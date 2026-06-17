namespace KICD.KICD;

#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

Page 55006 "Board Meetings Pending"
{
    ApplicationArea = Basic;
    CardPageID = "Board Meeting Card";
    PageType = List;
    SourceTable = "Board Meetings";
    SourceTableView = where(Status = const("Pending Approval"), Closed = const(false));
    UsageCategory = Lists;
    Caption = 'Board Meetings Pending Approval';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start date field.';
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting group field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Notes) { }
            systempart(Control13; Links) { }
        }
    }

    actions
    { }

}