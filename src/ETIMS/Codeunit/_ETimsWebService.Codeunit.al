/// <summary>
/// Core KRA eTIMS integration codeunit: registers the device, pushes sales invoices, purchase invoices and credit notes (including stock in/out and QR/barcode generation), and syncs reference data (codes, items, branches, customers, users, GL accounts) with the eTIMS middleware.
/// </summary>
codeunit 50112 ETimsWebService
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

    procedure getURL(): Text
    begin
        if evironmentInfo.GetEnvironmentName().ToLower().Contains('production') then
            exit(prodMiddlewareUrl)
        else
            exit(testMiddlewareUrl)
    end;

    procedure getETIMSURL(): Text
    begin
        if evironmentInfo.GetEnvironmentName().ToLower().Contains('production') then
            exit(prodETIMSUrl)
        else
            exit(testETIMSUrl)
    end;

    procedure RequestData(): Text
    begin
        company.Get();
        if (company."Company Tin" = '') or (company."Branch ID" = '') or (company."ETIMS CMC Key" = '') then
            exit('Missing ETIMS config: Tin/Branch ID/CMC Key');

        if evironmentInfo.GetEnvironmentName().ToLower().Contains('production') then
            exit('{"pin": "' + company."Company Tin" + '", "branchId": "' + company."Branch ID" + '"}')
        else
            exit('{"pin": "' + company."Company Tin" + '", "branchId": "' + company."Branch ID" + '", "deviceSerialNo":"' + company."Device Number" + '"}')
    end;

    procedure RequestDataInitialize(branchId: code[15]; deviceSerialNumber: Text): Text
    begin
        company.Get();
        if (branchId = '') or (deviceSerialNumber = '') then
            exit('Missing ETIMS config: Branch ID/DeviceSerialNumber');

        exit('{"pin": "' + company."Company Tin" + '", "branchId": "' + branchId + '", "deviceSerialNo":"' + deviceSerialNumber + '"}')
    end;

    procedure Initialize(): Text
    var
        token: Text;
        ResponseText: Text;
    begin
        Clear(token);
        //token := GetEtimsToken;
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'RegisterEtims/RegisterDevice');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        company.Get();
        HttpContent.WriteFrom(RequestData());
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);

        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            Error('Failed to reach ETIMS service');

        ResponseMessage.Content.ReadAs(ResponseText);

        if not ResponseMessage.IsSuccessStatusCode then
            Error('ETIMS request failed: %1', ResponseText);

        exit(HandleInitializeResponse(ResponseText));
    end;

    procedure InitializeNew(branchId: code[15]; deviceSerialNumber: Text): Text
    var
        token: Text;
        ResponseText: Text;
    begin
        Clear(token);
        //token := GetEtimsToken;
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'RegisterEtims/RegisterDevice');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        company.Get();
        HttpContent.WriteFrom(RequestDataInitialize(branchId, deviceSerialNumber));
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);

        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            Error('Failed to reach ETIMS service');

        ResponseMessage.Content.ReadAs(ResponseText);

        if not ResponseMessage.IsSuccessStatusCode then
            Error('ETIMS request failed: %1', ResponseText);

        exit(HandleInitializeResponse(ResponseText));
    end;



    local procedure HandleInitializeResponse(ResponseText: Text): Text

    var
        RootObj: JsonObject;
        DataObj: JsonObject;
        InfoObj: JsonObject;
        JsonToken: JsonToken;
        eTimsBranch: Record "eTims-Branch";
        BHFIdToken: JsonToken;
        BHFId: Text;
    begin
        if not RootObj.ReadFrom(ResponseText) then
            Error('Invalid JSON returned from ETIMS');

        // ===== Validate Result Code =====
        if RootObj.Get('resultCd', JsonToken) then
            if JsonToken.AsValue().AsText() <> '000' then begin
                if RootObj.Get('resultMsg', JsonToken) then
                    Error(JsonToken.AsValue().AsText());
                Error('ETIMS returned an error');
            end;

        // ===== Navigate to data.info =====
        if not RootObj.Get('data', JsonToken) then
            Error('Missing data node in ETIMS response');

        DataObj := JsonToken.AsObject();

        if not DataObj.Get('info', JsonToken) then
            Error('Missing info node in ETIMS response');

        InfoObj := JsonToken.AsObject();
        if InfoObj.Get('bhfId', BHFIdToken) then
            BHFId := BHFIdToken.AsValue().AsText();

        // ===== Update Company =====
        company.Get();
        if (BHFId <> '') then begin
            eTimsBranch.Reset();
            eTimsBranch.SetRange("Branch Id", BHFId);
            if eTimsBranch.FindFirst() then begin
                SetTextIfExists(InfoObj, 'tin', eTimsBranch.Tin);
                SetTextIfExists(InfoObj, 'taxprNm', eTimsBranch."Branch Name");
                SetTextIfExists(InfoObj, 'bhfNm', eTimsBranch."Branch Name");
                SetDateIfExists(InfoObj, 'bhfOpenDt', eTimsBranch."ETIMS Branch Open Date");
                SetTextIfExists(InfoObj, 'mgrNm', eTimsBranch."Manager Name");
                SetTextIfExists(InfoObj, 'mgrTelNo', eTimsBranch."Manager Phone");
                SetTextIfExists(InfoObj, 'mgrEmail', eTimsBranch."Manager Email");
                SetTextIfExists(InfoObj, 'dvcId', eTimsBranch."ETIMS Device ID");
                SetTextIfExists(InfoObj, 'sdcId', eTimsBranch."ETIMS SDC ID");
                SetTextIfExists(InfoObj, 'mrcNo', eTimsBranch."ETIMS MRC No.");
                SetTextIfExists(InfoObj, 'cmcKey', eTimsBranch."ETIMS CMC Key");
                SetTextIfExists(InfoObj, 'prvncNm', eTimsBranch."Province Name");
                SetTextIfExists(InfoObj, 'dstrtNm', eTimsBranch."District Name");
                SetCodeIfExists(InfoObj, 'bsnsActv', eTimsBranch."Branch Status Code");
            end;
        end;

        // ===== Update Branch =====
        SetCodeIfExists(InfoObj, 'tin', company."Company Tin");
        SetTextIfExists(InfoObj, 'taxprNm', company."ETIMS Taxpayer Name");
        SetTextIfExists(InfoObj, 'bhfNm', company."ETIMS Branch Name");
        SetDateIfExists(InfoObj, 'bhfOpenDt', company."ETIMS Branch Open Date");
        SetTextIfExists(InfoObj, 'mgrNm', company."ETIMS Manager Name");
        SetTextIfExists(InfoObj, 'mgrTelNo', company."ETIMS Manager Phone No.");
        SetTextIfExists(InfoObj, 'mgrEmail', company."ETIMS Manager Email");
        SetCodeIfExists(InfoObj, 'dvcId', company."ETIMS Device ID");
        SetCodeIfExists(InfoObj, 'sdcId', company."ETIMS SDC ID");
        SetCodeIfExists(InfoObj, 'mrcNo', company."ETIMS MRC No.");
        SetTextIfExists(InfoObj, 'cmcKey', company."ETIMS CMC Key");

        company.Modify(true);

        exit('ETIMS device registered successfully');
    end;

    local procedure SetTextIfExists(
    InfoObj: JsonObject;
    PropertyName: Text;
    var TargetField: Text)
    var
        Token: JsonToken;
    begin
        if InfoObj.Get(PropertyName, Token) then
            TargetField := Token.AsValue().AsText();
    end;

    local procedure SetCodeIfExists(
        InfoObj: JsonObject;
        PropertyName: Text;
        var TargetField: Code[20])
    var
        Token: JsonToken;
    begin
        if InfoObj.Get(PropertyName, Token) then
            TargetField := Token.AsValue().AsText();
    end;

    local procedure SetDateIfExists(
        InfoObj: JsonObject;
        PropertyName: Text;
        var TargetDate: Date)
    var
        Token: JsonToken;
    begin
        if InfoObj.Get(PropertyName, Token) then
            TargetDate := ParseYYYYMMDD(Token.AsValue().AsText());
    end;

    local procedure ParseYYYYMMDD(DateText: Text): Date
    var
        Year: Integer;
        Month: Integer;
        Day: Integer;
    begin
        if StrLen(DateText) <> 8 then
            exit(0D);

        Evaluate(Year, CopyStr(DateText, 1, 4));
        Evaluate(Month, CopyStr(DateText, 5, 2));
        Evaluate(Day, CopyStr(DateText, 7, 2));

        exit(DMY2Date(Day, Month, Year));
    end;

    procedure pushSalesInvoices(): Text
    var
        token: Text;
        HeaderJsonObject: JsonObject;
        LinesJsonObject: JsonObject;
        LinesJsonArray: JsonArray;
        SalesInvHeader, salesINV : Record "Sales Invoice Header";
        SalesInvLines: Record "Sales Invoice Line";
        startingDay: Date;
        saledate: Text;
        currency: Text;
        rtnMessageArray: JsonArray;
        rtnMessageToken: JsonToken;
        rtnMessageObject: JsonObject;
        rtnToken: JsonToken;
        invoceNum: Text;
        intrlData: Text;
        rcptSign: Text;
        sdcId: Text;
        CUInvoiceNo: Text;
        QRCodeUrl: Text;
        dateT: DateTime;
        Month: Integer;
        Year: Integer;
        Day: Integer;
        TheTime: Time;
        TheTime2: Time;
        myTime: Time;
        mystring: Text;
        mydateTime: DateTime;
        CompInfo: Record "Company Information";
        eTimsPushCredit: Record eTimsPushCredit;
        getEndDate: DateTime;
        getStartDate: DateTime;
    begin


        //create Sales header Json
        token := GetEtimsToken();
        company.Get();
        Evaluate(TheTime, '235959');
        Evaluate(TheTime2, '000001');
        getStartDate := CreateDateTime(Today, TheTime2);
        getEndDate := CreateDateTime(Today, TheTime);

        SalesInvHeader.Reset();
        SalesInvHeader.SetRange("Posted to Etims", false);
        SalesInvHeader.SetFilter(SystemCreatedAt, '>=%1&<=%2', getStartDate, getEndDate);
        if SalesInvHeader.FindSet() then
            repeat
                SalesInvHeader."Posted to Etims" := true;
                SalesInvHeader.Modify();

                Clear(HeaderJsonObject);
                Clear(LinesJsonArray);
                HeaderJsonObject.Add('tin', company."Company Tin");
                HeaderJsonObject.Add('BranchId', company."Branch ID");
                HeaderJsonObject.Add('DocumentType', 'Sales');
                HeaderJsonObject.Add('InvoiceNo', SalesInvHeader."No.");
                HeaderJsonObject.Add('ETimsInvoiceNo', getSalesInvoiceNum(SalesInvHeader."No."));
                customer.Reset();
                if customer.Get(SalesInvHeader."Bill-to Customer No.") then begin
                    HeaderJsonObject.Add('CustPIN', customer."VAT Registration No.");
                    HeaderJsonObject.Add('CustName', customer.Name);
                    HeaderJsonObject.Add('CustBranchId', customer."Branch Code");
                end;
                saledate := FORMAT(SalesInvHeader."Document Date", 0, '<Year4>-<Month,2>-<Day,2>');
                HeaderJsonObject.Add('SaleDate', saledate);
                HeaderJsonObject.Add('PostStockMovement', 'N');

                if SalesInvHeader."Currency Code" = '' then
                    currency := 'KES' else
                    currency := SalesInvHeader."Currency Code";
                HeaderJsonObject.Add('CurrencyCode', currency);
                //breaks
                HeaderJsonObject.Add('ExchangeRate', getPostedDocCurrencyDetails(SalesInvHeader."No."));
                HeaderJsonObject.Add('RefInvoiceNo', 0);
                HeaderJsonObject.Add('CreditNoteReason', '');
                users.Reset();
                users.SetRange("User Security ID", SalesInvHeader.SystemCreatedBy);
                if users.FindFirst() then begin
                    HeaderJsonObject.Add('CreatedBy', users."User Name");
                    HeaderJsonObject.Add('CreatedByName', users."Full Name");
                end;

                //Create Lines
                SalesInvLines.Reset();
                SalesInvLines.SetRange("Document No.", SalesInvHeader."No.");
                if SalesInvLines.FindSet() then
                    repeat
                        Clear(LinesJsonObject);
                        glAccount.Reset();
                        if glAccount.Get(SalesInvLines."No.") then begin
                            LinesJsonObject.Add('ItemCode', glAccount."Etims Item Code");
                            LinesJsonObject.Add('ItemClassCode', glAccount."Item Class");
                            LinesJsonObject.Add('ItemName', SalesInvLines.Description);
                            LinesJsonObject.Add('ItemTypeCode', glAccount."Service Type");
                            LinesJsonObject.Add('PackagingUnitCode', glAccount."Packaging Unit code");
                            LinesJsonObject.Add('QuantityUnitCode', glAccount."Quantity Unit Code");
                            LinesJsonObject.Add('Quantity', Round(SalesInvLines.Quantity, 0.01));
                            LinesJsonObject.Add('UnitPriceExcl', Round((SalesInvLines."Line Amount" / SalesInvLines.Quantity), 0.01));
                            LinesJsonObject.Add('TaxRate', SalesInvLines."VAT %");
                            LinesJsonObject.Add('TaxationTypeCode', getTaxType(SalesInvHeader."No.", SalesInvLines."No."));
                            LinesJsonObject.Add('DiscountRate', SalesInvLines."Line Discount %");
                            LinesJsonObject.Add('DiscountAmount', Round(SalesInvLines."Line Discount Amount", 0.01));
                            LinesJsonArray.Add(LinesJsonObject);
                        end;

                    until SalesInvLines.Next() = 0;
                HeaderJsonObject.Add('itemList', LinesJsonArray);

                //send Request to eTims
                Clear(RequestMessage);
                Clear(RequestHeaders);
                Clear(ContentHeaders);
                Clear(Response);
                RequestMessage.SetRequestUri(getURL + 'saveSales');
                RequestMessage.Method('POST');
                RequestMessage.GetHeaders(RequestHeaders);
                RequestHeaders.Add('Authorization', 'Bearer ' + token);
                HttpContent.WriteFrom(Format(HeaderJsonObject));
                HttpContent.GetHeaders(ContentHeaders);
                ContentHeaders.Remove('Content-Type');
                ContentHeaders.Add('Content-Type', 'application/json');
                HttpContent.GetHeaders(ContentHeaders);
                RequestMessage.Content(HttpContent);

                //HttpClient.Timeout(300000);
                if HttpClient.Send(RequestMessage, ResponseMessage) then begin
                    ResponseMessage.Content.ReadAs(Response);
                    if ResponseMessage.IsSuccessStatusCode then begin
                        JsonBuffer.ReadFromText(Response);
                        Response := convertToJson(Response);
                        //save response
                        eTimsPushCredit.Reset();
                        eTimsPushCredit.Init();
                        eTimsPushCredit.Code := SalesInvHeader."No.";
                        eTimsPushCredit.Json := Response;
                        if eTimsPushCredit.Insert() = false then
                            eTimsPushCredit.Modify();

                        if jsonResponse.ReadFrom(Response) then
                            if Response.Contains('9020') then begin
                                SalesInvHeader."Posted to Etims" := false;
                                SalesInvHeader.Modify();
                            end else begin
                                jsonResponse.Get('data', jsonTokenValue);
                                rtnMessageObject := jsonTokenValue.AsObject();

                                //rtnMessageObject.Get('rcptNo', rtnToken);
                                //rcptNo := rtnToken.AsValue().AsText();

                                rtnMessageObject.Get('intrlData', rtnToken);
                                intrlData := rtnToken.AsValue().AsText();

                                rtnMessageObject.Get('rcptSign', rtnToken);
                                rcptSign := rtnToken.AsValue().AsText();

                                rtnMessageObject.Get('ReceiptDateTime', rtnToken);
                                mystring := rtnToken.AsValue().AsText();
                                //2024-03-22 14:39:34
                                Evaluate(Day, CopyStr(mystring, 9, 2));
                                Evaluate(Month, CopyStr(mystring, 6, 2));
                                Evaluate(Year, CopyStr(mystring, 1, 4));
                                Evaluate(TheTime, CopyStr(mystring, 12, 2) + CopyStr(mystring, 15, 2) + CopyStr(mystring, 17, 1) + '00');
                                mydateTime := CreateDateTime(DMY2Date(Day, Month, Year), TheTime);

                                rtnMessageObject.Get('sdcId', rtnToken);
                                sdcId := rtnToken.AsValue().AsText();

                                rtnMessageObject.Get('cuInvoiceNo', rtnToken);
                                CUInvoiceNo := rtnToken.AsValue().AsText();

                                rtnMessageObject.Get('QRCodeUrl', rtnToken);
                                QRCodeUrl := rtnToken.AsValue().AsText();

                                updateInvoiceReport(SalesInvHeader."No.", intrlData, rcptSign, sdcId, CUInvoiceNo, QRCodeUrl, mydateTime);

                            end;
                    end else begin
                        SalesInvHeader."Posted to Etims" := false;
                        SalesInvHeader.Modify();
                        //save response
                        eTimsPushCredit.Reset();
                        eTimsPushCredit.Init();
                        eTimsPushCredit.Code := SalesInvHeader."No.";
                        eTimsPushCredit.Json := Response;
                        if eTimsPushCredit.Insert() = false then
                            eTimsPushCredit.Modify();
                    end;

                end;
            until SalesInvHeader.Next() = 0;
    end;

    procedure pushSalesInvoices2(No: Text): Text
    var
        token: Text;
        HeaderJsonObject: JsonObject;
        LinesJsonObject: JsonObject;
        LinesJsonArray: JsonArray;
        SalesInvHeader, salesINV : Record "Sales Invoice Header";
        SalesInvLines: Record "Sales Invoice Line";
        startingDay: Date;
        saledate: Text;
        currency: Text;
        rtnMessageArray: JsonArray;
        rtnMessageToken: JsonToken;
        rtnMessageObject: JsonObject;
        rtnToken: JsonToken;
        invoceNum: Text;
        intrlData: Text;
        rcptSign: Text;
        sdcId: Text;
        CUInvoiceNo: Text;
        QRCodeUrl: Text;
        dateT: DateTime;
        Month: Integer;
        Year: Integer;
        Day: Integer;
        TheTime: Time;
        TheTime2: Time;
        myTime: Time;
        mystring: Text;
        mydateTime: DateTime;
        CompInfo: Record "Company Information";
        eTimsPushCredit: Record eTimsPushCredit;
        getEndDate: DateTime;
        getStartDate: DateTime;
        jsontextRequest: Text;
        OutStream: OutStream;
    begin


        //create Sales header Json
        token := GetEtimsToken();
        company.Get();
        Evaluate(TheTime, '235959');
        Evaluate(TheTime2, '000001');
        getStartDate := CreateDateTime(Today, TheTime2);
        getEndDate := CreateDateTime(Today, TheTime);

        SalesInvHeader.Reset();
        SalesInvHeader.Get(No);
        SalesInvHeader."Posted to Etims" := true;
        SalesInvHeader.Modify();

        Clear(HeaderJsonObject);
        Clear(LinesJsonArray);
        HeaderJsonObject.Add('tin', company."Company Tin");
        HeaderJsonObject.Add('BranchId', company."Branch ID");
        HeaderJsonObject.Add('DocumentType', 'Sales');
        HeaderJsonObject.Add('InvoiceNo', SalesInvHeader."No.");
        HeaderJsonObject.Add('ETimsInvoiceNo', getSalesInvoiceNum(SalesInvHeader."No."));
        customer.Reset();
        if customer.Get(SalesInvHeader."Bill-to Customer No.") then begin
            HeaderJsonObject.Add('CustPIN', customer."VAT Registration No.");
            HeaderJsonObject.Add('CustName', customer.Name);
            HeaderJsonObject.Add('CustBranchId', customer."Branch Code");
        end;
        saledate := FORMAT(SalesInvHeader."Document Date", 0, '<Year4>-<Month,2>-<Day,2>');
        HeaderJsonObject.Add('SaleDate', saledate);
        HeaderJsonObject.Add('PostStockMovement', 'N');

        if SalesInvHeader."Currency Code" = '' then
            currency := 'KES' else
            currency := SalesInvHeader."Currency Code";
        HeaderJsonObject.Add('CurrencyCode', currency);
        //breaks
        HeaderJsonObject.Add('ExchangeRate', getPostedDocCurrencyDetails(SalesInvHeader."No."));
        HeaderJsonObject.Add('RefInvoiceNo', 0);
        HeaderJsonObject.Add('CreditNoteReason', '');
        users.Reset();
        users.SetRange("User Security ID", SalesInvHeader.SystemCreatedBy);
        if users.FindFirst() then begin
            HeaderJsonObject.Add('CreatedBy', users."User Name");
            HeaderJsonObject.Add('CreatedByName', users."Full Name");
        end;

        //Create Lines
        SalesInvLines.Reset();
        SalesInvLines.SetRange("Document No.", SalesInvHeader."No.");
        if SalesInvLines.FindSet() then
            repeat
                Clear(LinesJsonObject);
                glAccount.Reset();
                if glAccount.Get(SalesInvLines."No.") then begin
                    LinesJsonObject.Add('ItemCode', glAccount."Etims Item Code");
                    LinesJsonObject.Add('ItemClassCode', glAccount."Item Class");
                    LinesJsonObject.Add('ItemName', SalesInvLines.Description);
                    LinesJsonObject.Add('ItemTypeCode', glAccount."Service Type");
                    LinesJsonObject.Add('PackagingUnitCode', glAccount."Packaging Unit code");
                    LinesJsonObject.Add('QuantityUnitCode', glAccount."Quantity Unit Code");
                    LinesJsonObject.Add('Quantity', Round(SalesInvLines.Quantity, 0.01));
                    LinesJsonObject.Add('UnitPriceExcl', Round((SalesInvLines."Line Amount" / SalesInvLines.Quantity), 0.01));
                    LinesJsonObject.Add('TaxRate', SalesInvLines."VAT %");
                    LinesJsonObject.Add('TaxationTypeCode', getTaxType(SalesInvHeader."No.", SalesInvLines."No."));
                    LinesJsonObject.Add('DiscountRate', SalesInvLines."Line Discount %");
                    LinesJsonObject.Add('DiscountAmount', Round(SalesInvLines."Line Discount Amount", 0.01));
                    LinesJsonArray.Add(LinesJsonObject);
                end;

            until SalesInvLines.Next() = 0;
        HeaderJsonObject.Add('itemList', LinesJsonArray);

        //send Request to eTims
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'saveSales');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Authorization', 'Bearer ' + token);
        HttpContent.WriteFrom(Format(HeaderJsonObject));
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);

        //HttpClient.Timeout(300000);
        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode then begin
                JsonBuffer.ReadFromText(Response);
                Response := convertToJson(Response);
                //save response
                eTimsPushCredit.Reset();
                eTimsPushCredit.Init();
                eTimsPushCredit.Code := SalesInvHeader."No.";
                eTimsPushCredit.Json := Response;
                if eTimsPushCredit.Insert() = false then
                    eTimsPushCredit.Modify();

                if jsonResponse.ReadFrom(Response) then
                    if Response.Contains('9020') then begin
                        SalesInvHeader."Posted to Etims" := false;
                        SalesInvHeader.Modify();
                    end else begin
                        jsonResponse.Get('data', jsonTokenValue);
                        rtnMessageObject := jsonTokenValue.AsObject();

                        //rtnMessageObject.Get('rcptNo', rtnToken);
                        //rcptNo := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('intrlData', rtnToken);
                        intrlData := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('rcptSign', rtnToken);
                        rcptSign := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('ReceiptDateTime', rtnToken);
                        mystring := rtnToken.AsValue().AsText();
                        //2024-03-22 14:39:34
                        Evaluate(Day, CopyStr(mystring, 9, 2));
                        Evaluate(Month, CopyStr(mystring, 6, 2));
                        Evaluate(Year, CopyStr(mystring, 1, 4));
                        Evaluate(TheTime, CopyStr(mystring, 12, 2) + CopyStr(mystring, 15, 2) + CopyStr(mystring, 17, 1) + '00');
                        mydateTime := CreateDateTime(DMY2Date(Day, Month, Year), TheTime);

                        rtnMessageObject.Get('sdcId', rtnToken);
                        sdcId := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('cuInvoiceNo', rtnToken);
                        CUInvoiceNo := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('QRCodeUrl', rtnToken);
                        QRCodeUrl := rtnToken.AsValue().AsText();

                        updateInvoiceReport(SalesInvHeader."No.", intrlData, rcptSign, sdcId, CUInvoiceNo, QRCodeUrl, mydateTime);
                    end;
            end else begin
                SalesInvHeader."Posted to Etims" := false;
                SalesInvHeader.Modify();
                //save response
                eTimsPushCredit.Reset();
                eTimsPushCredit.Init();
                eTimsPushCredit.Code := SalesInvHeader."No.";
                eTimsPushCredit.Json := Response;
                if eTimsPushCredit.Insert() = false then
                    eTimsPushCredit.Modify();
            end;

        end;
    end;

    procedure PushSalesInvoice(DocumentNo: Text): Text
    var
        Token: Text;
        HeaderObj: JsonObject;
        ReceiptObj: JsonObject;
        ItemArray: JsonArray;
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvHeader1: Record "Sales Invoice Header";
        ResponseText: Text;
        TotalTaxable: Decimal;
        TotalTax: Decimal;
        TotalAmount: Decimal;
        count: Integer;

        // -------------------
        // Stock In/Out vars
        // -------------------
        StockHeaderObj: JsonObject;
        StockItemArray: JsonArray;
        StockResponseText: Text;
        TotalVat: Decimal;
    begin
        company.Get();
        // Token := GetEtimsToken();
        SalesInvHeader1.Get(DocumentNo);
        if SalesInvHeader1."ETIMS Local Invoice Number" = 0 then begin
            company.Get();
            company.LockTable();
            count := company."Sales Invoice Number" + 1;
            company."Sales Invoice Number" := count;
            company.Modify();

            SalesInvHeader1."ETIMS Local Invoice Number" := count;
            SalesInvHeader1.Modify();
            Commit();
        end;
        SalesInvHeader.Get(DocumentNo);

        if SalesInvHeader."Posted to Etims" then
            Error('Invoice %1 already posted to ETIMS', SalesInvHeader."No.");

        // Build JSON payload
        BuildInvoicePayload(SalesInvHeader, HeaderObj, ReceiptObj, ItemArray, TotalTaxable, TotalTax, TotalAmount);

        // Send request to ETIMS
        ResponseText := SendEtimsRequest(HeaderObj, Token);

        // Handle response
        HandleEtimsInvoiceResponse(ResponseText, SalesInvHeader."No.");

        // -------------------
        // 2) AFTER SUCCESS -> Build & Push Stock In/Out
        // -------------------
        // (Optional guard if you add a field on SIH to prevent re-posting stock)
        // if SalesInvHeader."Posted Stock to Etims" then
        //     exit(ResponseText);        

        // Build stock payload from same invoice header/lines
        //Commented Stock In Stock Out
        // BuildStockInOutPayloadFromInvoice(
        //     SalesInvHeader,
        //     StockHeaderObj,
        //     StockItemArray,
        //     TotalTaxable,
        //     TotalVat,
        //     TotalAmount);

        // Send stock in/out request (replace endpoint path inside this function)
        // StockResponseText := SendEtimsStockInOutRequest(StockHeaderObj, Token);

        // // Handle stock response + mark posted
        // HandleEtimsStockInOutResponse(StockResponseText);

        exit(ResponseText);
    end;


    local procedure BuildInvoicePayload(var SalesInvHeader: Record "Sales Invoice Header"; var HeaderObj: JsonObject; var ReceiptObj: JsonObject; var ItemArray: JsonArray; var TotalTaxable: Decimal; var TotalTax: Decimal; var TotalAmount: Decimal)
    var
        SalesInvLine: Record "Sales Invoice Line";
        Customer: Record Customer;
        ItemObj: JsonObject;
        LineNo: Integer;
        // CleanInvNo: Text;

        TaxBand: Code[10];
        TaxRate: Decimal;

        // Tax band totals A–E
        TaxableA: Decimal;
        TaxableB: Decimal;
        TaxableC: Decimal;
        TaxableD: Decimal;
        TaxableE: Decimal;
        TaxAmtA: Decimal;
        TaxAmtB: Decimal;
        TaxAmtC: Decimal;
        TaxAmtD: Decimal;
        TaxAmtE: Decimal;
        RateA: Decimal;
        RateB: Decimal;
        RateC: Decimal;
        RateD: Decimal;
        RateE: Decimal;

        LineTaxable: Decimal;
        LineTax: Decimal;
        CleanQuantity: Text;
    begin
        Clear(HeaderObj);
        Clear(ItemArray);
        Clear(ReceiptObj);

        TotalTaxable := 0;
        TotalTax := 0;
        TotalAmount := 0;

        TaxableA := 0;
        TaxableB := 0;
        TaxableC := 0;
        TaxableD := 0;
        TaxableE := 0;
        TaxAmtA := 0;
        TaxAmtB := 0;
        TaxAmtC := 0;
        TaxAmtD := 0;
        TaxAmtE := 0;
        RateA := 0;
        RateB := 0;
        RateC := 0;
        RateD := 0;
        RateE := 0;

        // CleanInvNo := DelChr(SalesInvHeader."No.", '=', 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-/');

        // // Remove leading zeros
        // while CopyStr(CleanInvNo, 1, 1) = '0' do
        //     CleanInvNo := DELSTR(CleanInvNo, 1, 1);

        // --- Header ---
        HeaderObj.Add('businessId', company.Name);
        HeaderObj.Add('pin', company."Company Tin");
        HeaderObj.Add('branchId', company."Branch ID");
        HeaderObj.Add('traderInvoiceNumber', SalesInvHeader."No.");
        HeaderObj.Add('invoiceNumber', Format(SalesInvHeader."ETIMS Local Invoice Number"));
        HeaderObj.Add('invoiceStatusCode', '02'); // Approved
        HeaderObj.Add('saleDate', _ETIMSHelperFunctions.FormatETIMSDateOnly(SalesInvHeader."Posting Date"));
        HeaderObj.Add('stockReleaseDate', _ETIMSHelperFunctions.FormatETIMSDate(CreateDateTime(SalesInvHeader."Posting Date", 0T)));
        HeaderObj.Add('validatedDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));
        HeaderObj.Add('salesTypeCode', 'N');  //Normal
        HeaderObj.Add('receiptTypeCode', 'S'); //Sales
        HeaderObj.Add('paymentTypeCode', '01'); // Cash

        if Customer.Get(SalesInvHeader."Bill-to Customer No.") then begin
            if Customer."VAT Registration No." = '' then
                Error(
                    'VAT Registration No. is required for customer %1 (%2).',
                    Customer."No.",
                    Customer.Name);

            HeaderObj.Add('customerPin', Customer."VAT Registration No.");
            HeaderObj.Add('customerName', Customer.Name);
        end;
        // --- Lines ---
        LineNo := 1;
        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        SalesInvLine.SetFilter(Type, '<>%1', SalesInvLine.Type::" ");
        if SalesInvLine.FindSet() then
            repeat
                Clear(ItemObj);
                item.Reset();
                if item.Get(SalesInvLine."No.") then begin
                    if item."Etims Item Code" = '' then
                        Error('Kindly generate ETIMS Item Code for item  %1 on the item card. It cannot be empty.', item."No.");
                    // Line amounts
                    // LineTaxable := SalesInvLine."Line Amount";
                    LineTaxable := SalesInvLine."VAT Base Amount";
                    LineTax := SalesInvLine."Amount Including VAT" - SalesInvLine."VAT Base Amount";

                    // Resolve tax band + rate from setup table 60002
                    TaxBand := _ETIMSHelperFunctions.NormalizeEtimsTaxBand(item."Tax Type"); // returns A/B/C/D/E
                    TaxRate := _ETIMSHelperFunctions.GetEtimsTaxRate(TaxBand);

                    CleanQuantity := DelChr(Format(SalesInvLine.Quantity), '=', ',');

                    ItemObj.Add('itemSequenceNumber', LineNo);
                    ItemObj.Add('itemCode', item."Etims Item Code");
                    ItemObj.Add('itemName', SalesInvLine.Description);
                    ItemObj.Add('quantity', CleanQuantity);
                    ItemObj.Add('unitPrice', SalesInvLine."Unit Price");
                    ItemObj.Add('supplyAmount', LineTaxable);
                    ItemObj.Add('taxableAmount', LineTaxable);
                    ItemObj.Add('taxAmount', LineTax);
                    // ItemObj.Add('totalAmount', SalesInvLine."Amount Including VAT");
                    ItemObj.Add('totalAmount', LineTaxable);
                    ItemObj.Add('taxationTypeCode', TaxBand);
                    ItemObj.Add('quantityUnitCode', item."Quantity Unit Code");
                    ItemObj.Add('packagingUnitCode', item."Packaging Unit code");
                    ItemObj.Add('itemClassificationCode', item."Item Class");

                    // Totals (overall)
                    TotalTaxable += LineTaxable;
                    TotalTax += LineTax;
                    TotalAmount += SalesInvLine."Amount Including VAT";

                    // Totals (by tax band A–E)
                    _ETIMSHelperFunctions.AccumulateTaxBandTotals(
                       TaxBand, TaxRate, LineTaxable, LineTax,
                       TaxableA, TaxableB, TaxableC, TaxableD, TaxableE,
                       TaxAmtA, TaxAmtB, TaxAmtC, TaxAmtD, TaxAmtE,
                       RateA, RateB, RateC, RateD, RateE);

                    ItemArray.Add(ItemObj);
                    LineNo += 1;
                end;

            until SalesInvLine.Next() = 0;

        HeaderObj.Add('itemList', ItemArray);

        // --- Totals ---
        HeaderObj.Add('totalItemCount', LineNo - 1);

        // A–E totals required by the payload
        HeaderObj.Add('taxableAmountA', TaxableA);
        HeaderObj.Add('taxableAmountB', TaxableB);
        HeaderObj.Add('taxableAmountC', TaxableC);
        HeaderObj.Add('taxableAmountD', TaxableD);
        HeaderObj.Add('taxableAmountE', TaxableE);

        HeaderObj.Add('taxRateA', RateA);
        HeaderObj.Add('taxRateB', RateB);
        HeaderObj.Add('taxRateC', RateC);
        HeaderObj.Add('taxRateD', RateD);
        HeaderObj.Add('taxRateE', RateE);

        HeaderObj.Add('taxAmountA', TaxAmtA);
        HeaderObj.Add('taxAmountB', TaxAmtB);
        HeaderObj.Add('taxAmountC', TaxAmtC);
        HeaderObj.Add('taxAmountD', TaxAmtD);
        HeaderObj.Add('taxAmountE', TaxAmtE);

        // Overall totals
        HeaderObj.Add('totalTaxableAmount', TotalTaxable);
        HeaderObj.Add('totalTaxAmount', TotalTax);
        HeaderObj.Add('totalAmount', TotalAmount);

        // =====================
        // Audit / Metadata
        // =====================
        HeaderObj.Add('purchaseAcceptYN', 'Y');
        HeaderObj.Add('remark', 'Sales Invoice');
        HeaderObj.Add('registrationId', company."Company Tin");
        HeaderObj.Add('registrationName', company.Name);
        HeaderObj.Add('modifierId', UserId);
        HeaderObj.Add('modifierName', UserId);

        // --- Receipt ---
        ReceiptObj.Add('customerPin', SalesInvHeader."VAT Registration No.");
        ReceiptObj.Add('tradeName', company.Name);
        ReceiptObj.Add('purchaseAcceptYN', 'Y');
        ReceiptObj.Add('receiptPublishedDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));

        HeaderObj.Add('receipt', ReceiptObj);
        Message(Format(HeaderObj));
    end;


    local procedure SendEtimsRequest(HeaderObj: JsonObject; Token: Text): Text
    var
        JsonTxt: Text;
    begin
        HeaderObj.WriteTo(JsonTxt);

        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        RequestMessage.SetRequestUri(getURL + 'Invoice/pushreceipt');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);

        HttpContent.WriteFrom(JsonTxt);
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        RequestMessage.Content(HttpContent);

        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            Error('Failed to send invoice to ETIMS');

        ResponseMessage.Content.ReadAs(JsonTxt);

        if not ResponseMessage.IsSuccessStatusCode then
            Error('ETIMS rejected invoice: %1', JsonTxt);

        exit(JsonTxt);
    end;

    local procedure BuildStockInOutPayloadFromInvoice(
        var SalesInvHeader: Record "Sales Invoice Header";
        var HeaderObj: JsonObject;
        var ItemArray: JsonArray;
        var TotalTaxable: Decimal;
        var TotalVat: Decimal;
        var TotalAmount: Decimal)
    var
        SalesInvLine: Record "Sales Invoice Line";
        Customer: Record Customer;
        ItemRec: Record Item;
        ItemObj: JsonObject;
        LineNo: Integer;

        TaxBand: Code[10];
        TaxRate: Decimal;

        LineTaxable: Decimal;
        LineVat: Decimal;
        LineTotal: Decimal;

        CleanQty: Text;
    begin
        Clear(HeaderObj);
        Clear(ItemArray);

        TotalTaxable := 0;
        TotalVat := 0;
        TotalAmount := 0;

        // =====================
        // Header (top-level)
        // =====================
        HeaderObj.Add('businessId', Company."Company Tin");     // or Company.Name if ETIMS expects name
        HeaderObj.Add('storedReleasedNo', SalesInvHeader."ETIMS Local Invoice Number");
        HeaderObj.Add('originalStoredReleasedNo', 0);
        HeaderObj.Add('registrationTypeCode', 'A');             // Automatic
        HeaderObj.Add('storedReleasedTypeCode', '11');          // Sale

        if Customer.Get(SalesInvHeader."Bill-to Customer No.") then begin
            HeaderObj.Add('customerTin', Customer."VAT Registration No.");
            HeaderObj.Add('customerNm', Customer.Name);
            HeaderObj.Add('customerBhfId', Company."Branch ID"); // if you have customer branch, map it here
        end else begin
            HeaderObj.Add('customerTin', '');
            HeaderObj.Add('customerNm', '');
            HeaderObj.Add('customerBhfId', Company."Branch ID");
        end;

        // Date-only (yyyyMMdd)
        HeaderObj.Add('occurredDateTime', _ETIMSHelperFunctions.FormatETIMSDateOnly(SalesInvHeader."Posting Date"));

        HeaderObj.Add('remark', 'Stock released to customer');
        HeaderObj.Add('registrationId', UserId);
        HeaderObj.Add('registrationName', UserId);
        HeaderObj.Add('modifierId', UserId);
        HeaderObj.Add('modifierName', UserId);

        // =====================
        // Lines -> itemList[]
        // =====================
        LineNo := 1;
        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        SalesInvLine.SetFilter(Type, '<>%1', SalesInvLine.Type::" ");
        if SalesInvLine.FindSet() then
            repeat
                Clear(ItemObj);

                if ItemRec.Get(SalesInvLine."No.") then begin
                    if ItemRec."Etims Item Code" = '' then
                        Error('Generate ETIMS Item Code for item %1. It cannot be empty.', ItemRec."No.");

                    // Amounts (same approach as your invoice)
                    LineTaxable := SalesInvLine."Line Amount";
                    LineTotal := SalesInvLine."Amount Including VAT";
                    LineVat := LineTotal - LineTaxable;

                    TaxBand := _ETIMSHelperFunctions.NormalizeEtimsTaxBand(ItemRec."Tax Type"); // A/B/C/D/E
                    TaxRate := _ETIMSHelperFunctions.GetEtimsTaxRate(TaxBand);

                    CleanQty := DelChr(Format(SalesInvLine.Quantity), '=', ',');

                    ItemObj.Add('itemSequence', LineNo);
                    ItemObj.Add('itemCode', ItemRec."Etims Item Code");
                    ItemObj.Add('itemClassificationCode', ItemRec."Item Class");
                    ItemObj.Add('itemName', SalesInvLine.Description);

                    // Barcode field: change to your actual barcode/GTIN field
                    ItemObj.Add('barcode', '');

                    ItemObj.Add('packagingUnitCode', ItemRec."Packaging Unit code");
                    ItemObj.Add('package', 1); // if you have pack size/outer pack qty, map it here
                    ItemObj.Add('quantityUnitCode', ItemRec."Quantity Unit Code");
                    ItemObj.Add('quantity', CleanQty);

                    // If expiry is required and you have it, add it; otherwise omit
                    // ItemObj.Add('itemExprDt', _ETIMSHelperFunctions.FormatETIMSDateOnly(ItemRec."Expiration Date"));

                    ItemObj.Add('unitPrice', SalesInvLine."Unit Price");
                    ItemObj.Add('supplyAmount', LineTaxable);
                    ItemObj.Add('discountAmount', 0);
                    ItemObj.Add('taxableAmount', LineTaxable);
                    ItemObj.Add('taxationTypeCode', TaxBand);
                    ItemObj.Add('taxAmount', LineVat);
                    ItemObj.Add('totalAmount', LineTotal);

                    ItemArray.Add(ItemObj);

                    TotalTaxable += LineTaxable;
                    TotalVat += LineVat;
                    TotalAmount += LineTotal;

                    LineNo += 1;
                end;
            until SalesInvLine.Next() = 0;

        HeaderObj.Add('itemList', ItemArray);

        HeaderObj.Add('totalItemCount', LineNo - 1);
        HeaderObj.Add('totalTaxableAmount', TotalTaxable);
        HeaderObj.Add('totalVat', TotalVat);

        // Your sample had totalAmount=20000 even though VAT exists (inconsistent).
        // Normally totalAmount should be taxable+vat. Here we use VAT-inclusive total:
        HeaderObj.Add('totalAmount', TotalAmount);

        Message(Format(HeaderObj));
    end;

    local procedure SendEtimsStockInOutRequest(HeaderObj: JsonObject; Token: Text): Text
    var
        JsonTxt: Text;
    begin
        HeaderObj.WriteTo(JsonTxt);

        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);

        RequestMessage.SetRequestUri(getURL + 'Stock/InsertStockIO');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);

        // If you use Bearer token:
        // RequestHeaders.Add('Authorization', StrSubstNo('Bearer %1', Token));

        HttpContent.WriteFrom(JsonTxt);
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        RequestMessage.Content(HttpContent);

        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            Error('Failed to send stock in/out to ETIMS');

        ResponseMessage.Content.ReadAs(JsonTxt);

        if not ResponseMessage.IsSuccessStatusCode then
            Error('ETIMS rejected stock in/out: %1', JsonTxt);

        exit(JsonTxt);
    end;
    // =====================================================
    // Same response design as HandleSaveItemsResponse
    // Envelope expected:
    // { "statusCode": 200, "success": true, "error": null, "result": "000: Successful" }
    // =====================================================
    local procedure HandleEtimsStockInOutResponse(ResponseText: Text)
    var
        RootObj: JsonObject;
        JsonTok: JsonToken;
        StatusCode: Integer;
        Success: Boolean;
        ErrorTxt: Text;
        ResultTxt: Text;
        ResultCd: Text;
        ColonPos: Integer;
    begin
        if not RootObj.ReadFrom(ResponseText) then
            Error('Invalid JSON returned from ETIMS');

        if RootObj.Get('statusCode', JsonTok) then
            StatusCode := JsonTok.AsValue().AsInteger()
        else
            Error('Missing statusCode in response');

        if RootObj.Get('success', JsonTok) then
            Success := JsonTok.AsValue().AsBoolean()
        else
            Error('Missing success in response');

        if (not Success) or (StatusCode <> 200) then begin
            if RootObj.Get('error', JsonTok) then
                ErrorTxt := JsonTok.AsValue().AsText()
            else
                ErrorTxt := '';

            if ErrorTxt <> '' then
                Error(ErrorTxt);

            Error('ETIMS returned an error');
        end;

        if RootObj.Get('result', JsonTok) then
            ResultTxt := JsonTok.AsValue().AsText()
        else
            ResultTxt := '';

        ResultCd := '';
        ColonPos := StrPos(ResultTxt, ':');
        if ColonPos > 1 then
            ResultCd := CopyStr(ResultTxt, 1, ColonPos - 1)
        else
            if StrLen(ResultTxt) >= 3 then
                ResultCd := CopyStr(ResultTxt, 1, 3);

        if ResultCd <> '000' then begin
            if ResultTxt <> '' then
                Error(ResultTxt);
            Error('ETIMS returned an error');
        end;

        // Optional: mark something on item to show stock master synced
        // Add a boolean field like "Stock Master Posted to Etims" if you want.
        // ItemRec."Stock Master Posted to Etims" := true;
        // ItemRec.Modify(true);

        Message('StockMaster saved to ETIMS successfully.');
    end;

    local procedure HandleEtimsInvoiceResponse(Response: Text; SalesInvHeaderNo: Code[20])
    var
        RootObj: JsonObject;
        ResultObj: JsonObject;
        DataObj: JsonObject;
        Token: JsonToken;

        ResultCd: Text;
        ResultMsg: Text;
        ResultDt: Text;

        CurRcptNo: Text;
        TotRcptNo: Text;
        IntrlData: Text;
        RcptSign: Text;
        SdcDateTimeTxt: Text;
        SdcDateTimeVal: DateTime;
        QrCodeUrl: Text;
        SdcId: Text;

        SdcDate: Date;
        SdcTime: Time;
        CUNumber: Text;
        ResponseText: Text;
    begin
        // Parse root
        if not RootObj.ReadFrom(Response) then
            Error('Invalid ETIMS response');

        if RootObj.Get('success', Token) then
            if not Token.AsValue().AsBoolean() then begin
                if RootObj.Get('error', Token) then
                    Error('ETIMS Error: %1', Token.AsValue().AsText());

                Error('ETIMS request failed.');
            end;

        // Extract "result" object
        RootObj.Get('result', Token);
        ResultObj := Token.AsObject();

        // Top-level result fields
        ResultObj.Get('resultCd', Token);
        ResultCd := Token.AsValue().AsText();

        ResultObj.Get('resultMsg', Token);
        ResultMsg := Token.AsValue().AsText();

        ResultObj.Get('resultDt', Token);
        ResultDt := Token.AsValue().AsText();

        // Handle failure
        if ResultCd <> '000' then
            Error('%1: %2', ResultCd, ResultMsg);

        // Extract "data" object
        ResultObj.Get('data', Token);
        DataObj := Token.AsObject();

        // Convert to Text
        DataObj.Get('rcptNo', Token);
        CurRcptNo := Format(Token.AsValue().AsInteger());

        DataObj.Get('totRcptNo', Token);
        TotRcptNo := Format(Token.AsValue().AsInteger());

        DataObj.Get('intrlData', Token);
        IntrlData := Token.AsValue().AsText();

        DataObj.Get('rcptSign', Token);
        RcptSign := Token.AsValue().AsText();

        DataObj.Get('cuInvoiceNo', Token);
        CUNumber := Token.AsValue().AsText();

        DataObj.Get('sdcId', Token);
        SdcId := Token.AsValue().AsText();

        DataObj.Get('vsdcRcptPbctDate', Token);

        SdcDateTimeTxt := Token.AsValue().AsText(); // 20260122162738
                                                    // yyyy-mm-dd  → SAFE in all locales
        Evaluate(SdcDate,
            CopyStr(SdcDateTimeTxt, 1, 4) + '-' +
            CopyStr(SdcDateTimeTxt, 5, 2) + '-' +
            CopyStr(SdcDateTimeTxt, 7, 2));

        // HH:MM:SS
        Evaluate(SdcTime,
            CopyStr(SdcDateTimeTxt, 9, 2) + ':' +
            CopyStr(SdcDateTimeTxt, 11, 2) + ':' +
            CopyStr(SdcDateTimeTxt, 13, 2));

        SdcDateTimeVal := CreateDateTime(SdcDate, SdcTime);


        // QR Code comes directly from API
        DataObj.Get('qrCode', Token);
        QrCodeUrl := Token.AsValue().AsText();

        company.Get();

        // Update invoice report / table
        UpdateInvoiceReport(
            SalesInvHeaderNo,
            IntrlData,
            RcptSign,
            SdcId,    // Text
            company."ETIMS SDC ID",    // Text
            QrCodeUrl,
            SdcDateTimeVal
        );
    end;


    //receiptNum,intrlData, rcptSign, sdcId, CUInvoiceNo, QRCodeUrl, dateTime
    procedure updateInvoiceReport(invoceNum: Text; intrlData: Text; rcptSign: Text; sdcId: Text; CUInvoiceNo: Text; QRCodeUrl: Text; dateT: DateTime) Msg: Text
    var
    // CleanInvNo: Text;
    begin
        Msg := 'fail';
        company.Get();
        SIH.Reset();
        SIH.SetRange("No.", invoceNum);
        if SIH.FindFirst() then begin
            // CleanInvNo := DelChr(SIH."No.", '=', 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-/');
            // while CopyStr(CleanInvNo, 1, 1) = '0' do
            //     CleanInvNo := DELSTR(CleanInvNo, 1, 1);

            SIH.EtimsDate := DT2Date(dateT);
            SIH.EtimsTime := DT2Time(dateT);
            SIH."SCU ID" := sdcId;
            SIH."CU Invoice Number" := sdcId + '/' + Format(SIH."ETIMS Local Invoice Number");
            SIH."Internal Data" := intrlData;
            SIH."Receipt Signature" := rcptSign;
            SIH.QRCodeUrl := QRCodeUrl;
            SIH."Posted to Etims" := true;
            if SIH.Modify() then GenerateBarcode(QRCodeUrl, SIH);
            Msg := 'Success';
        end;
    end;
    // =========================================
    // PUSH PURCHASE INVOICE (mirror of PushSalesInvoice)
    // Expected endpoint payload matches your sample
    // =========================================

    procedure PushPurchaseInvoice(DocumentNo: Code[20]): Text
    var
        Token: Text;
        HeaderObj: JsonObject;
        ItemArray: JsonArray;
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvHeader1: Record "Purch. Inv. Header";
        ResponseText: Text;
        TotalTaxable: Decimal;
        TotalTax: Decimal;
        TotalAmount: Decimal;
        Count: Integer;
        // -------------------
        // Stock In/Out vars
        // -------------------
        StockHeaderObj: JsonObject;
        StockItemArray: JsonArray;
        StockResponseText: Text;
        TotalVat: Decimal;
    begin
        company.Get();

        // Token := GetEtimsToken();

        // Generate local invoice number (similar to your Sales logic)
        PurchInvHeader1.Get(DocumentNo);
        if PurchInvHeader1."ETIMS Local Invoice Number" = 0 then begin
            company.Get();
            company.LockTable();
            Count := company."Purchase Invoice Number" + 1; // create this field if you don't have it
            company."Purchase Invoice Number" := Count;
            company.Modify();

            PurchInvHeader1."ETIMS Local Invoice Number" := Count;
            PurchInvHeader1.Modify();
            Commit();
        end;

        PurchInvHeader.Get(DocumentNo);

        if PurchInvHeader."Posted to Etims" then
            Error('Purchase Invoice %1 already posted to ETIMS', PurchInvHeader."No.");

        // Build JSON payload
        BuildPurchaseInvoicePayload(PurchInvHeader, HeaderObj, ItemArray, TotalTaxable, TotalTax, TotalAmount);

        // Send request to ETIMS
        ResponseText := SendEtimsPurchaseRequest(HeaderObj, Token);

        // Handle response (you can reuse your response handler if response format is same "result/data")
        HandleEtimsPurchaseInvoiceResponse(ResponseText, PurchInvHeader."No.");

        // ======================================================
        // 4) AFTER PURCHASE SUCCESS -> Push Stock IN (Stored Release)
        // ======================================================
        BuildStockInOutPayloadFromPurchaseInvoice(
            PurchInvHeader,
            StockHeaderObj,
            StockItemArray,
            TotalTaxable,
            TotalVat,
            TotalAmount);

        StockResponseText := SendEtimsStockInOutRequest(StockHeaderObj, Token);

        HandleEtimsStockInOutResponse(StockResponseText);

        exit(ResponseText);
    end;


    // =========================================
    // BUILD PURCHASE PAYLOAD (matches your sample)
    // =========================================
    local procedure BuildPurchaseInvoicePayload(
        var PurchInvHeader: Record "Purch. Inv. Header";
        var HeaderObj: JsonObject;
        var ItemArray: JsonArray;
        var TotalTaxable: Decimal;
        var TotalTax: Decimal;
        var TotalAmount: Decimal)
    var
        PurchInvLine: Record "Purch. Inv. Line";
        Vendor: Record Vendor;
        ItemObj: JsonObject;
        LineNo: Integer;

        TaxBand: Code[10];
        TaxRate: Decimal;

        // Tax band totals A–E
        TaxableA: Decimal;
        TaxableB: Decimal;
        TaxableC: Decimal;
        TaxableD: Decimal;
        TaxableE: Decimal;
        TaxAmtA: Decimal;
        TaxAmtB: Decimal;
        TaxAmtC: Decimal;
        TaxAmtD: Decimal;
        TaxAmtE: Decimal;
        RateA: Decimal;
        RateB: Decimal;
        RateC: Decimal;
        RateD: Decimal;
        RateE: Decimal;

        LineTaxable: Decimal;
        LineTax: Decimal;
        CleanQuantity: Text;
    begin
        Clear(HeaderObj);
        Clear(ItemArray);

        TotalTaxable := 0;
        TotalTax := 0;
        TotalAmount := 0;

        TaxableA := 0;
        TaxableB := 0;
        TaxableC := 0;
        TaxableD := 0;
        TaxableE := 0;
        TaxAmtA := 0;
        TaxAmtB := 0;
        TaxAmtC := 0;
        TaxAmtD := 0;
        TaxAmtE := 0;
        RateA := 0;
        RateB := 0;
        RateC := 0;
        RateD := 0;
        RateE := 0;

        company.Get();

        // But if your API expects "supplierPin" to be vendor PIN instead, swap the mapping here.
        if Vendor.Get(PurchInvHeader."Buy-from Vendor No.") then begin
            // optional: store vendor in remark or custom fields if your endpoint supports it
        end;
        // ---------------------
        // HEADER (Purchase)
        // ---------------------
        HeaderObj.Add('businessId', company."Company Tin");
        HeaderObj.Add('invoiceNumber', PurchInvHeader."ETIMS Local Invoice Number");
        HeaderObj.Add('originalInvoiceNo', PurchInvHeader."ETIMS Local Invoice Number");

        // Supplier = YOUR COMPANY (who is receiving/recording purchase)
        HeaderObj.Add('supplierPin', Vendor."VAT Registration No.");
        HeaderObj.Add('supplierBranchId', company."Branch ID"); // sample shows null allowed; use text if required
        HeaderObj.Add('supplierName', Vendor.Name);
        // HeaderObj.Add('supplierInvoiceNo', PurchInvHeader."Vendor Invoice No."); // can be null; here we map if present

        HeaderObj.Add('registrationTypeCode', 'A'); // Automatic
        HeaderObj.Add('purchaseTypeCode', 'N');     // Normal
        HeaderObj.Add('receiptTypeCode', 'P');      // Purchase
        HeaderObj.Add('paymentTypeCode', '01');     // Cash (adjust if needed)
        HeaderObj.Add('purchaseStatusCode', '02');  // Approved

        HeaderObj.Add('validatedDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));
        HeaderObj.Add('purchaseDate', _ETIMSHelperFunctions.FormatETIMSDateOnly(PurchInvHeader."Posting Date")); // yyyyMMdd
        HeaderObj.Add('wareHousingDate', ''); // keep blank if not used
        HeaderObj.Add('cancelRequestedDate', '');
        HeaderObj.Add('canceledDate', '');
        HeaderObj.Add('creditNoteDate', '');

        // ---------------------
        // LINES
        // ---------------------
        LineNo := 1;
        PurchInvLine.SetRange("Document No.", PurchInvHeader."No.");
        PurchInvLine.SetFilter(Type, '<>%1', PurchInvLine.Type::" ");
        if PurchInvLine.FindSet() then
            repeat
                Clear(ItemObj);

                item.Reset();
                if not item.Get(PurchInvLine."No.") then
                    Error('Item %1 not found for purchase invoice %2', PurchInvLine."No.", PurchInvHeader."No.");

                if item."Etims Item Code" = '' then
                    Error('Generate ETIMS Item Code for item %1. It cannot be empty.', item."No.");

                // Amounts (adjust if your purchase invoice line uses different fields)
                LineTaxable := PurchInvLine."Line Amount";
                LineTax := PurchInvLine."Amount Including VAT" - PurchInvLine."Line Amount";

                // Resolve tax band + rate (same helper you use on Sales)
                TaxBand := _ETIMSHelperFunctions.NormalizeEtimsTaxBand(item."Tax Type"); // A/B/C/D/E
                TaxRate := _ETIMSHelperFunctions.GetEtimsTaxRate(TaxBand);

                CleanQuantity := DelChr(Format(PurchInvLine.Quantity), '=', ',');

                ItemObj.Add('itemSequenceNumber', LineNo);
                ItemObj.Add('itemCode', item."Etims Item Code");
                ItemObj.Add('itemClassificationCode', item."Item Class"); // sample uses a code like 5059690800
                ItemObj.Add('itemName', PurchInvLine.Description);

                ItemObj.Add('barCode', ''); // if you store barcodes, map here
                ItemObj.Add('supplierItemClassificationCd', ''); // sample shows null; keep empty or omit if allowed
                ItemObj.Add('supplierItemCode', '');
                ItemObj.Add('supplierItemName', '');

                ItemObj.Add('packagingUnitCode', item."Packaging Unit code");
                ItemObj.Add('package', CleanQuantity); // sample uses "package": 2; if you have cartons/packs, map properly
                ItemObj.Add('quantityUnitCode', item."Quantity Unit Code");
                ItemObj.Add('quantity', CleanQuantity);

                ItemObj.Add('unitPrice', PurchInvLine."Direct Unit Cost");
                ItemObj.Add('supplyAmount', LineTaxable);

                ItemObj.Add('discountRate', 0);
                ItemObj.Add('discountAmount', 0);

                ItemObj.Add('taxableAmount', LineTaxable);
                ItemObj.Add('taxationTypeCode', TaxBand);
                ItemObj.Add('taxAmount', LineTax);
                ItemObj.Add('totalAmount', PurchInvLine."Amount Including VAT");

                ItemObj.Add('itemExpiredDate', ''); // sample is null

                // Totals (overall)
                TotalTaxable += LineTaxable;
                TotalTax += LineTax;
                TotalAmount += PurchInvLine."Amount Including VAT";

                // Totals (by tax band A–E)
                _ETIMSHelperFunctions.AccumulateTaxBandTotals(
                    TaxBand, TaxRate, LineTaxable, LineTax,
                    TaxableA, TaxableB, TaxableC, TaxableD, TaxableE,
                    TaxAmtA, TaxAmtB, TaxAmtC, TaxAmtD, TaxAmtE,
                    RateA, RateB, RateC, RateD, RateE);

                ItemArray.Add(ItemObj);
                LineNo += 1;
            until PurchInvLine.Next() = 0;

        HeaderObj.Add('totalItemCount', LineNo - 1);

        // A–E totals
        HeaderObj.Add('taxableAmountA', TaxableA);
        HeaderObj.Add('taxableAmountB', TaxableB);
        HeaderObj.Add('taxableAmountC', TaxableC);
        HeaderObj.Add('taxableAmountD', TaxableD);
        HeaderObj.Add('taxableAmountE', TaxableE);

        HeaderObj.Add('taxRateA', RateA);
        HeaderObj.Add('taxRateB', RateB);
        HeaderObj.Add('taxRateC', RateC);
        HeaderObj.Add('taxRateD', RateD);
        HeaderObj.Add('taxRateE', RateE);

        HeaderObj.Add('taxAmountA', TaxAmtA);
        HeaderObj.Add('taxAmountB', TaxAmtB);
        HeaderObj.Add('taxAmountC', TaxAmtC);
        HeaderObj.Add('taxAmountD', TaxAmtD);
        HeaderObj.Add('taxAmountE', TaxAmtE);

        // Overall totals
        HeaderObj.Add('totalTaxableAmount', TotalTaxable);
        HeaderObj.Add('totalTaxAmount', TotalTax);
        HeaderObj.Add('totalAmount', TotalAmount);

        // Metadata (your sample has these)
        HeaderObj.Add('remark', 'Purchase Invoice');
        HeaderObj.Add('registrationId', company.Name);
        HeaderObj.Add('registrationNm', company.Name);
        HeaderObj.Add('modifierId', UserId);
        HeaderObj.Add('modifierName', UserId);

        HeaderObj.Add('itemList', ItemArray);

        // Message(Format(HeaderObj)); // debug
    end;


    // =========================================
    // SEND PURCHASE REQUEST (endpoint differs)
    // =========================================
    local procedure SendEtimsPurchaseRequest(HeaderObj: JsonObject; Token: Text): Text
    var
        JsonTxt: Text;
    begin
        HeaderObj.WriteTo(JsonTxt);

        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);

        // Adjust endpoint to your purchase push endpoint
        RequestMessage.SetRequestUri(getURL + 'Purchase/SavePurchase');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);

        HttpContent.WriteFrom(JsonTxt);
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        RequestMessage.Content(HttpContent);

        // If you use auth header:
        // RequestHeaders.Add('Authorization', StrSubstNo('Bearer %1', Token));

        if not HttpClient.Send(RequestMessage, ResponseMessage) then
            Error('Failed to send purchase invoice to ETIMS');

        ResponseMessage.Content.ReadAs(JsonTxt);

        if not ResponseMessage.IsSuccessStatusCode then
            Error('ETIMS rejected purchase invoice: %1', JsonTxt);

        exit(JsonTxt);
    end;


    // =========================================
    // HANDLE RESPONSE (same pattern as your sales handler)
    // =========================================
    local procedure HandleEtimsPurchaseInvoiceResponse(ResponseText: Text; PurchInvHeaderNo: Code[20])
    var
        RootObj: JsonObject;
        ResultObj: JsonObject;
        DataObj: JsonObject;
        Token: JsonToken;
        ResultCd: Text;
        ResultMsg: Text;
        JsonTok: JsonToken;
        StatusCode: Integer;
        Success: Boolean;
        ErrorTxt: Text;
        ResultTxt: Text;
        ColonPos: Integer;
    begin
        if not RootObj.ReadFrom(ResponseText) then
            Error('Invalid JSON returned from ETIMS');

        // ===== Validate API Envelope =====
        // Expected:
        // { "statusCode": 200, "success": true, "error": null, "result": "000: Successful" }

        if RootObj.Get('statusCode', JsonTok) then
            StatusCode := JsonTok.AsValue().AsInteger()
        else
            Error('Missing statusCode in response');

        if RootObj.Get('success', JsonTok) then
            Success := JsonTok.AsValue().AsBoolean()
        else
            Error('Missing success in response');

        if (not Success) or (StatusCode <> 200) then begin
            if RootObj.Get('error', JsonTok) then
                ErrorTxt := JsonTok.AsValue().AsText()
            else
                ErrorTxt := '';
            if ErrorTxt <> '' then
                Error(ErrorTxt);

            Error('ETIMS returned an error');
        end;

        // ===== Validate Result Code inside "result" =====
        // result example: "000: Successful"
        if RootObj.Get('result', JsonTok) then
            ResultTxt := JsonTok.AsValue().AsText()
        else
            ResultTxt := '';
        ResultCd := '';
        ColonPos := StrPos(ResultTxt, ':');
        if ColonPos > 1 then
            ResultCd := CopyStr(ResultTxt, 1, ColonPos - 1)
        else
            if StrLen(ResultTxt) >= 3 then
                ResultCd := CopyStr(ResultTxt, 1, 3);

        if ResultCd <> '000' then begin
            if ResultTxt <> '' then
                Error(ResultTxt);
            Error('ETIMS returned an error');
        end;

        Message('Purchase posted to ETIMS successfully');

        // Mark invoice as posted
        MarkPurchaseInvoicePosted(PurchInvHeaderNo);
    end;

    local procedure BuildStockInOutPayloadFromPurchaseInvoice(
        var PurchInvHeader: Record "Purch. Inv. Header";
        var HeaderObj: JsonObject;
        var ItemArray: JsonArray;
        var TotalTaxable: Decimal;
        var TotalVat: Decimal;
        var TotalAmount: Decimal)
    var
        PurchInvLine: Record "Purch. Inv. Line";
        Vendor: Record Vendor;
        ItemObj: JsonObject;
        LineNo: Integer;

        TaxBand: Code[10];
        LineTaxable: Decimal;
        LineVat: Decimal;
        LineTotal: Decimal;
        CleanQty: Text;
    begin
        Clear(HeaderObj);
        Clear(ItemArray);

        TotalTaxable := 0;
        TotalVat := 0;
        TotalAmount := 0;

        Company.Get();

        // ---------------------
        // Header (Stock IN)
        // ---------------------
        HeaderObj.Add('businessId', Company."Company Tin");

        // You need a storedReleasedNo for purchases too (recommended separate field/counter)
        // If you want: EnsurePurchStoredReleasedNo(PurchInvHeader);
        HeaderObj.Add('storedReleasedNo', PurchInvHeader."ETIMS Local Invoice Number"); // add field on Purch. Inv. Header ext
        HeaderObj.Add('originalStoredReleasedNo', PurchInvHeader."ETIMS Local Invoice Number");

        HeaderObj.Add('registrationTypeCode', 'A'); //Automatic

        // Stock IN code (change to what ETIMS expects for purchase/stock-in)
        // You used '11' for sales stock-out. For purchase stock-in, confirm code.
        HeaderObj.Add('storedReleasedTypeCode', '02'); // Purchase

        // Vendor -> acts like supplier/customer in payload
        if Vendor.Get(PurchInvHeader."Buy-from Vendor No.") then begin
            HeaderObj.Add('customerTin', Vendor."VAT Registration No.");
            HeaderObj.Add('customerNm', Vendor.Name);
            HeaderObj.Add('customerBhfId', Company."Branch ID");
        end else begin
            HeaderObj.Add('customerTin', '');
            HeaderObj.Add('customerNm', '');
            HeaderObj.Add('customerBhfId', Company."Branch ID");
        end;

        // DATE only (yyyyMMdd)
        HeaderObj.Add('occurredDateTime', _ETIMSHelperFunctions.FormatETIMSDateOnly(PurchInvHeader."Posting Date"));

        // HeaderObj.Add('totalItemCount', 0); // filled later
        HeaderObj.Add('remark', 'Stock received from vendor');
        HeaderObj.Add('registrationId', UserId);
        HeaderObj.Add('registrationName', UserId);
        HeaderObj.Add('modifierId', UserId);
        HeaderObj.Add('modifierName', UserId);

        // ---------------------
        // Lines -> itemList
        // ---------------------
        LineNo := 1;
        PurchInvLine.SetRange("Document No.", PurchInvHeader."No.");
        PurchInvLine.SetFilter(Type, '<>%1', PurchInvLine.Type::" ");
        if PurchInvLine.FindSet() then
            repeat
                Clear(ItemObj);

                Item.Reset();
                if Item.Get(PurchInvLine."No.") then begin
                    if Item."Etims Item Code" = '' then
                        Error('Kindly generate ETIMS Item Code for item %1. It cannot be empty.', Item."No.");

                    // Amounts (same approach as Sales)
                    LineTaxable := PurchInvLine."Line Amount";
                    LineTotal := PurchInvLine."Amount Including VAT";
                    LineVat := LineTotal - LineTaxable;

                    TaxBand := _ETIMSHelperFunctions.NormalizeEtimsTaxBand(Item."Tax Type");

                    CleanQty := DelChr(Format(PurchInvLine.Quantity), '=', ',');

                    ItemObj.Add('itemSequence', LineNo);
                    ItemObj.Add('itemCode', Item."Etims Item Code");
                    ItemObj.Add('itemClassificationCode', Item."Item Class");
                    ItemObj.Add('itemName', PurchInvLine.Description);
                    ItemObj.Add('barcode', Item.GTIN); // change to your barcode field
                    ItemObj.Add('packagingUnitCode', Item."Packaging Unit code");
                    ItemObj.Add('package', 1);
                    ItemObj.Add('quantityUnitCode', Item."Quantity Unit Code");
                    ItemObj.Add('quantity', CleanQty);

                    ItemObj.Add('unitPrice', PurchInvLine."Direct Unit Cost");
                    ItemObj.Add('supplyAmount', LineTaxable);
                    ItemObj.Add('discountAmount', 0);
                    ItemObj.Add('taxableAmount', LineTaxable);
                    ItemObj.Add('taxationTypeCode', TaxBand);
                    ItemObj.Add('taxAmount', LineVat);
                    ItemObj.Add('totalAmount', LineTotal);

                    ItemArray.Add(ItemObj);

                    TotalTaxable += LineTaxable;
                    TotalVat += LineVat;
                    TotalAmount += LineTotal;

                    LineNo += 1;
                end;
            until PurchInvLine.Next() = 0;

        HeaderObj.Add('itemList', ItemArray);

        // Totals
        HeaderObj.Add('totalItemCount', LineNo - 1);
        HeaderObj.Add('totalTaxableAmount', TotalTaxable);
        HeaderObj.Add('totalVat', TotalVat);
        HeaderObj.Add('totalAmount', TotalAmount);
    end;

    local procedure MarkPurchaseInvoicePosted(PurchInvHeaderNo: Code[20])
    var
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        if PurchInvHeader.Get(PurchInvHeaderNo) then begin
            PurchInvHeader.EtimsDate := DT2Date(dateT);
            PurchInvHeader.EtimsTime := DT2Time(dateT);
            PurchInvHeader."Posted to Etims" := true;
            PurchInvHeader.Modify();
        end;
    end;


    procedure PushCreditNotes(DocumentNo: Text): Text
    var
        token: Text;
        HeaderJsonObject: JsonObject;
        LinesJsonObject: JsonObject;
        LinesJsonArray: JsonArray;
        SalesCreditHeader: Record "Sales Cr.Memo Header";
        SalesCreditLines: Record "Sales Cr.Memo Line";
        startingDay: Date;
        saledate: Text;
        currency: Text;
        refundreson: Text;
        // eTimsPushCredit: Record eTimsPushCredit;
        rtnToken: JsonToken;
        invoceNum: Text;
        intrlData: Text;
        rcptSign: Text;
        sdcId: Text;
        CUInvoiceNo: Text;
        QRCodeUrl: Text;
        dateT: DateTime;
        Month: Integer;
        Year: Integer;
        Day: Integer;
        TheTime: Time;
        TheTime2: Time;
        myTime: Time;
        mystring: Text;
        mydateTime: DateTime;
        rtnMessageObject: JsonObject;
        getEndDate: DateTime;
        getStartDate: DateTime;
    begin
        //create Sales header Json
        token := GetEtimsToken();
        company.Get();
        startingDay := DMY2Date(28, 2, 2024);
        Evaluate(TheTime, '235959');
        Evaluate(TheTime2, '000001');
        getStartDate := CreateDateTime(Today, TheTime2);
        getEndDate := CreateDateTime(Today, TheTime);
        SalesCreditHeader.Reset();
        SalesCreditHeader.SetRange("No.", DocumentNo); //, false);
        //  SalesCreditHeader.SetFilter(SystemCreatedAt, '>=%1&<=%2', getStartDate, getEndDate);
        if SalesCreditHeader.FindSet() then
            repeat // SalesCreditHeader."Posted to Etims" := true;
                // SalesCreditHeader.Modify();
                Clear(HeaderJsonObject);
                Clear(LinesJsonArray);
                HeaderJsonObject.Add('tin', 'A123456789Z');
                HeaderJsonObject.Add('BranchId', '00');
                HeaderJsonObject.Add('DocumentType', 'CreditNote');
                HeaderJsonObject.Add('InvoiceNo', SalesCreditHeader."No.");
                // HeaderJsonObject.Add('ETimsInvoiceNo', getSalesInvoiceNum(SalesCreditHeader."No."));
                customer.Reset();
                if customer.Get(SalesCreditHeader."Bill-to Customer No.") then begin
                    HeaderJsonObject.Add('CustPIN', customer."VAT Registration No.");
                    HeaderJsonObject.Add('CustName', customer.Name);
                    HeaderJsonObject.Add('CustBranchId', '00');
                end;
                saledate := FORMAT(SalesCreditHeader."Document Date", 0, '<Year4>-<Month,2>-<Day,2>');
                HeaderJsonObject.Add('SaleDate', saledate);
                HeaderJsonObject.Add('PostStockMovement', 'N');
                if SalesCreditHeader."Currency Code" = '' then
                    currency := 'KES'
                else
                    currency := SalesCreditHeader."Currency Code";
                HeaderJsonObject.Add('CurrencyCode', currency);
                HeaderJsonObject.Add('ExchangeRate', Round(getcurrencyDetails(currency), 0.01));
                HeaderJsonObject.Add('RefInvoiceNo', 457);
                salesHeader.Reset();
                salesHeader.SetRange("Applies-to Doc. No.", SalesCreditHeader."No.");
                // if salesHeader.FindFirst() then
                //     refundreson := salesHeader."Refund Reason"
                // else
                //     refundreson := '01';
                HeaderJsonObject.Add('CreditNoteReason', '13');
                // users.Reset();
                // users.SetRange("User Security ID", SalesCreditHeader.SystemCreatedBy);
                // if users.FindFirst() then begin
                //     HeaderJsonObject.Add('CreatedBy', users."User Name");
                //     HeaderJsonObject.Add('CreatedByName', users."Full Name");
                // end;
                HeaderJsonObject.Add('CreatedBy', 'David.Mu');
                HeaderJsonObject.Add('CreatedByName', 'David.Mukuria');
                //Create Lines
                SalesCreditLines.Reset();
                SalesCreditLines.SetRange("Document No.", SalesCreditHeader."No.");
                if SalesCreditLines.FindSet() then
                    repeat
                        Clear(LinesJsonObject);
                        glAccount.Reset();
                        if SalesCreditLines.Type = SalesCreditLines.Type::"G/L Account" then begin
                            // if glAccount.Get(SalesCreditLines."No.") then begin
                            LinesJsonObject.Add('ItemCode', 'KE1NTU0000002');
                            LinesJsonObject.Add('ItemClassCode', '99011035');
                            LinesJsonObject.Add('ItemName', SalesCreditLines.Description);
                            LinesJsonObject.Add('ItemTypeCode', '1');
                            LinesJsonObject.Add('PackagingUnitCode', 'NT');
                            LinesJsonObject.Add('QuantityUnitCode', 'U');
                            LinesJsonObject.Add('Quantity', Round(SalesCreditLines.Quantity, 0.01));
                            LinesJsonObject.Add('UnitPriceExcl', Round((SalesCreditLines."Line Amount" / SalesCreditLines.Quantity), 0.01));
                            LinesJsonObject.Add('TaxRate', '16');
                            LinesJsonObject.Add('TaxationTypeCode', 'B');
                            LinesJsonObject.Add('DiscountRate', SalesCreditLines."Line Discount %");
                            LinesJsonObject.Add('DiscountAmount', Round(SalesCreditLines."Line Discount Amount", 0.01));
                            LinesJsonArray.Add(LinesJsonObject);
                        end;
                    until SalesCreditLines.Next() = 0;
                HeaderJsonObject.Add('itemList', LinesJsonArray);
                //send Request to eTims
                Clear(RequestMessage);
                Clear(RequestHeaders);
                Clear(ContentHeaders);
                Clear(Response);
                RequestMessage.SetRequestUri(testMiddlewareUrl + 'saveSales');
                RequestMessage.Method('POST');
                RequestMessage.GetHeaders(RequestHeaders);
                RequestHeaders.Add('Authorization', 'Bearer ' + token);
                HttpContent.WriteFrom(Format(HeaderJsonObject));
                HttpContent.GetHeaders(ContentHeaders);
                ContentHeaders.Remove('Content-Type');
                ContentHeaders.Add('Content-Type', 'application/json');
                HttpContent.GetHeaders(ContentHeaders);
                RequestMessage.Content(HttpContent);
                if HttpClient.Send(RequestMessage, ResponseMessage) then begin
                    ResponseMessage.Content.ReadAs(Response);
                    // Message(Response);
                    if ResponseMessage.IsSuccessStatusCode then begin
                        JsonBuffer.ReadFromText(Response);
                        Response := convertToJson(Response);
                        //save Response
                        // eTimsPushCredit.Reset();
                        // eTimsPushCredit.Init();
                        // eTimsPushCredit.Code := SalesCreditHeader."No.";
                        // eTimsPushCredit.Json := Response;
                        // eTimsPushCredit.Insert();
                        Message(Response);
                        if jsonResponse.ReadFrom(Response) then begin
                            if (Response.Contains('9020')) then begin
                                SalesCreditHeader."Posted to Etims" := false;
                                SalesCreditHeader.Modify();
                            end
                            else begin
                                jsonResponse.Get('data', jsonTokenValue);
                                rtnMessageObject := jsonTokenValue.AsObject();
                                rtnMessageObject.Get('intrlData', rtnToken);
                                intrlData := rtnToken.AsValue().AsText();
                                rtnMessageObject.Get('rcptSign', rtnToken);
                                rcptSign := rtnToken.AsValue().AsText();
                                rtnMessageObject.Get('ReceiptDateTime', rtnToken);
                                mystring := rtnToken.AsValue().AsText();
                                //2024-03-22 14:39:34
                                Evaluate(Day, CopyStr(mystring, 9, 2));
                                Evaluate(Month, CopyStr(mystring, 6, 2));
                                Evaluate(Year, CopyStr(mystring, 1, 4));
                                Evaluate(TheTime, CopyStr(mystring, 12, 2) + CopyStr(mystring, 15, 2) + CopyStr(mystring, 17, 1) + '00');
                                mydateTime := CreateDateTime(DMY2Date(Day, Month, Year), TheTime);
                                rtnMessageObject.Get('sdcId', rtnToken);
                                sdcId := rtnToken.AsValue().AsText();
                                rtnMessageObject.Get('CUInvoiceNo', rtnToken);
                                CUInvoiceNo := rtnToken.AsValue().AsText();
                                rtnMessageObject.Get('QRCodeUrl', rtnToken);
                                QRCodeUrl := rtnToken.AsValue().AsText();
                                updatecreditNote(SalesCreditHeader."No.", intrlData, rcptSign, sdcId, CUInvoiceNo, QRCodeUrl, mydateTime);
                            end;
                        end;
                    end
                    else begin
                        SalesCreditHeader."Posted to Etims" := false;
                        SalesCreditHeader.Modify();
                        //save Response
                        // eTimsPushCredit.Reset();
                        // eTimsPushCredit.Init();
                        // eTimsPushCredit.Code := SalesCreditHeader."No.";
                        // eTimsPushCredit.Json := Response;
                        // eTimsPushCredit.Insert();
                    end;
                end;
            until SalesCreditHeader.Next() = 0;
    end;

    procedure PushCreditNotes2(No: Text): Text
    var
        token: Text;
        HeaderJsonObject: JsonObject;
        LinesJsonObject: JsonObject;
        LinesJsonArray: JsonArray;
        SalesCreditHeader: Record "Sales Cr.Memo Header";
        SalesCreditLines: Record "Sales Cr.Memo Line";
        startingDay: Date;
        saledate: Text;
        currency: Text;
        refundreson: Text;
        eTimsPushCredit: Record eTimsPushCredit;
        rtnToken: JsonToken;
        invoceNum: Text;
        intrlData: Text;
        rcptSign: Text;
        sdcId: Text;
        CUInvoiceNo: Text;
        QRCodeUrl: Text;
        dateT: DateTime;
        Month: Integer;
        Year: Integer;
        Day: Integer;
        TheTime: Time;
        TheTime2: Time;
        myTime: Time;
        mystring: Text;
        mydateTime: DateTime;
        rtnMessageObject: JsonObject;
        getEndDate: DateTime;
        getStartDate: DateTime;
        jsontextRequest: Text;
        OutStream: OutStream;
        string2048: Text[2048];
    begin
        //create Sales header Json
        token := GetEtimsToken();
        company.Get();
        startingDay := DMY2Date(28, 2, 2024);
        Evaluate(TheTime, '235959');
        Evaluate(TheTime2, '000001');
        getStartDate := CreateDateTime(Today, TheTime2);
        getEndDate := CreateDateTime(Today, TheTime);

        SalesCreditHeader.Reset();
        SalesCreditHeader.Get(No);
        //SalesCreditHeader."Posted to Etims" := true;
        SalesCreditHeader.Modify();

        Clear(HeaderJsonObject);
        Clear(LinesJsonArray);
        HeaderJsonObject.Add('tin', company."Company Tin");
        HeaderJsonObject.Add('BranchId', company."Branch ID");
        HeaderJsonObject.Add('DocumentType', 'CreditNote');
        HeaderJsonObject.Add('InvoiceNo', SalesCreditHeader."No.");

        /* if getEtimsInvoiceNumber(SalesCreditHeader."Applies-to Doc. No.") = '' then
            HeaderJsonObject.Add('ETimsInvoiceNo', getEtimsInvoiceNumber(SalesCreditHeader."Applies-to Doc. No."))
        else */
        //HeaderJsonObject.Add('ETimsInvoiceNo', getSalesInvoiceNum(SalesCreditHeader."No."));
        HeaderJsonObject.Add('ETimsInvoiceNo', getEtimsInvoiceNumber(SalesCreditHeader."Applies-to Doc. No."));

        customer.Reset();
        if customer.Get(SalesCreditHeader."Bill-to Customer No.") then begin
            HeaderJsonObject.Add('CustPIN', customer."VAT Registration No.");
            HeaderJsonObject.Add('CustName', customer.Name);
            HeaderJsonObject.Add('CustBranchId', customer."Branch Code");
        end;
        saledate := FORMAT(SalesCreditHeader."Document Date", 0, '<Year4>-<Month,2>-<Day,2>');
        HeaderJsonObject.Add('SaleDate', saledate);
        HeaderJsonObject.Add('PostStockMovement', 'N');

        if SalesCreditHeader."Currency Code" = '' then
            currency := 'KES' else
            currency := SalesCreditHeader."Currency Code";
        HeaderJsonObject.Add('CurrencyCode', currency);
        HeaderJsonObject.Add('ExchangeRate', getPostedDocCurrencyDetails(SalesCreditHeader."Applies-to Doc. No."));
        HeaderJsonObject.Add('RefInvoiceNo', getEtimsInvoiceNumber(SalesCreditHeader."Applies-to Doc. No."));

        salesHeader.Reset();
        salesHeader.SetRange("Applies-to Doc. No.", SalesCreditHeader."No.");
        if salesHeader.FindFirst() then
            refundreson := salesHeader."Refund Reason"
        else
            refundreson := '01';
        HeaderJsonObject.Add('CreditNoteReason', refundreson);
        users.Reset();
        users.SetRange("User Security ID", SalesCreditHeader.SystemCreatedBy);
        if users.FindFirst() then begin
            HeaderJsonObject.Add('CreatedBy', users."User Name");
            HeaderJsonObject.Add('CreatedByName', users."Full Name");
        end;

        //Create Lines
        SalesCreditLines.Reset();
        SalesCreditLines.SetRange("Document No.", SalesCreditHeader."No.");
        if SalesCreditLines.FindSet() then
            repeat
                Clear(LinesJsonObject);
                glAccount.Reset();
                if glAccount.Get(SalesCreditLines."No.") then begin
                    LinesJsonObject.Add('ItemCode', glAccount."Etims Item Code");
                    LinesJsonObject.Add('ItemClassCode', glAccount."Item Class");
                    LinesJsonObject.Add('ItemName', SalesCreditLines.Description);
                    LinesJsonObject.Add('ItemTypeCode', glAccount."Service Type");
                    LinesJsonObject.Add('PackagingUnitCode', glAccount."Packaging Unit code");
                    LinesJsonObject.Add('QuantityUnitCode', glAccount."Quantity Unit Code");
                    LinesJsonObject.Add('Quantity', Round(SalesCreditLines.Quantity, 0.01));
                    LinesJsonObject.Add('UnitPriceExcl', Round((SalesCreditLines."Line Amount" / SalesCreditLines.Quantity), 0.01));
                    LinesJsonObject.Add('TaxRate', SalesCreditLines."VAT %");
                    LinesJsonObject.Add('TaxationTypeCode', getTaxType(SalesCreditHeader."No.", SalesCreditLines."No."));
                    LinesJsonObject.Add('DiscountRate', SalesCreditLines."Line Discount %");
                    LinesJsonObject.Add('DiscountAmount', Round(SalesCreditLines."Line Discount Amount", 0.01));
                    LinesJsonArray.Add(LinesJsonObject);
                end;

            until SalesCreditLines.Next() = 0;
        HeaderJsonObject.Add('itemList', LinesJsonArray);

        HeaderJsonObject.WriteTo(jsontextRequest);
        //save Response
        if StrLen(jsontextRequest) > 2048 then
            string2048 := PadStr(jsontextRequest, 2048)
        else
            string2048 := jsontextRequest;
        eTimsPushCredit.Reset();
        eTimsPushCredit.Init();
        eTimsPushCredit.Code := SalesCreditHeader."No.";
        eTimsPushCredit.Json := Response;
        eTimsPushCredit."Request Message" := string2048;
        eTimsPushCredit.Insert();


        //send Request to eTims
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'saveSales');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Authorization', 'Bearer ' + token);
        HttpContent.WriteFrom(Format(HeaderJsonObject));
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);


        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode then begin
                JsonBuffer.ReadFromText(Response);
                Response := convertToJson(Response);
                //save Response
                eTimsPushCredit.Reset();
                Clear(eTimsPushCredit);
                eTimsPushCredit.Init();
                eTimsPushCredit.Code := SalesCreditHeader."No.";
                eTimsPushCredit.Json := Response;
                eTimsPushCredit.Insert();

                if jsonResponse.ReadFrom(Response) then
                    if not (Response.Contains('data')) then begin
                        SalesCreditHeader."Posted to Etims" := false;
                        SalesCreditHeader.Modify();
                        //save Response
                        eTimsPushCredit.Reset();
                        Clear(eTimsPushCredit);
                        eTimsPushCredit.Init();
                        eTimsPushCredit.Code := SalesCreditHeader."No.";
                        eTimsPushCredit.Json := Response;
                        eTimsPushCredit.Insert();
                    end else begin
                        jsonResponse.Get('data', jsonTokenValue);
                        rtnMessageObject := jsonTokenValue.AsObject();

                        rtnMessageObject.Get('intrlData', rtnToken);
                        intrlData := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('rcptSign', rtnToken);
                        rcptSign := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('ReceiptDateTime', rtnToken);
                        mystring := rtnToken.AsValue().AsText();
                        //2024-03-22 14:39:34
                        Evaluate(Day, CopyStr(mystring, 9, 2));
                        Evaluate(Month, CopyStr(mystring, 6, 2));
                        Evaluate(Year, CopyStr(mystring, 1, 4));
                        Evaluate(TheTime, CopyStr(mystring, 12, 2) + CopyStr(mystring, 15, 2) + CopyStr(mystring, 17, 1) + '00');
                        mydateTime := CreateDateTime(DMY2Date(Day, Month, Year), TheTime);

                        rtnMessageObject.Get('sdcId', rtnToken);
                        sdcId := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('CUInvoiceNo', rtnToken);
                        CUInvoiceNo := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('QRCodeUrl', rtnToken);
                        QRCodeUrl := rtnToken.AsValue().AsText();

                        updatecreditNote(SalesCreditHeader."No.", intrlData, rcptSign, sdcId, CUInvoiceNo, QRCodeUrl, mydateTime);
                    end;
            end else begin
                SalesCreditHeader."Posted to Etims" := false;
                SalesCreditHeader.Modify();
                //save Response
                eTimsPushCredit.Reset();
                Clear(eTimsPushCredit);
                eTimsPushCredit.Init();
                eTimsPushCredit.Code := SalesCreditHeader."No.";
                eTimsPushCredit.Json := Response;
                eTimsPushCredit.Insert();
            end;
        end;
    end;

    procedure getEtimsInvoiceNumber(Num: Text): Text
    var
        ScuID: Text;
        ScuIDLength: Integer;
        CUInvNum: Text;
        CUInvNumLength: Integer;
        etimsInvNum: Text;
    begin
        SIH.Reset();
        if SIH.Get(Num) then begin
            ScuID := SIH."SCU ID";
            CUInvNum := SIH."CU Invoice Number";
            ScuIDLength := StrLen(ScuID) + 1;
            CUInvNumLength := StrLen(CUInvNum);
            etimsInvNum := DelStr(CUInvNum, 1, ScuIDLength);
            exit(etimsInvNum);
        end;
    end;

    procedure getPostedDocCurrencyDetails(DocNum: Text) Msg: Decimal
    var
        DetailCustReg: Record "Detailed Cust. Ledg. Entry";
    begin
        Msg := 0;
        DetailCustReg.SetRange("Document No.", DocNum);
        if DetailCustReg.FindLast() then
            Msg := Round(DetailCustReg."Amount (LCY)" / DetailCustReg.Amount, 0.01);
    end;

    procedure getTaxType(docNum: Text; itemNum: Text) Msg: Text
    begin
        //if sales
        invLine.Reset();
        invLine.SetRange("Document No.", docNum);
        invLine.SetRange("No.", itemNum);
        if invLine.FindFirst() then begin
            if invLine."VAT Prod. Posting Group" <> '' then begin
                vatpg.Reset();
                vatpg.SetRange(Code, invLine."VAT Prod. Posting Group");
                if vatpg.FindFirst() then
                    Msg := vatpg."Tax Type Code"
            end else
                if invLine."VAT %" >= 16 then
                    Msg := 'B'
                else
                    Msg := 'A';
        end else begin
            //if credit note
            invCreditLine.Reset();
            invCreditLine.SetRange("Document No.", docNum);
            invCreditLine.SetRange("No.", itemNum);
            if invCreditLine.FindFirst() then begin
                if invCreditLine."VAT Prod. Posting Group" <> '' then begin
                    vatpg.Reset();
                    vatpg.SetRange(Code, invCreditLine."VAT Prod. Posting Group");
                    if vatpg.FindFirst() then
                        Msg := vatpg."Tax Type Code"
                end else
                    if invCreditLine."VAT %" >= 16 then
                        Msg := 'B'
                    else
                        Msg := 'A';
            end else
                if not invCreditLine.FindFirst() then begin
                    PostedPurchaseLines.Reset();
                    PostedPurchaseLines.SetRange("Document No.", docNum);
                    PostedPurchaseLines.SetRange("No.", itemNum);
                    if PostedPurchaseLines.FindFirst() then
                        if PostedPurchaseLines."VAT Prod. Posting Group" <> '' then begin
                            vatpg.Reset();
                            vatpg.SetRange(Code, PostedPurchaseLines."VAT Prod. Posting Group");
                            if vatpg.FindFirst() then
                                Msg := vatpg."Tax Type Code"
                        end else
                            if PostedPurchaseLines."VAT %" >= 16 then
                                Msg := 'B'
                            else
                                Msg := 'A';
                end
        end

    end;

    procedure PushCreditNote(DocumentNo: Code[20]): Text
    var
        Token: Text;
        HeaderObj: JsonObject;
        ReceiptObj: JsonObject;
        ItemArray: JsonArray;
        CrHeader: Record "Sales Cr.Memo Header";
        CrHeader1: Record "Sales Cr.Memo Header";
        ResponseText: Text;
        TotalTaxable: Decimal;
        TotalTax: Decimal;
        TotalAmount: Decimal;
        count: Integer;
    begin
        company.Get();
        // Token := GetEtimsToken();
        CrHeader1.Get(DocumentNo);
        if CrHeader1."ETIMS Local Invoice Number" = 0 then begin
            company.Get();
            company.LockTable();
            count := company."Sales Invoice Number" + 1;
            company."Sales Invoice Number" := count;
            company.Modify();

            CrHeader1."ETIMS Local Invoice Number" := count;
            CrHeader1.Modify();
            Commit();
        end;
        CrHeader.Get(DocumentNo);

        if CrHeader."Posted to Etims" then
            Error('Credit Note %1 already posted to ETIMS', CrHeader."No.");

        BuildCreditNotePayload(
            CrHeader,
            HeaderObj,
            ReceiptObj,
            ItemArray,
            TotalTaxable,
            TotalTax,
            TotalAmount
        );

        ResponseText := SendEtimsRequest(HeaderObj, Token);

        HandleEtimsCreditNoteResponse(ResponseText, CrHeader."No.");

        exit(ResponseText);
    end;

    local procedure BuildCreditNotePayload(
    var SalesCrHeader: Record "Sales Cr.Memo Header";
    var HeaderObj: JsonObject;
    var ReceiptObj: JsonObject;
    var ItemArray: JsonArray;
    var TotalTaxable: Decimal;
    var TotalTax: Decimal;
    var TotalAmount: Decimal)
    var
        SalesCrLine: Record "Sales Cr.Memo Line";
        Customer: Record Customer;
        ItemObj: JsonObject;
        LineNo: Integer;
        CleanCrNo: Text;
        CleanOrigInvNo: Text;
        SalesInvHeader: Record "Sales Invoice Header";

        TaxBand: Code[10];
        TaxRate: Decimal;

        // Tax band totals A–E
        TaxableA: Decimal;
        TaxableB: Decimal;
        TaxableC: Decimal;
        TaxableD: Decimal;
        TaxableE: Decimal;
        TaxAmtA: Decimal;
        TaxAmtB: Decimal;
        TaxAmtC: Decimal;
        TaxAmtD: Decimal;
        TaxAmtE: Decimal;
        RateA: Decimal;
        RateB: Decimal;
        RateC: Decimal;
        RateD: Decimal;
        RateE: Decimal;

        LineTaxable: Decimal;
        LineTax: Decimal;

        CleanQuantity: Text;
    begin
        Clear(HeaderObj);
        Clear(ItemArray);
        Clear(ReceiptObj);

        TotalTaxable := 0;
        TotalTax := 0;
        TotalAmount := 0;

        TaxableA := 0;
        TaxableB := 0;
        TaxableC := 0;
        TaxableD := 0;
        TaxableE := 0;
        TaxAmtA := 0;
        TaxAmtB := 0;
        TaxAmtC := 0;
        TaxAmtD := 0;
        TaxAmtE := 0;
        RateA := 0;
        RateB := 0;
        RateC := 0;
        RateD := 0;
        RateE := 0;

        // if SalesCrHeader."Applies-to Doc. No." = '' then
        //     Error('Applies-to Doc. No. accnot be empty.');
        SalesInvHeader.Get(SalesCrHeader."Applies-to Doc. No.");

        if SalesInvHeader."Posted To Etims" = false then
            Error('The original invoice %1 was not sent to KRA. Please ensure it is posted to eTIMS before proceeding.', SalesInvHeader."No.");

        // if SalesInvHeader."ETIMS Local Invoice Number" = 0 then
        //     Error('Invoice number %1 was not posted to ETIMS', SalesInvHeader."No.");

        // =====================
        // Header
        // =====================
        HeaderObj.Add('businessId', company.Name);
        HeaderObj.Add('pin', company."Company Tin");
        HeaderObj.Add('branchId', company."Branch ID");

        HeaderObj.Add('traderInvoiceNumber', SalesCrHeader."No.");
        HeaderObj.Add('invoiceNumber', Format(SalesCrHeader."ETIMS Local Invoice Number"));
        HeaderObj.Add('originalInvoiceNumber', SalesInvHeader."ETIMS Local Invoice Number");
        //For Test Only
        // HeaderObj.Add('originalInvoiceNumber', '701');

        HeaderObj.Add('invoiceStatusCode', '02'); // Approved

        HeaderObj.Add('saleDate', _ETIMSHelperFunctions.FormatETIMSDateOnly(SalesCrHeader."Posting Date"));
        HeaderObj.Add('validatedDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));
        HeaderObj.Add('stockReleaseDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));
        HeaderObj.Add('canceledDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));
        HeaderObj.Add('creditNoteDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));


        HeaderObj.Add('creditNoteReasonCode', '06'); // refund        
        HeaderObj.Add('salesTypeCode', 'N'); //Normal
        HeaderObj.Add('receiptTypeCode', 'R'); //Credit Note
        HeaderObj.Add('paymentTypeCode', '01'); //Cash

        if Customer.Get(SalesCrHeader."Bill-to Customer No.") then begin
            if Customer."VAT Registration No." = '' then
                Error(
                    'VAT Registration No. is required for customer %1 (%2).',
                    Customer."No.",
                    Customer.Name);

            HeaderObj.Add('customerPin', Customer."VAT Registration No.");
            HeaderObj.Add('customerName', Customer.Name);
        end;

        // =====================
        // Lines
        // =====================
        LineNo := 1;
        SalesCrLine.SetRange("Document No.", SalesCrHeader."No.");
        SalesCrLine.SetFilter(Type, '<>%1', SalesCrLine.Type::" ");
        if SalesCrLine.FindSet() then
            repeat
                Clear(ItemObj);

                item.Reset();
                if item.Get(SalesCrLine."No.") then begin
                    if item."Etims Item Code" = '' then
                        Error('Kindly generate ETIMS Item Code for item  %1 on the item card. It cannot be empty.', item."No.");
                    // Line amounts
                    LineTaxable := SalesCrLine."Line Amount";
                    // LineTax := SalesCrLine."Amount Including VAT" - SalesCrLine."Line Amount";

                    LineTax := SalesCrLine."Amount Including VAT" - SalesCrLine."VAT Base Amount";

                    // Resolve tax band + rate from setup table 60002
                    TaxBand := _ETIMSHelperFunctions.NormalizeEtimsTaxBand(item."Tax Type"); // returns A/B/C/D/E
                    TaxRate := _ETIMSHelperFunctions.GetEtimsTaxRate(TaxBand);

                    CleanQuantity := DelChr(Format(SalesCrLine.Quantity), '=', ',');

                    ItemObj.Add('itemSequenceNumber', LineNo);
                    ItemObj.Add('itemCode', item."Etims Item Code");
                    ItemObj.Add('itemName', SalesCrLine.Description);
                    ItemObj.Add('quantity', CleanQuantity);
                    ItemObj.Add('unitPrice', SalesCrLine."Unit Price");
                    ItemObj.Add('supplyAmount', LineTaxable);
                    ItemObj.Add('taxableAmount', LineTaxable);
                    ItemObj.Add('taxAmount', LineTax);
                    // ItemObj.Add('totalAmount', SalesCrLine."Amount Including VAT");
                    ItemObj.Add('totalAmount', LineTaxable);
                    ItemObj.Add('taxationTypeCode', TaxBand);
                    ItemObj.Add('quantityUnitCode', item."Quantity Unit Code");
                    ItemObj.Add('packagingUnitCode', item."Packaging Unit code");
                    ItemObj.Add('itemClassificationCode', item."Item Class");

                    // Totals (overall)
                    TotalTaxable += LineTaxable;
                    TotalTax += LineTax;
                    TotalAmount += SalesCrLine."Amount Including VAT";

                    // Totals (by tax band A–E)
                    _ETIMSHelperFunctions.AccumulateTaxBandTotals(
                       TaxBand, TaxRate, LineTaxable, LineTax,
                       TaxableA, TaxableB, TaxableC, TaxableD, TaxableE,
                       TaxAmtA, TaxAmtB, TaxAmtC, TaxAmtD, TaxAmtE,
                       RateA, RateB, RateC, RateD, RateE);

                    ItemArray.Add(ItemObj);
                    LineNo += 1;
                end;
            until SalesCrLine.Next() = 0;

        HeaderObj.Add('itemList', ItemArray);

        // --- Totals ---
        HeaderObj.Add('totalItemCount', LineNo - 1);

        // A–E totals required by the payload
        HeaderObj.Add('taxableAmountA', TaxableA);
        HeaderObj.Add('taxableAmountB', TaxableB);
        HeaderObj.Add('taxableAmountC', TaxableC);
        HeaderObj.Add('taxableAmountD', TaxableD);
        HeaderObj.Add('taxableAmountE', TaxableE);

        HeaderObj.Add('taxRateA', RateA);
        HeaderObj.Add('taxRateB', RateB);
        HeaderObj.Add('taxRateC', RateC);
        HeaderObj.Add('taxRateD', RateD);
        HeaderObj.Add('taxRateE', RateE);

        HeaderObj.Add('taxAmountA', TaxAmtA);
        HeaderObj.Add('taxAmountB', TaxAmtB);
        HeaderObj.Add('taxAmountC', TaxAmtC);
        HeaderObj.Add('taxAmountD', TaxAmtD);
        HeaderObj.Add('taxAmountE', TaxAmtE);

        // Overall totals
        HeaderObj.Add('totalTaxableAmount', TotalTaxable);
        HeaderObj.Add('totalTaxAmount', TotalTax);
        HeaderObj.Add('totalAmount', TotalAmount);

        // =====================
        // Audit / Metadata
        // =====================
        HeaderObj.Add('purchaseAcceptYN', 'Y');
        HeaderObj.Add('remark', 'Sales Credit Note');
        HeaderObj.Add('registrationId', company."Company Tin");
        HeaderObj.Add('registrationName', company.Name);
        HeaderObj.Add('modifierId', UserId);
        HeaderObj.Add('modifierName', UserId);

        // =====================
        // Receipt
        // =====================
        ReceiptObj.Add('customerPin', SalesCrHeader."VAT Registration No.");
        ReceiptObj.Add('tradeName', company.Name);
        ReceiptObj.Add('purchaseAcceptYN', 'Y');
        ReceiptObj.Add('receiptPublishedDate', _ETIMSHelperFunctions.FormatETIMSDate(CurrentDateTime()));

        HeaderObj.Add('receipt', ReceiptObj);
        Message(Format(HeaderObj));
    end;

    local procedure HandleEtimsCreditNoteResponse(Response: Text; CreditNoteNo: Code[20])
    var
        RootObj: JsonObject;
        ResultObj: JsonObject;
        DataObj: JsonObject;
        Token: JsonToken;

        ResultCd: Text;
        ResultMsg: Text;

        CurRcptNo: Text;
        TotRcptNo: Text;
        IntrlData: Text;
        RcptSign: Text;
        SdcDateTimeTxt: Text;
        SdcDateTimeVal: DateTime;
        QrCodeUrl: Text;
        CUNumber: Text;
        SdcId: Text;

        SdcDate: Date;
        SdcTime: Time;
        Msg: Text;
    begin
        // =====================
        // Parse root
        // =====================
        if not RootObj.ReadFrom(Response) then
            Error('Invalid ETIMS response');

        RootObj.Get('result', Token);
        ResultObj := Token.AsObject();

        // =====================
        // Result fields
        // =====================
        ResultObj.Get('resultCd', Token);
        ResultCd := Token.AsValue().AsText();

        ResultObj.Get('resultMsg', Token);
        ResultMsg := Token.AsValue().AsText();

        if ResultCd <> '000' then
            Error('%1: %2', ResultCd, ResultMsg);

        // =====================
        // Data object
        // =====================
        ResultObj.Get('data', Token);
        DataObj := Token.AsObject();

        DataObj.Get('rcptNo', Token);
        CurRcptNo := Format(Token.AsValue().AsInteger());

        DataObj.Get('totRcptNo', Token);
        TotRcptNo := Format(Token.AsValue().AsInteger());

        DataObj.Get('intrlData', Token);
        IntrlData := Token.AsValue().AsText();

        DataObj.Get('rcptSign', Token);
        RcptSign := Token.AsValue().AsText();

        DataObj.Get('cuInvoiceNo', Token);
        CUNumber := Token.AsValue().AsText();

        DataObj.Get('sdcId', Token);
        SdcId := Token.AsValue().AsText();

        DataObj.Get('vsdcRcptPbctDate', Token);

        SdcDateTimeTxt := Token.AsValue().AsText(); // 20260122162738
                                                    // yyyy-mm-dd  → SAFE in all locales

        // yyyy-MM-dd (locale-safe)
        Evaluate(
            SdcDate,
            CopyStr(SdcDateTimeTxt, 1, 4) + '-' +
            CopyStr(SdcDateTimeTxt, 5, 2) + '-' +
            CopyStr(SdcDateTimeTxt, 7, 2)
        );

        // HH:mm:ss
        Evaluate(
            SdcTime,
            CopyStr(SdcDateTimeTxt, 9, 2) + ':' +
            CopyStr(SdcDateTimeTxt, 11, 2) + ':' +
            CopyStr(SdcDateTimeTxt, 13, 2)
        );

        SdcDateTimeVal := CreateDateTime(SdcDate, SdcTime);

        DataObj.Get('qrCode', Token);
        QrCodeUrl := Token.AsValue().AsText();

        // =====================
        // Persist via your function
        // =====================
        Msg := updatecreditNote(
            CreditNoteNo,
            IntrlData,
            RcptSign,
            SdcId,    // Text
            company."ETIMS SDC ID",    // Text
            QrCodeUrl,
            SdcDateTimeVal
        );

        if Msg <> 'Success' then
            Error('Failed to update credit note %1 after ETIMS response', CreditNoteNo);
    end;



    procedure pushCreditManually(HeaderJsonObject: Text)
    var
        token: Text;
        LinesJsonObject: JsonObject;
        LinesJsonArray: JsonArray;
        SalesCreditHeader: Record "Sales Cr.Memo Header";
        SalesCreditLines: Record "Sales Cr.Memo Line";
        startingDay: Date;
        saledate: Text;
        currency: Text;
        refundreson: Text;
    begin
        //send Request to eTims
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'saveSales');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Authorization', 'Bearer ' + token);
        HttpContent.WriteFrom(HeaderJsonObject);
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);
        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode then begin
                JsonBuffer.ReadFromText(Response);
                Response := convertToJson(Response);
                if jsonResponse.ReadFrom(Response) then begin
                    if Response.Contains('000') then begin
                        SalesCreditHeader."Posted to Etims" := true;
                        SalesCreditHeader.Modify();
                    end;
                end;
                //exit(Response);
            end else begin
                Message('Request failed!: %1', Response);
            end;


        end;
    end;

    procedure convertToJson(myString: Text): Text
    begin
        myString := DelStr(myString.Replace('\\', '').Replace('\"', '"'), 1, 1);
        myString := DelStr(myString, StrLen(myString), StrLen(myString));
        exit(myString);
    end;

    procedure getPostedPurchaseDetails(num: Text; customerNum: Text) Msg: Text
    var
        totalAmount: Decimal;
        totalVAT: Decimal;
        discount: Decimal;
        count: Integer;
        custPin: Text;
        vat: Decimal;
        refundreason: Text;
    begin
        totalAmount := 0;
        totalVAT := 0;
        count := 0;
        PostedPurchaseLines.Reset();
        PostedPurchaseLines.SetRange("Document No.", num);
        PostedPurchaseLines.SetRange(Type, PostedPurchaseLines.Type::"G/L Account");
        if PostedPurchaseLines.FindSet() then begin
            repeat
                totalAmount += PostedPurchaseLines."Line Amount";
                totalVAT += PostedPurchaseLines."Line Amount" * PostedPurchaseLines."VAT %";
                count += 1;
            /* item.Reset();
            item.SetRange("No.", PostedPurchaseLines."No.");
            item.SetFilter("Posted to Etims", '=%1', false);
            if item.FindFirst() then
                exit('0'); */
            until PostedPurchaseLines.Next() = 0;
        end;
        vendor.Reset();
        vendor.SetRange("No.", customerNum);
        if vendor.FindFirst() then begin
            custPin := vendor."VAT Registration No.";
        end;
        Msg := Format(totalAmount) + '::' + Format(totalVAT) + '::' + Format(count) + '::' + custPin;
    end;

    procedure getOriginalIvoiceNum(DocNum: Text) Msg: Text
    begin
        SIH.Reset();
        SIH.SetRange("No.", DocNum);
    end;

    procedure getuserDetails(SSID: Text) Msg: Text
    begin
        users.Reset();
        users.SetRange("User Security ID", SSID);
        if users.FindFirst() then begin
            Msg := users."User Name" + '::' + users."Full Name";
        end;
    end;

    procedure getcurrencyDetails(C_Code: Text) Msg: Decimal
    begin
        currency.Reset();
        currency.SetRange("Currency Code", C_Code);
        if currency.FindLast() then begin
            Msg := currency."Relational Exch. Rate Amount";
        end;
    end;

    procedure generateSalesInvoiceNumber(Num: Text)
    begin
        SIH.Reset();
        SIH.SetRange("Pre-Assigned No.", Num);
        if SIH.FindFirst() then begin
        end;
    end;

    procedure getSalesInvoiceNum(Num: Text) Msg: Integer
    begin
        company.Get();
        SIH.Reset();
        SIH.SetRange("No.", Num);
        if SIH.FindFirst() then begin
            if (SIH."Invoice Number" < 1) then begin
                Msg := company."Sales Invoice Number" + 1;
                company."Sales Invoice Number" := Msg;
                company.Modify();
                SIH."Invoice Number" := Msg;
                SIH.Modify();
            end
            else begin
                if (SIH."Invoice Number" > 0) then Msg := SIH."Invoice Number";
            end;
        end
        else if not SIH.FindFirst() then begin
            creditNote.Reset();
            creditNote.SetRange("No.", Num);
            if creditNote.FindFirst() then begin
                if (creditNote."Invoice Number" < 1) then begin
                    Msg := company."Sales Invoice Number" + 1;
                    company."Sales Invoice Number" := Msg;
                    company.Modify();
                    creditNote."Invoice Number" := Msg;
                    creditNote.Modify();
                end
                else begin
                    if (creditNote."Invoice Number" > 0) then Msg := creditNote."Invoice Number";
                end;
            end
            else begin
                postedPurchase.Reset();
                postedPurchase.SetRange("No.", Num);
                if postedPurchase.FindFirst() then begin
                    if (postedPurchase."Invoice Number" < 1) then begin
                        Msg := company."Sales Invoice Number" + 1;
                        company."Sales Invoice Number" := Msg;
                        company.Modify();
                        postedPurchase."Invoice Number" := Msg;
                        postedPurchase.Modify();
                    end
                    else begin
                        if (postedPurchase."Invoice Number" > 0) then Msg := postedPurchase."Invoice Number";
                    end;
                end
            end;
        end;
    end;

    procedure getItemDetails(itemNum: Text) Msg: Text
    begin
        /* item.Reset();
        item.SetRange("No.", itemNum);
        if item.FindFirst() then begin
            Msg := item."Etims Item Code" + '::' + item."Item Class" + '::' + item."Packaging Unit code" + '::' + item."Quantity Unit Code" + '::' + item."Tax Type" + '::' + item."Product Type";
        end; */
        glAccount.Reset();
        glAccount.SetRange("No.", itemNum);
        if glAccount.FindFirst() then begin
            Msg := glAccount."Etims Item Code" + '::' + glAccount."Item Class" + '::' + glAccount."Packaging Unit code" + '::' + glAccount."Quantity Unit Code" + '::' + glAccount."Tax Type" + '::' + glAccount."Service Type";
        end;
    end;

    procedure getSalestaxTypeAmount(itemNum: Text; type: Text; docNum: Text) Msg: Text
    var
        taxblAmt: Decimal;
        taxAmt: Decimal;
        taxRate: Decimal;
        count: Integer;
        mycode: Text;
    begin
        taxblAmt := 0;
        taxAmt := 0;
        count := 0;
        invLine.Reset();
        invLine.SetRange("No.", itemNum);
        invLine.SetRange("Document No.", docNum);
        if invLine."VAT Prod. Posting Group" = '' then begin
            type := 'A';
            mycode := '';
        end;
        vatpg.Reset();
        vatpg.SetRange("Tax Type Code", type);
        if vatpg.FindFirst() then begin
            invLine.SetRange("VAT Prod. Posting Group", vatpg.Code);
            if invLine.FindSet() then begin
                repeat
                    count += 1;
                    taxAmt += invLine."Line Amount" * invLine."VAT %" / 100;
                    taxblAmt += invLine."Line Amount";
                    taxRate += invLine."VAT %";
                until invLine.Next() = 0;
                Msg := Format(taxAmt) + '::' + Format(taxblAmt) + '::' + Format(taxRate / count);
            end;
        end;
    end;

    procedure getSalesCreditTaxTypeAmount(itemNum: Text; type: Text; docNum: Text) Msg: Text
    var
        taxblAmt: Decimal;
        taxAmt: Decimal;
        taxRate: Decimal;
        count: Integer;
    begin
        taxblAmt := 0;
        taxAmt := 0;
        count := 0;
        invCreditLine.Reset();
        invCreditLine.SetRange("No.", itemNum);
        invCreditLine.SetRange("Document No.", docNum);
        if invCreditLine."VAT Prod. Posting Group" = '' then type := 'A';
        vatpg.Reset();
        vatpg.SetRange("Tax Type Code", type);
        if vatpg.FindFirst() then begin
            invCreditLine.SetRange("VAT Prod. Posting Group", vatpg.Code);
            if invCreditLine.FindSet() then begin
                repeat
                    count += 1;
                    taxAmt += invCreditLine."Line Amount" * invCreditLine."VAT %" / 100;
                    taxblAmt += invCreditLine."Line Amount";
                    taxRate += invCreditLine."VAT %";
                until invCreditLine.Next() = 0;
                Msg := Format(taxAmt) + '::' + Format(taxblAmt) + '::' + Format(taxRate / count);
            end;
        end;
    end;

    procedure getPostedCreditSalesInvoiceDetails(no: Text; customerNum: Text) Msg: Text
    var
        totalAmount: Decimal;
        totalvat: Decimal;
        discount: Decimal;
        count: Integer;
        custPin: Text;
        vat: Decimal;
        vatAmount: Decimal;
        refundreason: Text;
    begin
        totalAmount := 0;
        totalvat := 0;
        vat := 0;
        count := 0;
        vatAmount := 0;
        invCreditLine.Reset();
        invCreditLine.SetRange("Document No.", No);
        invCreditLine.SetFilter(Type, '=%1', invCreditLine.Type::"G/L Account");
        if invCreditLine.FindSet() then begin
            repeat
                totalAmount += invCreditLine."Line Amount";
                totalvat += invCreditLine."Line Amount" * invCreditLine."VAT %" / 100;
                count += 1;
            until invCreditLine.Next() = 0;
        end;
        customer.Reset();
        customer.SetRange("No.", customerNum);
        if customer.FindFirst() then begin
            custPin := customer."VAT Registration No.";
        end;
        salesHeader.Reset();
        salesHeader.SetRange("Applies-to Doc. No.", no);
        if salesHeader.FindFirst() then
            refundreason := '13' //salesHeader."Refund Reason"
        else
            refundreason := '13';
        Msg := Format(totalAmount) + '::' + Format(totalvat) + '::' + Format(count) + '::' + custPin + '::' + refundreason;
    end;

    procedure getPostedSalesInvoiceDetails(no: Text; customerNum: Text) Msg: Text
    var
        totalAmount: Decimal;
        totalVAT: Decimal;
        discount: Decimal;
        count: Integer;
        custPin: Text;
        vat: Decimal;
        refundreason: Text;
    begin
        totalAmount := 0;
        totalVAT := 0;
        count := 0;
        invLine.Reset();
        invLine.SetRange("Document No.", No);
        if invLine.FindSet() then begin
            repeat
                totalAmount += invLine."Line Amount";
                totalVAT += invLine."Line Amount" * invLine."VAT %";
                count += 1;
            until invLine.Next() = 0;
        end;
        customer.Reset();
        customer.SetRange("No.", customerNum);
        if customer.FindFirst() then begin
            custPin := customer."VAT Registration No.";
        end;
        Msg := Format(totalAmount) + '::' + Format(totalVAT) + '::' + Format(count) + '::' + custPin;
    end;

    local procedure GetRequest() ResponseText: Text
    var
        Client: HttpClient;
        HttpStatusCode: Integer;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
    begin
        IsSuccessful := Client.Get('https://jsonplaceholder.typicode.com/todos/3', Response);
        if not IsSuccessful then begin
            ResponseText := 'Call Not Successful';
        end;
        if not Response.IsSuccessStatusCode() then begin
            HttpStatusCode := response.HttpStatusCode();
            // handle the error (depending on the HTTP status code)
        end;
        Response.Content().ReadAs(ResponseText);
        // Expected output:
        //   GET https://jsonplaceholder.typicode.com/todos/3 HTTP/1.1
        //   {
        //     "userId": 1,
        //     "id": 3,
        //     "title": "fugiat veniam minus",
        //     "completed": false
        //   }
    end;

    procedure updatecreditNote(DocNum: Text; intrlData: Text; rcptSign: Text; sdcId: Text; CUInvoiceNo: Text; QRCodeUrl: Text; dateT: DateTime) Msg: Text
    var
    begin
        Msg := 'Fail';
        creditNote.Reset();
        company.Get();
        creditNote.SetRange("No.", DocNum);
        if creditNote.FindFirst() then begin


            creditNote."Posted to Etims" := true;
            creditNote.EtimsDate := DT2Date(dateT);
            creditNote.EtimsTime := DT2Time(dateT);
            creditNote."SCU ID" := sdcId;
            creditNote."CU Invoice Number" := creditNote."SCU ID" + '/' + Format(creditNote."ETIMS Local Invoice Number");
            creditNote."Internal Data" := intrlData;
            creditNote."Receipt Signature" := rcptSign;
            creditNote.QRCodeUrl := QRCodeUrl;
            creditNote."Posted to Etims" := true;
            if creditNote.Modify() then GenerateBarcodeCr(QRCodeUrl, creditNote);
            Msg := 'Success';
        end;
    end;

    local procedure GenerateBarcode(urlforqr: Text; RecSalesInvoice: Record "Sales Invoice Header")
    var
        Client: HttpClient;
        Content: HttpContent;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        InStr: InStream;
        StartPos: Integer;
        OutStr: OutStream;
        ApiUrl: Text;
        Method: Text;
        QRCodeURL: Text;
        SubStrAfter: Text;
        SubStrBefore: Text;
    begin
        QRCodeURL := urlforqr;
        StartPos := StrPos(urlforqr, '&');
        if StartPos > 0 then begin
            SubStrBefore := CopyStr(urlforqr, 1, StartPos - 1);
            SubStrAfter := CopyStr(urlforqr, StartPos + 1, StrLen(urlforqr) - StartPos);
            QRCodeURL := SubStrBefore + '%26' + SubStrAfter;
        end;
        Method := 'v1/create-qr-code/?size=150x150&data=' + QRCodeURL;
        // Set the API URL
        ApiUrl := 'https://api.qrserver.com/' + Method;
        Request.SetRequestUri(ApiUrl);
        Request.Method := 'GET';
        // Send the request
        if Client.Send(Request, Response) then
            if Response.IsSuccessStatusCode() then begin
                Content := Response.Content();
                Content.ReadAs(InStr);
                RecSalesInvoice.CalcFields("Kra QR Code");
                Clear(RecSalesInvoice."Kra QR Code");
                RecSalesInvoice."Kra QR Code".CreateOutStream(OutStr);
                CopyStream(OutStr, InStr);
                RecSalesInvoice.Modify();
                Commit();
            end;
    end;

    local procedure GenerateBarcodeCr(urlforqr: Text; RecSalesInvoice: Record "Sales Cr.Memo Header")
    var
        Client: HttpClient;
        Content: HttpContent;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        InStr: InStream;
        StartPos: Integer;
        OutStr: OutStream;
        ApiUrl: Text;
        Method: Text;
        QRCodeURL: Text;
        SubStrAfter: Text;
        SubStrBefore: Text;
    begin
        QRCodeURL := urlforqr;
        StartPos := StrPos(urlforqr, '&');
        if StartPos > 0 then begin
            SubStrBefore := CopyStr(urlforqr, 1, StartPos - 1);
            SubStrAfter := CopyStr(urlforqr, StartPos + 1, StrLen(urlforqr) - StartPos);
            QRCodeURL := SubStrBefore + '%26' + SubStrAfter;
        end;
        Method := 'v1/create-qr-code/?size=150x150&data=' + QRCodeURL;
        // Set the API URL
        ApiUrl := 'https://api.qrserver.com/' + Method;
        Request.SetRequestUri(ApiUrl);
        Request.Method := 'GET';
        // Send the request
        if Client.Send(Request, Response) then
            if Response.IsSuccessStatusCode() then begin
                Content := Response.Content();
                Content.ReadAs(InStr);
                RecSalesInvoice.CalcFields("Kra QR Code");
                Clear(RecSalesInvoice."Kra QR Code");
                RecSalesInvoice."Kra QR Code".CreateOutStream(OutStr);
                CopyStream(OutStr, InStr);
                RecSalesInvoice.Modify();
                Commit();
            end;
    end;

    procedure selectCodes(): Text
    var
        token: Text;
        returnMsgArray: JsonArray;
        returnMsgToken: JsonToken;
        returnMsgObject, ResponseObject : JsonObject;
        banksArray: JsonArray;
        banksToken: JsonToken;
        banksObject: JsonObject;
        localeArray: JsonArray;
        localeToken, quantityunit, taxationType, packagingUnit, countries, productType : JsonToken;
        localeObject: JsonObject;
        cd: Text;
        cdNm: Text;
        useYn: Text;
        srtOrd: Integer;
        cdDesc: Text;
        yn: Integer;
        rtnToken: JsonToken;
        rate: Decimal;
    begin
        Clear(token);
        token := GetEtimsToken;
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'selectCodes');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Authorization', 'Bearer ' + token);
        HttpContent.WriteFrom(RequestData());
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);

        if HttpClient.Send(RequestMessage, ResponseMessage) then
            if ResponseMessage.Content.ReadAs(Response) then
                if ResponseMessage.IsSuccessStatusCode then begin
                    Response := convertToJson(Response);
                    Message(Response);
                    jsonResponse.ReadFrom(Response);
                    //if jsonResponse.ReadFrom(Response) then begin
                    if jsonResponse.Get('data', jsonTokenValue) then begin
                        jsonTokenValue.AsObject().Get('clsList', jsonTokenValue);
                        //convert to array to get positions
                        returnMsgArray := jsonTokenValue.AsArray();
                        returnMsgArray.Get(0, taxationType);
                        returnMsgArray.Get(1, countries);
                        returnMsgArray.Get(11, returnMsgToken);
                        returnMsgArray.Get(15, banksToken);
                        returnMsgArray.Get(19, localeToken);
                        returnMsgArray.Get(4, quantityunit);
                        returnMsgArray.Get(8, packagingUnit);
                        returnMsgArray.Get(9, productType);

                        //refund Reason
                        returnMsgToken.AsObject().Get('dtlList', returnMsgToken);
                        returnMsgArray := returnMsgToken.AsArray();
                        foreach returnMsgToken in returnMsgArray do begin
                            returnMsgObject := returnMsgToken.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdDesc', rtnToken);
                            if rtnToken.AsValue().IsNull then
                                cdDesc := 'null'
                            else
                                cdDesc := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('srtOrd', rtnToken);
                            srtOrd := rtnToken.AsValue().AsInteger();

                            returnMsgObject.Get('useYn', rtnToken);
                            useYn := rtnToken.AsValue().AsText();

                            yn := 2;
                            if useYn = 'Y' then yn := 1;
                            updateRefundReason(cd, cdNm, cdDesc, srtOrd, yn);

                        end;

                        //Banks
                        banksToken.AsObject().Get('dtlList', banksToken);
                        returnMsgArray := banksToken.AsArray();
                        foreach banksToken in returnMsgArray do begin
                            returnMsgObject := banksToken.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('srtOrd', rtnToken);
                            srtOrd := rtnToken.AsValue().AsInteger();

                            returnMsgObject.Get('useYn', rtnToken);
                            useYn := rtnToken.AsValue().AsText();

                            yn := 2;
                            if useYn = 'Y' then yn := 1;
                            updateBanks(cd, cdNm, cdNm, yn, srtOrd);
                        end;

                        //Locale
                        localeToken.AsObject().Get('dtlList', localeToken);
                        returnMsgArray := localeToken.AsArray();
                        foreach localeToken in returnMsgArray do begin
                            returnMsgObject := localeToken.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('srtOrd', rtnToken);
                            srtOrd := rtnToken.AsValue().AsInteger();

                            returnMsgObject.Get('useYn', rtnToken);
                            useYn := rtnToken.AsValue().AsText();

                            yn := 2;
                            if useYn = 'Y' then yn := 1;
                            updateLocale(cd, cdNm, cdNm, yn, srtOrd);
                        end;

                        //Quantity Unit
                        quantityunit.AsObject().Get('dtlList', quantityunit);
                        returnMsgArray := quantityunit.AsArray();
                        foreach quantityunit in returnMsgArray do begin
                            returnMsgObject := quantityunit.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdDesc', rtnToken);
                            cdDesc := rtnToken.AsValue().AsText();

                            updateQuantityUnit(cd, cdNm, cdDesc);
                        end;

                        //Taxation Type
                        taxationType.AsObject().Get('dtlList', taxationType);
                        returnMsgArray := taxationType.AsArray();
                        foreach taxationType in returnMsgArray do begin
                            returnMsgObject := taxationType.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('userDfnCd1', rtnToken);
                            rate := rtnToken.AsValue().AsDecimal();

                            updateTaxationType(cd, cdNm, rate);
                        end;

                        //Packaging Unit
                        packagingUnit.AsObject().Get('dtlList', packagingUnit);
                        returnMsgArray := packagingUnit.AsArray();
                        foreach packagingUnit in returnMsgArray do begin
                            returnMsgObject := packagingUnit.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdDesc', rtnToken);
                            cdDesc := rtnToken.AsValue().AsText();

                            updatePackagingUnit(cd, cdNm, cdDesc);
                        end;

                        //countries
                        countries.AsObject().Get('dtlList', countries);
                        returnMsgArray := countries.AsArray();
                        foreach countries in returnMsgArray do begin
                            returnMsgObject := countries.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            updateCountries(cd, cdNm, cdNm);
                        end;

                        //Product Type
                        productType.AsObject().Get('dtlList', productType);
                        returnMsgArray := productType.AsArray();
                        foreach productType in returnMsgArray do begin
                            returnMsgObject := productType.AsObject();

                            returnMsgObject.Get('cd', rtnToken);
                            cd := rtnToken.AsValue().AsText();

                            returnMsgObject.Get('cdNm', rtnToken);
                            cdNm := rtnToken.AsValue().AsText();

                            updateProductType(cd, cdNm, cdNm);
                        end;
                    end;
                    exit('Update successful');
                    //Page.Run(Page::"JSON Buffer BCG", JsonBuffer);
                end else begin
                    Message('Request failed!: %1', Response);
                end;
    end;

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

    procedure updateCustomer(custNum: Text) Msg: Text
    begin
        customer.Reset();
        customer.SetRange("No.", custNum);
        if customer.FindFirst() then
            customer."Posted to Etims" := true;
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

    procedure selectItems(): Text
    var
        token: Text;
        rtnMessageArray: JsonArray;
        rtnMessageToken: JsonToken;
        rtnMessageObject: JsonObject;
        cd: Text;
        cdNm: Text;
        rtnToken: JsonToken;
        itemClsCd: Text;
        itemClsNm: Text;
        itemClsLvl: Text;
        taxTyCd: Boolean;
        taxTyCdText: Text;
        mjrTgYn: Boolean;
        mjrTgYnText: Text;
        useYn: Text;
        yn: Integer;
    begin
        Clear(token);
        token := GetEtimsToken;
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'selectItemsClass');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Authorization', 'Bearer ' + token);
        HttpContent.WriteFrom(RequestData());
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);

        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode then begin
                JsonBuffer.ReadFromText(Response);
                Response := convertToJson(Response);
                if jsonResponse.ReadFrom(Response) then begin
                    jsonResponse.Get('data', jsonTokenValue);
                    jsonTokenValue.AsObject().Get('itemClsList', jsonTokenValue);
                    //convert to array to get positions
                    rtnMessageArray := jsonTokenValue.AsArray();
                    foreach jsonTokenValue in rtnMessageArray do begin
                        rtnMessageObject := jsonTokenValue.AsObject();

                        rtnMessageObject.Get('itemClsCd', rtnToken);
                        itemClsCd := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('itemClsNm', rtnToken);
                        itemClsNm := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('itemClsLvl', rtnToken);
                        itemClsLvl := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('taxTyCd', rtnToken);
                        if rtnToken.AsValue().IsNull() then
                            taxTyCdText := 'null'
                        else
                            taxTyCdText := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('mjrTgYn', rtnToken);
                        if rtnToken.AsValue().IsNull() then
                            mjrTgYnText := 'null'
                        else
                            mjrTgYnText := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('useYn', rtnToken);
                        useYn := rtnToken.AsValue().AsText();

                        yn := 2;
                        if useYn = 'Y' then yn := 1;

                        updateClass(true, yn, itemClsCd, itemClsLvl, itemClsNm, false, taxTyCdText)
                    end;
                end;
                exit('Update successful');
                //Page.Run(Page::"JSON Buffer BCG", JsonBuffer);
            end else begin
                Message('Request failed!: %1', Response);
            end;
        end;
    end;

    procedure SelectItemsClassifications(): Text
    var
        Token: Text;
        ResponseTxt: Text;
        BusinesssID: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        UpdatedCount: Integer;
    begin
        Company.Get();

        Clear(BusinesssID);
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;
        UpdatedCount := 0;
        BusinesssID := 'Test';

        SendETIMSGetRequest('Branch/GetClassificationCodes', Token, BusinesssID, HttpStatus, ResponseTxt, ErrTxt);

        if ErrTxt <> '' then
            exit(StrSubstNo('SelectItems failed. %1', ErrTxt));

        UpdatedCount := ParseItemClassListAndUpdate(ResponseTxt);

        exit(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
    end;

    local procedure ParseItemClassListAndUpdate(ResponseTxt: Text): Integer
    var
        RootObj: JsonObject;
        Tok: JsonToken;
        SuccessTok: JsonToken;
        Success: Boolean;

        ResultTok: JsonToken;
        ResultArray: JsonArray;
        ItemTok: JsonToken;
        ItemObj: JsonObject;

        ErrorTok: JsonToken;
        ErrorMsg: Text;

        ItemClsCd: Text;
        ItemClsNm: Text;
        ItemClsLvl: Text;
        TaxTyCdText: Text;
        MjrTgYnText: Text;
        UseYn: Text;
        Yn: Integer;
        Updated: Integer;
    begin
        Updated := 0;

        // If you still need convertToJson() for cleaning, keep it:
        // ResponseTxt := convertToJson(ResponseTxt);

        if not RootObj.ReadFrom(ResponseTxt) then
            Error('Invalid JSON returned from ETIMS');

        // success (required)
        if not RootObj.Get('success', SuccessTok) then
            Error('Missing "success" in response');

        Success := SuccessTok.AsValue().AsBoolean();

        if not Success then begin
            // error (preferred)
            ErrorMsg := '';
            if RootObj.Get('error', ErrorTok) then
                if not ErrorTok.AsValue().IsNull() then
                    ErrorMsg := ErrorTok.AsValue().AsText();

            if ErrorMsg = '' then
                ErrorMsg := 'ETIMS request failed (success=false).';

            Error(ErrorMsg);
        end;

        // result must be an array
        if not RootObj.Get('result', ResultTok) then
            Error('Missing "result" in response');

        ResultArray := ResultTok.AsArray();

        foreach ItemTok in ResultArray do begin
            ItemObj := ItemTok.AsObject();

            ItemClsCd := _ETIMSHelperFunctions.GetJsonTextRequired(ItemObj, 'itemClassCode');
            ItemClsNm := _ETIMSHelperFunctions.GetJsonTextRequired(ItemObj, 'itemClassName');

            // itemClassLevel is numeric in your sample, but we keep it as Text because updateClass expects Text
            ItemClsLvl := _ETIMSHelperFunctions.GetJsonTextNullable(ItemObj, 'itemClassLevel');
            if ItemClsLvl = 'null' then
                ItemClsLvl := ''; // or '0' if you prefer a default

            TaxTyCdText := _ETIMSHelperFunctions.GetJsonTextNullable(ItemObj, 'taxTypeCode');
            MjrTgYnText := _ETIMSHelperFunctions.GetJsonTextNullable(ItemObj, 'majorTargetYn');

            UseYn := _ETIMSHelperFunctions.GetJsonTextRequired(ItemObj, 'useYn');

            Yn := 2;
            if UseYn = 'Y' then
                Yn := 1;

            // Keep your existing signature; TaxTyCdText passed as-is
            updateClass(true, Yn, ItemClsCd, ItemClsLvl, ItemClsNm, false, TaxTyCdText);

            Updated += 1;
        end;

        exit(Updated);
    end;


    procedure selectBranches(): Text
    var
        token: Text;
        rtnMessageArray: JsonArray;
        rtnMessageToken: JsonToken;
        rtnMessageObject: JsonObject;
        rtnToken: JsonToken;
        tin: Text;
        bhfId: Text;
        bhfNm: Text;
        bhfSttsCd: Text;
        prvncNm: Text;
        dstrtNm: Text;
        sctrNm: Text;
        locDesc: Boolean;
        locDescText: Text;
        mgrNm: Text;
        mgrTelNo: Text;
        mgrEmail: Text;
        useYn: Text;
        yn: Boolean;
    begin
        Clear(token);
        token := GetEtimsToken;
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(getURL + 'selectBranches');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Authorization', 'Bearer ' + token);
        HttpContent.WriteFrom(RequestData());
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);

        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode then begin
                JsonBuffer.ReadFromText(Response);
                Response := convertToJson(Response);
                if jsonResponse.ReadFrom(Response) then begin
                    jsonResponse.Get('data', jsonTokenValue);
                    jsonTokenValue.AsObject().Get('bhfList', jsonTokenValue);
                    rtnMessageArray := jsonTokenValue.AsArray();
                    foreach jsonTokenValue in rtnMessageArray do begin
                        rtnMessageObject := jsonTokenValue.AsObject();

                        rtnMessageObject.Get('tin', rtnToken);
                        tin := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('bhfId', rtnToken);
                        bhfId := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('bhfNm', rtnToken);
                        bhfNm := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('bhfSttsCd', rtnToken);
                        bhfSttsCd := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('prvncNm', rtnToken);
                        prvncNm := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('dstrtNm', rtnToken);
                        dstrtNm := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('sctrNm', rtnToken);
                        sctrNm := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('locDesc', rtnToken);
                        if rtnToken.AsValue().IsNull() then
                            locDescText := 'null'
                        else
                            locDescText := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('mgrNm', rtnToken);
                        mgrNm := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('mgrTelNo', rtnToken);
                        mgrTelNo := rtnToken.AsValue().AsText();

                        rtnMessageObject.Get('mgrEmail', rtnToken);
                        mgrEmail := rtnToken.AsValue().AsText();


                        rtnMessageObject.Get('hqYn', rtnToken);
                        useYn := rtnToken.AsValue().AsText();

                        yn := false;
                        if useYn = 'Y' then yn := true;

                        insertBranches(bhfId, bhfNm, bhfSttsCd, yn, mgrEmail, mgrNm, mgrTelNo, locDescText, tin, dstrtNm);
                    end;
                end;
                exit('Update Successful');
                //Page.Run(Page::"JSON Buffer BCG", JsonBuffer);
            end else begin
                Message('Request failed!: %1', Response);
            end;
        end;
    end;

    procedure insertBranches(branchId: Code[20]; branchName: Text; statuscode: Text; Hq: Boolean; email: Text; name: Text; phone: Text; taxlocality: Text; tin: Text; district: Text) Msg: Text
    begin
        branch.Reset();
        branch.SetRange("Branch Id", branchId);
        if not branch.FindFirst() then begin
            branch.Init();
            branch."Branch Id" := branchId;
            branch."Branch Name" := branchName;
            branch."Branch Status Code" := statuscode;
            branch.Headquater := Hq;
            branch."Manager Email" := email;
            branch."Manager Name" := name;
            branch."Manager Phone" := phone;
            branch."Tax Locality" := taxlocality;
            branch.Tin := tin;
            branch."District Name" := district;
            if branch.Insert() then
                Msg := 'Success'
            else
                Msg := 'Fail';
        end;
    end;

    procedure saveBranchCustomersOld(): Text
    var
        token: Text;
        CustomerJsonObject: JsonObject;
        JsonArray: JsonArray;
        customer: Record Customer;
        tin, bhfId, custNo, custTin, custNm, adrs, telNo, email, faxNo, useYn, remark, regrId, regrNm, modrNm, modrId : Text;

    begin
        //create json from branch Customers
        Clear(token);
        token := GetEtimsToken;
        company.Get();
        if customer.FindSet() then
            repeat
                if not customer."Posted to Etims" then begin
                    Clear(CustomerJsonObject);
                    CustomerJsonObject.Add('tin', company."Company Tin");
                    CustomerJsonObject.Add('bhfId', company."Branch ID");
                    CustomerJsonObject.Add('custNo', customer."No.");
                    CustomerJsonObject.Add('custTin', customer."VAT Registration No.");
                    CustomerJsonObject.Add('custNm', customer.Name);
                    CustomerJsonObject.Add('adrs', customer.Address);
                    CustomerJsonObject.Add('telNo', customer."Mobile Phone No.");
                    CustomerJsonObject.Add('email', customer."E-Mail");
                    CustomerJsonObject.Add('faxNo', customer."Fax No.");
                    useYn := 'N';
                    if customer.useYn = 0 then useYn := 'Y';
                    CustomerJsonObject.Add('useYn', useYn);
                    CustomerJsonObject.Add('remark', '');
                    users.Reset();
                    users.SetRange("User Security ID", customer.SystemCreatedBy);
                    if users.FindFirst() then begin
                        CustomerJsonObject.Add('regrId', users."User Name");
                        CustomerJsonObject.Add('regrNm', users."Full Name");
                        CustomerJsonObject.Add('modrNm', users."Full Name");
                        CustomerJsonObject.Add('modrId', users."User Name");
                    end;

                    Clear(RequestMessage);
                    Clear(RequestHeaders);
                    Clear(ContentHeaders);
                    Clear(Response);
                    RequestMessage.SetRequestUri(getURL + 'saveBranchCustomers');
                    RequestMessage.Method('POST');
                    RequestMessage.GetHeaders(RequestHeaders);
                    RequestHeaders.Add('Authorization', 'Bearer ' + token);
                    HttpContent.WriteFrom(Format(CustomerJsonObject));
                    HttpContent.GetHeaders(ContentHeaders);
                    ContentHeaders.Remove('Content-Type');
                    ContentHeaders.Add('Content-Type', 'application/json');
                    HttpContent.GetHeaders(ContentHeaders);
                    RequestMessage.Content(HttpContent);

                    if HttpClient.Send(RequestMessage, ResponseMessage) then begin
                        ResponseMessage.Content.ReadAs(Response);
                        if ResponseMessage.IsSuccessStatusCode then begin
                            JsonBuffer.ReadFromText(Response);
                            Response := convertToJson(Response);
                            if jsonResponse.ReadFrom(Response) then begin
                                jsonResponse.Get('resultMsg', jsonTokenValue);
                                Response := jsonTokenValue.AsValue().AsText();
                                if Response.Contains('000') then begin
                                    customer."Posted to Etims" := true;
                                    customer.Modify();
                                end;
                            end;
                            exit(Response);
                        end else begin
                            Message('Request failed!: %1', Response);
                        end;
                    end;
                end
            until customer.Next() = 0;
    end;

    procedure SaveBulkBranchCustomers(): Text
    var
        Token: Text;
        CustomerRec: Record Customer;
        PayloadTxt: Text;
        ResponseTxt: Text;
        HttpStatus: Integer;
        ErrTxt: Text;
        OkCount: Integer;
        FailCount: Integer;
    begin
        Company.Get();
        OkCount := 0;
        FailCount := 0;

        CustomerRec.Reset();
        CustomerRec.SetRange("Posted to Etims", false);
        if CustomerRec.FindSet() then
            repeat
                if (CustomerRec."VAT Registration No." = '') then
                    Error('Record %1 does not have a VAT Registration No.');
                Clear(PayloadTxt);
                Clear(ResponseTxt);
                Clear(ErrTxt);
                HttpStatus := 0;

                BuildBranchCustomerPayload(CustomerRec, PayloadTxt);

                SendETIMSRequest('Branch/SaveBranchCustomer', Token, PayloadTxt, HttpStatus, ResponseTxt, ErrTxt);

                HandleBranchCustomerResponse(ResponseTxt, CustomerRec);

            until CustomerRec.Next() = 0;

        exit(StrSubstNo('SaveBranchCustomers completed. Success=%1, Failed=%2', OkCount, FailCount));
    end;

    procedure SaveSingleBranchCustomers(no: Code[50]): Text
    var
        Token: Text;
        CustomerRec: Record Customer;
        PayloadTxt: Text;
        ResponseTxt: Text;
        HttpStatus: Integer;
        ErrTxt: Text;
        OkCount: Integer;
        FailCount: Integer;
    begin
        Company.Get();
        OkCount := 0;
        FailCount := 0;
        CustomerRec.Get(no);
        if (CustomerRec."Posted to Etims" = true) then
            Error('Item already posted to ETIMS');
        Clear(PayloadTxt);
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        BuildBranchCustomerPayload(CustomerRec, PayloadTxt);

        SendETIMSRequest('Branch/SaveBranchCustomer', Token, PayloadTxt, HttpStatus, ResponseTxt, ErrTxt);

        HandleBranchCustomerResponse(ResponseTxt, CustomerRec);

        exit(StrSubstNo('SaveBranchCustomers completed. Success=%1, Failed=%2', OkCount, FailCount));
    end;

    local procedure BuildBranchCustomerPayload(var CustomerRec: Record Customer; var PayloadTxt: Text)
    var
        J: JsonObject;
        UsedUnusedTxt: Text;
    begin
        Clear(J);

        // Endpoint expected JSON (NEW keys)
        J.Add('businessId', Company.Name); // change to Company."Company Tin" if that is your businessId
        J.Add('customerNumber', CustomerRec."No.");
        J.Add('customerPin', CustomerRec."VAT Registration No.");
        J.Add('customerName', CustomerRec.Name);
        J.Add('address', CustomerRec.Address);
        J.Add('telNo', CustomerRec."Mobile Phone No.");
        J.Add('email', CustomerRec."E-Mail");
        J.Add('faxNumber', CustomerRec."Fax No.");

        // usedUnused: your old logic was (useYn=0 => Y). Keep same behavior.
        UsedUnusedTxt := 'N';
        if CustomerRec.useYn = 0 then
            UsedUnusedTxt := 'Y';
        J.Add('usedUnused', UsedUnusedTxt);

        J.Add('remark', '');

        AddRegistrarFieldsCustomer(CustomerRec, J);

        PayloadTxt := Format(J);
    end;

    local procedure AddRegistrarFieldsCustomer(var CustomerRec: Record Customer; var J: JsonObject)
    var
        Users: Record User;
    begin
        Users.Reset();
        Users.SetRange("User Security ID", CustomerRec.SystemCreatedBy);
        if Users.FindFirst() then begin
            J.Add('registrationId', Users."User Name");
            J.Add('registrationNm', Users."Full Name");
            J.Add('modifierId', Users."User Name");
            J.Add('modifierNm', Users."Full Name");
        end else begin
            J.Add('registrationId', '');
            J.Add('registrationNm', '');
            J.Add('modifierId', '');
            J.Add('modifierNm', '');
        end;
    end;

    local procedure HandleBranchCustomerResponse(ResponseText: Text; var CustomerRec: Record Customer): Text
    var
        RootObj: JsonObject;
        JsonTok: JsonToken;
        StatusCode: Integer;
        Success: Boolean;
        ErrorTxt: Text;
        ResultTxt: Text;
        ResultCd: Text;
        ColonPos: Integer;
    begin
        if not RootObj.ReadFrom(ResponseText) then
            Error('Invalid JSON returned from ETIMS');

        // ===== Validate API Envelope =====
        // Expected:
        // { "statusCode": 200, "success": true, "error": null, "result": "000: Successful" }

        if RootObj.Get('statusCode', JsonTok) then
            StatusCode := JsonTok.AsValue().AsInteger()
        else
            Error('Missing statusCode in response');

        if RootObj.Get('success', JsonTok) then
            Success := JsonTok.AsValue().AsBoolean()
        else
            Error('Missing success in response');

        if (not Success) or (StatusCode <> 200) then begin
            if RootObj.Get('error', JsonTok) then
                ErrorTxt := JsonTok.AsValue().AsText()
            else
                ErrorTxt := '';
            if ErrorTxt <> '' then
                Error(ErrorTxt);

            Error('ETIMS returned an error');
        end;

        // ===== Validate Result Code inside "result" =====
        // result example: "000: Successful"
        if RootObj.Get('result', JsonTok) then
            ResultTxt := JsonTok.AsValue().AsText()
        else
            ResultTxt := '';
        ResultCd := '';
        ColonPos := StrPos(ResultTxt, ':');
        if ColonPos > 1 then
            ResultCd := CopyStr(ResultTxt, 1, ColonPos - 1)
        else
            if StrLen(ResultTxt) >= 3 then
                ResultCd := CopyStr(ResultTxt, 1, 3);

        if ResultCd <> '000' then begin
            if ResultTxt <> '' then
                Error(ResultTxt);
            Error('ETIMS returned an error');
        end;

        // ===== Update Customer =====
        CustomerRec."Posted to Etims" := true;
        CustomerRec.Modify(true);

        Message('Item posted to ETIMS successfully');
    end;

    procedure saveBrancheUsers(): Text
    var
        token: Text;
        branchUserJsonObject: JsonObject;
        EtimsUser: Record "eTims-User";
    begin
        // token := GetEtimsToken();
        company.Get();
        EtimsUser.SetRange(Synched, false);
        if EtimsUser.FindSet() then
            repeat
                Clear(branchUserJsonObject);
                branchUserJsonObject.Add('tin', company."Company Tin");
                branchUserJsonObject.Add('bhfId', company."Branch ID");
                branchUserJsonObject.Add('userId', EtimsUser."User Id");
                branchUserJsonObject.Add('userNm', EtimsUser."User Name");
                branchUserJsonObject.Add('pwd', EtimsUser.Password);
                branchUserJsonObject.Add('adrs', EtimsUser.Address);
                branchUserJsonObject.Add('cntc', EtimsUser.Contact);
                branchUserJsonObject.Add('authCd', EtimsUser."Auth Code");
                branchUserJsonObject.Add('remark', '');
                branchUserJsonObject.Add('useYn', 'Y');
                users.Reset();
                users.SetRange("User Security ID", EtimsUser.SystemCreatedBy);
                if users.FindFirst() then begin
                    branchUserJsonObject.Add('regrId', users."User Name");
                    branchUserJsonObject.Add('regrNm', users."Full Name");
                    branchUserJsonObject.Add('modrNm', users."Full Name");
                    branchUserJsonObject.Add('modrId', users."User Name");
                end;

                Clear(RequestMessage);
                Clear(RequestHeaders);
                Clear(ContentHeaders);
                Clear(Response);
                RequestMessage.SetRequestUri(getURL + 'saveBranchUsers');
                RequestMessage.Method('POST');
                RequestMessage.GetHeaders(RequestHeaders);
                RequestHeaders.Add('Authorization', 'Bearer ' + token);
                HttpContent.WriteFrom(Format(branchUserJsonObject));
                HttpContent.GetHeaders(ContentHeaders);
                ContentHeaders.Remove('Content-Type');
                ContentHeaders.Add('Content-Type', 'application/json');
                HttpContent.GetHeaders(ContentHeaders);
                RequestMessage.Content(HttpContent);

                if HttpClient.Send(RequestMessage, ResponseMessage) then begin
                    ResponseMessage.Content.ReadAs(Response);
                    if ResponseMessage.IsSuccessStatusCode then begin
                        JsonBuffer.ReadFromText(Response);
                        Response := convertToJson(Response);
                        if jsonResponse.ReadFrom(Response) then
                            //jsonResponse.Get('Token', jsonTokenValue);
                            //Response := jsonTokenValue.AsValue().AsText();
                            if Response.Contains('000') then begin
                                EtimsUser.Synched := true;
                                EtimsUser.Modify();
                            end;
                        //exit(Response);
                    end else begin
                        Message('Request failed!: %1', Response);
                    end;
                end;

            until EtimsUser.Next() = 0;
    end;

    procedure SaveBranchUsers(): Text
    var
        Token: Text;
        EtimsUser: Record "eTims-User";
        PayloadTxt: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        OkCount: Integer;
        FailCount: Integer;
        LastErr: Text;
    begin
        // Token := GetEtimsToken();
        Company.Get();

        OkCount := 0;
        FailCount := 0;
        LastErr := '';

        EtimsUser.Reset();
        EtimsUser.SetRange(Synched, false);

        if not EtimsUser.FindSet() then
            exit('SaveBranchUsers completed. No unsynched users found.');

        repeat
            Clear(PayloadTxt);
            Clear(ResponseTxt);
            Clear(ErrTxt);
            HttpStatus := 0;

            BuildSaveBranchUserPayload(EtimsUser, PayloadTxt);

            SendETIMSRequest('Branch/saveBranchUser', Token, PayloadTxt, HttpStatus, ResponseTxt, ErrTxt);

            if ErrTxt <> '' then begin
                FailCount += 1;
                LastErr := ErrTxt;
            end else begin
                // Validate response properly (throws Error() if not OK)
                ValidateEnvelopeAndResultOk(ResponseTxt);

                MarkUserSynched(EtimsUser);
                OkCount += 1;
            end;

        until EtimsUser.Next() = 0;

        if FailCount > 0 then
            exit(StrSubstNo('SaveBranchUsers completed. Success=%1, Failed=%2. LastError=%3', OkCount, FailCount, LastErr));

        exit(StrSubstNo('SaveBranchUsers completed. Success=%1, Failed=%2', OkCount, FailCount));
    end;

    local procedure BuildSaveBranchUserPayload(var EtimsUser: Record "eTims-User"; var PayloadTxt: Text)
    var
        J: JsonObject;
    begin
        Clear(J);
        Company.Get();

        J.Add('businessId', 'Test');
        J.Add('branchId', Company."Branch ID");
        J.Add('userId', EtimsUser."User Id");
        J.Add('userName', EtimsUser."User Name");
        J.Add('password', EtimsUser.Password);
        J.Add('address', EtimsUser.Address);
        J.Add('contact', EtimsUser.Contact);
        J.Add('authorizationCode', EtimsUser."Auth Code");
        J.Add('remark', '');
        J.Add('usedUnused', 'Y');

        AddRegistrarFieldsFromCreatedBy(EtimsUser.SystemCreatedBy, J);

        PayloadTxt := Format(J);
    end;

    local procedure AddRegistrarFieldsFromCreatedBy(CreatedByGuid: Guid; var J: JsonObject)
    var
        Users: Record User;
    begin
        Users.Reset();
        Users.SetRange("User Security ID", CreatedByGuid);

        if Users.FindFirst() then begin
            J.Add('registrationId', Users."User Name");
            J.Add('registrationNm', Users."Full Name");
            J.Add('modifierNm', Users."Full Name");
            J.Add('modifierId', Users."User Name");
        end else begin
            J.Add('registrationId', '');
            J.Add('registrationNm', '');
            J.Add('modifierNm', '');
            J.Add('modifierId', '');
        end;
    end;

    local procedure MarkUserSynched(var EtimsUser: Record "eTims-User")
    begin
        EtimsUser.Synched := true;
        EtimsUser.Modify(true);
    end;

    local procedure ValidateEnvelopeAndResultOk(ResponseTxt: Text)
    var
        RootObj: JsonObject;
        Tok: JsonToken;
        StatusCode: Integer;
        Success: Boolean;
        ErrorTxt: Text;
        ResultTxt: Text;
        ResultCd: Text;
        ColonPos: Integer;
    begin
        // If you still need convertToJson(), uncomment:
        // ResponseTxt := convertToJson(ResponseTxt);

        if not RootObj.ReadFrom(ResponseTxt) then
            Error('Invalid JSON returned from ETIMS');

        StatusCode := _ETIMSHelperFunctions.GetJsonIntRequired(RootObj, 'statusCode');
        Success := _ETIMSHelperFunctions.GetJsonBoolRequired(RootObj, 'success');

        if (not Success) or (StatusCode <> 200) then begin
            ErrorTxt := _ETIMSHelperFunctions.GetJsonTextNullable(RootObj, 'error'); // returns '' for missing/null
            if ErrorTxt <> '' then
                Error(ErrorTxt);
            Error(StrSubstNo('ETIMS returned an error. statusCode=%1, success=%2', StatusCode, Success));
        end;

        ResultTxt := _ETIMSHelperFunctions.GetJsonTextNullable(RootObj, 'result'); // e.g. "000: Successful"
        ResultCd := '';
        ColonPos := StrPos(ResultTxt, ':');

        if ColonPos > 1 then
            ResultCd := CopyStr(ResultTxt, 1, ColonPos - 1)
        else
            if StrLen(ResultTxt) >= 3 then
                ResultCd := CopyStr(ResultTxt, 1, 3);

        if ResultCd <> '000' then begin
            if ResultTxt <> '' then
                Error(ResultTxt);
            Error('ETIMS returned an error');
        end;
    end;

    procedure saveGlAccounts(AccountNo: Text): Text
    var
        token: Text;
        HeaderJsonObject: JsonObject;
        LinesJsonObject: JsonObject;
        LinesJsonArray: JsonArray;
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLines: Record "Sales Invoice Line";
    begin
        glAccount.Reset();
        //create Sales header Json
        token := GetEtimsToken();
        company.Get();
        glAccount.SetRange("No.", AccountNo); //(No, '=%1', false);
        if glAccount.FindSet() then
            repeat
                HeaderJsonObject.Add('BranchId', company."Branch ID");
                HeaderJsonObject.Add('itemCd', glAccount."Etims Item Code");
                HeaderJsonObject.Add('itemClsCd', glAccount."Item Class");
                HeaderJsonObject.Add('itemTyCd', glAccount."Service Type");
                HeaderJsonObject.Add('itemNm', glAccount.Name);
                HeaderJsonObject.Add('orgnNatCd', glAccount."Country of Origin");
                HeaderJsonObject.Add('pkgUnitCd', glAccount."Packaging Unit Code");
                HeaderJsonObject.Add('qtyUnitCd', glAccount."Quantity Unit Code");
                HeaderJsonObject.Add('taxTyCd', glAccount."Tax Type");
                HeaderJsonObject.Add('btchNo', '');
                HeaderJsonObject.Add('bcd', '');
                HeaderJsonObject.Add('dftPrc', 1);
                HeaderJsonObject.Add('useYn', 'Y');
                HeaderJsonObject.Add('CreatedBy', 'David.Mu');
                HeaderJsonObject.Add('CreatedByName', 'David.Mukuria');
                //users.Reset();
                // users.SetRange("User Security ID", 'David.');
                // if users.FindFirst() then begin
                //     HeaderJsonObject.Add('regrId', users."User Name");
                //     HeaderJsonObject.Add('regrNm', users."Full Name");
                //     HeaderJsonObject.Add('modrNm', users."Full Name");
                //     HeaderJsonObject.Add('modrId', users."User Name");
                // end;
                Clear(RequestMessage);
                Clear(RequestHeaders);
                Clear(ContentHeaders);
                Clear(Response);
                RequestMessage.SetRequestUri(testMiddlewareUrl + 'saveItems');
                RequestMessage.Method('POST');
                RequestMessage.GetHeaders(RequestHeaders);
                RequestHeaders.Add('Authorization', 'Bearer ' + token);
                HttpContent.WriteFrom(Format(HeaderJsonObject));
                HttpContent.GetHeaders(ContentHeaders);
                ContentHeaders.Remove('Content-Type');
                ContentHeaders.Add('Content-Type', 'application/json');
                HttpContent.GetHeaders(ContentHeaders);
                RequestMessage.Content(HttpContent);
                if HttpClient.Send(RequestMessage, ResponseMessage) then begin
                    ResponseMessage.Content.ReadAs(Response);
                    if ResponseMessage.IsSuccessStatusCode then begin
                        JsonBuffer.ReadFromText(Response);
                        Response := convertToJson(Response);
                        if jsonResponse.ReadFrom(Response) then begin
                            if Response.Contains('000') then begin
                                glAccount."Posted to Etims" := true;
                                glAccount.Modify();
                                Message('Gl Account Successfully Posted to Etims');
                            end
                            else begin
                                Error('Item was not successfully posted');
                            end;
                        end;
                        //exit(Response);
                    end else begin
                        Message('Request failed!: %1', Response);
                    end;
                end;
            until glAccount.Next() = 0;
    end;

    procedure saveGlAccounts(): Text
    var
        token: Text;
        HeaderJsonObject: JsonObject;
        LinesJsonObject: JsonObject;
        LinesJsonArray: JsonArray;
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLines: Record "Sales Invoice Line";
    begin
        glAccount.Reset();
        //create Sales header Json
        token := GetEtimsToken();
        company.Get();
        glAccount.SetFilter("Posted to Etims", '=%1', false);
        if glAccount.FindSet() then
            repeat
                HeaderJsonObject.Add('tin', company."Company Tin");
                HeaderJsonObject.Add('bhfIds', company."Branch ID");
                HeaderJsonObject.Add('itemClsCd', glAccount."Item Class");
                HeaderJsonObject.Add('itemCd', glAccount."Etims Item Code");
                HeaderJsonObject.Add('itemNm', glAccount.Name);
                HeaderJsonObject.Add('itemStdNm', '');
                HeaderJsonObject.Add('orgnNatCd', glAccount."Country of Origin");
                HeaderJsonObject.Add('qtyUnitCd', glAccount."Quantity Unit Code");
                HeaderJsonObject.Add('taxTyCd', glAccount."Tax Type");
                HeaderJsonObject.Add('btchNo', '');
                HeaderJsonObject.Add('bcd', '');
                HeaderJsonObject.Add('dftPrc', 0);
                HeaderJsonObject.Add('grpPrcL1', '');
                HeaderJsonObject.Add('grpPrcL2', '');
                HeaderJsonObject.Add('grpPrcL3', '');
                HeaderJsonObject.Add('grpPrcL4', '');
                HeaderJsonObject.Add('grpPrcL5', '');
                HeaderJsonObject.Add('addInfo', '');
                HeaderJsonObject.Add('sftyQty', '');
                HeaderJsonObject.Add('isrcAplcbYn', 'Y');
                users.Reset();
                users.SetRange("User Security ID", glAccount.SystemCreatedBy);
                if users.FindFirst() then begin
                    HeaderJsonObject.Add('regrId', users."User Name");
                    HeaderJsonObject.Add('regrNm', users."Full Name");
                    HeaderJsonObject.Add('modrNm', users."Full Name");
                    HeaderJsonObject.Add('modrId', users."User Name");
                end;
                HeaderJsonObject.Add('useYn', 'Y');

                Clear(RequestMessage);
                Clear(RequestHeaders);
                Clear(ContentHeaders);
                Clear(Response);
                RequestMessage.SetRequestUri(getURL + 'saveItems');
                RequestMessage.Method('POST');
                RequestMessage.GetHeaders(RequestHeaders);
                RequestHeaders.Add('Authorization', 'Bearer ' + token);
                HttpContent.WriteFrom(Format(HeaderJsonObject));
                HttpContent.GetHeaders(ContentHeaders);
                ContentHeaders.Remove('Content-Type');
                ContentHeaders.Add('Content-Type', 'application/json');
                HttpContent.GetHeaders(ContentHeaders);
                RequestMessage.Content(HttpContent);

                if HttpClient.Send(RequestMessage, ResponseMessage) then begin
                    ResponseMessage.Content.ReadAs(Response);
                    if ResponseMessage.IsSuccessStatusCode then begin
                        JsonBuffer.ReadFromText(Response);
                        Response := convertToJson(Response);
                        if jsonResponse.ReadFrom(Response) then
                            if Response.Contains('000') then begin
                                glAccount."Posted to Etims" := true;
                                glAccount.Modify();
                            end;
                        //exit(Response);
                    end else begin
                        Message('Request failed!: %1', Response);
                    end;
                end;

            until glAccount.Next() = 0;
    end;

    procedure SaveBulkItems(): Text
    var
        Token: Text;
        ItemRec: Record Item;
        OkCount: Integer;
        FailCount: Integer;
        PayloadTxt: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
    begin
        OkCount := 0;
        FailCount := 0;
        ItemRec.Reset();
        ItemRec.SetRange("Posted to Etims", false);
        if ItemRec.FindSet() then
            repeat
                Clear(PayloadTxt);
                Clear(ResponseTxt);
                Clear(ErrTxt);
                HttpStatus := 0;

                BuildSaveItemPayload(ItemRec, PayloadTxt);

                SendETIMSRequest('Item/SaveItem', Token, PayloadTxt, HttpStatus, ResponseTxt, ErrTxt);

                HandleSaveItemsResponse(ResponseTxt, ItemRec);

            until ItemRec.Next() = 0;

        exit(StrSubstNo('SaveItems completed. Success=%1, Failed=%2', OkCount, FailCount));
    end;

    procedure SaveSingleItem(no: code[50]): Text
    var
        Token: Text;
        ItemRec: Record Item;
        OkCount: Integer;
        FailCount: Integer;
        PayloadTxt: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
    begin
        OkCount := 0;
        FailCount := 0;

        Token := GetEtimsToken();
        Company.Get();

        ItemRec.Get(no);
        if (ItemRec."Posted to Etims" = true) then
            Error('Item already posted to ETIMS');
        Clear(PayloadTxt);
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        BuildSaveItemPayload(ItemRec, PayloadTxt);

        SendETIMSRequest('Item/SaveItem', Token, PayloadTxt, HttpStatus, ResponseTxt, ErrTxt);

        HandleSaveItemsResponse(ResponseTxt, ItemRec);

        exit(StrSubstNo('SaveItems completed. Success=%1, Failed=%2', OkCount, FailCount));
    end;

    local procedure BuildSaveItemPayload(var ItemRec: Record Item; var PayloadTxt: Text)
    var
        J: JsonObject;
    begin
        Clear(J);

        Company.Get();

        J.Add('businessId', Company.Name); // change if your API expects tin instead
        J.Add('itemCode', ItemRec."Etims Item Code");
        J.Add('itemClassificationCode', ItemRec."Item Class");
        J.Add('itemTypeCode', ItemRec."Service Type"); // adjust if you have a dedicated type field/code
        J.Add('itemName', ItemRec.Description);
        J.Add('itemStandardName', ItemRec.Description);
        J.Add('originCode', ItemRec."Country of Origin");
        J.Add('packagingUnitCode', ItemRec."Packaging Unit code");
        J.Add('quantityUnitCode', ItemRec."Quantity Unit Code");
        J.Add('taxationTypeCode', ItemRec."Tax Type");
        J.Add('batchNumber', '');
        J.Add('barCode', '');
        J.Add('defaultPrice', 0);
        J.Add('groupPrice1', 0);
        J.Add('groupPrice2', 0);
        J.Add('groupPrice3', 0);
        J.Add('groupPrice4', 0);
        J.Add('groupPrice5', 0);
        J.Add('additionalInfo', '');
        J.Add('safetyQuantity', 0);
        J.Add('insuranceApplicable', 'Y');
        J.Add('usedUnused', 'Y');

        AddRegistrarFields(ItemRec, J);

        PayloadTxt := Format(J);
    end;

    local procedure AddRegistrarFields(var ItemRec: Record Item; var J: JsonObject)
    var
        Users: Record User;
        CreatedByGuid: Guid;
    begin
        CreatedByGuid := ItemRec.SystemCreatedBy;

        Users.Reset();
        Users.SetRange("User Security ID", CreatedByGuid);
        if Users.FindFirst() then begin
            J.Add('regId', Users."User Name");
            J.Add('regName', Users."Full Name");
            J.Add('modifierId', Users."User Name");
            J.Add('modifierName', Users."Full Name");
        end else begin
            J.Add('regId', '');
            J.Add('regName', '');
            J.Add('modifierId', '');
            J.Add('modifierName', '');
        end;
    end;

    local procedure SendETIMSRequest(Endpoint: Text; Token: Text; PayloadTxt: Text; var HttpStatus: Integer; var ResponseTxt: Text; var ErrTxt: Text)
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        ReqHeaders: HttpHeaders;
        ContentHeaders: HttpHeaders;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        Request.SetRequestUri(GetURL + Endpoint);
        Request.Method('POST');

        Request.GetHeaders(ReqHeaders);
        // ReqHeaders.Add('Authorization', 'Bearer ' + Token);

        Content.WriteFrom(PayloadTxt);
        Content.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        Request.Content(Content);

        if not Client.Send(Request, Response) then begin
            ErrTxt := 'EtimsDown: HTTP send failed.';
            exit;
        end;

        HttpStatus := Response.HttpStatusCode();
        Response.Content.ReadAs(ResponseTxt);

        if not Response.IsSuccessStatusCode() then
            ErrTxt := StrSubstNo('HTTP %1: %2', HttpStatus, ResponseTxt);
    end;

    local procedure SendETIMSGetRequest(Endpoint: Text; Token: Text; BusinessId: Text; var HttpStatus: Integer; var ResponseTxt: Text; var ErrTxt: Text)
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        ReqHeaders: HttpHeaders;
        FullUrl: Text;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        // Build URL with query parameter
        FullUrl := GetURL + Endpoint + '?businessId=' + BusinessId;

        Request.SetRequestUri(FullUrl);
        Request.Method('GET');

        // Add Authorization Header
        Request.GetHeaders(ReqHeaders);
        // ReqHeaders.Add('Authorization', 'Bearer ' + Token);
        ReqHeaders.Add('Accept', 'application/json');

        if not Client.Send(Request, Response) then begin
            ErrTxt := 'EtimsDown: HTTP GET send failed.';
            exit;
        end;

        HttpStatus := Response.HttpStatusCode();
        Response.Content.ReadAs(ResponseTxt);

        if not Response.IsSuccessStatusCode() then
            ErrTxt := StrSubstNo('HTTP %1: %2', HttpStatus, ResponseTxt);
    end;


    local procedure HandleSaveItemsResponse(ResponseText: Text; var ItemRec: Record Item): Text
    var
        RootObj: JsonObject;
        JsonTok: JsonToken;
        StatusCode: Integer;
        Success: Boolean;
        ErrorTxt: Text;
        ResultTxt: Text;
        ResultCd: Text;
        ColonPos: Integer;
    begin
        if not RootObj.ReadFrom(ResponseText) then
            Error('Invalid JSON returned from ETIMS');

        // ===== Validate API Envelope =====
        // Expected:
        // { "statusCode": 200, "success": true, "error": null, "result": "000: Successful" }

        if RootObj.Get('statusCode', JsonTok) then
            StatusCode := JsonTok.AsValue().AsInteger()
        else
            Error('Missing statusCode in response');

        if RootObj.Get('success', JsonTok) then
            Success := JsonTok.AsValue().AsBoolean()
        else
            Error('Missing success in response');

        if (not Success) or (StatusCode <> 200) then begin
            if RootObj.Get('error', JsonTok) then
                ErrorTxt := JsonTok.AsValue().AsText()
            else
                ErrorTxt := '';
            if ErrorTxt <> '' then
                Error(ErrorTxt);

            Error('ETIMS returned an error');
        end;

        // ===== Validate Result Code inside "result" =====
        // result example: "000: Successful"
        if RootObj.Get('result', JsonTok) then
            ResultTxt := JsonTok.AsValue().AsText()
        else
            ResultTxt := '';
        ResultCd := '';
        ColonPos := StrPos(ResultTxt, ':');
        if ColonPos > 1 then
            ResultCd := CopyStr(ResultTxt, 1, ColonPos - 1)
        else
            if StrLen(ResultTxt) >= 3 then
                ResultCd := CopyStr(ResultTxt, 1, 3);

        if ResultCd <> '000' then begin
            if ResultTxt <> '' then
                Error(ResultTxt);
            Error('ETIMS returned an error');
        end;

        // ===== Update Item =====
        ItemRec."Posted to Etims" := true;
        ItemRec.Modify(true);

        Message('Item posted to ETIMS successfully');
    end;
    // =====================================================
    // SaveSingleStockMaster – same design as SaveSingleItem
    // Endpoint + Payload match your expected format
    // Response handling uses the SAME envelope you used:
    // { "statusCode": 200, "success": true, "error": null, "result": "000: Successful" }
    // =====================================================

    procedure SaveItemStockMaster(ItemNo: Code[50]): Text
    var
        Token: Text;
        ItemRec: Record Item;
        PayloadTxt: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
    begin
        Token := GetEtimsToken();
        Company.Get();

        if not ItemRec.Get(ItemNo) then
            Error('Item %1 not found.', ItemNo);

        // Optional: ensure ETIMS item code exists
        if ItemRec."Etims Item Code" = '' then
            Error('ETIMS Item Code is missing for item %1.', ItemRec."No.");

        Clear(PayloadTxt);
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        BuildSaveStockMasterPayload(ItemRec, PayloadTxt);

        SendETIMSRequest('Stock/SaveStockMaster', Token, PayloadTxt, HttpStatus, ResponseTxt, ErrTxt);

        if ErrTxt <> '' then
            Error(ErrTxt);

        HandleSaveStockMasterResponse(ResponseTxt, ItemRec);

        exit('SaveStockMaster completed successfully.');
    end;


    // =====================================================
    // Build payload
    // Expected payload:
    // {
    //   "businessId": "Test",
    //   "itemCode": "KE3OUNO0000065",
    //   "remainQuantity": 150,
    //   "registrationId": "Test ID",
    //   "registrationName": "Test Name",
    //   "modifierId": "Test Modifier ID",
    //   "modifierName": "Test Modifier Name"
    // }
    // =====================================================
    local procedure BuildSaveStockMasterPayload(var ItemRec: Record Item; var PayloadTxt: Text)
    var
        J: JsonObject;
    begin
        Clear(J);
        Company.Get();

        // If your API expects TIN instead, swap Company.Name -> Company."Company Tin"
        J.Add('businessId', Company.Name);
        J.Add('itemCode', ItemRec."Etims Item Code");
        J.Add('remainQuantity', ItemRec.Inventory);

        AddStockMasterRegistrarFields(ItemRec, J);

        // IMPORTANT: JsonObject -> Text (don’t use Format(J) if you want guaranteed JSON text)
        J.WriteTo(PayloadTxt);
    end;


    // =====================================================
    // Registrar fields for StockMaster
    // Uses same "SystemCreatedBy" approach as your item saver
    // =====================================================
    local procedure AddStockMasterRegistrarFields(var ItemRec: Record Item; var J: JsonObject)
    var
        Users: Record User;
        CreatedByGuid: Guid;
    begin
        CreatedByGuid := ItemRec.SystemCreatedBy;

        Users.Reset();
        Users.SetRange("User Security ID", CreatedByGuid);
        if Users.FindFirst() then begin
            J.Add('registrationId', Users."User Name");
            J.Add('registrationName', Users."Full Name");
            J.Add('modifierId', Users."User Name");
            J.Add('modifierName', Users."Full Name");
        end else begin
            J.Add('registrationId', '');
            J.Add('registrationName', '');
            J.Add('modifierId', '');
            J.Add('modifierName', '');
        end;
    end;


    // =====================================================
    // Same response design as HandleSaveItemsResponse
    // Envelope expected:
    // { "statusCode": 200, "success": true, "error": null, "result": "000: Successful" }
    // =====================================================
    local procedure HandleSaveStockMasterResponse(ResponseText: Text; var ItemRec: Record Item)
    var
        RootObj: JsonObject;
        JsonTok: JsonToken;
        StatusCode: Integer;
        Success: Boolean;
        ErrorTxt: Text;
        ResultTxt: Text;
        ResultCd: Text;
        ColonPos: Integer;
    begin
        if not RootObj.ReadFrom(ResponseText) then
            Error('Invalid JSON returned from ETIMS');

        if RootObj.Get('statusCode', JsonTok) then
            StatusCode := JsonTok.AsValue().AsInteger()
        else
            Error('Missing statusCode in response');

        if RootObj.Get('success', JsonTok) then
            Success := JsonTok.AsValue().AsBoolean()
        else
            Error('Missing success in response');

        if (not Success) or (StatusCode <> 200) then begin
            if RootObj.Get('error', JsonTok) then
                ErrorTxt := JsonTok.AsValue().AsText()
            else
                ErrorTxt := '';

            if ErrorTxt <> '' then
                Error(ErrorTxt);

            Error('ETIMS returned an error');
        end;

        if RootObj.Get('result', JsonTok) then
            ResultTxt := JsonTok.AsValue().AsText()
        else
            ResultTxt := '';

        ResultCd := '';
        ColonPos := StrPos(ResultTxt, ':');
        if ColonPos > 1 then
            ResultCd := CopyStr(ResultTxt, 1, ColonPos - 1)
        else
            if StrLen(ResultTxt) >= 3 then
                ResultCd := CopyStr(ResultTxt, 1, 3);

        if ResultCd <> '000' then begin
            if ResultTxt <> '' then
                Error(ResultTxt);
            Error('ETIMS returned an error');
        end;

        // Optional: mark something on item to show stock master synced
        // Add a boolean field like "Stock Master Posted to Etims" if you want.
        // ItemRec."Stock Master Posted to Etims" := true;
        // ItemRec.Modify(true);

        Message('StockMaster saved to ETIMS successfully.');
    end;


    procedure GetEtimsToken(): Text
    begin
        Clear(RequestMessage);
        Clear(RequestHeaders);
        Clear(ContentHeaders);
        Clear(Response);
        RequestMessage.SetRequestUri(testMiddlewareUrl + 'token');
        RequestMessage.Method('POST');
        RequestMessage.GetHeaders(RequestHeaders);
        company.Get();
        //if getURL().Contains('EtimsDataTest') then
        HttpContent.WriteFrom('{"ClientId":"T005001","ClientSecret":"Yrt36g%hn9"}');
        /*  else begin
             ContentHeaders.Add('ClientId', '' + company.ClientID + '');
             ContentHeaders.Add('ClientSecret', '' + company.ClientSecret + '');
         end; */
        HttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HttpContent.GetHeaders(ContentHeaders);
        RequestMessage.Content(HttpContent);
        // Message('Start Sending');
        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            // Message('Start Sending 2');
            ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode then begin
                //Message('Start Sending 3');
                // Message(Response);
                JsonBuffer.ReadFromText(Response);
                Response := convertToJson(Response);
                if jsonResponse.ReadFrom(Response) then begin
                    // Message('Start Sending 3');
                    jsonResponse.Get('Token', jsonTokenValue);
                    Response := jsonTokenValue.AsValue().AsText();
                end;
                exit(Response);
            end else begin
                Message('Request failed!: %1', Response);
            end;
        end;
    end;
    // procedure updatePostedSales(Num: Text; SCUID: Text; CUInvoiceNumber: Text; InternalData: Text; ReceiptSignature: Text; Month: Integer; Year: Integer; Day: Integer; Times: Text): Text
    // var
    //     SalesInvHeader, salesINV : Record "Sales Invoice Header";
    //     CompInfo: Record "Company Information";
    //     myTime: Time;
    // begin
    //     if salesINV.Get(Num) then begin
    //         if salesINV."SCU ID" = '' then begin
    //             CompInfo.Get();
    //             salesINV."SCU ID" := SCUID;
    //             salesINV.EtimsDate := DMY2Date(Day, Month, Year);
    //             salesINV."CU Invoice Number" := CUInvoiceNumber;
    //             Evaluate(myTime, Times);
    //             salesINV.EtimsTime := myTime;
    //             salesINV."Internal Data" := InternalData;
    //             salesINV."Receipt Signature" := ReceiptSignature;
    //             salesINV.QRCodeUrl := 'https://etims.kra.go.ke/common/link/etims/receipt/indexEtimsReceiptData?Data=' + CompInfo."Company Tin" + CompInfo."Branch ID" + ReceiptSignature;
    //             salesINV.Modify();
    //         end;
    //     end;
    // end;
    // procedure pushSalesInvoices(DocumentNo: Text): Text
    //     var
    //         token: Text;
    //         HeaderJsonObject: JsonObject;
    //         LinesJsonObject: JsonObject;
    //         LinesJsonArray: JsonArray;
    //         SalesInvHeader, salesINV : Record "Sales Invoice Header";
    //         SalesInvLines: Record "Sales Invoice Line";
    //         startingDay: Date;
    //         saledate: Text;
    //         currency: Text;
    //         rtnMessageArray: JsonArray;
    //         rtnMessageToken: JsonToken;
    //         rtnMessageObject: JsonObject;
    //         rtnToken: JsonToken;
    //         invoceNum: Text;
    //         intrlData: Text;
    //         rcptSign: Text;
    //         sdcId: Text;
    //         CUInvoiceNo: Text;
    //         QRCodeUrl: Text;
    //         dateT: DateTime;
    //         Month: Integer;
    //         Year: Integer;
    //         Day: Integer;
    //         TheTime: Time;
    //         TheTime2: Time;
    //         myTime: Time;
    //         mystring: Text;
    //         mydateTime: DateTime;
    //         CompInfo: Record "Company Information";
    //         //eTimsPushCredit: Record eTimsPushCredit;
    //         getEndDate: DateTime;
    //         getStartDate: DateTime;
    //     begin
    //         company.Get();
    //         //create Sales header Json
    //         token := GetEtimsToken();
    //         Evaluate(TheTime, '235959');
    //         Evaluate(TheTime2, '000001');
    //         getStartDate := CreateDateTime(Today, TheTime2);
    //         getEndDate := CreateDateTime(Today, TheTime);
    //         SalesInvHeader.Reset();
    //         // SalesInvHeader.SetRange("Posted to Etims", false);
    //         SalesInvHeader.SetRange("No.", DocumentNo); //(No, '>=%1&<=%2', getStartDate, getEndDate);
    //         if SalesInvHeader.FindSet() then
    //             repeat // SalesInvHeader."Posted to Etims" := true;
    //                 // SalesInvHeader.Modify();
    //                 Clear(HeaderJsonObject);
    //                 Clear(LinesJsonArray);
    //                 HeaderJsonObject.Add('tin', 'A123456789Z');
    //                 HeaderJsonObject.Add('BranchId', '00');
    //                 HeaderJsonObject.Add('DocumentType', 'Sales');
    //                 HeaderJsonObject.Add('InvoiceNo', SalesInvHeader."No.");
    //                 //HeaderJsonObject.Add('ETimsInvoiceNo', getSalesInvoiceNum(SalesInvHeader."No."));
    //                 customer.Reset();
    //                 if customer.Get(SalesInvHeader."Bill-to Customer No.") then begin
    //                     HeaderJsonObject.Add('CustPIN', customer."VAT Registration No.");
    //                     HeaderJsonObject.Add('CustName', customer.Name);
    //                     HeaderJsonObject.Add('CustBranchId', '00');
    //                 end;
    //                 saledate := FORMAT(SalesInvHeader."Document Date", 0, '<Year4>-<Month,2>-<Day,2>');
    //                 HeaderJsonObject.Add('SaleDate', saledate);
    //                 HeaderJsonObject.Add('PostStockMovement', 'N');
    //                 if SalesInvHeader."Currency Code" = '' then
    //                     currency := 'KES'
    //                 else
    //                     currency := SalesInvHeader."Currency Code";
    //                 HeaderJsonObject.Add('CurrencyCode', currency);
    //                 //breaks
    //                 HeaderJsonObject.Add('ExchangeRate', Round(getcurrencyDetails(currency), 0.01));
    //                 HeaderJsonObject.Add('RefInvoiceNo', 0);
    //                 HeaderJsonObject.Add('CreditNoteReason', '');
    //                 // users.Reset();
    //                 // users.SetRange("User Security ID", SalesInvHeader.SystemCreatedBy);
    //                 // if users.FindFirst() then begin
    //                 //     
    //                 // end;
    //                 HeaderJsonObject.Add('CreatedBy', 'David.Mu');
    //                 HeaderJsonObject.Add('CreatedByName', 'David.Mu');
    //                 //Create Lines
    //                 SalesInvLines.Reset();
    //                 SalesInvLines.SetRange("Document No.", SalesInvHeader."No.");
    //                 if SalesInvLines.FindSet() then
    //                     repeat
    //                         Clear(LinesJsonObject);
    //                         glAccount.Reset();
    //                         // if glAccount.Get(SalesInvLines."No.") then begin
    //                         LinesJsonObject.Add('ItemCode', 'KE1NTU0000002');
    //                         LinesJsonObject.Add('ItemClassCode', '99011035');
    //                         LinesJsonObject.Add('ItemName', SalesInvLines.Description);
    //                         LinesJsonObject.Add('ItemTypeCode', '1');
    //                         LinesJsonObject.Add('PackagingUnitCode', 'NT');
    //                         LinesJsonObject.Add('QuantityUnitCode', 'U');
    //                         LinesJsonObject.Add('Quantity', Round(SalesInvLines.Quantity, 0.01));
    //                         LinesJsonObject.Add('UnitPriceExcl', Round((SalesInvLines."Line Amount" / SalesInvLines.Quantity), 0.01));
    //                         LinesJsonObject.Add('TaxRate', '16');
    //                         LinesJsonObject.Add('TaxationTypeCode', 'B');
    //                         LinesJsonObject.Add('DiscountRate', SalesInvLines."Line Discount %");
    //                         LinesJsonObject.Add('DiscountAmount', Round(SalesInvLines."Line Discount Amount", 0.01));
    //                         LinesJsonArray.Add(LinesJsonObject);
    //                     // end;
    //                     until SalesInvLines.Next() = 0;
    //                 HeaderJsonObject.Add('itemList', LinesJsonArray);
    //                 //send Request to eTims
    //                 Clear(RequestMessage);
    //                 Clear(RequestHeaders);
    //                 Clear(ContentHeaders);
    //                 Clear(Response);
    //                 RequestMessage.SetRequestUri(testUrl + 'saveSales');
    //                 RequestMessage.Method('POST');
    //                 RequestMessage.GetHeaders(RequestHeaders);
    //                 RequestHeaders.Add('Authorization', 'Bearer ' + token);
    //                 RequestMessage.GetHeaders(RequestHeaders);
    //                 HttpContent.WriteFrom(Format(HeaderJsonObject));
    //                 // Message(Format(HeaderJsonObject));
    //                 HttpContent.GetHeaders(ContentHeaders);
    //                 ContentHeaders.Remove('Content-Type');
    //                 ContentHeaders.Add('Content-Type', 'application/json');
    //                 HttpContent.GetHeaders(ContentHeaders);
    //                 RequestMessage.Content(HttpContent);
    //                 //HttpClient.Timeout(300000);
    //                 if HttpClient.Send(RequestMessage, ResponseMessage) then begin
    //                     ResponseMessage.Content.ReadAs(Response);
    //                     //Message(Response);
    //                     if ResponseMessage.IsSuccessStatusCode then begin
    //                         JsonBuffer.ReadFromText(Response);
    //                         Response := convertToJson(Response);
    //                         //save response
    //                         // eTimsPushCredit.Reset();
    //                         // eTimsPushCredit.Init();
    //                         // eTimsPushCredit.Code := SalesInvHeader."No.";
    //                         // eTimsPushCredit.DocumentNo := SalesInvHeader."No." + '_S';
    //                         // // eTimsPushCredit.Json := Response;
    //                         // eTimsPushCredit.Status := eTimsPushCredit.Status::Success;
    //                         // eTimsPushCredit.Insert();
    //                         if jsonResponse.ReadFrom(Response) then begin
    //                             if Response.Contains('9020') then begin
    //                                 SalesInvHeader."Posted to Etims" := false;
    //                                 SalesInvHeader.Modify();
    //                             end
    //                             else begin
    //                                 jsonResponse.Get('data', jsonTokenValue);
    //                                 rtnMessageObject := jsonTokenValue.AsObject();
    //                                 //rtnMessageObject.Get('rcptNo', rtnToken);
    //                                 //rcptNo := rtnToken.AsValue().AsText();
    //                                 rtnMessageObject.Get('intrlData', rtnToken);
    //                                 intrlData := rtnToken.AsValue().AsText();
    //                                 rtnMessageObject.Get('rcptSign', rtnToken);
    //                                 rcptSign := rtnToken.AsValue().AsText();
    //                                 rtnMessageObject.Get('ReceiptDateTime', rtnToken);
    //                                 mystring := rtnToken.AsValue().AsText();
    //                                 //2024-03-22 14:39:34
    //                                 Evaluate(Day, CopyStr(mystring, 9, 2));
    //                                 Evaluate(Month, CopyStr(mystring, 6, 2));
    //                                 Evaluate(Year, CopyStr(mystring, 1, 4));
    //                                 Evaluate(TheTime, CopyStr(mystring, 12, 2) + CopyStr(mystring, 15, 2) + CopyStr(mystring, 17, 1) + '00');
    //                                 mydateTime := CreateDateTime(DMY2Date(Day, Month, Year), TheTime);
    //                                 rtnMessageObject.Get('sdcId', rtnToken);
    //                                 sdcId := rtnToken.AsValue().AsText();
    //                                 rtnMessageObject.Get('CUInvoiceNo', rtnToken);
    //                                 CUInvoiceNo := rtnToken.AsValue().AsText();
    //                                 rtnMessageObject.Get('QRCodeUrl', rtnToken);
    //                                 QRCodeUrl := rtnToken.AsValue().AsText();
    //                                 updateInvoiceReport(SalesInvHeader."No.", intrlData, rcptSign, sdcId, CUInvoiceNo, QRCodeUrl, mydateTime);
    //                             end;
    //                         end;
    //                     end
    //                     else begin
    //                         SalesInvHeader."Posted to Etims" := false;
    //                         SalesInvHeader.Modify();
    //                         //save response
    //                         // eTimsPushCredit.Reset();
    //                         // eTimsPushCredit.Init();
    //                         // eTimsPushCredit.DocumentNo := SalesInvHeader."No." + '_F';
    //                         // eTimsPushCredit.Code := SalesInvHeader."No.";
    //                         // eTimsPushCredit.Status := eTimsPushCredit.Status::Fail;
    //                         // eTimsPushCredit.Insert();
    //                     end;
    //                 end;
    //             until SalesInvHeader.Next() = 0;
    //     end;
    // procedure selectCodes(): Text
    // var
    //     token: Text;
    //     returnMsgArray: JsonArray;
    //     returnMsgToken: JsonToken;
    //     returnMsgObject: JsonObject;
    //     banksArray: JsonArray;
    //     banksToken: JsonToken;
    //     banksObject: JsonObject;
    //     localeArray: JsonArray;
    //     localeToken: JsonToken;
    //     localeObject: JsonObject;
    //     cd: Text;
    //     cdNm: Text;
    //     useYn: Text;
    //     srtOrd: Integer;
    //     cdDesc: Text;
    //     yn: Integer;
    //     rtnToken: JsonToken;
    // begin
    //     Clear(token);
    //     token := GetEtimsToken;
    //     Clear(RequestMessage);
    //     Clear(RequestHeaders);
    //     Clear(ContentHeaders);
    //     Clear(Response);
    //     RequestMessage.SetRequestUri(getURL + 'selectCodes');
    //     RequestMessage.Method('POST');
    //     RequestMessage.GetHeaders(RequestHeaders);
    //     RequestHeaders.Add('Authorization', 'Bearer ' + token);
    //     HttpContent.WriteFrom(RequestData());
    //     HttpContent.GetHeaders(ContentHeaders);
    //     ContentHeaders.Remove('Content-Type');
    //     ContentHeaders.Add('Content-Type', 'application/json');
    //     HttpContent.GetHeaders(ContentHeaders);
    //     RequestMessage.Content(HttpContent);
    //     if HttpClient.Send(RequestMessage, ResponseMessage) then begin
    //         ResponseMessage.Content.ReadAs(Response);
    //         if ResponseMessage.IsSuccessStatusCode then begin
    //             JsonBuffer.ReadFromText(Response);
    //             Response := convertToJson(Response);
    //             if jsonResponse.ReadFrom(Response) then begin
    //                 jsonResponse.Get('data', jsonTokenValue);
    //                 jsonTokenValue.AsObject().Get('clsList', jsonTokenValue);
    //                 //convert to array to get positions
    //                 returnMsgArray := jsonTokenValue.AsArray();
    //                 //refund reason
    //                 returnMsgArray.Get(0, returnMsgToken);
    //                 returnMsgArray.Get(1, banksToken);
    //                 returnMsgArray.Get(2, localeToken);
    //                 //refund Reason
    //                 returnMsgToken.AsObject().Get('dtlList', returnMsgToken);
    //                 returnMsgArray := returnMsgToken.AsArray();
    //                 foreach returnMsgToken in returnMsgArray do begin
    //                     returnMsgObject := returnMsgToken.AsObject();
    //                     returnMsgObject.Get('cd', rtnToken);
    //                     cd := rtnToken.AsValue().AsText();
    //                     returnMsgObject.Get('cdNm', rtnToken);
    //                     cdNm := rtnToken.AsValue().AsText();
    //                     returnMsgObject.Get('cdDesc', rtnToken);
    //                     if rtnToken.AsValue().IsNull then
    //                         cdDesc := 'null'
    //                     else
    //                         cdDesc := rtnToken.AsValue().AsText();
    //                     returnMsgObject.Get('srtOrd', rtnToken);
    //                     srtOrd := rtnToken.AsValue().AsInteger();
    //                     returnMsgObject.Get('useYn', rtnToken);
    //                     useYn := rtnToken.AsValue().AsText();
    //                     yn := 2;
    //                     if useYn = 'Y' then yn := 1;
    //                     updateRefundReason(cd, cdNm, cdDesc, srtOrd, yn);
    //                 end;
    //                 //Banks
    //                 banksToken.AsObject().Get('dtlList', banksToken);
    //                 returnMsgArray := banksToken.AsArray();
    //                 foreach banksToken in returnMsgArray do begin
    //                     returnMsgObject := returnMsgToken.AsObject();
    //                     returnMsgObject.Get('cd', rtnToken);
    //                     cd := rtnToken.AsValue().AsText();
    //                     returnMsgObject.Get('cdNm', rtnToken);
    //                     cdNm := rtnToken.AsValue().AsText();
    //                     returnMsgObject.Get('srtOrd', rtnToken);
    //                     srtOrd := rtnToken.AsValue().AsInteger();
    //                     returnMsgObject.Get('useYn', rtnToken);
    //                     useYn := rtnToken.AsValue().AsText();
    //                     yn := 2;
    //                     if useYn = 'Y' then yn := 1;
    //                     updateBanks(cd, cdNm, cdNm, yn, srtOrd);
    //                 end;
    //                 //Locale
    //                 localeToken.AsObject().Get('dtlList', localeToken);
    //                 returnMsgArray := localeToken.AsArray();
    //                 foreach localeToken in returnMsgArray do begin
    //                     returnMsgObject := returnMsgToken.AsObject();
    //                     returnMsgObject.Get('cd', rtnToken);
    //                     cd := rtnToken.AsValue().AsText();
    //                     returnMsgObject.Get('cdNm', rtnToken);
    //                     cdNm := rtnToken.AsValue().AsText();
    //                     returnMsgObject.Get('srtOrd', rtnToken);
    //                     srtOrd := rtnToken.AsValue().AsInteger();
    //                     returnMsgObject.Get('useYn', rtnToken);
    //                     useYn := rtnToken.AsValue().AsText();
    //                     yn := 2;
    //                     if useYn = 'Y' then yn := 1;
    //                     updateLocale(cd, cdNm, cdNm, yn, srtOrd);
    //                 end;
    //             end;
    //             exit('Update successful');
    //             //Page.Run(Page::"JSON Buffer BCG", JsonBuffer);
    //         end else
    //             Message('Request failed!: %1', Response);
    //     end;
    // end;
    // procedure selectItems(): Text
    // var
    //     token: Text;
    //     rtnMessageArray: JsonArray;
    //     rtnMessageToken: JsonToken;
    //     rtnMessageObject: JsonObject;
    //     cd: Text;
    //     cdNm: Text;
    //     rtnToken: JsonToken;
    //     itemClsCd: Text;
    //     itemClsNm: Text;
    //     itemClsLvl: Text;
    //     taxTyCd: Boolean;
    //     taxTyCdText: Text;
    //     mjrTgYn: Boolean;
    //     mjrTgYnText: Text;
    //     useYn: Text;
    //     yn: Integer;
    // begin
    //     Clear(token);
    //     token := GetEtimsToken;
    //     Clear(RequestMessage);
    //     Clear(RequestHeaders);
    //     Clear(ContentHeaders);
    //     Clear(Response);
    //     RequestMessage.SetRequestUri(getURL + 'selectItemsClass');
    //     RequestMessage.Method('POST');
    //     RequestMessage.GetHeaders(RequestHeaders);
    //     RequestHeaders.Add('Authorization', 'Bearer ' + token);
    //     HttpContent.WriteFrom(RequestData());
    //     HttpContent.GetHeaders(ContentHeaders);
    //     ContentHeaders.Remove('Content-Type');
    //     ContentHeaders.Add('Content-Type', 'application/json');
    //     HttpContent.GetHeaders(ContentHeaders);
    //     RequestMessage.Content(HttpContent);
    //     if HttpClient.Send(RequestMessage, ResponseMessage) then begin
    //         ResponseMessage.Content.ReadAs(Response);
    //         if ResponseMessage.IsSuccessStatusCode then begin
    //             JsonBuffer.ReadFromText(Response);
    //             Response := convertToJson(Response);
    //             if jsonResponse.ReadFrom(Response) then begin
    //                 jsonResponse.Get('data', jsonTokenValue);
    //                 jsonTokenValue.AsObject().Get('itemClsList', jsonTokenValue);
    //                 //convert to array to get positions
    //                 rtnMessageArray := jsonTokenValue.AsArray();
    //                 foreach jsonTokenValue in rtnMessageArray do begin
    //                     rtnMessageObject := jsonTokenValue.AsObject();
    //                     rtnMessageObject.Get('itemClsCd', rtnToken);
    //                     itemClsCd := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('itemClsNm', rtnToken);
    //                     itemClsNm := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('itemClsLvl', rtnToken);
    //                     itemClsLvl := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('taxTyCd', rtnToken);
    //                     if rtnToken.AsValue().IsNull() then
    //                         taxTyCdText := 'null'
    //                     else
    //                         taxTyCdText := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('mjrTgYn', rtnToken);
    //                     if rtnToken.AsValue().IsNull() then
    //                         mjrTgYnText := 'null'
    //                     else
    //                         mjrTgYnText := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('useYn', rtnToken);
    //                     useYn := rtnToken.AsValue().AsText();
    //                     yn := 2;
    //                     if useYn = 'Y' then yn := 1;
    //                     updateClass(true, yn, itemClsCd, itemClsLvl, itemClsNm, false, taxTyCdText)
    //                 end;
    //             end;
    //             exit('Update successful');
    //             //Page.Run(Page::"JSON Buffer BCG", JsonBuffer);
    //         end else
    //             Message('Request failed!: %1', Response);
    //     end;
    // end;
    // procedure selectBranches(): Text
    // var
    //     token: Text;
    //     rtnMessageArray: JsonArray;
    //     rtnMessageToken: JsonToken;
    //     rtnMessageObject: JsonObject;
    //     rtnToken: JsonToken;
    //     tin: Text;
    //     bhfId: Text;
    //     bhfNm: Text;
    //     bhfSttsCd: Text;
    //     prvncNm: Text;
    //     dstrtNm: Text;
    //     sctrNm: Text;
    //     locDesc: Boolean;
    //     locDescText: Text;
    //     mgrNm: Text;
    //     mgrTelNo: Text;
    //     mgrEmail: Text;
    //     useYn: Text;
    //     yn: Boolean;
    // begin
    //     Clear(token);
    //     token := GetEtimsToken;
    //     Clear(RequestMessage);
    //     Clear(RequestHeaders);
    //     Clear(ContentHeaders);
    //     Clear(Response);
    //     RequestMessage.SetRequestUri(getURL + 'selectBranches');
    //     RequestMessage.Method('POST');
    //     RequestMessage.GetHeaders(RequestHeaders);
    //     RequestHeaders.Add('Authorization', 'Bearer ' + token);
    //     HttpContent.WriteFrom(RequestData());
    //     HttpContent.GetHeaders(ContentHeaders);
    //     ContentHeaders.Remove('Content-Type');
    //     ContentHeaders.Add('Content-Type', 'application/json');
    //     HttpContent.GetHeaders(ContentHeaders);
    //     RequestMessage.Content(HttpContent);
    //     if HttpClient.Send(RequestMessage, ResponseMessage) then begin
    //         ResponseMessage.Content.ReadAs(Response);
    //         if ResponseMessage.IsSuccessStatusCode then begin
    //             JsonBuffer.ReadFromText(Response);
    //             Response := convertToJson(Response);
    //             if jsonResponse.ReadFrom(Response) then begin
    //                 jsonResponse.Get('data', jsonTokenValue);
    //                 jsonTokenValue.AsObject().Get('bhfList', jsonTokenValue);
    //                 rtnMessageArray := jsonTokenValue.AsArray();
    //                 foreach jsonTokenValue in rtnMessageArray do begin
    //                     rtnMessageObject := jsonTokenValue.AsObject();
    //                     rtnMessageObject.Get('tin', rtnToken);
    //                     tin := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('bhfId', rtnToken);
    //                     bhfId := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('bhfNm', rtnToken);
    //                     bhfNm := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('bhfSttsCd', rtnToken);
    //                     bhfSttsCd := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('prvncNm', rtnToken);
    //                     prvncNm := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('dstrtNm', rtnToken);
    //                     dstrtNm := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('sctrNm', rtnToken);
    //                     sctrNm := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('locDesc', rtnToken);
    //                     if rtnToken.AsValue().IsNull() then
    //                         locDescText := 'null'
    //                     else
    //                         locDescText := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('mgrNm', rtnToken);
    //                     mgrNm := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('mgrTelNo', rtnToken);
    //                     mgrTelNo := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('mgrEmail', rtnToken);
    //                     mgrEmail := rtnToken.AsValue().AsText();
    //                     rtnMessageObject.Get('hqYn', rtnToken);
    //                     useYn := rtnToken.AsValue().AsText();
    //                     yn := false;
    //                     if useYn = 'Y' then yn := true;
    //                     insertBranches(bhfId, bhfNm, bhfSttsCd, yn, mgrEmail, mgrNm, mgrTelNo, locDescText, tin, dstrtNm);
    //                 end;
    //             end;
    //             exit('Update Successful');
    //             //Page.Run(Page::"JSON Buffer BCG", JsonBuffer);
    //         end else
    //             Message('Request failed!: %1', Response);
    //     end;
    // end;
    // procedure synchBranchUser(username: Text) Msg: Boolean
    // begin
    //     Msg := false;
    //     branchUsers.Reset();
    //     branchUsers.SetRange("User Id", username);
    //     if branchUsers.FindFirst() then begin
    //         branchUsers.Synched := true;
    //         if branchUsers.Modify() then
    //             Msg := true;
    //     end;
    // end;
    // procedure updateLocale(code: Text; codeName: Text; codeDesc: Text; useYN: Integer; sortOrder: Integer) Msg: Text
    // begin
    //     locale.Reset();
    //     locale.SetRange(Code, code);
    //     if not locale.FindFirst() then begin
    //         locale.Code := code;
    //         locale.Name := codeName;
    //         locale."Code Description" := codeDesc;
    //         locale.UseYN := useYN;
    //         locale."Sort Order" := sortOrder;
    //         if locale.Insert() then
    //             Msg := 'Success'
    //         else
    //             Msg := 'Fail';
    //     end;
    // end;
    // procedure updateBanks(bankCode: Text; codeName: Text; codeDesc: Text; Useyn: Integer; sortOrder: Integer) Msg: Text
    // begin
    //     banks.Reset();
    //     banks.SetRange(Code, bankCode);
    //     if not banks.FindLast() then begin
    //         banks.Code := bankCode;
    //         banks."Code Name" := codeName;
    //         banks."Code Description" := codeDesc;
    //         banks.UseYN := Useyn;
    //         banks.sortOder := sortOrder;
    //         if banks.Insert() then
    //             Msg := 'Success'
    //         else
    //             Msg := 'Fail';
    //     end;
    // end;
    // procedure getCustomerData(customerNum: Text) Msg: Text
    // begin
    //     customer.Reset();
    //     customer.SetRange("No.", customerNum);
    //     if customer.FindFirst() then begin
    //         Msg := customer.Name + '::' + customer."Branch Code"
    //     end;
    // end;
    // procedure updateClass(freqUsed: Boolean; useYn: Integer; itemClassCode: Text; itemClassLevel: Text; itemClassName: Text; manualEntry: Boolean; taxationTypeCode: Text) Msg: Boolean
    // begin
    //     Msg := false;
    //     itemClass.Init();
    //     itemClass."Frequently Used" := freqUsed;
    //     itemClass."In Use" := useYn;
    //     itemClass."Item Class Code" := itemClassCode;
    //     itemClass."Item Class Level" := itemClassLevel;
    //     itemClass."Item Class Name" := itemClassName;
    //     itemClass."Manual Entry" := manualEntry;
    //     itemClass."Taxation Type Code" := taxationTypeCode;
    //     itemClass.SetRange("Item Class Code", itemClassCode);
    //     itemClass.SetRange("Item Class Level", itemClassLevel);
    //     if not itemClass.FindFirst() then begin
    //         if itemClass.Insert() then
    //             Msg := true;
    //     end else
    //         if itemClass.Modify() then
    //             Msg := true;
    // end;
    // procedure getInitializationInfo() Msg: Text
    // var
    //     evironmentInfo: Codeunit "Environment Information";
    // begin
    //     company.Get();
    //     Msg := company."Company Tin" + '::' +
    //     company."Device Number" + '::' +
    //     company."Branch ID" + '::' +
    //     company.ClientID + '::' +
    //     company.ClientSecret + '::' +
    //     company."BC TenantID" + '::' +
    //     company."BC ClientID" + '::' +
    //     company."BC ClientSecret" + '::' +
    //     Database.CompanyName + '::' +
    //     evironmentInfo.GetEnvironmentName();
    // end;
    // procedure insertBranches(branchId: Code[20]; branchName: Text; statuscode: Text; Hq: Boolean; email: Text; name: Text; phone: Text; taxlocality: Text; tin: Text; district: Text) Msg: Text
    // begin
    //     branch.Reset();
    //     branch.SetRange("Branch Id", branchId);
    //     if not branch.FindFirst() then begin
    //         branch.Init();
    //         branch."Branch Id" := branchId;
    //         branch."Branch Name" := branchName;
    //         branch."Branch Status Code" := statuscode;
    //         branch.Headquater := Hq;
    //         branch."Manager Email" := email;
    //         branch."Manager Name" := name;
    //         branch."Manager Phone" := phone;
    //         branch."Tax Locality" := taxlocality;
    //         branch.Tin := tin;
    //         branch."District Name" := district;
    //         if branch.Insert() then
    //             Msg := 'Success'
    //         else
    //             Msg := 'Fail';
    //     end;
    // end;
    // procedure updateRefundReason(code: Text; codeName: Text; codeDesc: Text; sortOrder: Integer; useYN: Integer) Msg: Text
    // begin
    //     refundreason.Reset();
    //     refundreason.SetRange(Code, code);
    //     if not refundreason.FindFirst() then begin
    //         refundreason.Init();
    //         refundreason.Code := code;
    //         refundreason."Code Name" := codeName;
    //         refundreason."Code Description" := codeDesc;
    //         refundreason."Sort Order" := sortOrder;
    //         refundreason.UseYN := useYN;
    //         if refundreason.Insert() then
    //             Msg := 'Success'
    //         else
    //             Msg := 'Fail';
    //     end;
    // end;
    // procedure updateCustomer(custNum: Text) Msg: Text
    // begin
    //     customer.Reset();
    //     customer.SetRange("No.", custNum);
    //     if customer.FindFirst() then
    //         customer."Posted to Etims" := true;
    // end;
    // procedure insertErrorLogs(docNum: Text; msg: Text)
    // var
    //     ErrLogs: Record "eTims Error Logs";
    // begin
    //     ErrLogs.Reset();
    //     ErrLogs.Init();
    //     ErrLogs.DocNum := docNum;
    //     ErrLogs.Message := msg;
    //     ErrLogs.Date := Today;
    //     ErrLogs.Time := Time;
    //     ErrLogs.Insert();
    // end;
}
