#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70050 "Purchases Types"
{
    PageType = List;
    SourceTable = "Purchases Types";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Purchase Type"; Rec."Purchase Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Type field.';
                }
                field("Purchase Type Description"; Rec."Purchase Type Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Type Description field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006; Notes)
            {
            }
            systempart(Control1000000007; MyNotes)
            {
            }
            systempart(Control1000000008; Links)
            {
            }
        }
    }

    actions
    {
    }
}

