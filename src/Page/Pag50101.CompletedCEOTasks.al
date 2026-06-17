page 50101 "Completed CEO Tasks"
{
    ApplicationArea = All;
    Caption = 'Completed CEO Tasks';
    PageType = List;
    SourceTable = "CEO Assign Tasks";
    UsageCategory = Documents;
    Editable = false;
    CardPageId = "Completed CEO Task";
    SourceTableView = where(Completed = filter(true));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Assign to Employee No"; Rec."Assign to Employee No")
                {
                    ToolTip = 'Specifies the value of the Assign to Employee No field.', Comment = '%';
                }
                field("Assign to Employee Name"; Rec."Assign to Employee Name")
                {
                    ToolTip = 'Specifies the value of the Assign to Employee Name field.', Comment = '%';
                }
                field(Completed; Rec.Completed)
                {
                    ToolTip = 'Specifies the value of the Is Completed field.', Comment = '%';
                }
                field("To be Completed On"; Rec."To be Completed On")
                {
                    ToolTip = 'Specifies the value of the To be Completed On field.', Comment = '%';
                }
                field("Date of Completion"; Rec."Date of Completion")
                {
                    ToolTip = 'Specifies the value of the Date of Completion field.', Comment = '%';
                }
            }
        }
    }
}
