namespace KICD.KICD;

page 50227 "Benefits Matrix Setup"
{
    Caption = 'Benefits Matrix Setup';
    PageType = List;
    SourceTable = "Benefits Matrix Setup";
    ApplicationArea = Basic;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Benefit Type"; Rec."Benefit Type")
                {
                    ToolTip = 'Specifies the value of the Benefit Type field.';
                }
                field("Benefit Description"; Rec."Benefit Description")
                {
                    ToolTip = 'Specifies the value of the Benefit Description field.';
                }
                field("Beneficiary Category"; Rec."Beneficiary Category")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Category field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
