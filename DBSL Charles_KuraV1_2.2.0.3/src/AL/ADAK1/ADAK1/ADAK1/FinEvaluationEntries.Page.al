#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75467 "Fin Evaluation Entries"
{
    Caption = 'Finance Evaluation';
    PageType = List;
    SourceTable = "Fin Evaluation Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid No"; Rec."Bid No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }
                field("Bill Item No"; Rec."Bill Item No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item No field.';
                }
                field("Bidder Bill Item Rate"; Rec."Bidder Bill Item Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Bill Item Rate field.';
                }
                field("Bill Item Market  Rate"; Rec."Bill Item Market  Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill Item Average Modal Rate';
                    ToolTip = 'Specifies the value of the Bill Item Average Modal Rate field.';
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
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
    }
}

