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

    procedure GetLedger2(Endpoint: Text; JsonBody: Text): Text
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

        SendPostRequest2(
            Endpoint,
            JsonBody,
            HttpStatus,
            ResponseTxt,
            ErrTxt);

        if ErrTxt <> '' then begin
            Message(StrSubstNo('Ledger retrieval failed. %1', ErrTxt));
            exit(StrSubstNo('Ledger retrieval failed. %1', ErrTxt));
        end;

        UpdatedCount := ImportDomainLedger(ResponseTxt);

        Message(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
        exit(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
    end;

    local procedure SendPostRequest2(Endpoint: Text; JsonBody: Text; var HttpStatus: Integer; var ResponseTxt: Text; var ErrTxt: Text)
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        Content.WriteFrom(JsonBody);

        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        Request.Method('POST');
        Request.SetRequestUri(GetURL() + Endpoint);
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

    procedure GetLedgerByDomain(DomainName: Text): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"domainName":"' + DomainName + '"' +
            '}';

        exit(GetLedger2(
            'Transactions/ledger/by-domainname',
            JsonBody));
    end;

    procedure GetLedgerByDocument(DocumentNumber: Integer): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"documentNumber":' + Format(DocumentNumber) +
            '}';

        exit(GetLedger2(
            'Transactions/ledger/by-documentnumber',
            JsonBody));
    end;

    procedure GetLedgerByDateRange(StartDate: DateTime; EndDate: DateTime): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"startDate":"' + FormatDateTimeISO(StartDate) + '",' +
            '"endDate":"' + FormatDateTimeISO(EndDate) + '"' +
            '}';

        exit(GetLedger2(
            'Transactions/ledger/by-created-range',
            JsonBody));
    end;

    local procedure FormatDateTimeISO(Value: DateTime): Text
    begin
        exit(
            Format(Value, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>.000Z'));
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
            Ledger.RefundExpiry := _HelperFunctions.GetAsDateTimeISO(Obj, 'refundExpiry');
            Ledger.RefundAmount := _HelperFunctions.GetAsDecimal(Obj, 'refundAmount');
            Ledger.Balance := _HelperFunctions.GetAsDecimal(Obj, 'balance');
            Ledger.DomainName := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'domainName'), MaxStrLen(Ledger.DomainName));

            Ledger.CreditTransactionId := _HelperFunctions.GetAsBigInteger(Obj, 'creditTransactionId');

            Ledger.TLD := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'tld'), MaxStrLen(Ledger.TLD));
            Ledger.ProcessorAccountHistoryId := _HelperFunctions.GetAsInteger(Obj, 'processorAccountHistoryId');
            Ledger.RefundGrace := _HelperFunctions.GetAsDateTimeISO(Obj, 'refundGrace');
            Ledger.IsPicked := _HelperFunctions.GetAsBoolean(Obj, 'isPicked');
            Ledger.PreviousExpiryDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'previousExpiryDate');
            Ledger.RenewalRefund := _HelperFunctions.GetAsBoolean(Obj, 'renewalRefund');
            Ledger.DocumentNumber := _HelperFunctions.GetAsInteger(Obj, 'documentNumber');
            Ledger.TransfRoid := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'transfRoid'), MaxStrLen(Ledger.TransfRoid));
            Ledger.ExDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'exDate');

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

    procedure GetClient(Endpoint: Text; JsonBody: Text): Text
    var
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        UpdatedCount: Integer;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        SendPostRequest2(
            Endpoint,
            JsonBody,
            HttpStatus,
            ResponseTxt,
            ErrTxt);

        if ErrTxt <> '' then begin
            Message(StrSubstNo('Client retrieval failed. %1', ErrTxt));
            exit(StrSubstNo('Client retrieval failed. %1', ErrTxt));
        end;

        UpdatedCount := ImportClients(ResponseTxt);

        Message(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
        exit(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
    end;

    procedure GetClientById(ClientId: Code[50]): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"clid":"' + ClientId + '"' +
            '}';

        exit(GetClient(
            'Transactions/client/by-clientid',
            JsonBody));
    end;

    procedure GetClientByEmail(Email: Text): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"email":"' + Email + '"' +
            '}';

        exit(GetClient(
            'Transactions/client/by-email',
            JsonBody));
    end;

    procedure GetClientByDateRange(StartDate: DateTime; EndDate: DateTime): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"startDate":"' + FormatDateTimeISO(StartDate) + '",' +
            '"endDate":"' + FormatDateTimeISO(EndDate) + '"' +
            '}';

        exit(GetClient(
            'Transactions/client/by-createdatebyrange',
            JsonBody));
    end;

    procedure ImportClients(JsonText: Text): Integer
    var
        RootObj: JsonObject;
        DataArray: JsonArray;
        Token: JsonToken;
        Obj: JsonObject;
        Client: Record "Domain Client";
        IsNew: Boolean;
        CountUpdated: Integer;
        Clid: Code[50];
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

            Clid := _HelperFunctions.SafeAssignText(
                _HelperFunctions.GetAsText(Obj, 'clid'),
                MaxStrLen(Client.Clid));

            Client.Reset();
            Client.SetRange(Clid, Clid);

            if Client.FindFirst() then
                IsNew := false
            else begin
                IsNew := true;
                Client.Init();
                Client.Clid := Clid;
            end;

            Client.Roid := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'roid'), MaxStrLen(Client.Roid));
            Client.EppPassword := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'eppPassword'), MaxStrLen(Client.EppPassword));
            Client.Name := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'name'), MaxStrLen(Client.Name));
            Client.Email := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'email'), MaxStrLen(Client.Email));
            Client.Address := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'address'), MaxStrLen(Client.Address));
            Client.Country := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'country'), MaxStrLen(Client.Country));
            Client.Phone := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'phone'), MaxStrLen(Client.Phone));
            Client.Fax := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'fax'), MaxStrLen(Client.Fax));
            Client.AdminContact := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'adminContact'), MaxStrLen(Client.AdminContact));
            Client.AdminEmail := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'adminEmail'), MaxStrLen(Client.AdminEmail));
            Client.BillingContact := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'billingContact'), MaxStrLen(Client.BillingContact));
            Client.BillingEmail := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'billingEmail'), MaxStrLen(Client.BillingEmail));
            Client.TechContact := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'techContact'), MaxStrLen(Client.TechContact));
            Client.TechEmail := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'techEmail'), MaxStrLen(Client.TechEmail));

            Client.CreateDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'createDate');
            Client.UpdateDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'updateDate');

            Client.ServiceContact := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'serviceContact'), MaxStrLen(Client.ServiceContact));
            Client.ServiceEmail := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'serviceEmail'), MaxStrLen(Client.ServiceEmail));
            Client.RegistrationUrl := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'registrationUrl'), MaxStrLen(Client.RegistrationUrl));
            Client.PrimaryFocus := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'primaryFocus'), MaxStrLen(Client.PrimaryFocus));

            Client.AllowEpp := _HelperFunctions.GetAsBoolean(Obj, 'allowEpp');
            Client.RestrictIps := _HelperFunctions.GetAsBoolean(Obj, 'restrictIps');
            Client.AllowRegistryNs := _HelperFunctions.GetAsBoolean(Obj, 'allowRegistryNs');
            Client.FailedEppLogins := _HelperFunctions.GetAsInteger(Obj, 'failedEppLogins');
            Client.EppLockedUntil := _HelperFunctions.GetAsDateTimeISO(Obj, 'eppLockedUntil');
            Client.OldStatus := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'oldStatus'), MaxStrLen(Client.OldStatus));
            Client.IsPicked := _HelperFunctions.GetAsBoolean(Obj, 'isPicked');
            Client.BillingDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'billingDate');
            Client.AllowRestrictIps := _HelperFunctions.GetAsBoolean(Obj, 'allowRestrictIps');
            Client.DedicatedEppConnections := _HelperFunctions.GetAsInteger(Obj, 'dedicatedEppConnections');
            Client.Emailed := _HelperFunctions.GetAsBoolean(Obj, 'emailed');
            Client.LegacySystemId := _HelperFunctions.GetAsBigInteger(Obj, 'legacySystemId');

            Client.EmailOptOut := _HelperFunctions.GetAsBoolean(Obj, 'emailOptOut');
            Client.SystemAccount := _HelperFunctions.GetAsBoolean(Obj, 'systemAccount');
            Client.AdminOptOut := _HelperFunctions.GetAsBoolean(Obj, 'adminOptOut');
            Client.BillingOptOut := _HelperFunctions.GetAsBoolean(Obj, 'billingOptOut');
            Client.TechOptOut := _HelperFunctions.GetAsBoolean(Obj, 'techOptOut');
            Client.ServiceOptOut := _HelperFunctions.GetAsBoolean(Obj, 'serviceOptOut');

            Client.DomainsContact := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'domainsContact'), MaxStrLen(Client.DomainsContact));
            Client.DomainsEmail := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'domainsEmail'), MaxStrLen(Client.DomainsEmail));
            Client.AutoDiscount := _HelperFunctions.GetAsBoolean(Obj, 'autoDiscount');
            Client.DefaultWhoisProxyId := _HelperFunctions.GetAsBigInteger(Obj, 'defaultWhoisProxyId');
            Client.CreateUsername := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'createUsername'), MaxStrLen(Client.CreateUsername));
            Client.UpdateUsername := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'updateUsername'), MaxStrLen(Client.UpdateUsername));
            Client.IanaNumber := _HelperFunctions.GetAsInteger(Obj, 'ianaNumber');

            Client.UseSecureAuthInfoPw := _HelperFunctions.GetAsBoolean(Obj, 'useSecureAuthInfoPw');
            Client.TmpActivateVariants := _HelperFunctions.GetAsBoolean(Obj, 'tmpActivateVariants');
            Client.AbuseEmail := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'abuseEmail'), MaxStrLen(Client.AbuseEmail));
            Client.AbusePhone := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'abusePhone'), MaxStrLen(Client.AbusePhone));
            Client.EppSalt := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'eppSalt'), MaxStrLen(Client.EppSalt));
            Client.EppHashIteration := _HelperFunctions.GetAsInteger(Obj, 'eppHashIteration');
            Client.ClientWhois := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'clientWhois'), MaxStrLen(Client.ClientWhois));
            Client.ClientRdap := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'clientRdap'), MaxStrLen(Client.ClientRdap));
            Client.ContactCounter := _HelperFunctions.GetAsInteger(Obj, 'contactCounter');
            Client.PaymentGatewayId := _HelperFunctions.GetAsInteger(Obj, 'paymentGatewayId');
            Client.City := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'city'), MaxStrLen(Client.City));
            Client.State := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'state'), MaxStrLen(Client.State));
            Client.PostalCode := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'postalCode'), MaxStrLen(Client.PostalCode));
            Client.EppEnforceClientCert := _HelperFunctions.GetAsBoolean(Obj, 'eppEnforceClientCert');

            if IsNew then
                Client.Insert(true)
            else
                Client.Modify(true);

            CountUpdated += 1;
        end;

        exit(CountUpdated);
    end;

    procedure GetReceipt(Endpoint: Text; JsonBody: Text): Text
    var
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        UpdatedCount: Integer;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);

        SendPostRequest2(
            Endpoint,
            JsonBody,
            HttpStatus,
            ResponseTxt,
            ErrTxt);

        if ErrTxt <> '' then begin
            Message(StrSubstNo('Receipt retrieval failed. %1', ErrTxt));
            exit(ErrTxt);
        end;

        UpdatedCount := ImportReceipts(ResponseTxt);

        exit(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
    end;

    procedure GetReceiptByLedger(LedgerId: BigInteger): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"ledgerId":' + Format(LedgerId) +
            '}';

        exit(GetReceipt(
            'Transactions/receipt/by-ledgerid',
            JsonBody));
    end;

    procedure GetReceiptByDate(StartDate: DateTime; EndDate: DateTime): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"startDate":"' + FormatDateTimeISO(StartDate) + '",' +
            '"endDate":"' + FormatDateTimeISO(EndDate) + '"' +
            '}';

        exit(GetReceipt(
            'Transactions/receipt/by-receipt-date',
            JsonBody));
    end;

    procedure ImportReceipts(JsonText: Text): Integer
    var
        RootObj: JsonObject;
        DataArray: JsonArray;
        Token: JsonToken;
        Obj: JsonObject;
        Receipt: Record "Domain Receipt";
        IsNew: Boolean;
        CountUpdated: Integer;
        ReceiptId: Integer;
    begin
        if JsonText = '' then
            exit(0);

        RootObj.ReadFrom(JsonText);

        if not RootObj.Get('data', Token) then
            exit(0);

        DataArray := Token.AsArray();

        foreach Token in DataArray do begin

            Obj := Token.AsObject();

            ReceiptId := _HelperFunctions.GetAsInteger(Obj, 'receiptId');

            Receipt.Reset();
            Receipt.SetRange(ReceiptId, ReceiptId);

            if Receipt.FindFirst() then
                IsNew := false
            else begin
                IsNew := true;
                Receipt.Init();
                Receipt.ReceiptId := ReceiptId;
            end;

            Receipt.Roid := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'roid'), MaxStrLen(Receipt.Roid));
            Receipt.LedgerId := _HelperFunctions.GetAsBigInteger(Obj, 'ledgerId');
            Receipt.ReceiptDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'receiptDate');
            Receipt.Amount := _HelperFunctions.GetAsDecimal(Obj, 'amount');
            Receipt.BankCode := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'bankCode'), MaxStrLen(Receipt.BankCode));
            Receipt.ChequeDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'chequeDate');
            Receipt.ChequeNumber := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'chequeNumber'), MaxStrLen(Receipt.ChequeNumber));
            Receipt.DrawerName := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'drawerName'), MaxStrLen(Receipt.DrawerName));
            Receipt.Cash := _HelperFunctions.GetAsBoolean(Obj, 'cash');
            Receipt.Details := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'details'), MaxStrLen(Receipt.Details));
            Receipt.InWords := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'inWords'), MaxStrLen(Receipt.InWords));
            Receipt.VatWithheld := _HelperFunctions.GetAsBoolean(Obj, 'vatWithheld');
            Receipt.VatCertNo := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'vatCertNo'), MaxStrLen(Receipt.VatCertNo));
            Receipt.Voided := _HelperFunctions.GetAsBoolean(Obj, 'voided');
            Receipt.VoidDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'voidDate');
            Receipt.SmsTransId := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'smsTransId'), MaxStrLen(Receipt.SmsTransId));
            Receipt.MpesaTrxId := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'mpesaTrxId'), MaxStrLen(Receipt.MpesaTrxId));
            Receipt.Mpesa := _HelperFunctions.GetAsBoolean(Obj, 'mpesa');
            Receipt.IPay := _HelperFunctions.GetAsBoolean(Obj, 'iPay');
            Receipt.MpesaApiId := _HelperFunctions.GetAsInteger(Obj, 'mpesaApiId');
            Receipt.NcbaKes := _HelperFunctions.GetAsBoolean(Obj, 'ncbaKes');
            Receipt.ImKes := _HelperFunctions.GetAsBoolean(Obj, 'imKes');
            Receipt.ImUsd := _HelperFunctions.GetAsBoolean(Obj, 'imUsd');

            if IsNew then
                Receipt.Insert(true)
            else
                Receipt.Modify(true);

            CountUpdated += 1;
        end;

        exit(CountUpdated);
    end;

    procedure GetIMTransaction(Endpoint: Text; JsonBody: Text): Text
    var
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        UpdatedCount: Integer;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);

        SendPostRequest2(
            Endpoint,
            JsonBody,
            HttpStatus,
            ResponseTxt,
            ErrTxt);

        if ErrTxt <> '' then begin
            Message(StrSubstNo('I&M Transaction retrieval failed. %1', ErrTxt));
            exit(ErrTxt);
        end;

        UpdatedCount := ImportIMTransactions(ResponseTxt);

        exit(StrSubstNo('Update successful. Updated=%1', UpdatedCount));
    end;

    procedure GetIMTransactionByReference(TransactionReference: Text): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"transactionReference":"' + TransactionReference + '"' +
            '}';

        exit(GetIMTransaction(
            'Transactions/im/by-transaction-reference',
            JsonBody));
    end;

    procedure GetIMTransactionByDate(StartDate: DateTime; EndDate: DateTime): Text
    var
        JsonBody: Text;
    begin
        JsonBody :=
            '{' +
            '"startDate":"' + FormatDateTimeISO(StartDate) + '",' +
            '"endDate":"' + FormatDateTimeISO(EndDate) + '"' +
            '}';

        exit(GetIMTransaction(
            'Transactions/im/by-transaction-date',
            JsonBody));
    end;

    procedure ImportIMTransactions(JsonText: Text): Integer
    var
        RootObj: JsonObject;
        DataArray: JsonArray;
        Token: JsonToken;
        Obj: JsonObject;
        IMTransaction: Record "I&M Transaction";
        IsNew: Boolean;
        CountUpdated: Integer;
        OutStream: OutStream;
    begin
        if JsonText = '' then
            exit(0);

        RootObj.ReadFrom(JsonText);

        if not RootObj.Get('data', Token) then
            exit(0);

        DataArray := Token.AsArray();

        foreach Token in DataArray do begin

            Obj := Token.AsObject();

            IMTransaction.Reset();
            IMTransaction.SetRange(IMTransactionId,
                _HelperFunctions.GetAsInteger(Obj, 'imTransactionId'));

            if IMTransaction.FindFirst() then
                IsNew := false
            else begin
                IsNew := true;
                IMTransaction.Init();
                IMTransaction.IMTransactionId :=
                    _HelperFunctions.GetAsInteger(Obj, 'imTransactionId');
            end;

            IMTransaction.OrgId := _HelperFunctions.GetAsInteger(Obj, 'orgId');
            IMTransaction.ApiClientId := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'apiClientId'), MaxStrLen(IMTransaction.ApiClientId));
            IMTransaction.PaymentType := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'paymentType'), MaxStrLen(IMTransaction.PaymentType));
            IMTransaction.TransactionReference := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'transactionReference'), MaxStrLen(IMTransaction.TransactionReference));
            IMTransaction.TransactionDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'transactionDate');
            IMTransaction.Amount := _HelperFunctions.GetAsDecimal(Obj, 'amount');
            IMTransaction.Currency := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'currency'), MaxStrLen(IMTransaction.Currency));
            IMTransaction.ShortCode := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'shortCode'), MaxStrLen(IMTransaction.ShortCode));
            IMTransaction.CustomerRef := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'customerRef'), MaxStrLen(IMTransaction.CustomerRef));
            IMTransaction.ExternalRefNumber := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'externalRefNumber'), MaxStrLen(IMTransaction.ExternalRefNumber));
            IMTransaction.SenderBankCode := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'senderBankCode'), MaxStrLen(IMTransaction.SenderBankCode));
            IMTransaction.SenderAccountNumber := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'senderAccountNumber'), MaxStrLen(IMTransaction.SenderAccountNumber));
            IMTransaction.SenderAccountName := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'senderAccountName'), MaxStrLen(IMTransaction.SenderAccountName));
            IMTransaction.PayerName := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'payerName'), MaxStrLen(IMTransaction.PayerName));
            IMTransaction.PayerMobileNumber := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'payerMobileNumber'), MaxStrLen(IMTransaction.PayerMobileNumber));
            IMTransaction.SenderAddress := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'senderAddress'), MaxStrLen(IMTransaction.SenderAddress));
            IMTransaction.ChequeNumber := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'chequeNumber'), MaxStrLen(IMTransaction.ChequeNumber));
            IMTransaction.Narration := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'narration'), MaxStrLen(IMTransaction.Narration));
            IMTransaction.CustomerConfirmed := _HelperFunctions.GetAsBoolean(Obj, 'customerConfirmed');
            IMTransaction.Status := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'status'), MaxStrLen(IMTransaction.Status));
            IMTransaction.ErpRefId := _HelperFunctions.SafeAssignText(_HelperFunctions.GetAsText(Obj, 'erpRefId'), MaxStrLen(IMTransaction.ErpRefId));
            IMTransaction.CreatedDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'createdDate');

            Clear(IMTransaction.RawJsonPayload);
            IMTransaction.RawJsonPayload.CreateOutStream(OutStream);
            OutStream.WriteText(_HelperFunctions.GetAsText(Obj, 'rawJsonPayload'));

            if IsNew then
                IMTransaction.Insert(true)
            else
                IMTransaction.Modify(true);

            CountUpdated += 1;
        end;

        exit(CountUpdated);
    end;

    procedure GetRegistrantsByZoneName(ZoneName: Text): Text
    var
        RequestObject: JsonObject;
        JsonBody: Text;
    begin
        if ZoneName = '' then
            Error('Zone Name must be provided.');
        RequestObject.Add('zoneName', ZoneName);
        RequestObject.WriteTo(JsonBody);
        exit(GetRegistrants('Transactions/registrant/by-zonename', JsonBody));
    end;

    procedure GetRegistrantsByClientId(ClientClid: Text): Text
    var
        RequestObject: JsonObject;
        JsonBody: Text;
    begin
        if ClientClid = '' then
            Error('Client ID must be provided.');
        RequestObject.Add('clientClid', ClientClid);
        RequestObject.WriteTo(JsonBody);
        exit(GetRegistrants('Transactions/registrant/by-clientid', JsonBody));
    end;

    procedure GetRegistrantsByDateRange(StartDate: Date; EndDate: Date): Text
    var
        RequestObject: JsonObject;
        JsonBody: Text;
    begin
        if StartDate = 0D then
            Error('Start Date must be provided.');
        if EndDate = 0D then
            Error('End Date must be provided.');
        if StartDate > EndDate then
            Error('Start Date cannot be later than End Date.');

        RequestObject.Add('startDate', FormatUtcDate(StartDate, false));
        RequestObject.Add('endDate', FormatUtcDate(EndDate, true));
        RequestObject.WriteTo(JsonBody);
        exit(GetRegistrants('Transactions/registrant/by-daterange', JsonBody));
    end;

    local procedure FormatUtcDate(Value: Date; EndOfDay: Boolean): Text
    var
        TimeText: Text;
    begin
        if EndOfDay then
            TimeText := '23:59:59.000Z'
        else
            TimeText := '00:00:00.000Z';

        exit(
            StrSubstNo(
                '%1-%2-%3T%4',
                Format(Date2DMY(Value, 3), 0, '<Integer,4><Filler Character,0>'),
                Format(Date2DMY(Value, 2), 0, '<Integer,2><Filler Character,0>'),
                Format(Date2DMY(Value, 1), 0, '<Integer,2><Filler Character,0>'),
                TimeText));
    end;

    local procedure GetRegistrants(Endpoint: Text; JsonBody: Text): Text
    var
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        InsertedCount: Integer;
        UpdatedCount: Integer;
    begin
        SendPostRequest2(Endpoint, JsonBody, HttpStatus, ResponseTxt, ErrTxt);

        if ErrTxt <> '' then
            Error('Registrar retrieval failed. %1', ErrTxt);
        if (HttpStatus < 200) or (HttpStatus > 299) then
            Error('Registrar retrieval failed. HTTP Status=%1. Response=%2', HttpStatus, ResponseTxt);

        ImportRegistrants(ResponseTxt, InsertedCount, UpdatedCount);
        exit(StrSubstNo('Registrar retrieval successful. Inserted=%1, Updated=%2.', InsertedCount, UpdatedCount));
    end;

    local procedure ImportRegistrants(JsonText: Text; var InsertedCount: Integer; var UpdatedCount: Integer)
    var
        RootObj: JsonObject;
        DataArray: JsonArray;
        Token: JsonToken;
        DataToken: JsonToken;
        Obj: JsonObject;
    begin
        Clear(InsertedCount);
        Clear(UpdatedCount);
        if JsonText = '' then
            exit;
        if not RootObj.ReadFrom(JsonText) then
            Error('The registrar API returned invalid JSON.');
        if RootObj.Get('success', Token) then
            if not Token.AsValue().IsNull() then
                if not Token.AsValue().AsBoolean() then
                    Error('The registrar API returned success as false.');
        if not RootObj.Get('data', Token) then
            exit;
        if not Token.IsArray() then
            Error('The data property in the registrar response is not an array.');

        DataArray := Token.AsArray();
        foreach DataToken in DataArray do
            if DataToken.IsObject() then begin
                Obj := DataToken.AsObject();
                ImportOneRegistrant(Obj, InsertedCount, UpdatedCount);
            end;
    end;

    local procedure ImportOneRegistrant(Obj: JsonObject; var InsertedCount: Integer; var UpdatedCount: Integer)
    var
        Registrar: Record Registrants;
        RoidValue: Text;
        IsNew: Boolean;
        RawRecordJson: Text;
        OutStream: OutStream;
    begin
        RoidValue := _HelperFunctions.GetAsText(Obj, 'roid');
        if RoidValue = '' then
            exit;

        RoidValue := CopyStr(RoidValue, 1, MaxStrLen(Registrar.Roid));
        IsNew := not Registrar.Get(RoidValue);
        if IsNew then begin
            Registrar.Init();
            Registrar.Roid := RoidValue;
        end;

        Registrar.ClientId := CopyStr(_HelperFunctions.GetAsText(Obj, 'clid'), 1, MaxStrLen(Registrar.ClientId));
        Registrar.Name := CopyStr(_HelperFunctions.GetAsText(Obj, 'name'), 1, MaxStrLen(Registrar.Name));
        Registrar.Email := CopyStr(_HelperFunctions.GetAsText(Obj, 'email'), 1, MaxStrLen(Registrar.Email));
        Registrar.Address := CopyStr(_HelperFunctions.GetAsText(Obj, 'address'), 1, MaxStrLen(Registrar.Address));
        Registrar.Country := CopyStr(_HelperFunctions.GetAsText(Obj, 'country'), 1, MaxStrLen(Registrar.Country));
        Registrar.Phone := CopyStr(_HelperFunctions.GetAsText(Obj, 'phone'), 1, MaxStrLen(Registrar.Phone));
        Registrar.Fax := CopyStr(_HelperFunctions.GetAsText(Obj, 'fax'), 1, MaxStrLen(Registrar.Fax));
        Registrar.AdminContact := CopyStr(_HelperFunctions.GetAsText(Obj, 'adminContact'), 1, MaxStrLen(Registrar.AdminContact));
        Registrar.AdminEmail := CopyStr(_HelperFunctions.GetAsText(Obj, 'adminEmail'), 1, MaxStrLen(Registrar.AdminEmail));
        Registrar.BillingContact := CopyStr(_HelperFunctions.GetAsText(Obj, 'billingContact'), 1, MaxStrLen(Registrar.BillingContact));
        Registrar.BillingEmail := CopyStr(_HelperFunctions.GetAsText(Obj, 'billingEmail'), 1, MaxStrLen(Registrar.BillingEmail));
        Registrar.TechContact := CopyStr(_HelperFunctions.GetAsText(Obj, 'techContact'), 1, MaxStrLen(Registrar.TechContact));
        Registrar.TechEmail := CopyStr(_HelperFunctions.GetAsText(Obj, 'techEmail'), 1, MaxStrLen(Registrar.TechEmail));
        Registrar.ServiceContact := CopyStr(_HelperFunctions.GetAsText(Obj, 'serviceContact'), 1, MaxStrLen(Registrar.ServiceContact));
        Registrar.ServiceEmail := CopyStr(_HelperFunctions.GetAsText(Obj, 'serviceEmail'), 1, MaxStrLen(Registrar.ServiceEmail));
        Registrar.DomainsContact := CopyStr(_HelperFunctions.GetAsText(Obj, 'domainsContact'), 1, MaxStrLen(Registrar.DomainsContact));
        Registrar.DomainsEmail := CopyStr(_HelperFunctions.GetAsText(Obj, 'domainsEmail'), 1, MaxStrLen(Registrar.DomainsEmail));
        Registrar.AbuseEmail := CopyStr(_HelperFunctions.GetAsText(Obj, 'abuseEmail'), 1, MaxStrLen(Registrar.AbuseEmail));
        Registrar.AbusePhone := CopyStr(_HelperFunctions.GetAsText(Obj, 'abusePhone'), 1, MaxStrLen(Registrar.AbusePhone));
        Registrar.RegistrationUrl := CopyStr(_HelperFunctions.GetAsText(Obj, 'registrationUrl'), 1, MaxStrLen(Registrar.RegistrationUrl));
        Registrar.PrimaryFocus := CopyStr(_HelperFunctions.GetAsText(Obj, 'primaryFocus'), 1, MaxStrLen(Registrar.PrimaryFocus));
        Registrar.CreateDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'createDate');
        Registrar.UpdateDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'updateDate');
        Registrar.BillingDate := _HelperFunctions.GetAsDateTimeISO(Obj, 'billingDate');
        Registrar.CreateUsername := CopyStr(_HelperFunctions.GetAsText(Obj, 'createUsername'), 1, MaxStrLen(Registrar.CreateUsername));
        Registrar.UpdateUsername := CopyStr(_HelperFunctions.GetAsText(Obj, 'updateUsername'), 1, MaxStrLen(Registrar.UpdateUsername));
        Registrar.AllowEpp := _HelperFunctions.GetAsBoolean(Obj, 'allowEpp');
        Registrar.RestrictIps := _HelperFunctions.GetAsBoolean(Obj, 'restrictIps');
        Registrar.AllowRegistryNs := _HelperFunctions.GetAsBoolean(Obj, 'allowRegistryNs');
        Registrar.FailedEppLogins := _HelperFunctions.GetAsInteger(Obj, 'failedEppLogins');
        Registrar.EppLockedUntil := _HelperFunctions.GetAsDateTimeISO(Obj, 'eppLockedUntil');
        Registrar.OldStatus := CopyStr(_HelperFunctions.GetAsText(Obj, 'oldStatus'), 1, MaxStrLen(Registrar.OldStatus));
        Registrar.IsPicked := _HelperFunctions.GetAsBoolean(Obj, 'isPicked');
        Registrar.AllowRestrictIps := _HelperFunctions.GetAsBoolean(Obj, 'allowRestrictIps');
        Registrar.DedicatedEppConnections := _HelperFunctions.GetAsInteger(Obj, 'dedicatedEppConnections');
        Registrar.Emailed := _HelperFunctions.GetAsBoolean(Obj, 'emailed');
        Registrar.LegacySystemId := CopyStr(_HelperFunctions.GetAsText(Obj, 'legacySystemId'), 1, MaxStrLen(Registrar.LegacySystemId));
        Registrar.EmailOptOut := _HelperFunctions.GetAsBoolean(Obj, 'emailOptOut');
        Registrar.SystemAccount := _HelperFunctions.GetAsBoolean(Obj, 'systemAccount');
        Registrar.AdminOptOut := _HelperFunctions.GetAsBoolean(Obj, 'adminOptOut');
        Registrar.BillingOptOut := _HelperFunctions.GetAsBoolean(Obj, 'billingOptOut');
        Registrar.TechOptOut := _HelperFunctions.GetAsBoolean(Obj, 'techOptOut');
        Registrar.ServiceOptOut := _HelperFunctions.GetAsBoolean(Obj, 'serviceOptOut');
        Registrar.AutoDiscount := _HelperFunctions.GetAsBoolean(Obj, 'autoDiscount');
        Registrar.DefaultWhoisProxyId := CopyStr(_HelperFunctions.GetAsText(Obj, 'defaultWhoisProxyId'), 1, MaxStrLen(Registrar.DefaultWhoisProxyId));
        Registrar.IanaNumber := CopyStr(_HelperFunctions.GetAsText(Obj, 'ianaNumber'), 1, MaxStrLen(Registrar.IanaNumber));
        Registrar.UseSecureAuthInfoPw := _HelperFunctions.GetAsBoolean(Obj, 'useSecureAuthInfoPw');
        Registrar.TmpActivateVariants := _HelperFunctions.GetAsBoolean(Obj, 'tmpActivateVariants');
        Registrar.EppHashIteration := _HelperFunctions.GetAsInteger(Obj, 'eppHashIteration');
        Registrar.ClientWhois := CopyStr(_HelperFunctions.GetAsText(Obj, 'clientWhois'), 1, MaxStrLen(Registrar.ClientWhois));
        Registrar.ClientRdap := CopyStr(_HelperFunctions.GetAsText(Obj, 'clientRdap'), 1, MaxStrLen(Registrar.ClientRdap));
        Registrar.ContactCounter := _HelperFunctions.GetAsInteger(Obj, 'contactCounter');
        Registrar.PaymentGatewayId := CopyStr(_HelperFunctions.GetAsText(Obj, 'paymentGatewayId'), 1, MaxStrLen(Registrar.PaymentGatewayId));
        Registrar.City := CopyStr(_HelperFunctions.GetAsText(Obj, 'city'), 1, MaxStrLen(Registrar.City));
        Registrar.State := CopyStr(_HelperFunctions.GetAsText(Obj, 'state'), 1, MaxStrLen(Registrar.State));
        Registrar.PostalCode := CopyStr(_HelperFunctions.GetAsText(Obj, 'postalCode'), 1, MaxStrLen(Registrar.PostalCode));
        Registrar.EppEnforceClientCert := _HelperFunctions.GetAsBoolean(Obj, 'eppEnforceClientCert');
        Registrar.EppPassword := CopyStr(_HelperFunctions.GetAsText(Obj, 'eppPassword'), 1, MaxStrLen(Registrar.EppPassword));
        Registrar.EppSalt := CopyStr(_HelperFunctions.GetAsText(Obj, 'eppSalt'), 1, MaxStrLen(Registrar.EppSalt));
        Registrar.LastUpdatedAt := CurrentDateTime();
        Registrar.LastUpdatedBy := CopyStr(UserId(), 1, MaxStrLen(Registrar.LastUpdatedBy));

        Clear(Registrar.RawJsonPayload);
        Registrar.RawJsonPayload.CreateOutStream(OutStream, TextEncoding::UTF8);
        Obj.WriteTo(RawRecordJson);
        OutStream.WriteText(RawRecordJson);

        if IsNew then begin
            Registrar.Insert(true);
            InsertedCount += 1;
        end else begin
            Registrar.Modify(true);
            UpdatedCount += 1;
        end;
    end;

    procedure PushDomainReceipt(ReceiptId: Integer): Text
    var
        DomainReceipt: Record "Domain Receipt";
        PayloadObj: JsonObject;
        PayloadTxt: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
    begin
        if not DomainReceipt.Get(ReceiptId) then
            Error('Domain receipt %1 was not found.', ReceiptId);

        DomainReceipt.TestField(ReceiptDate);

        BuildDomainReceiptPayload(DomainReceipt, PayloadObj);
        PayloadObj.WriteTo(PayloadTxt);
        Message('PayloadObj = %1',PayloadObj);

        SendDomainReceiptRequest(
            PayloadTxt,
            HttpStatus,
            ResponseTxt,
            ErrTxt);

        // Parse JSON error bodies as well, including duplicate responses.
        if ResponseTxt = '' then
            Error(
                'No response body was received for receipt %1. %2',
                ReceiptId,
                ErrTxt);

        HandleDomainReceiptResponse(
            ResponseTxt,
            ReceiptId,
            HttpStatus,
            ErrTxt);

        exit(ResponseTxt);
    end;

    local procedure BuildDomainReceiptPayload(
        DomainReceipt: Record "Domain Receipt";
        var PayloadObj: JsonObject)
    begin
        Clear(PayloadObj);

        PayloadObj.Add('receiptId', DomainReceipt.ReceiptId);
        PayloadObj.Add('roid', DomainReceipt.Roid);
        PayloadObj.Add('ledgerId', DomainReceipt.LedgerId);

        AddReceiptDateTime(
            PayloadObj, 'receiptDate', DomainReceipt.ReceiptDate);

        PayloadObj.Add('amount', DomainReceipt.Amount);
        PayloadObj.Add('bankCode', DomainReceipt.BankCode);

        AddReceiptDateTime(
            PayloadObj, 'chequeDate', DomainReceipt.ChequeDate);

        PayloadObj.Add('chequeNumber', DomainReceipt.ChequeNumber);
        PayloadObj.Add('drawerName', DomainReceipt.DrawerName);
        PayloadObj.Add('cash', DomainReceipt.Cash);
        PayloadObj.Add('details', DomainReceipt.Details);
        PayloadObj.Add('inWords', DomainReceipt.InWords);
        PayloadObj.Add('vatWithheld', DomainReceipt.VatWithheld);

        AddReceiptNullableText(
            PayloadObj, 'vatCertNo', DomainReceipt.VatCertNo);

        PayloadObj.Add('voided', DomainReceipt.Voided);

        AddReceiptDateTime(
            PayloadObj, 'voidDate', DomainReceipt.VoidDate);

        PayloadObj.Add('smsTransId', DomainReceipt.SmsTransId);
        PayloadObj.Add('mpesaTrxId', DomainReceipt.MpesaTrxId);
        PayloadObj.Add('mpesa', DomainReceipt.Mpesa);
        PayloadObj.Add('iPay', DomainReceipt.IPay);
        PayloadObj.Add('mpesaApiId', DomainReceipt.MpesaApiId);
        PayloadObj.Add('ncbaKes', DomainReceipt.NcbaKes);
        PayloadObj.Add('imKes', DomainReceipt.ImKes);
        PayloadObj.Add('imUsd', DomainReceipt.ImUsd);
        PayloadObj.Add('posted', DomainReceipt.Posted);
        PayloadObj.Add('postedBy', DomainReceipt."Posted By");

        AddReceiptDate(
            PayloadObj, 'postedDate', DomainReceipt."Posted Date");

        AddReceiptTime(
            PayloadObj, 'postedTime', DomainReceipt."Posted Time");

        PayloadObj.Add(
            'sourceReceiptNo', DomainReceipt."Source Receipt No.");

        PayloadObj.Add(
            'externalReceiptNo', DomainReceipt."External Receipt No.");

        // "Entry No." and "IsManual Entry" are not in the API payload.
    end;

    local procedure AddReceiptNullableText(
        var PayloadObj: JsonObject;
        PropertyName: Text;
        PropertyValue: Text)
    var
        JsonVal: JsonValue;
    begin
        if PropertyValue = '' then
            JsonVal.SetValueToNull()
        else
            JsonVal.SetValue(PropertyValue);

        PayloadObj.Add(PropertyName, JsonVal);
    end;

    local procedure AddReceiptDateTime(
        var PayloadObj: JsonObject;
        PropertyName: Text;
        PropertyValue: DateTime)
    var
        JsonVal: JsonValue;
    begin
        if PropertyValue = 0DT then
            JsonVal.SetValueToNull()
        else
            JsonVal.SetValue(PropertyValue);

        PayloadObj.Add(PropertyName, JsonVal);
    end;

    local procedure AddReceiptDate(
        var PayloadObj: JsonObject;
        PropertyName: Text;
        PropertyValue: Date)
    var
        JsonVal: JsonValue;
    begin
        if PropertyValue = 0D then
            JsonVal.SetValueToNull()
        else
            JsonVal.SetValue(PropertyValue);

        PayloadObj.Add(PropertyName, JsonVal);
    end;

    local procedure AddReceiptTime(
        var PayloadObj: JsonObject;
        PropertyName: Text;
        PropertyValue: Time)
    var
        JsonVal: JsonValue;
    begin
        if PropertyValue = 0T then
            JsonVal.SetValueToNull()
        else
            JsonVal.SetValue(
                Format(PropertyValue, 0, '<Hours24,2>:<Minutes,2>:<Seconds,2>'));

        PayloadObj.Add(PropertyName, JsonVal);
    end;

    local procedure SendDomainReceiptRequest(
        PayloadTxt: Text;
        var HttpStatus: Integer;
        var ResponseTxt: Text;
        var ErrTxt: Text)
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);
        HttpStatus := 0;

        Request.SetRequestUri(
            'http://41.90.10.39:8099/api/Transactions/receipt/save');
        Request.Method('POST');

        Content.WriteFrom(PayloadTxt);
        Content.GetHeaders(ContentHeaders);

        if ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Remove('Content-Type');

        ContentHeaders.Add('Content-Type', 'application/json');
        Request.Content(Content);

        if not Client.Send(Request, Response) then begin
            ErrTxt :=
                'HTTP send failed. Check connectivity and Allow HttpClient Requests.';
            exit;
        end;

        HttpStatus := Response.HttpStatusCode();

        if not Response.Content.ReadAs(ResponseTxt) then begin
            ErrTxt := StrSubstNo(
                'HTTP %1: Unable to read the response body.',
                HttpStatus);
            exit;
        end;

        if not Response.IsSuccessStatusCode() then
            ErrTxt := StrSubstNo(
                'HTTP %1: %2',
                HttpStatus,
                ResponseTxt);
    end;

    local procedure HandleDomainReceiptResponse(
        ResponseTxt: Text;
        LocalReceiptId: Integer;
        HttpStatus: Integer;
        ErrTxt: Text)
    var
        RootObj: JsonObject;
        JsonTok: JsonToken;
        JsonVal: JsonValue;
        WarningArray: JsonArray;
        WarningTok: JsonToken;
        Success: Boolean;
        ResultMessage: Text;
        WarningText: Text;
        ApiReceiptId: Integer;
        ExistingReceiptId: Integer;
    begin
        if not RootObj.ReadFrom(ResponseTxt) then
            Error(
                'Invalid API response for receipt %1. HTTP %2.\Response: %3',
                LocalReceiptId,
                HttpStatus,
                ResponseTxt);

        if not RootObj.Get('success', JsonTok) then
            Error('The API response does not contain "success".\%1', ResponseTxt);

        if not JsonTok.IsValue() then
            Error('Invalid "success" value.\%1', ResponseTxt);

        JsonVal := JsonTok.AsValue();
        if JsonVal.IsNull() then
            Error('The API returned a null "success" value.\%1', ResponseTxt);

        Success := JsonVal.AsBoolean();
        ResultMessage := GetReceiptResponseText(RootObj, 'message');

        if not Success then begin
            if RootObj.Get('existingReceiptId', JsonTok) then
                if JsonTok.IsValue() then
                    if not JsonTok.AsValue().IsNull() then begin
                        ExistingReceiptId := JsonTok.AsValue().AsInteger();

                        Error(
                            'Receipt %1 was not saved: %2\Existing API Receipt ID: %3.',
                            LocalReceiptId,
                            ResultMessage,
                            ExistingReceiptId);
                    end;

            Error(
                'Receipt %1 was not saved. HTTP %2.\%3',
                LocalReceiptId,
                HttpStatus,
                ResultMessage);
        end;

        // A success flag must also have a successful HTTP status.
        if (HttpStatus < 200) or (HttpStatus > 299) then
            Error(
                'The API returned success=true with an unsuccessful HTTP status.\%1',
                ErrTxt);

        if not RootObj.Get('receiptId', JsonTok) then
            Error(
                'The API returned success but no receiptId.\%1',
                ResponseTxt);

        if not JsonTok.IsValue() then
            Error('Invalid API receiptId.\%1', ResponseTxt);

        if JsonTok.AsValue().IsNull() then
            Error('The API returned a null receiptId.\%1', ResponseTxt);

        ApiReceiptId := JsonTok.AsValue().AsInteger();

        if RootObj.Get('warnings', JsonTok) then
            if JsonTok.IsArray() then begin
                WarningArray := JsonTok.AsArray();

                foreach WarningTok in WarningArray do
                    if WarningTok.IsValue() then
                        if not WarningTok.AsValue().IsNull() then begin
                            if WarningText <> '' then
                                WarningText += '\';

                            WarningText += WarningTok.AsValue().AsText();
                        end;
            end;

        if GuiAllowed then begin
            if WarningText <> '' then
                Message(
                    'Receipt %1 sent successfully.\%2\API Receipt ID: %3.\Warnings:\%4',
                    LocalReceiptId,
                    ResultMessage,
                    ApiReceiptId,
                    WarningText)
            else
                Message(
                    'Receipt %1 sent successfully.\%2\API Receipt ID: %3.',
                    LocalReceiptId,
                    ResultMessage,
                    ApiReceiptId);
        end;
    end;

    local procedure GetReceiptResponseText(
        RootObj: JsonObject;
        PropertyName: Text): Text
    var
        JsonTok: JsonToken;
    begin
        if not RootObj.Get(PropertyName, JsonTok) then
            exit('');

        if not JsonTok.IsValue() then
            exit('');

        if JsonTok.AsValue().IsNull() then
            exit('');

        exit(JsonTok.AsValue().AsText());
    end;

    procedure GetAdjustmentsByDateRange(StartDate: Date; EndDate: Date; PageSize: Integer): Text
    var
        RequestObj: JsonObject;
        Root: JsonObject;
        Data: JsonArray;
        Token: JsonToken;
        Row: JsonToken;
        JsonBody: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        PageNo: Integer;
        TotalPages: Integer;
        InsertedCount: Integer;
        UpdatedCount: Integer;
    begin
        if StartDate = 0D then
            Error('Start Date must be provided.');
        if EndDate = 0D then
            Error('End Date must be provided.');
        if EndDate < StartDate then
            Error('End Date must not be before Start Date.');
        if (PageSize < 1) or (PageSize > 500) then
            Error('Page Size must be between 1 and 500.');

        PageNo := 1;
        repeat
            Clear(RequestObj);
            Clear(Root);
            Clear(ResponseTxt);
            Clear(ErrTxt);
            Clear(HttpStatus);
            RequestObj.Add('startDate', Format(StartDate, 0, '<Year4>-<Month,2>-<Day,2>'));
            RequestObj.Add('endDate', Format(EndDate, 0, '<Year4>-<Month,2>-<Day,2>'));
            RequestObj.Add('page', PageNo);
            RequestObj.Add('pageSize', PageSize);
            RequestObj.WriteTo(JsonBody);
            SendPostRequest2('Transactions/adjustment/list', JsonBody, HttpStatus, ResponseTxt, ErrTxt);

            // The supplied API contract defines 404 as no matching adjustments.
            if HttpStatus = 404 then begin
                if PageNo = 1 then
                    exit('No adjustments found for the specified date range.');
                Error('Adjustment page %1 returned HTTP 404 after earlier pages. Please retry.', PageNo);
            end;
            if ErrTxt <> '' then
                Error('Adjustment retrieval failed on page %1. %2', PageNo, ErrTxt);
            if (HttpStatus < 200) or (HttpStatus > 299) then
                Error('Adjustment retrieval failed. HTTP %1. Response: %2', HttpStatus, ResponseTxt);
            if not Root.ReadFrom(ResponseTxt) then
                Error('The adjustment API returned invalid JSON.');
            if not Root.Get('success', Token) then
                Error('Missing success property in adjustment response.');
            if not Token.IsValue() then
                Error('Invalid success property.');
            if Token.AsValue().IsNull() then
                Error('Null success property.');
            if not Token.AsValue().AsBoolean() then
                Error('The adjustment API returned success=false. Response: %1', ResponseTxt);
            if AdjustmentInteger(Root, 'page') <> PageNo then
                Error('Unexpected page number in adjustment response. Expected %1.', PageNo);
            TotalPages := AdjustmentInteger(Root, 'totalPages');
            if TotalPages < 0 then
                Error('Invalid totalPages in adjustment response.');
            if not Root.Get('data', Token) then
                Error('Missing data property in adjustment response.');
            if not Token.IsArray() then
                Error('The adjustment data property is not an array.');
            Data := Token.AsArray();
            if (Data.Count() = 0) and (PageNo < TotalPages) then
                Error('Empty adjustment page %1 before the final page.', PageNo);
            foreach Row in Data do begin
                if not Row.IsObject() then
                    Error('Invalid adjustment row on page %1.', PageNo);
                ImportOneAdjustment(Row.AsObject(), InsertedCount, UpdatedCount);
            end;
            PageNo += 1;
        until PageNo > TotalPages;
        exit(StrSubstNo('Adjustment retrieval successful. Inserted=%1, Updated=%2.', InsertedCount, UpdatedCount));
    end;

    local procedure ImportOneAdjustment(Obj: JsonObject; var InsertedCount: Integer; var UpdatedCount: Integer)
    var
        Adjustment: Record "Domain Adjustment";
        AdjustmentId: BigInteger;
        IsNew: Boolean;
        TextValue: Text;
        Output: OutStream;
    begin
        AdjustmentId := AdjustmentBigInteger(Obj, 'adjustmentid');
        if AdjustmentId <= 0 then
            Error('Adjustment row has a missing or invalid adjustmentid.');
        IsNew := not Adjustment.Get(AdjustmentId);
        if IsNew then begin
            Adjustment.Init();
            Adjustment.AdjustmentId := AdjustmentId;
        end;
        TextValue := AdjustmentText(Obj, 'roid');
        if StrLen(TextValue) > MaxStrLen(Adjustment.Roid) then
            Error('ROID exceeds the supported length for adjustment %1.', AdjustmentId);
        Adjustment.Roid := TextValue;
        Adjustment.LedgerId := AdjustmentBigInteger(Obj, 'ledgerid');
        Adjustment.TransactionId := AdjustmentBigInteger(Obj, 'transactionid');
        Adjustment.AdjustmentDate := AdjustmentDateTime(Obj, 'adjustmentdate');
        Adjustment.Amount := AdjustmentDecimal(Obj, 'amount');
        TextValue := AdjustmentText(Obj, 'narration');
        if StrLen(TextValue) > MaxStrLen(Adjustment.Narration) then
            Error('Narration exceeds the supported length for adjustment %1.', AdjustmentId);
        Adjustment.Narration := TextValue;
        Clear(Adjustment.Details);
        TextValue := AdjustmentText(Obj, 'details');
        if TextValue <> '' then begin
            Adjustment.Details.CreateOutStream(Output, TextEncoding::UTF8);
            Output.WriteText(TextValue);
            Clear(Output);
        end;
        Clear(Adjustment.RawJsonPayload);
        Obj.WriteTo(TextValue);
        Adjustment.RawJsonPayload.CreateOutStream(Output, TextEncoding::UTF8);
        Output.WriteText(TextValue);
        Clear(Output);
        Adjustment.LastUpdatedAt := CurrentDateTime();
        Adjustment.LastUpdatedBy := CopyStr(UserId(), 1, MaxStrLen(Adjustment.LastUpdatedBy));
        if IsNew then begin
            Adjustment.Insert(true);
            InsertedCount += 1;
        end else begin
            Adjustment.Modify(true);
            UpdatedCount += 1;
        end;
    end;

    local procedure AdjustmentText(Obj: JsonObject; PropertyName: Text): Text
    var
        Token: JsonToken;
    begin
        if not Obj.Get(PropertyName, Token) then
            exit('');
        if not Token.IsValue() then
            Error('Property %1 must be a scalar value.', PropertyName);
        if Token.AsValue().IsNull() then
            exit('');
        exit(Token.AsValue().AsText());
    end;

    local procedure AdjustmentBigInteger(Obj: JsonObject; PropertyName: Text): BigInteger
    var
        ValueText: Text;
        Result: BigInteger;
    begin
        ValueText := AdjustmentText(Obj, PropertyName);
        if ValueText = '' then
            exit(0);
        if not Evaluate(Result, ValueText, 9) then
            Error('Invalid integer for %1: %2.', PropertyName, ValueText);
        exit(Result);
    end;

    local procedure AdjustmentInteger(Obj: JsonObject; PropertyName: Text): Integer
    var
        ValueText: Text;
        Result: Integer;
    begin
        ValueText := AdjustmentText(Obj, PropertyName);
        if ValueText = '' then
            Error('Missing pagination property %1.', PropertyName);
        if not Evaluate(Result, ValueText, 9) then
            Error('Invalid pagination property %1: %2.', PropertyName, ValueText);
        exit(Result);
    end;

    local procedure AdjustmentDecimal(Obj: JsonObject; PropertyName: Text): Decimal
    var
        ValueText: Text;
        Result: Decimal;
    begin
        ValueText := AdjustmentText(Obj, PropertyName);
        if ValueText = '' then
            Error('Missing numeric property %1.', PropertyName);
        if not Evaluate(Result, ValueText, 9) then
            Error('Invalid decimal for %1: %2.', PropertyName, ValueText);
        exit(Result);
    end;

    local procedure AdjustmentDateTime(Obj: JsonObject; PropertyName: Text): DateTime
    var
        ValueText: Text;
        Result: DateTime;
    begin
        ValueText := AdjustmentText(Obj, PropertyName);
        if ValueText = '' then
            exit(0DT);
        // CoCCA sample has microseconds and no timezone. BC stores milliseconds.
        // This implementation assumes timezone-less API timestamps represent UTC.
        if StrLen(ValueText) > 19 then
            if CopyStr(ValueText, 20, 1) = '.' then begin
                while (StrLen(ValueText) > 23) and
                      (CopyStr(ValueText, 24, 1) >= '0') and
                      (CopyStr(ValueText, 24, 1) <= '9') do
                    ValueText := DelStr(ValueText, 24, 1);
            end;
        if (StrPos(ValueText, 'Z') = 0) and
           (StrPos(CopyStr(ValueText, 20), '+') = 0) and
           (StrPos(CopyStr(ValueText, 20), '-') = 0) then
            ValueText += 'Z';
        if not Evaluate(Result, ValueText, 9) then
            Error('Invalid datetime for %1: %2.', PropertyName, ValueText);
        exit(Result);
    end;

    procedure GetRenewalsByDateRange(
    StartDate: Date;
    EndDate: Date;
    PageSize: Integer): Text
    var
        RequestObj: JsonObject;
        Root: JsonObject;
        Data: JsonArray;
        Token: JsonToken;
        Row: JsonToken;
        JsonBody: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
        PageNo: Integer;
        TotalPages: Integer;
        InsertedCount: Integer;
        UpdatedCount: Integer;
    begin
        if StartDate = 0D then
            Error('Start Date must be provided.');

        if EndDate = 0D then
            Error('End Date must be provided.');

        if EndDate < StartDate then
            Error('End Date must not be before Start Date.');

        // Whole-day selection: maximum 31 calendar days inclusive.
        if (EndDate - StartDate) >= 31 then
            Error('Date range must not exceed 31 calendar days inclusive.');

        if (PageSize < 1) or (PageSize > 200) then
            Error('Page Size must be between 1 and 200.');

        PageNo := 1;

        repeat
            Clear(RequestObj);
            Clear(Root);
            Clear(ResponseTxt);
            Clear(ErrTxt);
            Clear(HttpStatus);

            RequestObj.Add(
                'startDate',
                Format(StartDate, 0, '<Year4>-<Month,2>-<Day,2>') +
                'T00:00:00+03:00');

            RequestObj.Add(
                'endDate',
                Format(EndDate, 0, '<Year4>-<Month,2>-<Day,2>') +
                'T23:59:59.999+03:00');

            RequestObj.Add('page', PageNo);
            RequestObj.Add('pageSize', PageSize);
            RequestObj.WriteTo(JsonBody);

            SendPostRequest2(
                'Transactions/ledger/renewals-by-date',
                JsonBody,
                HttpStatus,
                ResponseTxt,
                ErrTxt);

            if HttpStatus = 404 then begin
                if PageNo = 1 then
                    exit('No renewals found for the specified date range.');

                Error(
                    'Renewal page %1 returned HTTP 404 after earlier pages. Please retry.',
                    PageNo);
            end;

            if ErrTxt <> '' then
                Error(
                    'Renewal retrieval failed on page %1. %2',
                    PageNo,
                    ErrTxt);

            if (HttpStatus < 200) or (HttpStatus > 299) then
                Error(
                    'Renewal retrieval failed. HTTP %1. Response: %2',
                    HttpStatus,
                    ResponseTxt);

            if not Root.ReadFrom(ResponseTxt) then
                Error('The renewal API returned invalid JSON.');

            // Present in the sample response.
            if Root.Get('success', Token) then begin
                if not Token.IsValue() then
                    Error('Invalid success property.');

                if Token.AsValue().IsNull() then
                    Error('Null success property.');

                if not Token.AsValue().AsBoolean() then
                    Error(
                        'The renewal API returned success=false. Response: %1',
                        ResponseTxt);
            end;

            if RenewalInteger(Root, 'page') <> PageNo then
                Error(
                    'Unexpected page number in renewal response. Expected %1.',
                    PageNo);

            TotalPages := RenewalInteger(Root, 'totalPages');

            if TotalPages < 0 then
                Error('Invalid totalPages in renewal response.');

            if not Root.Get('data', Token) then
                Error('Missing data property in renewal response.');

            if not Token.IsArray() then
                Error('The renewal data property is not an array.');

            Data := Token.AsArray();

            if (Data.Count() = 0) and (PageNo < TotalPages) then
                Error(
                    'Empty renewal page %1 before the final page.',
                    PageNo);

            foreach Row in Data do begin
                if not Row.IsObject() then
                    Error(
                        'Invalid renewal row on page %1.',
                        PageNo);

                ImportOneRenewal(
                    Row.AsObject(),
                    InsertedCount,
                    UpdatedCount);
            end;

            PageNo += 1;

        until PageNo > TotalPages;

        exit(
            StrSubstNo(
                'Renewal retrieval successful. Inserted=%1, Updated=%2.',
                InsertedCount,
                UpdatedCount));
    end;


    local procedure ImportOneRenewal(
        Obj: JsonObject;
        var InsertedCount: Integer;
        var UpdatedCount: Integer)
    var
        Renewal: Record "Domain Renewal";
        LedgerId: BigInteger;
        IsNew: Boolean;
        Token: JsonToken;
        RawJson: Text;
        Output: OutStream;
    begin
        LedgerId := RenewalBigInteger(Obj, 'ledgerId');

        if LedgerId <= 0 then
            Error('Renewal has a missing or invalid ledgerId.');

        IsNew := not Renewal.Get(LedgerId);

        if IsNew then begin
            Renewal.Init();
            Renewal.LedgerId := LedgerId;
        end;

        Renewal.DomainName :=
            RenewalCheckedText(
                Obj, 'domainName', MaxStrLen(Renewal.DomainName));

        Renewal.ClientRoid :=
            RenewalCheckedText(
                Obj, 'clientRoid', MaxStrLen(Renewal.ClientRoid));

        Renewal.Description :=
            RenewalCheckedText(
                Obj, 'description', MaxStrLen(Renewal.Description));

        Renewal.TransType :=
            RenewalCheckedText(
                Obj, 'transType', MaxStrLen(Renewal.TransType));

        Renewal.State :=
            RenewalCheckedText(
                Obj, 'state', MaxStrLen(Renewal.State));

        Renewal.BlockReason :=
            RenewalCheckedText(
                Obj, 'blockReason', MaxStrLen(Renewal.BlockReason));

        Renewal.Amount := RenewalDecimal(Obj, 'amount');
        Renewal.Total := RenewalDecimal(Obj, 'total');

        Renewal.Created :=
            RenewalDateTime(Obj, 'created');

        Renewal.PreviousExpiryDate :=
            RenewalDateTime(Obj, 'previousExpiryDate');

        Renewal.ExDate :=
            RenewalDateTime(Obj, 'exDate');

        Renewal.EligibleUntil :=
            RenewalDateTime(Obj, 'eligibleUntil');

        Renewal.WithinWindow :=
            RenewalBoolean(Obj, 'withinWindow');

        Renewal.CanReverse :=
            RenewalBoolean(Obj, 'canReverse');

        // Clear an old credit note value if the refreshed value is null.
        Clear(Renewal.CreditNoteId);
        Renewal.HasCreditNoteId := false;

        if Obj.Get('creditNoteId', Token) then begin
            if not Token.IsValue() then
                Error(
                    'Invalid creditNoteId for ledger %1.',
                    LedgerId);

            if not Token.AsValue().IsNull() then begin
                Renewal.CreditNoteId :=
                    RenewalBigInteger(Obj, 'creditNoteId');

                Renewal.HasCreditNoteId := true;
            end;
        end;

        Clear(Renewal.RawJsonPayload);
        Obj.WriteTo(RawJson);

        Renewal.RawJsonPayload.CreateOutStream(
            Output,
            TextEncoding::UTF8);

        Output.WriteText(RawJson);
        Clear(Output);

        Renewal.LastUpdatedAt := CurrentDateTime();

        Renewal.LastUpdatedBy :=
            CopyStr(
                UserId(),
                1,
                MaxStrLen(Renewal.LastUpdatedBy));

        if IsNew then begin
            Renewal.Insert(true);
            InsertedCount += 1;
        end else begin
            Renewal.Modify(true);
            UpdatedCount += 1;
        end;
    end;


    local procedure RenewalCheckedText(
        Obj: JsonObject;
        PropertyName: Text;
        MaximumLength: Integer): Text
    var
        ValueText: Text;
    begin
        ValueText := RenewalText(Obj, PropertyName);

        if StrLen(ValueText) > MaximumLength then
            Error(
                'Property %1 exceeds the supported length of %2.',
                PropertyName,
                MaximumLength);

        exit(ValueText);
    end;


    local procedure RenewalBoolean(
        Obj: JsonObject;
        PropertyName: Text): Boolean
    var
        Token: JsonToken;
    begin
        if not Obj.Get(PropertyName, Token) then
            Error(
                'Missing boolean property %1.',
                PropertyName);

        if not Token.IsValue() then
            Error(
                'Invalid boolean property %1.',
                PropertyName);

        if Token.AsValue().IsNull() then
            Error(
                'Null boolean property %1.',
                PropertyName);

        exit(Token.AsValue().AsBoolean());
    end;


    local procedure RenewalText(
        Obj: JsonObject;
        PropertyName: Text): Text
    var
        Token: JsonToken;
    begin
        if not Obj.Get(PropertyName, Token) then
            exit('');

        if not Token.IsValue() then
            Error(
                'Property %1 must be a scalar value.',
                PropertyName);

        if Token.AsValue().IsNull() then
            exit('');

        exit(Token.AsValue().AsText());
    end;


    local procedure RenewalBigInteger(
        Obj: JsonObject;
        PropertyName: Text): BigInteger
    var
        ValueText: Text;
        Result: BigInteger;
    begin
        ValueText := RenewalText(Obj, PropertyName);

        if ValueText = '' then
            exit(0);

        if not Evaluate(Result, ValueText, 9) then
            Error(
                'Invalid integer for %1: %2.',
                PropertyName,
                ValueText);

        exit(Result);
    end;


    local procedure RenewalInteger(
        Obj: JsonObject;
        PropertyName: Text): Integer
    var
        ValueText: Text;
        Result: Integer;
    begin
        ValueText := RenewalText(Obj, PropertyName);

        if ValueText = '' then
            Error(
                'Missing pagination property %1.',
                PropertyName);

        if not Evaluate(Result, ValueText, 9) then
            Error(
                'Invalid pagination property %1: %2.',
                PropertyName,
                ValueText);

        exit(Result);
    end;


    local procedure RenewalDecimal(
        Obj: JsonObject;
        PropertyName: Text): Decimal
    var
        ValueText: Text;
        Result: Decimal;
    begin
        ValueText := RenewalText(Obj, PropertyName);

        if ValueText = '' then
            Error(
                'Missing numeric property %1.',
                PropertyName);

        if not Evaluate(Result, ValueText, 9) then
            Error(
                'Invalid decimal for %1: %2.',
                PropertyName,
                ValueText);

        exit(Result);
    end;


    local procedure RenewalDateTime(
        Obj: JsonObject;
        PropertyName: Text): DateTime
    var
        ValueText: Text;
        Result: DateTime;
    begin
        ValueText := RenewalText(Obj, PropertyName);

        if ValueText = '' then
            exit(0DT);

        // Reduce fractional seconds to milliseconds.
        // Existing timezone offsets are preserved.
        if StrLen(ValueText) > 19 then
            if CopyStr(ValueText, 20, 1) = '.' then begin
                while (StrLen(ValueText) > 23) and
                      (CopyStr(ValueText, 24, 1) >= '0') and
                      (CopyStr(ValueText, 24, 1) <= '9') do
                    ValueText := DelStr(ValueText, 24, 1);
            end;

        // Assumption: offset-free API timestamps represent UTC.
        if (StrPos(ValueText, 'Z') = 0) and
           (StrPos(CopyStr(ValueText, 20), '+') = 0) and
           (StrPos(CopyStr(ValueText, 20), '-') = 0) then
            ValueText += 'Z';

        if not Evaluate(Result, ValueText, 9) then
            Error(
                'Invalid datetime for %1: %2.',
                PropertyName,
                ValueText);

        exit(Result);
    end;

    procedure NewCoCCAWriteRequest(
        Operation: Enum "CoCCA Write Operation";
        LedgerId: BigInteger)
    var
        Request: Record "CoCCA Write Request";
    begin
        Request.Init();
        Request.Operation := Operation;
        Request.Status := Request.Status::Draft;
        Request."Target Ledger ID" := LedgerId;
        Request."Posting DateTime" := CurrentDateTime();
        Request."Cheque DateTime" := CurrentDateTime();

        Request."Requested By" :=
            CopyStr(UserId(), 1, MaxStrLen(Request."Requested By"));

        Request.Insert(true);

        Request."BC Reference" :=
            StrSubstNo('BC-COCCA-%1', Request.SystemId);

        Request.Modify(true);
        Commit();

        Page.RunModal(Page::"CoCCA Write Request", Request);
    end;


    procedure PostCoCCAWriteRequest(EntryNo: Integer)
    var
        Request: Record "CoCCA Write Request";
        Payload: JsonObject;
        Endpoint: Text;
        PayloadText: Text;
        ResponseText: Text;
        TransportError: Text;
        ResultMessage: Text;
        HttpStatus: Integer;
        ResultState: Enum "CoCCA Write State";
        RemoteId: BigInteger;
        RemoteLedgerId: BigInteger;
        CreditNoteId: BigInteger;
        TransportOK: Boolean;
    begin
        Request.LockTable();
        Request.Get(EntryNo);

        if Request.Status <> Request.Status::Draft then
            Error(
                'Request %1 has already been attempted. Check its response/status; do not resubmit.',
                EntryNo);

        BuildCoCCAWritePayload(Request, Endpoint, Payload);
        Payload.WriteTo(PayloadText);

        WriteCoCCAAuditBlob(Request, PayloadText, 1);

        Request.Status := Request.Status::Sending;
        Request."Attempted At" := CurrentDateTime();
        Request."Last Message" :=
            'Attempt recorded. If interrupted, reconcile with CoCCA before taking further action.';

        Request.Modify(false);

        // Persist the attempt before the external write.
        // Call from the dedicated UI, not within a financial posting transaction.
        Commit();

        ClearLastError();

        TransportOK :=
            TryCoCCAWriteTransport(
                Endpoint,
                PayloadText,
                HttpStatus,
                ResponseText,
                TransportError);

        if not TransportOK then
            TransportError := GetLastErrorText();

        ResultState := ResultState::Unknown;
        ResultMessage :=
            'Outcome uncertain. Do not resend. Reconcile against CoCCA using the saved request.';

        if TransportOK then begin
            ClearLastError();

            if not TryParseCoCCAWriteResult(
                Request.Operation,
                Request."Target Ledger ID",
                HttpStatus,
                ResponseText,
                ResultState,
                RemoteId,
                RemoteLedgerId,
                CreditNoteId,
                ResultMessage)
            then begin
                ResultState := ResultState::Unknown;
                ResultMessage :=
                    'Response could not be verified: ' +
                    GetLastErrorText() +
                    ' Do not resend; reconcile with CoCCA.';
            end;
        end;

        if TransportError <> '' then
            ResultMessage += ' Transport: ' + TransportError;

        Request.LockTable();
        Request.Get(EntryNo);

        // A concurrent status check may already have confirmed completion.
        if (Request.Status = Request.Status::Succeeded) and
           ((ResultState = ResultState::Pending) or
            (ResultState = ResultState::Unknown))
        then begin
            ResultState := ResultState::Succeeded;

            if CreditNoteId = 0 then
                CreditNoteId := Request."Credit Note ID";

            ResultMessage :=
                'Completion was already confirmed by a status check. ' +
                ResultMessage;
        end;

        Request.Status := ResultState;
        Request."HTTP Status" := HttpStatus;
        Request."Remote Record ID" := RemoteId;
        Request."Remote Ledger ID" := RemoteLedgerId;
        Request."Credit Note ID" := CreditNoteId;

        Request."Last Message" :=
            CopyStr(ResultMessage, 1, MaxStrLen(Request."Last Message"));

        WriteCoCCAAuditBlob(Request, ResponseText, 2);

        Request.Modify(false);
        Commit();
    end;


    local procedure BuildCoCCAWritePayload(
        Request: Record "CoCCA Write Request";
        var Endpoint: Text;
        var Payload: JsonObject)
    var
        ChannelValue: Text;
    begin
        Clear(Payload);
        Request.TestField("Requested By");

        case Request.Operation of
            Request.Operation::Adjustment:
                begin
                    Request.TestField(Roid);

                    ValidateCoCCAIntId(
                        Request."Target Ledger ID",
                        'ledgerId',
                        false);

                    Request.TestField("Posting DateTime");
                    Request.TestField(Amount);
                    Request.TestField("Transaction ID");
                    Request.TestField(Narration);

                    Endpoint := 'Transactions/adjustment/save';

                    Payload.Add('roid', Request.Roid);
                    Payload.Add('ledgerId', Request."Target Ledger ID");

                    Payload.Add(
                        'adjustmentDate',
                        Format(Request."Posting DateTime", 0, 9));

                    Payload.Add('amount', Request.Amount);
                    Payload.Add('transactionId', Request."Transaction ID");
                    Payload.Add('narration', Request.Narration);
                    Payload.Add('details', Request.Details);
                    Payload.Add('requestedBy', Request."Requested By");
                end;

            Request.Operation::Receipt:
                begin
                    Request.TestField(Roid);
                    Request.TestField("Cheque DateTime");
                    Request.TestField("Cheque Number");

                    ValidateCoCCAIntId(
                        Request."Target Ledger ID",
                        'ledgerId',
                        true);

                    if Request."Payment Channel" =
                       Request."Payment Channel"::Mpesa
                    then
                        ValidateCoCCAIntId(
                            Request."Mpesa API ID",
                            'mpesaApiId',
                            false);

                    case Request."Payment Channel" of
                        Request."Payment Channel"::Mpesa:
                            ChannelValue := 'Mpesa';

                        Request."Payment Channel"::Ipay:
                            ChannelValue := 'Ipay';

                        Request."Payment Channel"::NCBAKES:
                            ChannelValue := 'ncba_kes';

                        Request."Payment Channel"::IMKES:
                            ChannelValue := 'im_kes';

                        Request."Payment Channel"::IMUSD:
                            ChannelValue := 'im_usd';

                        Request."Payment Channel"::Cash:
                            ChannelValue := '';
                    end;

                    Endpoint := 'Transactions/receipt/save';

                    Payload.Add('roid', Request.Roid);

                    if Request."Target Ledger ID" <> 0 then
                        Payload.Add(
                            'ledgerId',
                            Request."Target Ledger ID");

                    if Request."Posting DateTime" <> 0DT then
                        Payload.Add(
                            'receiptDate',
                            Format(Request."Posting DateTime", 0, 9));

                    Payload.Add('amount', Request.Amount);

                    Payload.Add(
                        'chequeDate',
                        Format(Request."Cheque DateTime", 0, 9));

                    Payload.Add('chequeNumber', Request."Cheque Number");

                    if ChannelValue <> '' then begin
                        Payload.Add('bankCode', ChannelValue);
                        Payload.Add('drawerName', ChannelValue);
                    end;

                    Payload.Add(
                        'cash',
                        Request."Payment Channel" =
                        Request."Payment Channel"::Cash);

                    Payload.Add(
                        'mpesa',
                        Request."Payment Channel" =
                        Request."Payment Channel"::Mpesa);

                    Payload.Add(
                        'iPay',
                        Request."Payment Channel" =
                        Request."Payment Channel"::Ipay);

                    Payload.Add(
                        'ncbaKes',
                        Request."Payment Channel" =
                        Request."Payment Channel"::NCBAKES);

                    Payload.Add(
                        'imKes',
                        Request."Payment Channel" =
                        Request."Payment Channel"::IMKES);

                    Payload.Add(
                        'imUsd',
                        Request."Payment Channel" =
                        Request."Payment Channel"::IMUSD);

                    if Request."Payment Channel" =
                       Request."Payment Channel"::Mpesa
                    then
                        Payload.Add(
                            'mpesaApiId',
                            Request."Mpesa API ID");

                    Payload.Add('details', Request.Details);
                    Payload.Add('inWords', Request."In Words");
                    Payload.Add('vatWithheld', Request."VAT Withheld");
                    Payload.Add('vatCertNo', Request."VAT Certificate No.");
                    Payload.Add('voided', Request.Voided);

                    if Request."Void DateTime" <> 0DT then
                        Payload.Add(
                            'voidDate',
                            Format(Request."Void DateTime", 0, 9));

                    if Request."SMS Transaction ID" <> '' then
                        Payload.Add(
                            'smsTransId',
                            Request."SMS Transaction ID");

                    if Request."Mpesa Transaction ID" <> '' then
                        Payload.Add(
                            'mpesaTrxId',
                            Request."Mpesa Transaction ID");
                end;

            Request.Operation::Reversal:
                begin
                    ValidateCoCCAIntId(
                        Request."Target Ledger ID",
                        'ledgerId',
                        false);

                    Endpoint := 'Transactions/ledger/reverse-renewal';

                    Payload.Add('ledgerId', Request."Target Ledger ID");
                    Payload.Add('requestedBy', Request."Requested By");

                    if Request."BC Reference" <> '' then
                        Payload.Add(
                            'bcReference',
                            Request."BC Reference");
                end;
        end;
    end;


    local procedure ValidateCoCCAIntId(
        Value: BigInteger;
        PropertyName: Text;
        AllowZero: Boolean)
    begin
        if AllowZero and (Value = 0) then
            exit;

        if (Value <= 0) or (Value > 2147483647) then
            Error(
                '%1 must be between 1 and 2147483647.',
                PropertyName);
    end;


    [TryFunction]
    local procedure TryCoCCAWriteTransport(
        Endpoint: Text;
        Payload: Text;
        var HttpStatus: Integer;
        var ResponseText: Text;
        var ErrText: Text)
    begin
        SendCoCCAWritePost(
            Endpoint,
            Payload,
            HttpStatus,
            ResponseText,
            ErrText);
    end;


    [TryFunction]
    local procedure TryParseCoCCAWriteResult(
        Operation: Enum "CoCCA Write Operation";
        TargetLedgerId: BigInteger;
        HttpStatus: Integer;
        ResponseText: Text;
        var ResultState: Enum "CoCCA Write State";
        var RemoteId: BigInteger;
        var RemoteLedgerId: BigInteger;
        var CreditNoteId: BigInteger;
        var ResultMessage: Text)
    var
        Root: JsonObject;
        RecordObj: JsonObject;
        StatusObj: JsonObject;
        Token: JsonToken;
        Success: Boolean;
        WarningText: Text;
        HasWarnings: Boolean;
        ReversalState: Text;
    begin
        if not Root.ReadFrom(ResponseText) then
            Error('Invalid JSON response.');

        if not Root.Get('success', Token) then
            Error('Missing success property.');

        Success := Token.AsValue().AsBoolean();
        ResultMessage := CoCCAWriteText(Root, 'message');
        ResultState := ResultState::Unknown;

        if (HttpStatus = 400) or
           (HttpStatus = 404) or
           (HttpStatus = 409)
        then begin
            if Success then
                Error('HTTP rejection conflicts with success=true.');

            ResultState := ResultState::Rejected;

            if ResultMessage = '' then
                ResultMessage :=
                    StrSubstNo(
                        'Request rejected. HTTP %1.',
                        HttpStatus);

            if HttpStatus = 409 then begin
                ResultMessage += ' Do not retry the same request.';

                if Operation = Operation::Receipt then
                    RemoteId :=
                        CoCCAWriteId(Root, 'existingReceiptId');

                if Operation = Operation::Reversal then
                    CreditNoteId :=
                        CoCCAWriteId(Root, 'creditNoteId');

                if Operation = Operation::Adjustment then
                    if Root.Get('existing', Token) then
                        if Token.IsObject() then begin
                            RecordObj := Token.AsObject();

                            RemoteId :=
                                CoCCAWriteId(
                                    RecordObj,
                                    'adjustmentid');

                            RemoteLedgerId :=
                                CoCCAWriteId(
                                    RecordObj,
                                    'ledgerid');
                        end;
            end;

            exit;
        end;

        if not Success then begin
            ResultMessage +=
                ' Outcome not confirmed. Do not resend; reconcile with CoCCA.';
            exit;
        end;

        if (HttpStatus = 202) and
           (Operation = Operation::Reversal)
        then begin
            ResultState := ResultState::Pending;
            ResultMessage :=
                'Reversal requested. Use Check Reversal Status until completed; do not send the reversal again.';
            exit;
        end;

        if HttpStatus <> 200 then begin
            ResultMessage +=
                StrSubstNo(
                    ' Unexpected HTTP %1. Do not resend; reconcile with CoCCA.',
                    HttpStatus);
            exit;
        end;

        case Operation of
            Operation::Adjustment:
                begin
                    if not Root.Get('record', Token) then
                        Error('Missing adjustment record.');

                    RecordObj := Token.AsObject();

                    RemoteId :=
                        CoCCAWriteId(RecordObj, 'adjustmentid');

                    RemoteLedgerId :=
                        CoCCAWriteId(RecordObj, 'ledgerid');

                    if (RemoteId <= 0) or (RemoteLedgerId <= 0) then
                        Error(
                            'Missing adjustment ID or returned ledger ID.');
                end;

            Operation::Receipt:
                begin
                    RemoteId := CoCCAWriteId(Root, 'receiptId');

                    if RemoteId <= 0 then
                        Error('Missing receipt ID.');

                    if Root.Get('warnings', Token) then begin
                        HasWarnings := true;

                        if Token.IsValue() then
                            HasWarnings :=
                                not Token.AsValue().IsNull();

                        if HasWarnings then begin
                            Token.WriteTo(WarningText);
                            ResultMessage +=
                                ' Warnings: ' + WarningText;
                        end;
                    end;
                end;

            Operation::Reversal:
                begin
                    if not Root.Get('status', Token) then
                        Error('Missing reversal status.');

                    StatusObj := Token.AsObject();

                    ParseCoCCAReversalStatus(
                        StatusObj,
                        TargetLedgerId,
                        ReversalState,
                        CreditNoteId);

                    if ReversalState <> 'completed' then
                        Error(
                            'HTTP 200 reversal response is not completed.');

                    ResultMessage :=
                        StrSubstNo(
                            'Reversal completed. Credit note %1.',
                            CreditNoteId);
                end;
        end;

        ResultState := ResultState::Succeeded;

        if ResultMessage = '' then
            ResultMessage :=
                'CoCCA request completed successfully.';
    end;


    procedure CheckCoCCAReversalStatus(EntryNo: Integer)
    var
        Request: Record "CoCCA Write Request";
        Payload: JsonObject;
        PayloadText: Text;
        ResponseText: Text;
        ErrText: Text;
        MessageText: Text;
        HttpStatus: Integer;
        CreditNoteId: BigInteger;
        StateText: Text;
        OK: Boolean;
    begin
        Request.Get(EntryNo);

        if Request.Operation <> Request.Operation::Reversal then
            Error('This is not a renewal reversal request.');

        if Request.Status = Request.Status::Draft then
            Error('Submit the reversal request first.');

        Payload.Add('ledgerId', Request."Target Ledger ID");
        Payload.WriteTo(PayloadText);

        ClearLastError();

        OK :=
            TryCoCCAWriteTransport(
                'Transactions/ledger/reversal-status',
                PayloadText,
                HttpStatus,
                ResponseText,
                ErrText);

        if not OK then
            ErrText := GetLastErrorText();

        if OK and (HttpStatus = 200) then begin
            ClearLastError();

            OK :=
                TryParseCoCCAStatusResponse(
                    ResponseText,
                    Request."Target Ledger ID",
                    StateText,
                    CreditNoteId);

            if not OK then
                ErrText := GetLastErrorText();
        end else
            OK := false;

        Request.LockTable();
        Request.Get(EntryNo);

        if OK then begin
            case StateText of
                'completed':
                    begin
                        Request.Status := Request.Status::Succeeded;
                        Request."Credit Note ID" := CreditNoteId;

                        MessageText :=
                            StrSubstNo(
                                'Reversal completed. Credit note %1.',
                                CreditNoteId);
                    end;

                'pending':
                    begin
                        if Request.Status <> Request.Status::Succeeded then
                            Request.Status := Request.Status::Pending;

                        MessageText :=
                            'Reversal pending. Check status again later; do not resubmit.';
                    end;

                'none':
                    MessageText :=
                        'Server reports no reversal. No automatic resubmission is permitted; reconcile before creating any new request.';
            end;
        end else
            MessageText :=
                StrSubstNo(
                    'Status check failed. HTTP %1. %2 Response: %3',
                    HttpStatus,
                    ErrText,
                    ResponseText);

        Request."Status Checked At" := CurrentDateTime();
        Request."Status HTTP Code" := HttpStatus;

        Request."Status Message" :=
            CopyStr(
                MessageText,
                1,
                MaxStrLen(Request."Status Message"));

        WriteCoCCAAuditBlob(Request, ResponseText, 3);

        Request.Modify(false);
        Commit();
    end;


    [TryFunction]
    local procedure TryParseCoCCAStatusResponse(
        ResponseText: Text;
        TargetLedgerId: BigInteger;
        var StateText: Text;
        var CreditNoteId: BigInteger)
    var
        Root: JsonObject;
        Token: JsonToken;
    begin
        if not Root.ReadFrom(ResponseText) then
            Error('Invalid status JSON.');

        if not Root.Get('success', Token) then
            Error('Missing success property.');

        if not Token.AsValue().AsBoolean() then
            Error('Status API returned success=false.');

        if not Root.Get('status', Token) then
            Error('Missing status object.');

        ParseCoCCAReversalStatus(
            Token.AsObject(),
            TargetLedgerId,
            StateText,
            CreditNoteId);
    end;


    local procedure ParseCoCCAReversalStatus(
        StatusObj: JsonObject;
        TargetLedgerId: BigInteger;
        var StateText: Text;
        var CreditNoteId: BigInteger)
    var
        Token: JsonToken;
        CreditNote: JsonObject;
    begin
        if CoCCAWriteId(StatusObj, 'ledgerId') <> TargetLedgerId then
            Error(
                'Reversal status ledgerId does not match the requested renewal.');

        StateText := CoCCAWriteText(StatusObj, 'state');

        if not (StateText in ['none', 'pending', 'completed']) then
            Error('Unexpected reversal status: %1.', StateText);

        CreditNoteId := 0;

        if StateText <> 'completed' then
            exit;

        if not StatusObj.Get('creditNote', Token) then
            Error('Completed reversal has no credit note.');

        CreditNote := Token.AsObject();
        CreditNoteId := CoCCAWriteId(CreditNote, 'id');

        if CreditNoteId <= 0 then
            Error('Missing credit note ID.');

        if CoCCAWriteId(CreditNote, 'refundForId') <> TargetLedgerId then
            Error(
                'Credit note refundForId does not match the original renewal.');

        // Credit note JSON is read-only and is never sent for reversal.
    end;


    local procedure CoCCAWriteText(
        Obj: JsonObject;
        PropertyName: Text): Text
    var
        Token: JsonToken;
    begin
        if not Obj.Get(PropertyName, Token) then
            exit('');

        if not Token.IsValue() then
            Error('Invalid scalar property %1.', PropertyName);

        if Token.AsValue().IsNull() then
            exit('');

        exit(Token.AsValue().AsText());
    end;


    local procedure CoCCAWriteId(
        Obj: JsonObject;
        PropertyName: Text): BigInteger
    var
        ValueText: Text;
        Result: BigInteger;
    begin
        ValueText := CoCCAWriteText(Obj, PropertyName);

        if ValueText = '' then
            exit(0);

        if not Evaluate(Result, ValueText, 9) then
            Error(
                'Invalid ID %1: %2.',
                PropertyName,
                ValueText);

        exit(Result);
    end;


    local procedure WriteCoCCAAuditBlob(
        var Request: Record "CoCCA Write Request";
        ValueText: Text;
        BlobKind: Integer)
    var
        Output: OutStream;
    begin
        case BlobKind of
            1:
                begin
                    Clear(Request."Request Payload");

                    Request."Request Payload".CreateOutStream(
                        Output,
                        TextEncoding::UTF8);
                end;

            2:
                begin
                    Clear(Request."Response Payload");

                    Request."Response Payload".CreateOutStream(
                        Output,
                        TextEncoding::UTF8);
                end;

            3:
                begin
                    Clear(Request."Status Response");

                    Request."Status Response".CreateOutStream(
                        Output,
                        TextEncoding::UTF8);
                end;

            else
                Error('Invalid audit BLOB kind.');
        end;

        Output.WriteText(ValueText);
    end;


    procedure DownloadCoCCAWriteAudit(EntryNo: Integer)
    var
        Request: Record "CoCCA Write Request";
        TempBuffer: Record "CoCCA Write Request" temporary;
        Root: JsonObject;
        Input: InStream;
        Output: OutStream;
        ValueText: Text;
        FileName: Text;
    begin
        Request.Get(EntryNo);

        Request.CalcFields(
            "Request Payload",
            "Response Payload",
            "Status Response");

        Root.Add('entryNo', EntryNo);
        Root.Add('operation', Format(Request.Operation));
        Root.Add('state', Format(Request.Status));
        Root.Add('httpStatus', Request."HTTP Status");
        Root.Add('message', Request."Last Message");
        Root.Add('statusHttpCode', Request."Status HTTP Code");
        Root.Add('statusMessage', Request."Status Message");

        Clear(ValueText);

        if Request."Request Payload".HasValue() then begin
            Request."Request Payload".CreateInStream(
                Input,
                TextEncoding::UTF8);

            Input.ReadText(ValueText);
        end;

        Root.Add('requestJson', ValueText);

        Clear(ValueText);

        if Request."Response Payload".HasValue() then begin
            Request."Response Payload".CreateInStream(
                Input,
                TextEncoding::UTF8);

            Input.ReadText(ValueText);
        end;

        Root.Add('responseJson', ValueText);

        Clear(ValueText);

        if Request."Status Response".HasValue() then begin
            Request."Status Response".CreateInStream(
                Input,
                TextEncoding::UTF8);

            Input.ReadText(ValueText);
        end;

        Root.Add('latestStatusJson', ValueText);
        Root.WriteTo(ValueText);

        TempBuffer.Init();

        TempBuffer."Request Payload".CreateOutStream(
            Output,
            TextEncoding::UTF8);

        Output.WriteText(ValueText);
        Clear(Output);

        TempBuffer."Request Payload".CreateInStream(
            Input,
            TextEncoding::UTF8);

        FileName :=
            StrSubstNo('CoCCA-Request-%1.json', EntryNo);

        DownloadFromStream(Input, '', '', '', FileName);
    end;


    local procedure SendCoCCAWritePost(
        Endpoint: Text;
        Payload: Text;
        var HttpStatus: Integer;
        var ResponseText: Text;
        var ErrText: Text)
    var
        Client: HttpClient;
        HttpRequest: HttpRequestMessage;
        HttpResponse: HttpResponseMessage;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
    begin
        Clear(HttpStatus);
        Clear(ResponseText);
        Clear(ErrText);

        Content.WriteFrom(Payload);
        Content.GetHeaders(ContentHeaders);

        if ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Remove('Content-Type');

        ContentHeaders.Add(
            'Content-Type',
            'application/json; charset=utf-8');

        HttpRequest.Method := 'POST';

        HttpRequest.SetRequestUri(
            GetCoCCAWriteBaseUrl() + Endpoint);

        HttpRequest.Content := Content;

        Client.Timeout(60000);

        // Send once only; do not automatically retry registry writes.
        if not Client.Send(HttpRequest, HttpResponse) then begin
            ErrText :=
                'HTTP request could not be sent. The remote outcome may be unknown.';
            exit;
        end;

        HttpStatus := HttpResponse.HttpStatusCode();

        if not HttpResponse.Content.ReadAs(ResponseText) then begin
            ErrText := 'HTTP response body could not be read.';
            exit;
        end;

        if not HttpResponse.IsSuccessStatusCode() then
            ErrText :=
                StrSubstNo(
                    'HTTP %1: %2',
                    HttpStatus,
                    HttpResponse.ReasonPhrase());
    end;


    local procedure GetCoCCAWriteBaseUrl(): Text
    begin
        exit('http://41.90.10.39:8099/api/');
    end;
}
