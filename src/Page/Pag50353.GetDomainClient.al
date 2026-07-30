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

                field(StartDateTime; StartDateTime)
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    Enabled = SearchType = SearchType::"Created Date";
                }

                field(EndDateTime; EndDateTime)
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                    Enabled = SearchType = SearchType::"Created Date";
                }
            }
        }
    }

    var
        SearchType: Option "Client ID",Email,"Created Date";

        ClientId: Code[50];
        Email: Text[100];
        StartDateTime: DateTime;
        EndDateTime: DateTime;

        ShowClientId: Boolean;
        ShowEmail: Boolean;
        ShowDateRange: Boolean;

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
        ShowDateRange := SearchType = SearchType::"Created Date";
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

            SearchType::"Created Date":
                begin
                    if StartDateTime = 0DT then
                        Error('Start Date is required.');

                    if EndDateTime = 0DT then
                        Error('End Date is required.');

                    if StartDateTime > EndDateTime then
                        Error('Start Date cannot be greater than End Date.');

                    Response := KenicMgt.GetClientByDateRange(StartDateTime, EndDateTime);
                end;
        end;

        Message(Response);

        exit(true);
    end;
}