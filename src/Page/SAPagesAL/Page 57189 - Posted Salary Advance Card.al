#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
page 57189 "Posted Salary Advance Card"
{
    DeleteAllowed = false;
    Editable = false;
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
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
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Joining field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Name';
                    ToolTip = 'Specifies the value of the Unit Name field.';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = All;
                    Caption = 'Basic Pay';
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of months deducted field.';
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Monthly Installment field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Pending field.';
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recovery Start Month field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Approved field.';
                }
                field("Effective from Month"; Rec."Effective from Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective from Month field.';
                }
            }
        }
        area(factboxes)
        {
            part(Attachments; "Doc. Attachment List Factbox")
            {
                ApplicationArea = Basic;
                SubPageLink = "Table ID" = const(Database::Payments), "No." = field("No.");
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
            //Employee.CALCFIELDS("Job Title");
            //Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
            Rec.VALIDATE("Shortcut Dimension 2 Code");
            Rec.VALIDATE("Shortcut Dimension 1 Code");

        END;
    end;

    var
        Usersetup: Record 91;
        Employee: Record 5200;
}

