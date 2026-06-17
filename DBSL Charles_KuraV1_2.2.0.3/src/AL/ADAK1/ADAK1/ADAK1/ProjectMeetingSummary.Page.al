#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 72258 "Project Meeting Summary"
{
    PageType = List;
    SourceTable = "Project Meeting Summary";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting ID"; Rec."Meeting ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Meeting ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Item No."; Rec."Agenda Item No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Agenda Item No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Item Discussed field.';
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                    Caption = 'Issues Raised';
                    ToolTip = 'Specifies the value of the Issues Raised field.';
                }
                field("Task Description"; Rec."Task Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Action';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Action field.';
                }
                field("Responsibility Category"; Rec."Responsibility Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Category field.';
                }
                field("Task Owner ID"; Rec."Task Owner ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Task Owner ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Project Meeting Action Point")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Meeting Action Point";
                RunPageLink = "Meeting ID" = field("Meeting ID");
                Visible = false;
                ToolTip = 'Executes the Project Meeting Action Point action.';
            }
        }
    }
}



