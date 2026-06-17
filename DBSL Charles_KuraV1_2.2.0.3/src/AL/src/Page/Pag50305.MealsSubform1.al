namespace KICD.KICD;

page 50305 "Meals Subform1"
{
    ApplicationArea = All;
    Caption = 'Meals Subform1';
    PageType = ListPart;
    SourceTable = "Meals Subform";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Meals Type"; Rec."Meal Type Code")
                {
                    ToolTip = 'Specifies the value of the Meals Type field.', Comment = '%';
                }
                field("Description"; Rec.Description)
                {
                    ToolTip = 'Specifies Description Value';
                }
                field(Quantity;Rec.Quantity)
                {

                }

                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.', Comment = '%';
                }
                field(Amount;Rec.Amount)
                {
                    
                }
            }
        }
    }
}
