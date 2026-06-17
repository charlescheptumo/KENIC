#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72461 "DWR Meeting Summaries"
{
    CardPageID = "DWR Meeting Summary";
    PageType = List;
    SourceTable = "DWR Meeting Summary";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Item No."; Rec."Agenda Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Item No. field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Discussed field.';
                }
                field("Contributor No"; Rec."Contributor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contributor No field.';
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summary Notes field.';
                }
                field("Task Description"; Rec."Task Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Description field.';
                }
                field("Responsibility Category"; Rec."Responsibility Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Category field.';
                }
                field("Task Owner ID"; Rec."Task Owner ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Owner ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange(DailyWorkRecord."Document No.", Rec."Document No.");
        if DailyWorkRecord.FindSet then begin
            Rec."Project No" := DailyWorkRecord."Project ID";
            Rec."Contractor No" := DailyWorkRecord."Contractor No.";

        end;
    end;

    var
        DailyWorkRecord: Record "Daily Work Record";
}

