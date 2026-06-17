namespace KICD.KICD;
using System.Security.Authentication;

page 50299 OAuth2Dialog
{
    ApplicationArea = All;
    Caption = 'OAuth2Dialog';
    PageType = Card;
    
    layout
    {
        area(Content)
        {
            usercontrol(OAuthIntegration; "OAuth 2.0 Integration")
            {
                ApplicationArea = All;

                trigger AuthorizationCodeRetrieved(AuthCode: Text; ReturnState: Text);
                begin
                    if State <> ReturnState then
                        Error('Error: Invalid states.');

                    AuthorizationCode := AuthCode;
                    Message('AuthCode: %1, ReturnState: %2', AuthCode, ReturnState);
                    CurrPage.Close();
                end;

                trigger ControlAddInReady();
                begin
                    CurrPage.OAuthIntegration.StartAuthorization(OAuthRequestUrl);
                end;
            }
        }
    }

    procedure SetOAuth2Properties(AuthRequestUrl: Text; InitialState: Text)
    begin
        OAuthRequestUrl := AuthRequestUrl;
        State := InitialState;
    end;

    procedure GetAuthCode(): Text
    begin
        exit(AuthorizationCode);
    end;

    var
        OAuthRequestUrl: Text;
        State: Text;
        AuthorizationCode: Text;

}