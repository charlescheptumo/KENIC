#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72256 "Project Meeting Attendance"
{
    PageType = ListPart;
    SourceTable = "Project Meeting Attendance";
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
                    ToolTip = 'Specifies the value of the Meeting ID field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Attendee Type"; Rec."Attendee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attendee Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Name field.';
                }
                field(Organization; Rec.Organization)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
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
                field("DateTime Notified"; Rec."DateTime Notified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateTime Notified field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

