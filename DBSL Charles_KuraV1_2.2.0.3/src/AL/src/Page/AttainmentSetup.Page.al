#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69123 "Attainment Setup"
{
    PageType = List;
    SourceTable = "Attainment Table Setup";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Attainment; Rec.Attainment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attainment field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                }
            }
        }
    }

    actions
    {
    }
}

