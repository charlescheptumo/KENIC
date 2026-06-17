page 50100 "My Completed Task Assigned"
{
    ApplicationArea = All;
    Caption = 'My Completed Task Assigned';
    PageType = Card;
    SourceTable = "CEO Assign Tasks";
    Editable = false;
    SourceTableView = where(Completed = filter(true));

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
                field(Completed; Rec.Completed)
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
                field("CEO Remark"; Rec."CEO Remark")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Remark field.', Comment = '%';
                }
                field("CEO Remark2"; Rec."CEO Remark2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Remark2 field.', Comment = '%';
                }
            }
            part("CEO Assign Tasks List"; "CEO Assign Tasks List")
            {
                Editable = false;
                SubPageLink = No = field(No);
                ApplicationArea = Basic;
            }
        }
    }
}
