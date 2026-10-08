/// <summary>
/// Shared utility functions for the KRA eTIMS integration: tax-band normalization/rate lookup and accumulation, safe JSON value extraction, date formatting, and HTTP header helpers used by the other ETIMS codeunits.
/// </summary>
codeunit 50110 ETIMSHelperFunctions
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

    procedure NormalizeEtimsTaxBand(RawTaxType: Code[10]): Code[10]
    var
        Band: Text;
    begin
        Band := UpperCase(DelChr(Format(RawTaxType), '=', ' '));

        if (Band = 'A') or (Band = 'B') or (Band = 'C') or (Band = 'D') or (Band = 'E') then
            exit(Band);

        Error('Unsupported Tax Type value "%1". Expected A, B, C, D, or E.', RawTaxType);
    end;

    procedure GetEtimsTaxRate(TaxBand: Code[10]): Decimal
    var
        TaxTypeSetup: Record "eTims-Taxation Type";
    begin
        if TaxBand = '' then
            exit(0);

        if TaxTypeSetup.Get(TaxBand) then
            exit(TaxTypeSetup.Rate);

        Error('Taxation Type Code %1 is not setup in eTims-Taxation Type table (60002).', TaxBand);
    end;

    procedure AccumulateTaxBandTotals(
    TaxBand: Code[10];
    TaxRate: Decimal;
    LineTaxable: Decimal;
    LineTax: Decimal;
    var TaxableA: Decimal; var TaxableB: Decimal; var TaxableC: Decimal; var TaxableD: Decimal; var TaxableE: Decimal;
    var TaxAmtA: Decimal; var TaxAmtB: Decimal; var TaxAmtC: Decimal; var TaxAmtD: Decimal; var TaxAmtE: Decimal;
    var RateA: Decimal; var RateB: Decimal; var RateC: Decimal; var RateD: Decimal; var RateE: Decimal)
    begin
        case TaxBand of
            'A':
                begin
                    RateA := TaxRate;
                    TaxableA += LineTaxable;
                    TaxAmtA += LineTax;
                end;
            'B':
                begin
                    RateB := TaxRate;
                    TaxableB += LineTaxable;
                    TaxAmtB += LineTax;
                end;
            'C':
                begin
                    RateC := TaxRate;
                    TaxableC += LineTaxable;
                    TaxAmtC += LineTax;
                end;
            'D':
                begin
                    RateD := TaxRate;
                    TaxableD += LineTaxable;
                    TaxAmtD += LineTax;
                end;
            'E':
                begin
                    RateE := TaxRate;
                    TaxableE += LineTaxable;
                    TaxAmtE += LineTax;
                end;
            else
                Error('Unsupported Tax Band %1. Expected A–E.', TaxBand);
        end;
    end;

    procedure GetJsonTextRequired(var Obj: JsonObject; FieldName: Text): Text
    var
        Tok: JsonToken;
    begin
        if not Obj.Get(FieldName, Tok) then
            Error(StrSubstNo('Missing %1 in response item', FieldName));

        if Tok.AsValue().IsNull() then
            Error(StrSubstNo('%1 is null in response item', FieldName));

        exit(Tok.AsValue().AsText());
    end;

    procedure GetJsonTextNullable(var Obj: JsonObject; FieldName: Text): Text
    var
        Tok: JsonToken;
    begin
        if not Obj.Get(FieldName, Tok) then
            exit('');

        if Tok.AsValue().IsNull() then
            exit('');

        exit(Tok.AsValue().AsText());
    end;

    procedure GetJsonBoolRequired(var Obj: JsonObject; FieldName: Text): Boolean
    var
        Tok: JsonToken;
    begin
        if not Obj.Get(FieldName, Tok) then
            Error(StrSubstNo('Missing %1 in response', FieldName));
        exit(Tok.AsValue().AsBoolean());
    end;

    procedure GetJsonIntRequired(var Obj: JsonObject; FieldName: Text): Integer
    var
        Tok: JsonToken;
    begin
        if not Obj.Get(FieldName, Tok) then
            Error(StrSubstNo('Missing %1 in response', FieldName));
        exit(Tok.AsValue().AsInteger());
    end;

    procedure FormatETIMSDate(DT: DateTime): Text
    begin
        exit(Format(DT, 0, '<Year4><Month,2><Day,2><Hour,2><Minute,2><Second,2>'));
    end;

    procedure FormatETIMSDateOnly(D: Date): Text
    begin
        exit(Format(D, 0, '<Year4><Month,2><Day,2>'));
    end;

    // ------------------------------------------------------------
    // Header helper
    // ------------------------------------------------------------
    procedure AddOrReplaceHeader(var Headers: HttpHeaders; Name: Text; Value: Text)
    begin
        if Headers.Contains(Name) then
            Headers.Remove(Name);
        Headers.Add(Name, Value);
    end;

    // ------------------------------------------------------------
    // Fix JSON "string token" responses safely
    // Only unescapes if response is wrapped in quotes.
    // ------------------------------------------------------------
    procedure NormalizeJsonResponse(raw: Text): Text
    var
        t: Text;
    begin
        t := raw.Trim();

        // quoted JSON string: "{ \"a\": 1 }"
        if (StrLen(t) >= 2) and (CopyStr(t, 1, 1) = '"') and (CopyStr(t, StrLen(t), 1) = '"') then begin
            t := CopyStr(t, 2, StrLen(t) - 2);
            t := t.Replace('\"', '"');
            t := t.Replace('\\/', '/');
            t := t.Replace('\\\\', '\');
        end;

        exit(t);
    end;

    // ------------------------------------------------------------
    // JSON helpers for processors
    // ------------------------------------------------------------
    procedure GetTextOrEmpty(Obj: JsonObject; FieldName: Text): Text
    var
        Tok: JsonToken;
    begin
        if Obj.Get(FieldName, Tok) then
            if not Tok.AsValue().IsNull then
                exit(Tok.AsValue().AsText());
        exit('');
    end;

    procedure GetTextOrNullLiteral(Obj: JsonObject; FieldName: Text): Text
    var
        Tok: JsonToken;
    begin
        if Obj.Get(FieldName, Tok) then begin
            if Tok.AsValue().IsNull then
                exit('null')
            else
                exit(Tok.AsValue().AsText());
        end;
        exit('null');
    end;

    procedure GetIntegerOrZero(Obj: JsonObject; FieldName: Text): Integer
    var
        Tok: JsonToken;
    begin
        if Obj.Get(FieldName, Tok) then
            if not Tok.AsValue().IsNull then
                exit(Tok.AsValue().AsInteger());
        exit(0);
    end;

    procedure GetDecimalOrZero(Obj: JsonObject; FieldName: Text): Decimal
    var
        Tok: JsonToken;
    begin
        if Obj.Get(FieldName, Tok) then
            if not Tok.AsValue().IsNull then
                exit(Tok.AsValue().AsDecimal());
        exit(0);
    end;

    procedure GetYNAsInt(Obj: JsonObject; FieldName: Text): Integer
    var
        v: Text;
    begin
        v := GetTextOrEmpty(Obj, FieldName);
        if v = 'Y' then
            exit(1);
        exit(2);
    end;


}
