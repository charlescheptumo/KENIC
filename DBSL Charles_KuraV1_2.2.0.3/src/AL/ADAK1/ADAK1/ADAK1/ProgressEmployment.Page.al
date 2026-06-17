#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72130 "Progress Employment"
{
    PageType = ListPart;
    SourceTable = "Progress Employment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Header No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Male Count"; Rec."Male Count")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Male Count field.';
                }
                field("Female Count"; Rec."Female Count")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Female Count field.';
                }
                field("Male Person Days"; Rec."Male Person Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Male Person Days field.';
                }
                field("Female Person Days"; Rec."Female Person Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Female Person Days field.';
                }
                field("Remaining Target Person Days"; Rec."Remaining Target Person Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Target Person Days field.';
                }
            }
        }
    }

    actions
    {
    }
}

