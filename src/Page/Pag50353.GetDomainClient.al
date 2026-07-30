namespace KENIC.KENIC;

page 50353 "Get Domain Client"
{
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Get Domain Client';
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(SearchType; SearchType)
                {
                    ApplicationArea = All;
                    Caption = 'Search By';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                    end;
                }

                field(ClientId; ClientId)
                {
                    ApplicationArea = All;
                    Caption = 'Client ID';
                    Enabled = SearchType = SearchType::"Client ID";
                }

                field(Email; Email)
                {
                    ApplicationArea = All;
                    Caption = 'Email';
                    Enabled = SearchType = SearchType::Email;
                }
            }
        }
    }

    var
        SearchType: Option "Client ID",Email;

        ClientId: Code[50];
        Email: Text[100];

        ShowClientId: Boolean;
        ShowEmail: Boolean;

    trigger OnOpenPage()
    begin
        SearchType := SearchType::"Client ID";
        UpdateVisibility();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateVisibility();
    end;

    procedure SetDefaultClientId(DefaultClientId: Code[50])
    begin
        ClientId := DefaultClientId;
    end;

    procedure SetDefaultEmail(DefaultEmail: Text)
    begin
        Email := DefaultEmail;
    end;

    local procedure UpdateVisibility()
    begin
        ShowClientId := SearchType = SearchType::"Client ID";
        ShowEmail := SearchType = SearchType::Email;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        KenicMgt: Codeunit COCCAIntegration;
        Response: Text;
    begin
        if CloseAction <> Action::OK then
            exit(true);

        case SearchType of

            SearchType::"Client ID":
                begin
                    if ClientId = '' then
                        Error('Client ID is required.');

                    Response := KenicMgt.GetClientById(ClientId);
                end;

            SearchType::Email:
                begin
                    if Email = '' then
                        Error('Email is required.');

                    Response := KenicMgt.GetClientByEmail(Email);
                end;
        end;

        Message(Response);

        exit(true);
    end;
}
