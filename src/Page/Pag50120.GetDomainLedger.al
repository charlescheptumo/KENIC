namespace KENIC.KENIC;

page 50120 "Get Domain Ledger"
{
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Get Domain Ledger';
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

                field(DomainName; DomainName)
                {
                    ApplicationArea = All;
                    Caption = 'Domain Name';
                    Enabled = SearchType = SearchType::"Domain Name";
                }

                field(DocumentNumber; DocumentNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Document Number';
                    Enabled = SearchType = SearchType::"Document Number";
                }

                field(StartDateTime; StartDateTime)
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    Enabled = SearchType = SearchType::"Date Range";
                }

                field(EndDateTime; EndDateTime)
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                    Enabled = SearchType = SearchType::"Date Range";
                }
            }
        }
    }

    var
        SearchType: Option "Domain Name","Document Number","Date Range";

        DomainName: Text[100];
        DocumentNumber: Integer;
        StartDateTime: DateTime;
        EndDateTime: DateTime;

        ShowDomain: Boolean;
        ShowDocument: Boolean;
        ShowDateRange: Boolean;

    trigger OnOpenPage()
    begin
        SearchType := SearchType::"Domain Name";
        UpdateVisibility();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateVisibility();
    end;

    procedure SetDefaultDomain(DefaultDomain: Text)
    begin
        DomainName := DefaultDomain;
    end;

    local procedure UpdateVisibility()
    begin
        ShowDomain := SearchType = SearchType::"Domain Name";
        ShowDocument := SearchType = SearchType::"Document Number";
        ShowDateRange := SearchType = SearchType::"Date Range";
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        KenicMgt: Codeunit COCCAIntegration;
        Response: Text;
    begin
        if CloseAction <> Action::OK then
            exit(true);

        case SearchType of

            SearchType::"Domain Name":
                begin
                    if DomainName = '' then
                        Error('Domain Name is required.');

                    Response := KenicMgt.GetLedgerByDomain(DomainName);
                end;

            SearchType::"Document Number":
                begin
                    if DocumentNumber = 0 then
                        Error('Document Number is required.');

                    Response := KenicMgt.GetLedgerByDocument(DocumentNumber);
                end;

            SearchType::"Date Range":
                begin
                    if StartDateTime = 0DT then
                        Error('Start Date is required.');

                    if EndDateTime = 0DT then
                        Error('End Date is required.');

                    if StartDateTime > EndDateTime then
                        Error('Start Date cannot be greater than End Date.');

                    Response := KenicMgt.GetLedgerByDateRange(StartDateTime, EndDateTime);
                end;
        end;

        Message(Response);

        exit(true);
    end;
}