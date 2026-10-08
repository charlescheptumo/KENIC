/// <summary>
/// Fetches KRA eTIMS code lists (taxation types, countries, units, product types, refund reasons, banks, locale) from the eTIMS middleware via selectETIMSCodes and syncs each category into its local setup table.
/// </summary>
codeunit 50100 ETIMSCodes
{
    Permissions = tabledata "Sales Invoice Header" = RIMD,
        tabledata "Sales Cr.Memo Header" = RIMD,
        tabledata "Purch. Inv. Header" = RIMD;

    var
        currency2: Codeunit "Additional-Currency Management";
        currency3: Record "Sales Invoice Header";
        currency4: Page "Posted Sales Invoice";
        UpdateCurrencyFactor: Codeunit "Update Currency Factor";
        branch: Record "eTims-Branch";
        refundreason: Record "eTims-Refund Reasons";
        itemClass: Record "eTims-Item Class";
        banks: Record "eTims-Banks";
        company: Record "Company Information";
        customer: Record Customer;
        locale: Record Language;
        branchUsers: Record "eTims-User";
        SIH: Record "Sales Invoice Header";
        invLine: Record "Sales Invoice Line";
        invCreditLine: Record "Sales Cr.Memo Line";
        item: Record Item;
        creditNote: Record "Sales Cr.Memo Header";
        salesHeader: Record "Sales Header";
        vatpg: Record "VAT Product Posting Group";
        currency: Record "Currency Exchange Rate";
        users: Record User;
        postedPurchase: Record "Purch. Inv. Header";
        PostedPurchaseLines: Record "Purch. Inv. Line";
        vendor: Record Vendor;
        glAccount: Record "G/L Account";

        HttpClient: HttpClient;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        RequestHeaders: HttpHeaders;
        ContentHeaders: HttpHeaders;
        HttpContent: HttpContent;
        Response: Text;

        dateT: DateTime;
        JsonObject: JsonObject;
        JsonBuffer: Record "JSON Buffer" temporary;
        jsonTokenValue: JsonToken;
        jsonResponse: JsonObject;
        jsonValue: JsonValue;

        evironmentInfo: Codeunit "Environment Information";
        testMiddlewareUrl: Label 'http://135.220.97.93:8087/api/';
        prodMiddlewareUrl: Label 'http://135.220.97.93:8087/api/';
        testETIMSUrl: Label 'http://135.220.97.93:8088/';
        prodETIMSUrl: Label 'http://135.220.97.93:8088/';

        lastreqDate: Text;
        ReqDate: Text;
        ETIMSDeviceInfo: Record "eTims-Branch Info";
        _ETIMSHelperFunctions: Codeunit "ETIMSHelperFunctions";

    procedure getETIMSURL(): Text
    begin
        if evironmentInfo.GetEnvironmentName().ToLower().Contains('production') then
            exit(prodETIMSUrl)
        else
            exit(testETIMSUrl)
    end;

    // ------------------------------------------------------------
    // URL builder: avoids calling getETIMSURL as variable
    // ------------------------------------------------------------
    local procedure BuildEtimsUrl(Endpoint: Text): Text
    var
        baseUrl: Text;
    begin
        baseUrl := getETIMSURL();
        if (StrLen(baseUrl) > 0) and (CopyStr(baseUrl, StrLen(baseUrl), 1) = '/') then
            exit(baseUrl + Endpoint)
        else
            exit(baseUrl + '/' + Endpoint);
    end;
    // ------------------------------------------------------------
    // NEW: Robust selectCodeList that:
    // 1) sends body { tin, bhfId, lastReqDt }
    // 2) adds headers Tin, Bhfid, cmcKey
    // 3) parses response safely (no index-based array access)
    // 4) routes by cdCls -> dtlList processors
    // ------------------------------------------------------------
    procedure selectETIMSCodes(): Text
    var
        // Config
        configTin: Text;
        configBranchId: Text;
        configCmcKey: Text;

        // Request body
        JsonBodyObj: JsonObject;

        // Parse
        tok: JsonToken;
        dataTok: JsonToken;
        clsTok: JsonToken;
        clsArray: JsonArray;
        clsObj: JsonObject;
        cdCls: Text;
        dtlTok: JsonToken;
        dtlArray: JsonArray;

        // ETIMS status
        resultCd: Text;
        resultMsg: Text;
    begin
        // --------------------------
        // Load config
        // --------------------------
        company.Get();
        configTin := company."Company Tin";
        configBranchId := company."Branch ID";
        configCmcKey := company."ETIMS CMC Key";

        if (configTin = '') or (configBranchId = '') or (configCmcKey = '') then
            exit('Missing ETIMS config: Tin/Branch ID/CMC Key');

        // --------------------------
        // Build JSON body
        // --------------------------
        Clear(JsonBodyObj);
        JsonBodyObj.Add('tin', configTin);
        JsonBodyObj.Add('bhfId', configBranchId);
        JsonBodyObj.Add('lastReqDt', '20120520000000');

        // --------------------------
        // Build HTTP request
        // --------------------------
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(HttpContent);
        Clear(Response);

        RequestMessage.Method('POST');
        RequestMessage.SetRequestUri(BuildEtimsUrl('code/selectCodes'));

        RequestMessage.GetHeaders(RequestHeaders);
        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'Tin', configTin);
        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'Bhfid', configBranchId);
        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'cmcKey', configCmcKey);

        HttpContent.WriteFrom(Format(JsonBodyObj));
        HttpContent.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        RequestMessage.Content(HttpContent);

        // --------------------------
        // Send + Read response
        // --------------------------
        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            exit('Request failed: HttpClient.Send returned false');

        if not ResponseMessage.Content.ReadAs(Response) then
            exit('Request failed: could not read response');

        if not ResponseMessage.IsSuccessStatusCode then
            exit(StrSubstNo('Request failed: HTTP %1. Body: %2', ResponseMessage.HttpStatusCode(), CopyStr(Response, 1, 250)));

        // Some ETIMS/proxies return JSON as a quoted string. Normalize only when needed.
        Response := _ETIMSHelperFunctions.NormalizeJsonResponse(Response);

        Clear(jsonResponse);
        if not jsonResponse.ReadFrom(Response) then
            exit('Invalid JSON returned. First 250 chars: ' + CopyStr(Response, 1, 250));

        // --------------------------
        // Validate ETIMS resultCd
        // --------------------------
        resultCd := '';
        resultMsg := '';
        if jsonResponse.Get('resultCd', tok) then
            resultCd := tok.AsValue().AsText();
        if jsonResponse.Get('resultMsg', tok) then
            resultMsg := tok.AsValue().AsText();

        if resultCd <> '000' then
            exit(StrSubstNo('ETIMS error %1: %2', resultCd, resultMsg));

        // --------------------------
        // Get data.clsList
        // --------------------------
        if not jsonResponse.Get('data', dataTok) then
            exit('Invalid response: missing data');

        if not dataTok.AsObject().Get('clsList', clsTok) then
            exit('Invalid response: missing data.clsList');

        clsArray := clsTok.AsArray();

        // --------------------------
        // Loop and route by cdCls (NO index-based Get())
        // --------------------------
        foreach clsTok in clsArray do begin
            clsObj := clsTok.AsObject();
            cdCls := _ETIMSHelperFunctions.GetTextOrEmpty(clsObj, 'cdCls');

            if cdCls <> '' then begin
                if clsObj.Get('dtlList', dtlTok) then begin
                    dtlArray := dtlTok.AsArray();

                    case cdCls of
                        '04':
                            ProcessTaxationType(dtlArray);
                        '05':
                            ProcessCountries(dtlArray);
                        '10':
                            ProcessQuantityUnit(dtlArray);
                        '17':
                            ProcessPackagingUnit(dtlArray);
                        '24':
                            ProcessProductType(dtlArray);
                        '32':
                            ProcessRefundReason(dtlArray);
                        '36':
                            ProcessBanks(dtlArray);
                        '48':
                            ProcessLocale(dtlArray);
                    end;
                end;
            end;
        end;


        exit('Update successful');
    end;



    // ------------------------------------------------------------
    // PROCESSORS (call your existing update... procedures)
    // ------------------------------------------------------------
    local procedure ProcessTaxationType(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
        rate: Decimal;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            rate := _ETIMSHelperFunctions.GetDecimalOrZero(Obj, 'userDfnCd1');
            updateTaxationType(cd, cdNm, rate);
        end;
    end;

    local procedure ProcessCountries(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            updateCountries(cd, cdNm, cdNm);
        end;
    end;

    local procedure ProcessQuantityUnit(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
        cdDesc: Text;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            cdDesc := _ETIMSHelperFunctions.GetTextOrNullLiteral(Obj, 'cdDesc');
            updateQuantityUnit(cd, cdNm, cdDesc);
        end;
    end;

    local procedure ProcessPackagingUnit(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
        cdDesc: Text;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            cdDesc := _ETIMSHelperFunctions.GetTextOrNullLiteral(Obj, 'cdDesc');
            updatePackagingUnit(cd, cdNm, cdDesc);
        end;
    end;

    local procedure ProcessProductType(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            updateProductType(cd, cdNm, cdNm);
        end;
    end;

    local procedure ProcessRefundReason(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
        cdDesc: Text;
        srtOrd: Integer;
        yn: Integer;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            cdDesc := _ETIMSHelperFunctions.GetTextOrNullLiteral(Obj, 'cdDesc');
            srtOrd := _ETIMSHelperFunctions.GetIntegerOrZero(Obj, 'srtOrd');
            yn := _ETIMSHelperFunctions.GetYNAsInt(Obj, 'useYn');
            updateRefundReason(cd, cdNm, cdDesc, srtOrd, yn);
        end;
    end;

    local procedure ProcessBanks(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
        srtOrd: Integer;
        yn: Integer;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            srtOrd := _ETIMSHelperFunctions.GetIntegerOrZero(Obj, 'srtOrd');
            yn := _ETIMSHelperFunctions.GetYNAsInt(Obj, 'useYn');
            updateBanks(cd, cdNm, cdNm, yn, srtOrd);
        end;
    end;

    local procedure ProcessLocale(DtlArray: JsonArray)
    var
        Tok: JsonToken;
        Obj: JsonObject;
        cd: Text;
        cdNm: Text;
        srtOrd: Integer;
        yn: Integer;
    begin
        foreach Tok in DtlArray do begin
            Obj := Tok.AsObject();
            cd := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cd');
            cdNm := _ETIMSHelperFunctions.GetTextOrEmpty(Obj, 'cdNm');
            srtOrd := _ETIMSHelperFunctions.GetIntegerOrZero(Obj, 'srtOrd');
            yn := _ETIMSHelperFunctions.GetYNAsInt(Obj, 'useYn');
            updateLocale(cd, cdNm, cdNm, yn, srtOrd);
        end;
    end;

    // ------------------------------------------------------------
    // KEEP YOUR EXISTING update... procedures below (unchanged)
    // ------------------------------------------------------------
    procedure updateBanks(bankCode: Text; codeName: Text; codeDesc: Text; Useyn: Integer; sortOrder: Integer) Msg: Text
    begin
        banks.Reset();
        banks.SetRange(Code, bankCode);
        if not banks.FindLast() then begin
            banks.Code := bankCode;
            banks."Code Name" := codeName;
            banks."Code Description" := codeDesc;
            banks.UseYN := Useyn;
            banks.sortOder := sortOrder;
            if banks.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updateLocale(code: Text; codeName: Text; codeDesc: Text; useYN: Integer; sortOrder: Integer) Msg: Text
    begin
        locale.Reset();
        locale.SetRange(Code, code);
        if not locale.FindFirst() then begin
            locale.Code := code;
            locale.Name := codeName;
            locale."Code Description" := codeDesc;
            locale.UseYN := useYN;
            locale."Sort Order" := sortOrder;
            if locale.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updateRefundReason(code: Text; codeName: Text; codeDesc: Text; sortOrder: Integer; useYN: Integer) Msg: Text
    begin
        refundreason.Reset();
        refundreason.SetRange(Code, code);
        if not refundreason.FindFirst() then begin
            refundreason.Init();
            refundreason.Code := code;
            refundreason."Code Name" := codeName;
            refundreason."Code Description" := codeDesc;
            refundreason."Sort Order" := sortOrder;
            refundreason.UseYN := useYN;
            if refundreason.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updateQuantityUnit(code: Text; codeName: Text; codeDesc: Text) Msg: Text
    var
        quantityunit: Record "eTims-Quantity Unit Code";
    begin
        Msg := '';
        quantityunit.Reset();
        quantityunit.SetRange("Code", code);
        if not quantityunit.FindFirst() then begin
            quantityunit.Init();
            quantityunit."Code" := code;
            quantityunit.Name := codeName;
            quantityunit.Description := codeDesc;
            if quantityunit.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updatePackagingUnit(code: Text; codeName: Text; codeDesc: Text) Msg: Text
    var
        packagingunit: Record "eTims-Packaging Unit";
    begin
        Msg := '';
        packagingunit.Reset();
        packagingunit.SetRange("Code", code);
        if not packagingunit.FindFirst() then begin
            packagingunit.Init();
            packagingunit."Code" := code;
            packagingunit."Code Name" := codeName;
            packagingunit.Description := codeDesc;
            if packagingunit.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updateTaxationType(code: Text; codeName: Text; rate: Decimal) Msg: Text
    var
        taxationtype: Record "eTims-Taxation Type";
    begin
        Msg := '';
        taxationtype.Reset();
        taxationtype.SetRange("Code", code);
        if not taxationtype.FindFirst() then begin
            taxationtype.Init();
            taxationtype."Code" := code;
            taxationtype.Name := codeName;
            taxationtype.Rate := rate;
            if taxationtype.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updateCountries(code: Text; codeName: Text; codeDesc: Text) Msg: Text
    var
        countries: Record "eTims-Country Codes";
    begin
        Msg := '';
        countries.Reset();
        countries.SetRange("Code", code);
        if not countries.FindFirst() then begin
            countries.Init();
            countries."Code" := code;
            countries."Country Name" := codeName;
            countries.Description := codeDesc;
            if countries.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updateProductType(code: Text; codeName: Text; codeDesc: Text) Msg: Text
    var
        productType: Record "eTims-Product Type";
    begin
        Msg := '';
        productType.Reset();
        productType.SetRange(Code, code);
        if not productType.FindFirst() then begin
            productType.Init();
            productType.Code := code;
            productType."Code Name" := codeName;
            productType.Description := codeDesc;
            if productType.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure updateClass(freqUsed: Boolean; useYn: Integer; itemClassCode: Text; itemClassLevel: Text; itemClassName: Text; manualEntry: Boolean; taxationTypeCode: Text) Msg: Boolean
    begin
        Msg := false;
        itemClass.Init();
        itemClass."Frequently Used" := freqUsed;
        itemClass."In Use" := useYn;
        itemClass."Item Class Code" := itemClassCode;
        itemClass."Item Class Level" := itemClassLevel;
        itemClass."Item Class Name" := itemClassName;
        itemClass."Manual Entry" := manualEntry;
        itemClass."Taxation Type Code" := taxationTypeCode;
        itemClass.SetRange("Item Class Code", itemClassCode);
        itemClass.SetRange("Item Class Level", itemClassLevel);
        if not itemClass.FindFirst() then begin
            if itemClass.Insert() then
                Msg := true;
        end else
            if itemClass.Modify() then
                Msg := true;
    end;
}
