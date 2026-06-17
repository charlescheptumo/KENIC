#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72074 "Road Asset Survey Item Card"
{
    PageType = Card;
    SourceTable = "Road Asset Survey Items";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Item; Rec.Item)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item field.';
                }
            }
        }
    }

    actions
    {
    }
}

