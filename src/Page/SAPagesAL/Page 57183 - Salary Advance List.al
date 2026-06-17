page 57183 "Salary Advance List"
{
    CardPageID = "Salary Advance Card";
    PageType = List;
    SourceTable = 57000;
    SourceTableView = WHERE("Payment Type" = FILTER("Salary Advance"),
                            Status = FILTER(Open | "Pending Approval"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ToolTip = 'Specifies the value of the No of months deducted field.';
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ToolTip = 'Specifies the value of the Monthly Installment field.';
                }
            }
        }
        area(factboxes)
        {

        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."Payment Type"::"Salary Advance";
        Rec."Document Type" := Rec."Document Type"::"Salary Advance";
        /*
        Date := TODAY;
        "Created By" := USERID;
        "Account Type" := "Account Type"::Customer;
        */

    end;
    trigger OnOpenPage();
    begin
        Usersetup1.Get(UserId);
        if Usersetup1."Payroll View" = false then
            ERROR('You do not have sufficient rights to view Salary Advance List Page!Please contact system administrator.');

    end;

    var
        Usersetup: Record 91;
        Employee: Record 5200;
        UserSetup1: Record "User Setup";
}

