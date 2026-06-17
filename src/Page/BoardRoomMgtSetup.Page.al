#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60078 "Board Room Mgt Setup"
{
    PageType = Card;
    SourceTable = "Board Room Management Setup";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Reservation Nos"; Rec."Reservation Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reservation Nos field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control5; Outlook)
            {
            }
            systempart(Control6; Notes)
            {
            }
            systempart(Control7; MyNotes)
            {
            }
            systempart(Control8; Links)
            {
            }
        }
    }

    actions
    {
    }
}

