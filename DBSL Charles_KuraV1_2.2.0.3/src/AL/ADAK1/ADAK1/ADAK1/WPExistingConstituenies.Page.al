#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72206 "WP Existing Constituenies"
{
    PageType = List;
    SourceTable = "WP Existing Constituency";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Wp No."; Rec."Wp No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Wp No. field.';
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Code field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

