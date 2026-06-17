#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69649 "Career Fair Attendance"
{
    PageType = List;
    SourceTable = "Career Fair Attendance";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Attendee Type"; Rec."Attendee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attendee Type field.';
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Name field.';
                }
                field("Representative Email"; Rec."Representative Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Email field.';
                }
                field("Representative Tel No"; Rec."Representative Tel No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Tel No field.';
                }
                field("Notified on Email"; Rec."Notified on Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified on Email field.';
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date/Time Notified field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
            }
            systempart(Control13; Notes)
            {
            }
            systempart(Control14; MyNotes)
            {
            }
            systempart(Control15; Links)
            {
            }
        }
    }

    actions
    {
    }
}

