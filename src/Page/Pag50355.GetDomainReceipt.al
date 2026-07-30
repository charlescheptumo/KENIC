namespace KENIC.KENIC;

page 50355 "Get Domain Receipt"
{
    PageType = StandardDialog;
    Caption = 'Get Domain Receipt';
    ApplicationArea = All;

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

                field(LedgerId; LedgerId)
                {
                    ApplicationArea = All;
                    Enabled = SearchType = SearchType::"Ledger ID";
                }

                field(StartDate; StartDate)
                {
                    ApplicationArea = All;
                    Enabled = SearchType = SearchType::"Receipt Date";
                }

                field(EndDate; EndDate)
                {
                    ApplicationArea = All;
                    Enabled = SearchType = SearchType::"Receipt Date";
                }
            }
        }
    }

    var
        SearchType: Option "Ledger ID","Receipt Date";
        LedgerId: BigInteger;
        StartDate: DateTime;
        EndDate: DateTime;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        Mgt: Codeunit COCCAIntegration;
    begin
        if CloseAction <> Action::OK then
            exit(true);

        case SearchType of

            SearchType::"Ledger ID":
                Mgt.GetReceiptByLedger(LedgerId);

            SearchType::"Receipt Date":
                Mgt.GetReceiptByDate(StartDate, EndDate);
        end;

        exit(true);
    end;
}
