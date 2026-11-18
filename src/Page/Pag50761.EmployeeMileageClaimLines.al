page 50761 "Employee Mileage Claim Lines"
{
    // Trips on the Employee Mileage Reimbursement Form: Amount = Kilometres x Mileage Rate.
    Caption = 'Trips';
    PageType = ListPart;
    SourceTable = "PV Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Trips)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    ShowMandatory = true;
                }
                field("Start Location"; Rec."Start Location")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("End Location"; Rec."End Location")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Kilometres; Rec.Kilometres)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount (KES)';
                    Editable = false;
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                    ShowMandatory = true;
                    ToolTip = 'The expense type (G/L account) the mileage is charged to. A new trip copies it from the trip above.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Same vote item as the trip above, so it is entered once per form.
        if xRec."Type of Expense" <> '' then
            Rec.Validate("Type of Expense", xRec."Type of Expense");
    end;
}
