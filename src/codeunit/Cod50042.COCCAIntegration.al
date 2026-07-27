namespace KENIC.KENIC;
using System.Environment;

codeunit 50042 COCCAIntegration
{
    trigger OnRun()
    begin
        // getTodaysTransactions();

    end;

    var
        tbl_transactions: Record "Domain Ledger Entry";
        prodUrl: Label 'http://41.90.10.39:8099/api/';
        testUrl: Label 'http://41.90.10.39:8099/api/';
        Company: Record Company;
        evironmentInfo: Codeunit "Environment Information";
        _HelperFunctions: Codeunit HelperFunctions;

    procedure getURL(): Text
    begin
        if evironmentInfo.GetEnvironmentName().ToLower().Contains('production') then
            exit(prodUrl)
        else
            exit(testUrl)
    end;

    procedure GetDomainLedger(DomainName: Text): Text
    var
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        UpdatedCount: Integer;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;
        UpdatedCount := 0;

        SendPostRequest(
            'Transactions/ledger/by-domainname',
            DomainName,
            HttpStatus,
            ResponseTxt,
            ErrTxt);

        if ErrTxt <> '' then begin
            Message(StrSubstNo('GetDomainLedger failed. %1', ErrTxt));
            exit(StrSubstNo('GetDomainLedger failed. %1', ErrTxt));
        end;

        UpdatedCount := ImportDomainLedger(ResponseTxt);

        Message(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
        exit(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
    end;

    local procedure SendPostRequest(Endpoint: Text; DomainName: Text; var HttpStatus: Integer; var ResponseTxt: Text; var ErrTxt: Text)
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
        JsonBody: Text;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        JsonBody :=
          '{' +
          '"domainName":"' + DomainName + '"' +
          '}';

        Content.WriteFrom(JsonBody);

        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        Request.Method('POST');
        Request.SetRequestUri(GetURL + Endpoint);
        Request.Content := Content;

        Request.GetHeaders(Headers);
        Headers.Add('Accept', 'application/json');

        if not Client.Send(Request, Response) then begin
            ErrTxt := 'HTTP POST send failed.';
            exit;
        end;

        HttpStatus := Response.HttpStatusCode();
        Response.Content.ReadAs(ResponseTxt);

        if not Response.IsSuccessStatusCode() then
            ErrTxt := StrSubstNo('HTTP %1: %2', HttpStatus, ResponseTxt);
    end;

    procedure ImportDomainLedger(JsonText: Text): Integer
    var
        RootObj: JsonObject;
        DataArray: JsonArray;
        Token: JsonToken;
        Obj: JsonObject;
        Ledger: Record "Domain Ledger Entry";
        IsNew: Boolean;
        CountUpdated: Integer;
        ID: BigInteger;
    begin
        CountUpdated := 0;

        if JsonText = '' then
            exit(0);

        RootObj.ReadFrom(JsonText);

        if not RootObj.Get('data', Token) then
            exit(0);

        DataArray := Token.AsArray();

        foreach Token in DataArray do begin
            Obj := Token.AsObject();

            ID := _HelperFunctions.GetAsBigInteger(Obj, 'id');

            Ledger.Reset();
            Ledger.SetRange(ID, ID);

            if Ledger.FindFirst() then
                IsNew := false
            else begin
                IsNew := true;
                Ledger.Init();
                Ledger.ID := ID;
            end;

            Ledger.ClientRoid := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'clientRoid'), MaxStrLen(Ledger.ClientRoid));
            Ledger.Description := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'description'), MaxStrLen(Ledger.Description));
            Ledger.Currency := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'currency'), MaxStrLen(Ledger.Currency));
            Ledger.Tax := _HelperFunctions.GetAsDecimal(Obj, 'tax');
            Ledger.TaxLabel := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'taxLabel'), MaxStrLen(Ledger.TaxLabel));
            Ledger.Total := _HelperFunctions.GetAsDecimal(Obj, 'total');
            Ledger.Created := _HelperFunctions.GetAsDateTimeISO(Obj, 'created');
            Ledger.DomainRoid := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'domainRoid'), MaxStrLen(Ledger.DomainRoid));
            Ledger.TransType := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'transType'), MaxStrLen(Ledger.TransType));
            //Ledger.RefundExpiry := _HelperFunctions.GetAsDateTimeISO(Obj, 'refundExpiry');
            Ledger.RefundAmount := _HelperFunctions.GetAsDecimal(Obj, 'refundAmount');
            Ledger.Balance := _HelperFunctions.GetAsDecimal(Obj, 'balance');
            Ledger.DomainName := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'domainName'), MaxStrLen(Ledger.DomainName));

            Ledger.CreditTransactionId := _HelperFunctions.GetAsBigInteger(Obj, 'creditTransactionId');

            Ledger.TLD := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'tld'), MaxStrLen(Ledger.TLD));
            Ledger.ProcessorAccountHistoryId := _HelperFunctions.GetAsInteger(Obj, 'processorAccountHistoryId');
            Ledger.RefundGrace := _HelperFunctions.GetAsDateTimeISO(Obj, 'refundGrace');
            Ledger.IsPicked := _HelperFunctions.GetAsBoolean(Obj, 'isPicked');
            //Ledger.PreviousExpiryDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'previousExpiryDate');
            Ledger.RenewalRefund := _HelperFunctions.GetAsBoolean(Obj, 'renewalRefund');
            Ledger.DocumentNumber := _HelperFunctions.GetAsInteger(Obj, 'documentNumber');
            Ledger.TransfRoid := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'transfRoid'), MaxStrLen(Ledger.TransfRoid));
            //Ledger.ExDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'exDate');

            Ledger.RefundForId := _HelperFunctions.GetAsBigInteger(Obj, 'refundForId');

            Ledger.VatSign := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'vatSign'), MaxStrLen(Ledger.VatSign));
            Ledger.IsPrinted := _HelperFunctions.GetAsBoolean(Obj, 'isPrinted');
            Ledger.PrintTime := _HelperFunctions.GetAsDateTimeISO(Obj, 'printTime');
            Ledger.IsFilled := _HelperFunctions.GetAsBoolean(Obj, 'isFilled');
            Ledger.Amount := _HelperFunctions.GetAsDecimal(Obj, 'amount');
            Ledger.TaxContent := _HelperFunctions.GetAsDecimal(Obj, 'taxContent');
            Ledger.TaxInclusive := _HelperFunctions.GetAsBoolean(Obj, 'taxInclusive');
            Ledger.LedgerLoginUsername := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'ledgerLoginUsername'), MaxStrLen(Ledger.LedgerLoginUsername));

            if IsNew then begin
                Ledger.Insert(true);
                CountUpdated += 1;
            end else begin
                Ledger.Modify(true);
                CountUpdated += 1;
            end;
        end;

        exit(CountUpdated);
    end;
}
