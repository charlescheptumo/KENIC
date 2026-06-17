page 57185 "Salary Advance Card Approvals"
{
    PageType = Card;
    SourceTable = 57000;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ToolTip = 'Specifies the value of the Date of Joining field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    Caption = 'Unit Name';
                    ToolTip = 'Specifies the value of the Unit Name field.';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ToolTip = 'Specifies the value of the Salary Last Drawn field.';
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
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ToolTip = 'Specifies the value of the Amount Pending field.';
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ToolTip = 'Specifies the value of the Recovery Start Month field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    Caption = 'Remarks By HOD/Principal';
                    ToolTip = 'Specifies the value of the Remarks By HOD/Principal field.';
                }
                field(Comments; Rec.Comments)
                {
                    Caption = 'Comments HR Dept';
                    ToolTip = 'Specifies the value of the Comments HR Dept field.';
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    Caption = 'Amount Approved by Accounts Dept';
                    ToolTip = 'Specifies the value of the Amount Approved by Accounts Dept field.';
                }
                field("Effective from Month"; Rec."Effective from Month")
                {
                    Caption = 'Effective from Month';
                    ToolTip = 'Specifies the value of the Effective from Month field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE("No.", Rec."No.");
                    REPORT.RUN(57015, TRUE, TRUE, Rec)
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."Payment Type"::"Salary Advance";
        Rec."Document Type" := Rec."Document Type"::"Salary Advance";
        Rec.Date := TODAY;
        Rec."Created By" := USERID;
        Rec."Account Type" := Rec."Account Type"::Employee;

        Usersetup.RESET;
        Usersetup.SETRANGE("User ID", Rec."Created By");
        IF Usersetup.FINDSET THEN BEGIN

            Rec."Account No." := Usersetup."Employee No.";
            Rec."Account Name" := Usersetup."Employee Name";
        END;

        Employee.RESET;
        Employee.SETRANGE("No.", Rec."Account No.");
        IF Employee.FINDSET THEN BEGIN
            Employee.CALCFIELDS("Job Title");
            //Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
            Rec.VALIDATE("Shortcut Dimension 2 Code");
            Rec.VALIDATE("Shortcut Dimension 1 Code");

        END;
    end;

    var
        // Usersetup: Record 91;
        // Employee: Record 5200;
        Usersetup: Record "User Setup";
        Employee: Record Employee;
}

