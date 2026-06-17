#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72595 "Project Funding Source"
{
    PageType = Card;
    SourceTable = "Project Funding Source";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Program ID field.';
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KeRRA Budget Code field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Funding Source Name"; Rec."Funding Source Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

