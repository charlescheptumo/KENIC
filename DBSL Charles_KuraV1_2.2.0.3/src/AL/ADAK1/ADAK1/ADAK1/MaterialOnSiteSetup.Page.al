#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72727 "Material On Site Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Material On Site Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Material Code"; Rec."Material Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Code field.';
                }
                field("Material Description"; Rec."Material Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Description field.';
                }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Of Measure Code field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

