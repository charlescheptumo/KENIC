#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 55005 "Meeting Agenda"
{
    PageType = List;
    SourceTable = "Meeting Agenda";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agenda code"; Rec."Agenda code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda code field.';
                }
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Person responsiblee"; Rec."Person responsiblee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Person responsiblee field.';
                }
                field("Scheduled time"; Rec."Scheduled time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled time field.';
                }
            }
        }
    }

    actions
    {
    }
}

