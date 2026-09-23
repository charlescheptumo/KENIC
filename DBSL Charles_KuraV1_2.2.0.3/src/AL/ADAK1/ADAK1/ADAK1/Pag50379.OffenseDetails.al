namespace KENIC.KENIC;

page 50379 "Offense Details"
{
    ApplicationArea = All;
    Caption = 'Offense Details';
    PageType = ListPart;
    SourceTable = "Offense Details";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Offense Description"; Rec."Offense Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offense Description field.';
                }
                field("Offense Date"; Rec."Offense Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offense Date field.';
                }
                field("Offense Type"; Rec."Offense Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offense Type field.';
                }
            }
        }
    }
}