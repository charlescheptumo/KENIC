#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65092 "Admin Team Members"
{
    Caption = 'Admin Team Members';
    PageType = List;
    SourceTable = "AdminTeam Members";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Admin Code"; Rec."Admin Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Admin Code field.';
                }
                field("Admin Name"; Rec."Admin Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Admin Name field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

