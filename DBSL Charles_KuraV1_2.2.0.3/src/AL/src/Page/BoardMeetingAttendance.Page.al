#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

Page 55009 "Board Meeting Attendance"
{
    PageType = List;
    SourceTable = "Board Meeting Attendance";
    ApplicationArea = All;
    Caption = 'Board Meeting Attendance';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Meeting Code.';
                    Visible = false;
                }
                field("Meeting Name"; Rec."Meeting Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Meeting Name.';
                    Visible = false;
                }
                field("Meeting Date"; Rec."Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Meeting Date.';
                    Visible = false;
                }
                field("Commitee No"; Rec."Commitee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Committee No.';
                    Visible = false;
                }
                field("Committee  Name"; Rec."Committee  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Committee Name.';
                    Visible = false;
                }
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Member No. Cannot be changed once the line is created - delete and re-add if the wrong member was picked.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Member Name.';
                }
                field("Attendance Confirmation"; Rec."Attendance Confirmation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the member confirmed in advance that they would attend.';
                }
                field(Attendance; Rec.Attendance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the member was actually present, sent apologies, or was absent.';
                }
                field("Attendance Mode"; Rec."Attendance Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the member attended in person or virtually.';
                }
                field("Has Attended"; Rec."Has Attended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Derived automatically from Attendance = Present. Cannot be set directly.';
                }
                field("Online Meeting Link"; Rec."Online Meeting Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'The virtual meeting link, for members attending virtually.';
                    Visible = false;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the Venue.';
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the Member E-mail.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GenerateAttendanceReport)
            {
                Caption = 'Generate Attendance Report';
                ApplicationArea = All;
                Image = Report;
                ToolTip = 'Generates an attendance report for the meeting(s) currently shown, for use as evidence supporting board allowance payments.';

                trigger OnAction()
                var
                    AttendanceReport: Report "Board Meeting Attendance Rpt";
                begin
                    AttendanceReport.SetTableView(Rec);
                    AttendanceReport.RunModal();
                end;
            }
        }
    }
}
