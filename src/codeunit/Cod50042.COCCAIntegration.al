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
}
