#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72240 "PCO Planned Meeting"
{
    PageType = List;
    SourceTable = "PCO Planned Meeting";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Notice No."; Rec."Notice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice No. field.';
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Time field.';
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue/Location field.';
                }
                field("Project Stage"; Rec."Project Stage")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Stage field.';
                }
                field("Project Meeting ID"; Rec."Project Meeting ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Meeting ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

