page 50068 "CEO Assign Tasks"
{
    ApplicationArea = All;
    Caption = 'CEO Assign Tasks';
    PageType = List;
    SourceTable = "CEO Assign Tasks";
    UsageCategory = Lists;
    CardPageId = "CEO Assign Task";

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
                }
                field("Assign to Employee Name"; Rec."Assign to Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign to Employee Name field.', Comment = '%';
                }
                field("Is Completed"; Rec.Completed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Completed field.', Comment = '%';
                }
            }
        }
    }
}
