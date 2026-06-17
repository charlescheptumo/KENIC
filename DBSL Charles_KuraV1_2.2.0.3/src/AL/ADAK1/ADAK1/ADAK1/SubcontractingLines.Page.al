#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72655 "Subcontracting Lines"
{
    PageType = List;
    SourceTable = "Subcontracting Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Tax PIN No."; Rec."Tax PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax PIN No. field.';
                }
                field("Current Vendor Class"; Rec."Current Vendor Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Vendor Class field.';
                }
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Group field.';
                }
                field("Supplier Type"; Rec."Supplier Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Type field.';
                }
                field("Scope of Subcontracting"; Rec."Scope of Subcontracting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scope of Subcontracting field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

