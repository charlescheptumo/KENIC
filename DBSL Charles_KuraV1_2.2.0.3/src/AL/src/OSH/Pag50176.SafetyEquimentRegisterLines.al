page 50176 "Safety Equiment Register Lines"
{
    ApplicationArea = All;
    Caption = 'Safety Equiment Register Lines';
    PageType = ListPart;
    SourceTable = "Safety Equiment Register Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ToolTip = 'Specifies the value of the Equipment ID field.', Comment = '%';
                    ApplicationArea = Basic;
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maintenance Type field.', Comment = '%';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Vendor No. field.';
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Service Date field.';
                }
                field("Maintenance Date"; Rec."Maintenance Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Date field.';
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Insured field.';
                }
            }
        }
    }
}
