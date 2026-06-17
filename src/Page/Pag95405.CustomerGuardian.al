page 95405 "Customer Guardian"
{
    Caption = 'Customer Guardian';
    PageType = ListPart;
    SourceTable = "Customer Guardian";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Guardian Name"; Rec."Guardian Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Guardian Name field.';
                }
                field(Signature; Rec.Signature)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Signature field.';
                }
            }
        }
    }
}
