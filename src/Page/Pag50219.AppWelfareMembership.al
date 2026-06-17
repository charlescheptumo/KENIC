namespace KICD.KICD;

page 50219 "App Welfare Membership"
{
    Caption = 'App Welfare Membership';
    PageType = Card;
    SourceTable = "Hr Welfare Header";
    DeleteAllowed = false;
    Editable = false;
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Welfare No."; Rec."Welfare No.")
                {
                    ToolTip = 'Specifies the value of the Welfare No. field.';
                }
                field("Welfare Type"; Rec."Welfare Type")
                {
                    ToolTip = 'Specifies the value of the Welfare Type field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ToolTip = 'Specifies the value of the Raisee Name field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Add Member")
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Add Member action.';

                trigger OnAction()
                begin
                    Employee.RESET;
                    Employee.SETRANGE("No.", Rec."Raised By");
                    Employee.SETRANGE("Welfare Member", FALSE);
                    IF Employee.FINDSET THEN BEGIN
                        Employee."Welfare Member" := TRUE;
                        Employee.MODIFY;
                        MESSAGE(TXT001, Employee."No.");
                        Rec.Status := Rec.Status::Closed;
                        Rec.MODIFY;
                    END ELSE BEGIN
                        ERROR('The Employee %1,is already a welfare member,kindly check', Rec."Raised By");
                    END;
                end;
            }
        }
    }

    var
        Employee: Record 5200;
        TXT001: Label 'The Employee %1, has been succesfully added';
}