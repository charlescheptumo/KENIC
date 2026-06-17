#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80099 "Performance Participants"
{
    PageType = List;
    SourceTable = "Performance Participant";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Doc No."; Rec."Performance Doc No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Doc No. field.';
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee ID field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
            }
        }
    }

    actions
    {
    }
}

