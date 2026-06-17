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
                    Editable = false;
                    ToolTip = 'Specifies the Meeting Code.';
                }
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the Member No.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the Member Name.';
                }
                field("Commitee No"; Rec."Commitee No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the Committee No.';
                }
                field("Committee  Name"; Rec."Committee  Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the Committee Name.';
                }
                field("Meeting Name"; Rec."Meeting Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the Meeting Name.';
                }
                field("Meeting Date"; Rec."Meeting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the Meeting Date.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    visible = false;
                    ToolTip = 'Specifies the Venue.';
                }
                field(Attendance; Rec.Attendance)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the Attendance status.';
                }
                field("Attendance Confirmation"; Rec."Attendance Confirmation")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the Attendance Confirmation.';
                }
                field("Has Attended"; Rec."Has Attended")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies whether the member has attended.';
                }
            }
        }
    }

    actions { }
}