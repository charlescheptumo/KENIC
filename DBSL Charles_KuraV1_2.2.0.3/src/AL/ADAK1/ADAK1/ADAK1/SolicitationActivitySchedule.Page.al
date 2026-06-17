#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75027 "Solicitation Activity Schedule"
{
    ApplicationArea = Basic;
    Caption = 'Procurement Activity Schedule';
    PageType = List;
    SourceTable = "Solicitation Activity Schedule";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Planned Duration"; Rec."Default Planned Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Planned Duration field.';
                }
                field("Solicitation Type ID"; Rec."Solicitation Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solicitation Type ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

