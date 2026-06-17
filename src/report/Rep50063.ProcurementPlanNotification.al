report 50063 "Procurement Plan Notification"
{
    Caption = 'Procurement Plan Notification';
    ApplicationArea = Basic;
    ProcessingOnly = true;
    AllowScheduling = true;
    dataset
    {
        dataitem(ProcurementPlan; "Procurement Plan")
        {

            dataitem(ProcurementPlanEntry; "Procurement Plan Entry")
            {
                DataItemLink = "Procurement Plan ID" = field(Code);

                trigger OnAfterGetRecord()
                begin
                    if "Planning Date" <= CalcDate(ProcurementSetup."Procurement Plan Notification", Today) then begin

                    end;
                end;

            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        CalculatedDate: Date;
        PurchaseHeader: Record "Purchase Header";
}
