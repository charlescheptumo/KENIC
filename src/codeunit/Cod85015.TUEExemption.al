codeunit 85015 "TUE Exemption"
{
    trigger onRun()
    begin

    end;

    var
        TempBlob: Codeunit "Temp Blob";
        ICDcoderesponse: Text;
        Mimetype: Text;
        TUESetup: Record "TUE Setup";
        ResultJobj: JsonObject;
        ResultJtoken: JsonToken;
        "ICD code": Text;
        ResultJtoken2: JsonToken;
        Result: Text;
        JsonObj: JsonObject;
        ResponseD: HttpResponseMessage;
        Response: Text;
        FileName: Text;
        Contents: HttpContent;
        Headers: HttpHeaders;
        ClientD: HttpClient;
        ResponseMessage: HttpResponseMessage;
        httpRequest: HttpRequestMessage;
        url: Text;
        SearchTerm: Text;

    procedure GetDiagnosis1(): Text[200]
    begin
        Contents.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        // Headers.Remove('Charset');
        Headers.Add('Content-Type', 'application/json');
        // Headers.Add('Charset', 'utf-8');
        // Headers.Add('id', '257068234');
        Headers.Add('API-Version', 'v2');
        Headers.Add('Accept-Language', 'en');
        Headers.Add('ClientId', TUESetup."WHO ICD API Client ID");
        Headers.Add('ClientSecret', TUESetup."WHO ICD API Client Secret");
        Headers.Add('Scope', 'icdapi_access');
        Headers.Add('GrantType', 'client_credentials');
        httpRequest.Method('GET');
        url := TUESetup."WHO ICD API Url" + Format(1);
        ClientD.Clear();
        if ClientD.Get(url, ResponseD) then begin
            if ClientD.Send(httpRequest, ResponseD) then begin
                ResponseD.Content.ReadAs(Response);

                if not ResponseD.IsSuccessStatusCode then
                    Error(Response);
                ResultJobj.ReadFrom(Response);
                if ResultJobj.Get('id', ResultJtoken) then
                    "ICD code" := ResultJtoken.AsValue().AsText();
                // exit("ICD code");

                If ResponseMessage.HttpStatusCode <> 200 then
                    Error('The request returned with the following error:\' +
                        'Status Code : %1\' +
                        'Description: %2',
                        ResponseMessage.HttpStatusCode,
                        ResponseMessage.ReasonPhrase);
            end;

        end
        else
            Error('Request failed');
    end;

    procedure GetDiagnosis(input: Text[200])
    var

    begin
        TUESetup.Get();
        // JsonObj.Remove('input');
        //   JsonObj.Add('input', input);
        //JsonObj.WriteTo(Result);
        // Contents.Clear();
        Contents.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        // Headers.Remove('Charset');
        Headers.Add('Content-Type', 'application/json');
        // Headers.Add('Charset', 'utf-8');
        // Headers.Add('id', '257068234');
        Headers.Add('API-Version', 'v2');
        Headers.Add('Accept-Language', 'en');
        Headers.Add('ClientId', TUESetup."WHO ICD API Client ID");
        Headers.Add('ClientSecret', TUESetup."WHO ICD API Client Secret");
        // Headers.Add('Scope', 'icdapi_access');
        // Headers.Add('GrantType', 'client_credentials');

        //Contents.WriteFrom(Result);

        // httpRequest.Content(Contents);
        httpRequest.Method('GET');
        url := TUESetup."WHO ICD API Url" + input;
        ClientD.Clear();
        //ClientD.SetBaseAddress(url);

        //ClientD.
        // httpRequest.GetRequestUri

        if ClientD.Get(url, ResponseD) then begin
            if ClientD.Send(httpRequest, ResponseD) then begin
                ResponseD.Content.ReadAs(Response);

                if not ResponseD.IsSuccessStatusCode then
                    Error(Response);
                ResultJobj.ReadFrom(Response);
                if ResultJobj.Get('id', ResultJtoken) then
                    "ICD code" := ResultJtoken.AsValue().AsText();
                // exit("ICD code");

                If ResponseMessage.HttpStatusCode <> 200 then
                    Error('The request returned with the following error:\' +
                        'Status Code : %1\' +
                        'Description: %2',
                        ResponseMessage.HttpStatusCode,
                        ResponseMessage.ReasonPhrase);
            end;

        end
        else
            Error('Request failed');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CustCont-Update", 'OnBeforeInsertNewContact', '', false, false)]
    local procedure OnBeforeInsertNewContact(var Customer: Record Customer; LocalCall: Boolean; var IsHandled: Boolean)
    begin
        if Customer."Customer Type" = Customer."Customer Type"::Athlete then
            IsHandled := true;
    end;

}
