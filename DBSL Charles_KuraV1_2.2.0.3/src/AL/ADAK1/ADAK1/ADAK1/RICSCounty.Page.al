#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72159 "RICS County"
{
    PageType = Card;
    SourceTable = "RICS County";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("RICS No."; Rec."RICS No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS No. field.';
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Code field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("No. of Existing Roads"; Rec."No. of Existing Roads")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Existing Roads field.';
                }
                field("No. of New Roads"; Rec."No. of New Roads")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of New Roads field.';
                }
            }
        }
    }

    actions
    {
    }
}

