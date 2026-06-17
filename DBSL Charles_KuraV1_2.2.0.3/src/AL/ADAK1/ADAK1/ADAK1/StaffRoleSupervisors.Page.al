#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72710 "Staff Role Supervisors"
{
    PageType = List;
    SourceTable = "Staff Role Code Supervisor";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Role Code field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Supervisor Job ID"; Rec."Supervisor Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Job ID field.';
                }
                field("Supervisor Job Title"; Rec."Supervisor Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Job Title field.';
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Email field.';
                }
            }
        }
    }

    actions
    {
    }
}

