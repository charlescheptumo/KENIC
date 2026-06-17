#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75005 "Solicitation Procurement Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Solictation Procurement Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solicitation Type field.';
                }
                field("Procument Type"; Rec."Procument Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procument Type field.';
                }
                field("Strict Purchase Limits"; Rec."Strict Purchase Limits")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strict Purchase Limits field.';
                }
                field("Min Purchase Value (LCY)"; Rec."Min Purchase Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Purchase Value (LCY) field.';
                }
                field("Max Purchase Value (LCY)"; Rec."Max Purchase Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Purchase Value (LCY) field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
            }
            systempart(Control10; Notes)
            {
            }
            systempart(Control11; MyNotes)
            {
            }
            systempart(Control12; Links)
            {
            }
        }
    }

    actions
    {
    }
}

