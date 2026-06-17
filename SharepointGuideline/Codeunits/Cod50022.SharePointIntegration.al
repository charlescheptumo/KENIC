codeunit 50026 "SharePoint Integration"
{

    internal procedure GetClientId(): Text
    begin
        exit(ClientIdTxt);
    end;

    internal procedure GetClientSecret(): Text
    begin
        exit(ClientSecretTxt);
    end;

    internal procedure GetApiGraphMe(): Text
    begin
        exit(ApiGraphMeUrlTxt);
    end;

    internal procedure GetRedirectURL(): Text
    begin
        exit(RedirectURLText);
    end;

    internal procedure GetAadTenantId(): Text
    var
        AzureADTenant: Codeunit "Azure AD Tenant";
    begin
        exit(AzureADTenant.GetAadTenantId());
    end;

    internal procedure GetOAuthAuthorityUrl(): text
    begin
        exit(OAuthAuthorityUrlLabel + GetAadTenantId() + '/oauth2/v2.0/authorize');
    end;

    internal procedure GetApiListCompanies(): text
    var
        EnviromentMgt: Codeunit "Environment Information";
    begin
        exit(StrSubstNo(ApiListCompaniesTxt, ApiBCUrl, GetAadTenantId(), EnviromentMgt.GetEnvironmentName()));
    end;

    internal procedure GetResourceURLForApiGraph(): text
    begin
        exit(ApiGraphUrlTxt);
    end;

    internal procedure GetResourceURLForApiBC(): text
    begin
        exit(ApiBCUrl);
    end;





    procedure CreateRequest(RequestUrl: Text; AccessToken: Text): Text
    var
        TempBlob: Codeunit "Temp Blob";
        IsSuccessful: Boolean;
        HttpClient: HttpClient;
        MailContent: HttpContent;
        MailContentHeaders: HttpHeaders;
        RequestHeaders: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        ResponseStream: InStream;
        StatusCode: Integer;
        JObject: JsonObject;
        APICallResponseMessage: Text;
    begin
        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Authorization', 'Bearer ' + AccessToken);
        RequestMessage.SetRequestUri(RequestUrl);
        RequestMessage.Method('GET');

        Clear(TempBlob);
        TempBlob.CreateInStream(ResponseStream);

        IsSuccessful := HttpClient.Send(RequestMessage, ResponseMessage);

        if not IsSuccessful then
            exit('An API call with the provided header has failed.');

        if not ResponseMessage.IsSuccessStatusCode() then begin
            StatusCode := ResponseMessage.HttpStatusCode();
            exit('The request has failed with status code ' + Format(StatusCode));
        end;

        if not ResponseMessage.Content().ReadAs(ResponseStream) then
            exit('The response message cannot be processed.');

        if not JObject.ReadFrom(ResponseStream) then
            exit('Cannot read JSON response.');

        JObject.WriteTo(APICallResponseMessage);
        APICallResponseMessage := APICallResponseMessage.Replace(',', '\');

        exit(APICallResponseMessage);
    end;

    procedure GetRedirectURI()
    begin
        // AzureGraph.GetCurrentUser();
    end;

    var
        ApiBCUrl: Label 'https://api.businesscentral.dynamics.com/', Locked = true;
        ApiGraphMeUrlTxt: Label 'https://graph.microsoft.com/v1.0/me', Locked = true;
        ApiGraphUrlTxt: Label 'https://graph.microsoft.com/', Locked = true;
        ApiListCompaniesTxt: Label '%1v2.0/%2/%3/api/beta/companies', Locked = true;
        ClientIdTxt: Label 'a637f507-612d-4eb9-xxxx-xxxxxxxxxxxx', Locked = true;
        ClientSecretTxt: Label 'v5S8Q~~egylz-xxxxxxxxxxxxxxxxxxxxxxxxxxx', Locked = true;
        OAuthAuthorityUrlLabel: Label 'https://login.microsoftonline.com/', Locked = true;
        // RedirectURLText: Label 'https://businesscentral.dynamics.com/OAuthLanding.htm', Locked = true;
        // RedirectURLText: Label 'https://ecs-adak-0002:48900/BC230/OAuthLanding.htm', Locked = true;
        // RedirectURLText: Label 'http://ecs-adak-0002:48900/BC230/OAuthLanding.htm', Locked = true;
        // RedirectURLText: Label 'http://localhost:8080/BC230/SignIn', Locked = true;
        RedirectURLText: Label 'http://localhost:8080/BC230/OAuthLanding.htm', Locked = true;
        AzureGraph: Codeunit "Azure AD Graph";
}
