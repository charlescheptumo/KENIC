#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59073 "SubActivity Matrix"
{
    PageType = ListPart;
    SourceTable = "Subactivity Matrix";
    ApplicationArea = All;

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
                field(Subactivity; Rec.Subactivity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subactivity field.';
                }
            }
        }
    }

    actions
    {
    }
}

