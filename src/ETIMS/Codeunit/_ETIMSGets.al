/// <summary>
/// Pulls reference and transaction data down from the KRA eTIMS middleware - customers, notices, items, import items, purchases, and stock movements - via the selectETIMSxxx web service calls.
/// </summary>
codeunit 50101 ETIMSGets
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
        Response: Text;
        dateT: DateTime;
        JsonObject: JsonObject;
        JsonBuffer: Record "JSON Buffer" temporary;
        ContentHeaders: HttpHeaders;
        HttpContent: HttpContent;
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

    procedure SelectETIMSCustomers(): Text
    var
        // Config
        configTin: Text;
        configBranchId: Text;
        configCmcKey: Text;

        // Request body
        JsonBodyObj: JsonObject;

        // JSON parsing
        tok: JsonToken;
        dataTok: JsonToken;
        custTok: JsonToken;
        custArray: JsonArray;
        custObj: JsonObject;

        // Customer values
        tin: Text;
        taxprNm: Text;
        taxprSttsCd: Text;
        prvncNm: Text;
        dstrtNm: Text;
        sctrNm: Text;
        locDesc: Text;

        // ETIMS status
        resultCd: Text;
        resultMsg: Text;

        // Table
        EtimsCustomer: Record "ETIMS Customer";
    begin

        //----------------------------------
        // Load Config
        //----------------------------------
        company.Get();
        configTin := company."Company Tin";
        configBranchId := company."Branch ID";
        configCmcKey := company."ETIMS CMC Key";

        if (configTin = '') or (configBranchId = '') or (configCmcKey = '') then
            exit('Missing ETIMS config: Tin/Branch ID/CMC Key');


        //----------------------------------
        // Build Request JSON
        //----------------------------------
        Clear(JsonBodyObj);
        JsonBodyObj.Add('tin', configTin);
        JsonBodyObj.Add('bhfId', configBranchId);
        JsonBodyObj.Add('lastReqDt', '20120520000000');


        //----------------------------------
        // Build HTTP Request
        //----------------------------------
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(HttpContent);
        Clear(Response);

        RequestMessage.Method('POST');
        RequestMessage.SetRequestUri(BuildEtimsUrl('customers/selectCustomer'));

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


        //----------------------------------
        // Send Request
        //----------------------------------
        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            exit('Request failed: HttpClient.Send returned false');

        if not ResponseMessage.Content.ReadAs(Response) then
            exit('Request failed: could not read response');

        if not ResponseMessage.IsSuccessStatusCode then
            exit(StrSubstNo('Request failed: HTTP %1. Body: %2',
                ResponseMessage.HttpStatusCode(),
                CopyStr(Response, 1, 250)));


        //----------------------------------
        // Normalize JSON
        //----------------------------------
        Response := _ETIMSHelperFunctions.NormalizeJsonResponse(Response);

        Clear(jsonResponse);
        if not jsonResponse.ReadFrom(Response) then
            exit('Invalid JSON returned. First 250 chars: ' + CopyStr(Response, 1, 250));


        //----------------------------------
        // Validate resultCd
        //----------------------------------
        resultCd := '';
        resultMsg := '';

        if jsonResponse.Get('resultCd', tok) then
            resultCd := tok.AsValue().AsText();

        if jsonResponse.Get('resultMsg', tok) then
            resultMsg := tok.AsValue().AsText();

        if resultCd <> '000' then
            exit(StrSubstNo('ETIMS error %1: %2', resultCd, resultMsg));


        //----------------------------------
        // Get data.custList
        //----------------------------------
        if not jsonResponse.Get('data', dataTok) then
            exit('Invalid response: missing data');

        if not dataTok.AsObject().Get('custList', custTok) then
            exit('Invalid response: missing data.custList');

        custArray := custTok.AsArray();


        //----------------------------------
        // Loop Customers
        //----------------------------------
        foreach custTok in custArray do begin

            custObj := custTok.AsObject();

            tin := _ETIMSHelperFunctions.GetTextOrEmpty(custObj, 'tin');
            taxprNm := _ETIMSHelperFunctions.GetTextOrEmpty(custObj, 'taxprNm');
            taxprSttsCd := _ETIMSHelperFunctions.GetTextOrEmpty(custObj, 'taxprSttsCd');
            prvncNm := _ETIMSHelperFunctions.GetTextOrEmpty(custObj, 'prvncNm');
            dstrtNm := _ETIMSHelperFunctions.GetTextOrEmpty(custObj, 'dstrtNm');
            sctrNm := _ETIMSHelperFunctions.GetTextOrEmpty(custObj, 'sctrNm');
            locDesc := _ETIMSHelperFunctions.GetTextOrEmpty(custObj, 'locDesc');


            //----------------------------------
            // Insert / Update Table
            //----------------------------------
            EtimsCustomer.Reset();
            EtimsCustomer.SetRange("TIN", tin);

            if not EtimsCustomer.FindFirst() then begin
                EtimsCustomer.Init();
                EtimsCustomer."TIN" := tin;
            end;

            EtimsCustomer."Taxpayer Name" := taxprNm;
            EtimsCustomer."Taxpayer Status" := taxprSttsCd;
            EtimsCustomer."Province Name" := prvncNm;
            EtimsCustomer."District Name" := dstrtNm;
            EtimsCustomer."Sector Name" := sctrNm;
            EtimsCustomer."Location Description" := locDesc;

            EtimsCustomer.Modify(true);

        end;

        exit('Customer update successful');

    end;

    procedure SelectETIMSNotices(): Text
    var
        // Config
        configTin: Text;
        configBranchId: Text;
        configCmcKey: Text;

        // Request
        JsonBodyObj: JsonObject;

        // JSON parsing
        tok: JsonToken;
        dataTok: JsonToken;
        noticeTok: JsonToken;
        noticeArray: JsonArray;
        noticeObj: JsonObject;

        // values
        noticeNo: Integer;
        title: Text;
        cont: Text;
        dtlUrl: Text;
        regrNm: Text;
        regDt: Text;

        // status
        resultCd: Text;
        resultMsg: Text;

        // table
        EtimsNotice: Record "ETIMS Notice";

    begin

        //----------------------------------
        // Load Config
        //----------------------------------
        company.Get();

        configTin := company."Company Tin";
        configBranchId := company."Branch ID";
        configCmcKey := company."ETIMS CMC Key";

        if (configTin = '') or (configBranchId = '') or (configCmcKey = '') then
            exit('Missing ETIMS config');


        //----------------------------------
        // Build JSON
        //----------------------------------
        Clear(JsonBodyObj);

        JsonBodyObj.Add('tin', configTin);
        JsonBodyObj.Add('bhfId', configBranchId);
        JsonBodyObj.Add('lastReqDt', '20120520000000');


        //----------------------------------
        // HTTP Request
        //----------------------------------
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(HttpContent);
        Clear(Response);

        RequestMessage.Method('POST');
        RequestMessage.SetRequestUri(BuildEtimsUrl('notices/selectNotices'));

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


        //----------------------------------
        // Send
        //----------------------------------
        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            exit('Request failed');

        if not ResponseMessage.Content.ReadAs(Response) then
            exit('Cannot read response');

        if not ResponseMessage.IsSuccessStatusCode then
            exit(StrSubstNo(
                'HTTP %1 %2',
                ResponseMessage.HttpStatusCode(),
                CopyStr(Response, 1, 250)));


        //----------------------------------
        // Normalize JSON
        //----------------------------------
        Response := _ETIMSHelperFunctions.NormalizeJsonResponse(Response);

        Clear(jsonResponse);

        if not jsonResponse.ReadFrom(Response) then
            exit('Invalid JSON');


        //----------------------------------
        // Validate resultCd
        //----------------------------------
        resultCd := '';
        resultMsg := '';

        if jsonResponse.Get('resultCd', tok) then
            resultCd := tok.AsValue().AsText();

        if jsonResponse.Get('resultMsg', tok) then
            resultMsg := tok.AsValue().AsText();

        if resultCd <> '000' then
            exit(StrSubstNo('ETIMS error %1 %2', resultCd, resultMsg));


        //----------------------------------
        // data.noticeList
        //----------------------------------
        if not jsonResponse.Get('data', dataTok) then
            exit('Missing data');

        if not dataTok.AsObject().Get('noticeList', noticeTok) then
            exit('Missing noticeList');

        noticeArray := noticeTok.AsArray();


        //----------------------------------
        // Loop notices
        //----------------------------------
        foreach noticeTok in noticeArray do begin

            noticeObj := noticeTok.AsObject();

            noticeNo := _ETIMSHelperFunctions.GetIntegerOrZero(noticeObj, 'noticeNo');
            title := _ETIMSHelperFunctions.GetTextOrEmpty(noticeObj, 'title');
            cont := _ETIMSHelperFunctions.GetTextOrEmpty(noticeObj, 'cont');
            dtlUrl := _ETIMSHelperFunctions.GetTextOrEmpty(noticeObj, 'dtlUrl');
            regrNm := _ETIMSHelperFunctions.GetTextOrEmpty(noticeObj, 'regrNm');
            regDt := _ETIMSHelperFunctions.GetTextOrEmpty(noticeObj, 'regDt');


            //----------------------------------
            // Insert / Update
            //----------------------------------
            EtimsNotice.Reset();
            EtimsNotice.SetRange("Notice No", noticeNo);

            if not EtimsNotice.FindFirst() then begin
                EtimsNotice.Init();
                EtimsNotice."Notice No" := noticeNo;
            end;

            EtimsNotice.Title := title;
            EtimsNotice.Content := cont;
            EtimsNotice."Detail URL" := dtlUrl;
            EtimsNotice."Registered By" := regrNm;
            EtimsNotice."Register Date" := regDt;

            EtimsNotice.Modify(true);

        end;

        exit('Notice update successful');

    end;

    procedure SelectETIMSItems(): Text
    var
        // Config
        configTin: Text;
        configBranchId: Text;
        configCmcKey: Text;

        JsonBodyObj: JsonObject;

        tok: JsonToken;
        dataTok: JsonToken;
        itemTok: JsonToken;
        itemArray: JsonArray;
        itemObj: JsonObject;

        resultCd: Text;
        resultMsg: Text;

        // values
        tin: Text;
        itemCd: Text;
        itemClsCd: Text;
        itemTyCd: Text;
        itemNm: Text;
        itemStdNm: Text;
        orgnNatCd: Text;
        pkgUnitCd: Text;
        qtyUnitCd: Text;
        taxTyCd: Text;
        bcd: Text;
        dftPrc: Decimal;
        useYn: Integer;

        EtimsItem: Record "ETIMS Item";

    begin

        //----------------------------------
        // Config
        //----------------------------------
        company.Get();

        configTin := company."Company Tin";
        configBranchId := company."Branch ID";
        configCmcKey := company."ETIMS CMC Key";

        if (configTin = '') or (configBranchId = '') or (configCmcKey = '') then
            exit('Missing ETIMS config');


        //----------------------------------
        // JSON body
        //----------------------------------
        Clear(JsonBodyObj);

        JsonBodyObj.Add('tin', configTin);
        JsonBodyObj.Add('bhfId', configBranchId);
        JsonBodyObj.Add('lastReqDt', '20120520000000');


        //----------------------------------
        // HTTP
        //----------------------------------
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(HttpContent);
        Clear(Response);

        RequestMessage.Method('POST');
        RequestMessage.SetRequestUri(BuildEtimsUrl('items/selectItems'));

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


        //----------------------------------
        // Send
        //----------------------------------
        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            exit('Request failed');

        if not ResponseMessage.Content.ReadAs(Response) then
            exit('Cannot read response');

        if not ResponseMessage.IsSuccessStatusCode then
            exit('HTTP error');


        //----------------------------------
        // Normalize
        //----------------------------------
        Response := _ETIMSHelperFunctions.NormalizeJsonResponse(Response);

        Clear(jsonResponse);

        if not jsonResponse.ReadFrom(Response) then
            exit('Invalid JSON');


        //----------------------------------
        // resultCd
        //----------------------------------
        if jsonResponse.Get('resultCd', tok) then
            resultCd := tok.AsValue().AsText();

        if jsonResponse.Get('resultMsg', tok) then
            resultMsg := tok.AsValue().AsText();

        if resultCd <> '000' then
            exit(resultMsg);


        //----------------------------------
        // data.itemList
        //----------------------------------
        if not jsonResponse.Get('data', dataTok) then
            exit('Missing data');

        if not dataTok.AsObject().Get('itemList', itemTok) then
            exit('Missing itemList');

        itemArray := itemTok.AsArray();


        //----------------------------------
        // Loop items
        //----------------------------------
        foreach itemTok in itemArray do begin

            itemObj := itemTok.AsObject();

            tin := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'tin');
            itemCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'itemCd');
            itemClsCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'itemClsCd');
            itemTyCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'itemTyCd');
            itemNm := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'itemNm');
            itemStdNm := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'itemStdNm');
            orgnNatCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'orgnNatCd');
            pkgUnitCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'pkgUnitCd');
            qtyUnitCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'qtyUnitCd');
            taxTyCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'taxTyCd');
            bcd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'bcd');
            dftPrc := _ETIMSHelperFunctions.GetDecimalOrZero(itemObj, 'dftPrc');
            useYn := _ETIMSHelperFunctions.GetYNAsInt(itemObj, 'useYn');

            //----------------------------------
            // Insert / Update
            //----------------------------------
            EtimsItem.Reset();
            EtimsItem.SetRange("Item Code", itemCd);

            if not EtimsItem.FindFirst() then begin
                EtimsItem.Init();
                EtimsItem."Item Code" := itemCd;
            end;

            EtimsItem."TIN" := tin;
            EtimsItem."Item Name" := itemNm;
            EtimsItem."Item Class Code" := itemClsCd;
            EtimsItem."Item Type Code" := itemTyCd;
            EtimsItem."Origin Country" := orgnNatCd;
            EtimsItem."Package Unit" := pkgUnitCd;
            EtimsItem."Quantity Unit" := qtyUnitCd;
            EtimsItem."Tax Type Code" := taxTyCd;
            EtimsItem.Barcode := bcd;
            EtimsItem."Default Price" := dftPrc;
            EtimsItem."Use YN" := useYn;

            EtimsItem.Modify(true);

        end;

        exit('Items updated');

    end;

    procedure SelectETIMSImportItems(): Text
    var
        // Config
        configTin: Text;
        configBranchId: Text;
        configCmcKey: Text;

        JsonBodyObj: JsonObject;

        tok: JsonToken;
        dataTok: JsonToken;
        itemTok: JsonToken;
        itemArray: JsonArray;
        itemObj: JsonObject;

        resultCd: Text;
        resultMsg: Text;

        // values
        taskCd: Text;
        dclDe: Text;
        itemSeq: Integer;
        dclNo: Text;
        hsCd: Text;
        itemNm: Text;
        imptItemsttsCd: Text;
        orgnNatCd: Text;
        exptNatCd: Text;
        pkg: Decimal;
        pkgUnitCd: Text;
        qty: Decimal;
        qtyUnitCd: Text;
        totWt: Decimal;
        netWt: Decimal;
        spplrNm: Text;
        agntNm: Text;
        invAmt: Decimal;
        invCur: Text;
        exRate: Decimal;

        ImportItem: Record "eTims-Import Item";

    begin

        //----------------------------------
        // Config
        //----------------------------------
        company.Get();

        configTin := company."Company Tin";
        configBranchId := company."Branch ID";
        configCmcKey := company."ETIMS CMC Key";

        if (configTin = '') or (configBranchId = '') or (configCmcKey = '') then
            exit('Missing ETIMS config');


        //----------------------------------
        // JSON body
        //----------------------------------
        Clear(JsonBodyObj);

        JsonBodyObj.Add('tin', configTin);
        JsonBodyObj.Add('bhfId', configBranchId);
        JsonBodyObj.Add('lastReqDt', '20120520000000');


        //----------------------------------
        // HTTP
        //----------------------------------
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(HttpContent);
        Clear(Response);

        RequestMessage.Method('POST');
        RequestMessage.SetRequestUri(
            BuildEtimsUrl('imports/selectImportItems'));

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


        //----------------------------------
        // Send
        //----------------------------------
        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            exit('Request failed');

        if not ResponseMessage.Content.ReadAs(Response) then
            exit('Cannot read response');

        if not ResponseMessage.IsSuccessStatusCode then
            exit('HTTP error');


        //----------------------------------
        // Normalize
        //----------------------------------
        Response := _ETIMSHelperFunctions.NormalizeJsonResponse(Response);

        Clear(jsonResponse);

        if not jsonResponse.ReadFrom(Response) then
            exit('Invalid JSON');


        //----------------------------------
        // resultCd
        //----------------------------------
        if jsonResponse.Get('resultCd', tok) then
            resultCd := tok.AsValue().AsText();

        if jsonResponse.Get('resultMsg', tok) then
            resultMsg := tok.AsValue().AsText();

        if resultCd <> '000' then
            exit(resultMsg);


        //----------------------------------
        // data.itemList
        //----------------------------------
        if not jsonResponse.Get('data', dataTok) then
            exit('Missing data');

        if not dataTok.AsObject().Get('itemList', itemTok) then
            exit('Missing itemList');

        itemArray := itemTok.AsArray();


        //----------------------------------
        // Loop
        //----------------------------------
        foreach itemTok in itemArray do begin

            itemObj := itemTok.AsObject();

            taskCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'taskCd');
            dclDe := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'dclDe');
            itemSeq := _ETIMSHelperFunctions.GetIntegerOrZero(itemObj, 'itemSeq');
            dclNo := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'dclNo');
            hsCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'hsCd');
            itemNm := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'itemNm');
            imptItemsttsCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'imptItemsttsCd');
            orgnNatCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'orgnNatCd');
            exptNatCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'exptNatCd');
            pkg := _ETIMSHelperFunctions.GetDecimalOrZero(itemObj, 'pkg');
            pkgUnitCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'pkgUnitCd');
            qty := _ETIMSHelperFunctions.GetDecimalOrZero(itemObj, 'qty');
            qtyUnitCd := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'qtyUnitCd');
            totWt := _ETIMSHelperFunctions.GetDecimalOrZero(itemObj, 'totWt');
            netWt := _ETIMSHelperFunctions.GetDecimalOrZero(itemObj, 'netWt');
            spplrNm := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'spplrNm');
            agntNm := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'agntNm');
            invAmt := _ETIMSHelperFunctions.GetDecimalOrZero(itemObj, 'invcFcurAmt');
            invCur := _ETIMSHelperFunctions.GetTextOrEmpty(itemObj, 'invcFcurCd');
            exRate := _ETIMSHelperFunctions.GetDecimalOrZero(itemObj, 'invcFcurExcrt');


            //----------------------------------
            // Insert / Update
            //----------------------------------
            ImportItem.Reset();
            ImportItem.SetRange("Task Code", taskCd);
            ImportItem.SetRange("Item Seq", itemSeq);

            if not ImportItem.FindFirst() then begin
                ImportItem.Init();
                ImportItem."Task Code" := taskCd;
                ImportItem."Item Seq" := itemSeq;
            end;

            ImportItem."Declaration Date" := dclDe;
            ImportItem."Declaration No" := dclNo;
            ImportItem."HS Code" := hsCd;
            ImportItem."Item Name" := itemNm;
            ImportItem."Import Status" := imptItemsttsCd;
            ImportItem."Origin Country" := orgnNatCd;
            ImportItem."Export Country" := exptNatCd;
            ImportItem.Package := pkg;
            ImportItem."Package Unit" := pkgUnitCd;
            ImportItem.Quantity := qty;
            ImportItem."Qty Unit" := qtyUnitCd;
            ImportItem."Total Weight" := totWt;
            ImportItem."Net Weight" := netWt;
            ImportItem.Supplier := spplrNm;
            ImportItem.Agent := agntNm;
            ImportItem."Invoice Amount" := invAmt;
            ImportItem.Currency := invCur;
            ImportItem."Exchange Rate" := exRate;

            ImportItem.Modify(true);

        end;

        exit('Import items updated');

    end;

    procedure SelectETIMSPurchases(): Text
    var
        configTin: Text;
        configBranchId: Text;
        configCmcKey: Text;

        JsonBodyObj: JsonObject;

        tok: JsonToken;
        dataTok: JsonToken;
        purchaseTok: JsonToken;
        purchaseArray: JsonArray;
        purchaseObj: JsonObject;

        lineTok: JsonToken;
        lineArray: JsonArray;
        lineObj: JsonObject;

        resultCd: Text;

        PurchaseHeader: Record "eTims-Purchase Header";
        PurchaseLine: Record "eTims-Purchase Line";

        spplrTin: Text;
        invNo: Integer;

    begin

        company.Get();

        configTin := company."Company Tin";
        configBranchId := company."Branch ID";
        configCmcKey := company."ETIMS CMC Key";

        Clear(JsonBodyObj);

        JsonBodyObj.Add('tin', configTin);
        JsonBodyObj.Add('bhfId', configBranchId);
        JsonBodyObj.Add('lastReqDt', '20120520000000');


        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(HttpContent);
        Clear(Response);

        RequestMessage.Method('POST');
        RequestMessage.SetRequestUri(
            BuildEtimsUrl('trnsPurchase/selectTrnsPurchaseSales'));

        RequestMessage.GetHeaders(RequestHeaders);

        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'Tin', configTin);
        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'Bhfid', configBranchId);
        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'cmcKey', configCmcKey);

        HttpContent.WriteFrom(Format(JsonBodyObj));

        HttpContent.GetHeaders(ContentHeaders);

        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        RequestMessage.Content(HttpContent);


        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            exit('Request failed');

        ResponseMessage.Content.ReadAs(Response);

        Response :=
            _ETIMSHelperFunctions.NormalizeJsonResponse(Response);

        jsonResponse.ReadFrom(Response);


        jsonResponse.Get('resultCd', tok);
        resultCd := tok.AsValue().AsText();

        if resultCd <> '000' then
            exit('ETIMS error');


        jsonResponse.Get('data', dataTok);
        dataTok.AsObject().Get('saleList', purchaseTok);

        purchaseArray := purchaseTok.AsArray();


        foreach purchaseTok in purchaseArray do begin

            purchaseObj := purchaseTok.AsObject();

            spplrTin :=
                _ETIMSHelperFunctions.GetTextOrEmpty(purchaseObj, 'spplrTin');

            invNo :=
                _ETIMSHelperFunctions.GetIntegerOrZero(purchaseObj, 'spplrInvcNo');


            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("Supplier TIN", spplrTin);
            PurchaseHeader.SetRange("Invoice No", invNo);

            if not PurchaseHeader.FindFirst() then begin
                PurchaseHeader.Init();
                PurchaseHeader."Supplier TIN" := spplrTin;
                PurchaseHeader."Invoice No" := invNo;
            end;

            PurchaseHeader."Supplier Name" :=
                _ETIMSHelperFunctions.GetTextOrEmpty(purchaseObj, 'spplrNm');

            PurchaseHeader."Sales Date" :=
                _ETIMSHelperFunctions.GetTextOrEmpty(purchaseObj, 'salesDt');

            PurchaseHeader."Total Amount" :=
                _ETIMSHelperFunctions.GetDecimalOrZero(purchaseObj, 'totAmt');

            PurchaseHeader."Total Tax" :=
                _ETIMSHelperFunctions.GetDecimalOrZero(purchaseObj, 'totTaxAmt');

            PurchaseHeader.Modify(true);


            if purchaseObj.Get('itemList', lineTok) then begin

                lineArray := lineTok.AsArray();

                foreach lineTok in lineArray do begin

                    lineObj := lineTok.AsObject();

                    PurchaseLine.Reset();
                    PurchaseLine.SetRange("Supplier TIN", spplrTin);
                    PurchaseLine.SetRange("Invoice No", invNo);
                    PurchaseLine.SetRange(
                        "Item Seq",
                        _ETIMSHelperFunctions.GetIntegerOrZero(lineObj, 'itemSeq'));

                    if not PurchaseLine.FindFirst() then begin
                        PurchaseLine.Init();
                        PurchaseLine."Supplier TIN" := spplrTin;
                        PurchaseLine."Invoice No" := invNo;
                        PurchaseLine."Item Seq" :=
                            _ETIMSHelperFunctions.GetIntegerOrZero(lineObj, 'itemSeq');
                    end;

                    PurchaseLine."Item Code" :=
                        _ETIMSHelperFunctions.GetTextOrEmpty(lineObj, 'itemCd');

                    PurchaseLine."Item Name" :=
                        _ETIMSHelperFunctions.GetTextOrEmpty(lineObj, 'itemNm');

                    PurchaseLine.Qty :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'qty');

                    PurchaseLine.Price :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'prc');

                    PurchaseLine."Supply Amount" :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'splyAmt');

                    PurchaseLine."Tax Amount" :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'taxAmt');

                    PurchaseLine."Total Amount" :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'totAmt');

                    PurchaseLine.Modify(true);

                end;
            end;

        end;

        exit('Purchases updated');

    end;

    procedure SelectETIMSStock(): Text
    var
        configTin: Text;
        configBranchId: Text;
        configCmcKey: Text;

        JsonBodyObj: JsonObject;

        tok: JsonToken;
        dataTok: JsonToken;
        stockTok: JsonToken;
        stockArray: JsonArray;
        stockObj: JsonObject;

        lineTok: JsonToken;
        lineArray: JsonArray;
        lineObj: JsonObject;

        resultCd: Text;

        StockHeader: Record "eTims-Stock Header";
        StockLine: Record "eTims-Stock Line";

        custTin: Text;
        bhfId: Text;
        sarNo: Integer;

    begin
        company.Get();

        configTin := company."Company Tin";
        configBranchId := company."Branch ID";
        configCmcKey := company."ETIMS CMC Key";

        Clear(JsonBodyObj);

        JsonBodyObj.Add('tin', configTin);
        JsonBodyObj.Add('bhfId', configBranchId);
        JsonBodyObj.Add('lastReqDt', '20120520000000');

        // HTTP setup (same as yours)
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(HttpContent);
        Clear(Response);

        RequestMessage.Method('POST');
        RequestMessage.SetRequestUri(
            BuildEtimsUrl('stock/selectStockItems'));

        RequestMessage.GetHeaders(RequestHeaders);

        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'Tin', configTin);
        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'Bhfid', configBranchId);
        _ETIMSHelperFunctions.AddOrReplaceHeader(RequestHeaders, 'cmcKey', configCmcKey);

        HttpContent.WriteFrom(Format(JsonBodyObj));

        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        RequestMessage.Content(HttpContent);

        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            exit('Request failed');

        ResponseMessage.Content.ReadAs(Response);

        Response :=
            _ETIMSHelperFunctions.NormalizeJsonResponse(Response);

        jsonResponse.ReadFrom(Response);

        jsonResponse.Get('resultCd', tok);
        resultCd := tok.AsValue().AsText();

        if resultCd <> '000' then
            exit('ETIMS error');

        jsonResponse.Get('data', dataTok);
        dataTok.AsObject().Get('stockList', stockTok);

        stockArray := stockTok.AsArray();

        foreach stockTok in stockArray do begin

            stockObj := stockTok.AsObject();

            custTin := _ETIMSHelperFunctions.GetTextOrEmpty(stockObj, 'custTin');
            bhfId := _ETIMSHelperFunctions.GetTextOrEmpty(stockObj, 'custBhfId');
            sarNo := _ETIMSHelperFunctions.GetIntegerOrZero(stockObj, 'sarNo');

            StockHeader.Reset();
            StockHeader.SetRange("Customer TIN", custTin);
            StockHeader.SetRange("Customer Branch ID", bhfId);
            StockHeader.SetRange("SAR No", sarNo);

            if not StockHeader.FindFirst() then begin
                StockHeader.Init();
                StockHeader."Customer TIN" := custTin;
                StockHeader."Customer Branch ID" := bhfId;
                StockHeader."SAR No" := sarNo;
            end;

            StockHeader."Occurrence Date" :=
                _ETIMSHelperFunctions.GetTextOrEmpty(stockObj, 'ocrnDt');

            StockHeader."Total Item Count" :=
                _ETIMSHelperFunctions.GetIntegerOrZero(stockObj, 'totItemCnt');

            StockHeader."Total Taxable Amount" :=
                _ETIMSHelperFunctions.GetDecimalOrZero(stockObj, 'totTaxblAmt');

            StockHeader."Total Tax Amount" :=
                _ETIMSHelperFunctions.GetDecimalOrZero(stockObj, 'totTaxAmt');

            StockHeader."Total Amount" :=
                _ETIMSHelperFunctions.GetDecimalOrZero(stockObj, 'totAmt');

            StockHeader.Modify(true);

            // 🔹 LINES
            if stockObj.Get('itemList', lineTok) then begin

                lineArray := lineTok.AsArray();

                foreach lineTok in lineArray do begin

                    lineObj := lineTok.AsObject();

                    StockLine.Reset();
                    StockLine.SetRange("Customer TIN", custTin);
                    StockLine.SetRange("Customer Branch ID", bhfId);
                    StockLine.SetRange("SAR No", sarNo);
                    StockLine.SetRange("Item Seq",
                        _ETIMSHelperFunctions.GetIntegerOrZero(lineObj, 'itemSeq'));

                    if not StockLine.FindFirst() then begin
                        StockLine.Init();
                        StockLine."Customer TIN" := custTin;
                        StockLine."Customer Branch ID" := bhfId;
                        StockLine."SAR No" := sarNo;
                        StockLine."Item Seq" :=
                            _ETIMSHelperFunctions.GetIntegerOrZero(lineObj, 'itemSeq');
                    end;

                    StockLine."Item Code" :=
                        _ETIMSHelperFunctions.GetTextOrEmpty(lineObj, 'itemCd');

                    StockLine."Item Name" :=
                        _ETIMSHelperFunctions.GetTextOrEmpty(lineObj, 'itemNm');

                    StockLine.Quantity :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'qty');

                    StockLine.Price :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'prc');

                    StockLine."Supply Amount" :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'splyAmt');

                    StockLine."Tax Amount" :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'taxAmt');

                    StockLine."Total Amount" :=
                        _ETIMSHelperFunctions.GetDecimalOrZero(lineObj, 'totAmt');

                    StockLine.Modify(true);

                end;
            end;

        end;

        exit('Stock updated');
    end;
}
