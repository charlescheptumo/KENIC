page 50091 "Assigned Tasks by CEO"
{
    ApplicationArea = All;
    Caption = 'Assigned Tasks by CEO';
    PageType = List;
    SourceTable = "CEO Assign Tasks";
    CardPageId = "Assigned Task by CEO";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Assign to Employee No"; Rec."Assign to Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign to Employee No field.', Comment = '%';
                    Visible = false;
                }
                field("Assign to Employee Name"; Rec."Assign to Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign to Employee Name field.', Comment = '%';
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                    Visible = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.', Comment = '%';
                    Visible = false;
                }
                field("Is Completed"; Rec.Completed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Completed field.', Comment = '%';
                }
                field("To be Completed On"; Rec."To be Completed On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To be Completed On field.', Comment = '%';
                }
                field("Date of Completion"; Rec."Date of Completion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Completion field.', Comment = '%';
                }
            }
        }
    }
}
