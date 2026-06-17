namespace KICD.KICD;
using System.Security.Authentication;

page 50300 OAuth2Dialog2
{
 ApplicationArea = All;
    Caption = 'OAuth2Dialog2';
    PageType = Card;

    layout
    {
        area(Content)
        {
            group(BodyGroup)
            {
                InstructionalText = 'A sign in window is open. To continue, pick the account you want to use and accept the conditions. This message will close when you are done.';
                ShowCaption = false;
            }
            usercontrol(OAuthIntegration; OAuthControlAddIn)
            {
                ApplicationArea = All;
                trigger AuthorizationCodeRetrieved(code: Text)
                var
                    StateOut: Text;
                    AdminConsentTxt: Text;
                    AuthorizationCode: Text;
                    CodeOut: Text;
                    AdminConsent: Text;
                    AuthorizationCodeErr: Label 'The OAuth2 authentication code retrieved is empty.', Locked = true;
                begin
                    // OAuth2Impl.GetOAuthProperties(code, AuthCode, StateOut, AdminConsentTxt);
                    //GetOAuthProperties
                    if AuthorizationCode = '' then begin
                        Session.LogMessage('0000C1V', AuthorizationCodeErr, Verbosity::Error, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', Oauth2CategoryLbl);
                        exit;
                    end;

                    if AuthorizationCode.EndsWith('#') then
                        AuthorizationCode := CopyStr(AuthorizationCode, 1, StrLen(AuthorizationCode) - 1);

                    CodeOut := GetPropertyFromCode(AuthorizationCode, 'code');
                    StateOut := GetPropertyFromCode(AuthorizationCode, 'state');
                    AdminConsent := GetPropertyFromCode(AuthorizationCode, 'admin_consent');
                    //GetOAuthProperties

                    if UpperCase(AdminConsentTxt) = 'TRUE' then
                        HasAdminConsentSucceded := true
                    else
                        HasAdminConsentSucceded := false;

                    if State = '' then begin
                        Session.LogMessage('0000BFH', MissingStateErr, Verbosity::Error, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', Oauth2CategoryLbl);
                        AuthError := AuthError + NoStateErr;
                    end else
                        if StateOut <> State then begin
                            Session.LogMessage('0000BFI', MismatchingStateErr, Verbosity::Error, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', Oauth2CategoryLbl);
                            AuthError := AuthError + NotMatchingStateErr;
                        end;

                    CurrPage.Close();
                end;

                trigger AuthorizationErrorOccurred(error: Text; desc: Text);
                begin
                    Session.LogMessage('0000BFD', StrSubstNo(OauthFailErrMsg, error, desc), Verbosity::Error, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', Oauth2CategoryLbl);
                    AuthError := StrSubstNo(AuthCodeErrorLbl, error, desc);
                    CurrPage.Close();
                end;

                trigger ControlAddInReady();
                begin
                    Session.LogMessage('0000C1U', OAuthCodeStartMsg, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'Category', Oauth2CategoryLbl);
                    CurrPage.OAuthIntegration.StartAuthorization(OAuthRequestUrl);
                end;
            }
        }
    }

    procedure SetOAuth2Properties(AuthRequestUrl: Text; AuthInitialState: Text)
    begin
        OAuthRequestUrl := AuthRequestUrl;
        State := AuthInitialState;
    end;

    procedure GetAuthCode(): Text
    begin
        exit(AuthCode);
    end;

    procedure GetAuthError(): Text
    begin
        exit(AuthError);
    end;

    procedure GetGrantConsentSuccess(): Boolean
    begin
        exit(HasAdminConsentSucceded);
    end;

    local procedure GetPropertyFromCode(CodeTxt: Text; Property: Text): Text
    var
        PosProperty: Integer;
        PosValue: Integer;
        PosEnd: Integer;
    begin
        PosProperty := StrPos(CodeTxt, Property);
        if PosProperty = 0 then
            exit('');
        PosValue := PosProperty + StrPos(CopyStr(CodeTxt, PosProperty), '=');
        PosEnd := PosValue + StrPos(CopyStr(CodeTxt, PosValue), '&');

        if PosEnd = PosValue then
            exit(CopyStr(CodeTxt, PosValue, StrLen(CodeTxt) - 1));
        exit(CopyStr(CodeTxt, PosValue, PosEnd - PosValue - 1));
    end;

    var
        // OAuth2Impl: Codeunit OAuth2Impl;
        OAuthRequestUrl: Text;
        State: Text;
        AuthCode: Text;
        AuthError: Text;
        HasAdminConsentSucceded: Boolean;
        Oauth2CategoryLbl: Label 'OAuth2', Locked = true;
        MissingStateErr: Label 'The returned authorization code is missing information about the returned state.', Locked = true;
        MismatchingStateErr: Label 'The authroization code returned state is missmatching the expected state value.', Locked = true;
        OauthFailErrMsg: Label 'Error: %1 ; Description: %2.', Comment = '%1 = OAuth error message ; %2 = description of OAuth failure error message', Locked = true;
        OAuthCodeStartMsg: Label 'The authorization code flow grant process has started.', Locked = true;
        NoStateErr: Label 'No state has been returned';
        NotMatchingStateErr: Label 'The state parameter value does not match.';
        AuthCodeErrorLbl: Label 'Error: %1, description: %2', Comment = '%1 = The authorization error message, %2 = The authorization error description';
}