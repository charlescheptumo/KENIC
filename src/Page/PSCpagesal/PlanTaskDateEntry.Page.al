#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80475 "Plan Task Date Entry"
{
    PageType = List;
    SourceTable = 80272;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }
                field("Event Start Date"; Rec."Event Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Event Start Date field.';
                }
                field("Event Start Time"; Rec."Event Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Event Start Time field.';
                }
                field("Event End Date"; Rec."Event End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Event End Date field.';
                }
                field("Event End Time"; Rec."Event End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Event End Time field.';
                }
            }
        }
    }

    actions
    {
    }
}
