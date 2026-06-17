page 50158 "Salary Advance Memos"
{
    ApplicationArea = All;
    Caption = 'Salary Advance Memos';
    CardPageId = "Salary Advance Memo";
    PageType = List;
    SourceTable = payments;
    UsageCategory = Lists;
    SourceTableView = where(Status = filter(Open | "Pending Approval"));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."Payment Type"::"Salary Advance Memo";
        Rec."Document Type" := Rec."Document Type"::"Salary Advance Memo";
        Rec."Account type" := Rec."Account type"::Employee;
    end;
    trigger OnOpenPage();
    begin
        Usersetup1.Get(UserId);
        if Usersetup1."Payroll View" = false then
            ERROR('You do not have sufficient rights to view Salary Advance Memos Page!Please contact system administrator.');

    end;

    var
        Usersetup: Record 91;
        Employee: Record 5200;
        UserSetup1: Record "User Setup";
}
