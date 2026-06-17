#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72388 "Road Reserve Width"
{
    PageType = Card;
    SourceTable = "Road Reserve Width";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("KeRRA Road Code"; Rec."KeRRA Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KeRRA Road Code field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Authentic Road Reserve Width"; Rec."Authentic Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the road reserve length that is defined under the survey maps.';
                }
                field("Actual Road Reserve Width"; Rec."Actual Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the road reserve length that is on the ground.';
                }
                field("Gazetted Road Code"; Rec."Gazetted Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gazetted Road Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

