page 57130 "Resolution lines Card"
{
    PageType = List;
    SourceTable = "Circular Resolution lines";
    Caption = 'Resolution Board Members';
    DelayedInsert = true;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Resolution No."; Rec."Resolution No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the resolution number.';
                    Editable = false;
                    // TableRelation = "Circular Resolution Header";
                }

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number.';
                    Editable = false;
                }

                field("Employee No."; Rec."Personal No.")
                {
                    Caption = 'Board Member No.';
                    ToolTip = 'Specifies the board member number.';
                    Editable = true;
                }

                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Caption = 'Board Member Name';
                    ToolTip = 'Displays the board member name.';
                    Editable = false;
                }

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the department code.';
                    Editable = false;
                    Visible = false;
                }

                field("Email"; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the board member email.';
                    Editable = false;
                }

                field("Vote Status"; Rec."Vote Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vote status.';
                    Editable = false;
                    visible = false;
                }

                field("Selected Option Line No."; Rec."Selected Option Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the selected option line number.';
                    Editable = false;
                    Visible = false;
                }

                field("Selected Option Code"; Rec."Selected Option Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the selected option code.';
                    Editable = false;
                    Visible = false;
                }

                field("Vote DateTime"; Rec."Vote DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the vote date and time.';
                    Editable = false;
                    visible = false;
                }

                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Allows optional comments.';
                    Editable = true;
                    MultiLine = true;
                    Visible = false;
                }

                field("Notification Sent"; Rec."Notification Sent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if notification was sent.';
                    Editable = false;
                    Visible = false;
                }

                field("Notification DateTime"; Rec."Notification DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the notification date and time.';
                    Editable = false;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        VoteLine: Record "Circular Resolution lines";
        NextLineNo: Integer;
    begin
        if Rec."Line No." = 0 then begin
            VoteLine.Reset();
            VoteLine.SetRange("Resolution No.", Rec."Resolution No.");
            if VoteLine.FindLast() then
                NextLineNo := VoteLine."Line No." + 1
            else
                NextLineNo := 10000;
            Rec.Validate("Line No.", NextLineNo);
        end;
        exit(true);
    end;

    trigger OnOpenPage()
    begin

    end;
}