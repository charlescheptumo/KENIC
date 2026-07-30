namespace KENIC.KENIC;

page 50357 "Get I&M Transaction"
{
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Get I&M Transaction';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(SearchType; SearchType)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                    end;
                }

                field(TransactionReference; TransactionReference)
                {
                    ApplicationArea = All;
                    Enabled = SearchType = SearchType::Reference;
                }

                field(StartDate; StartDate)
                {
                    ApplicationArea = All;
                    Enabled = SearchType = SearchType::Date;
                }

                field(EndDate; EndDate)
                {
                    ApplicationArea = All;
                    Enabled = SearchType = SearchType::Date;
                }
            }
        }
    }

    var
        SearchType: Option Reference,Date;
        TransactionReference: Code[50];
        StartDate: DateTime;
        EndDate: DateTime;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        Mgt: Codeunit COCCAIntegration;
    begin
        if CloseAction <> Action::OK then
            exit(true);

        case SearchType of
            SearchType::Reference:
                Mgt.GetIMTransactionByReference(TransactionReference);

            SearchType::Date:
                Mgt.GetIMTransactionByDate(StartDate, EndDate);
        end;

        exit(true);
    end;
}
