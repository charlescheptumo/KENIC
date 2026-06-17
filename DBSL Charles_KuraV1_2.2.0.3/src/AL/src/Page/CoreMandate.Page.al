#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80010 "Core Mandate"
{
    PageType = List;
    SourceTable = "Core Mandates";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Core Mandates"; Rec."Core Mandates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Core Mandates field.';
                }
            }
        }
    }

    actions
    {
    }
}

