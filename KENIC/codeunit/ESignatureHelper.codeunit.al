codeunit 50050 "Adobe Sign Integration"
{
    procedure SendAgreement(AgreementName: Text; AgreementMessage: Text; DocumentNumber: Code[20]; var ESignLine: Record "ESign Line"; var RecordLink: Record "Record Link"): Text
    var
        JsonBody: Text;
        ResponseTxt: Text;
        ErrTxt: Text;
        HttpStatus: Integer;
    begin
        JsonBody := BuildAgreementJson(AgreementName, AgreementMessage, DocumentNumber, ESignLine, RecordLink);

        SendPostRequest('Agreement/from-sharepoint', JsonBody, HttpStatus, ResponseTxt, ErrTxt);

        //Message('Generated JSON:\%1', JsonBody);

        if ErrTxt <> '' then
            Error(ErrTxt);

        exit(ResponseTxt);
    end;

    local procedure BuildAgreementJson(AgreementName: Text; AgreementMessage: Text; DocumentNumber: Code[20]; var ESignLine: Record "ESign Line"; var RecordLink: Record "Record Link"): Text
    var
        Json: Text;
        SignersJson: Text;
        UrlsJson: Text;
        FirstSigner: Boolean;
        FirstUrl: Boolean;
        OrderNo: Integer;
    begin

        SignersJson := '[';
        FirstSigner := true;
        OrderNo := 1;

        if ESignLine.FindSet() then
            repeat

                if not FirstSigner then
                    SignersJson += ',';

                SignersJson +=
                    '{' +
                    '"email":"' + ESignLine.Email + '",' +
                    '"name":"' + ESignLine."Board Member Name" + '",' +
                    '"order":' + Format(OrderNo) +
                    '}';

                FirstSigner := false;
                OrderNo += 1;

            until ESignLine.Next() = 0;

        SignersJson += ']';

        UrlsJson := '[';
        FirstUrl := true;

        if RecordLink.FindSet() then
            repeat

                if not FirstUrl then
                    UrlsJson += ',';

                UrlsJson += '"' + RecordLink.URL1 + '"';

                FirstUrl := false;

            until RecordLink.Next() = 0;

        UrlsJson += ']';

        Json :=
        '{' +
        '"name":"' + AgreementName + '",' +
        '"message":"' + AgreementMessage + '",' +
        '"documentNumber":"' + DocumentNumber + '",' +
        '"signers":' + SignersJson + ',' +
        '"sharePointUrls":' + UrlsJson +
        '}';

        exit(Json);
    end;

    local procedure SendPostRequest(Endpoint: Text; JsonBody: Text; var HttpStatus: Integer; var ResponseTxt: Text; var ErrTxt: Text)
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
    begin
        Clear(ResponseTxt);
        Clear(ErrTxt);

        Content.WriteFrom(JsonBody);

        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        Request.Method('POST');
        Request.SetRequestUri('http://41.90.10.39:9057/api/' + Endpoint);
        Request.Content := Content;

        Request.GetHeaders(Headers);
        Headers.Add('Accept', 'application/json');

        if not Client.Send(Request, Response) then begin
            ErrTxt := 'Unable to contact Adobe API.';
            exit;
        end;

        HttpStatus := Response.HttpStatusCode();

        Response.Content.ReadAs(ResponseTxt);

        if not Response.IsSuccessStatusCode() then
            ErrTxt := StrSubstNo('HTTP %1 : %2', HttpStatus, ResponseTxt);
    end;
}