page 50383 "Batch EFT Lines"
{
    ApplicationArea = All;
    Caption = 'Batch EFT Lines';
    PageType = ListPart;
    SourceTable = "Batch EFT Lines";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Vendor No"; Rec."Vendor No")
                {
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("PV No"; Rec."PV No")
                {
                    ToolTip = 'Specifies the value of the PV No field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Vendor Bank Account No."; Rec."Vendor Bank Account No.")
                {
                    ToolTip = 'Specifies the value of the Vendor Bank Account No. field.';
                }
                field("Vendor Bank Name"; Rec."Vendor Bank Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Bank Name field.';
                }
            }
        }
    }
}
