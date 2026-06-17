page 56176 "Maintenance Lines"
{
    ApplicationArea = All;
    Caption = 'Maintenance Lines';
    PageType = ListPart;
    SourceTable = "Maintenance Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Document No"; Rec."Document No")
                {
                    ToolTip = 'Specifies the value of the Document No field.', Comment = '%';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                }
                field("ICT Inventory No."; Rec."ICT Inventory No.")
                {
                    ToolTip = 'Specifies the value of the ICT Inventory No. field.', Comment = '%';
                }
                field("ICT Sub Category"; Rec."ICT Sub Category")
                {
                    ToolTip = 'Specifies the value of the ICT Sub Category field.', Comment = '%';
                }
                field("Inventory Category"; Rec."Inventory Category")
                {
                    ToolTip = 'Specifies the value of the Inventory Category field.', Comment = '%';
                }
                field("Maintenance Area"; Rec."Maintenance Area")
                {
                    ToolTip = 'Specifies the value of the Maintenance Area field.', Comment = '%';
                }
                field("Maintenance Period"; Rec."Maintenance Period")
                {
                    ToolTip = 'Specifies the value of the Maintenance Period field.', Comment = '%';
                }
                field("Maintenance Schedule"; Rec."Maintenance Schedule")
                {
                    ToolTip = 'Specifies the value of the Maintenance Schedule field.', Comment = '%';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ToolTip = 'Specifies the value of the Maintenance Type field.', Comment = '%';
                }
                field(Period; Rec.Period)
                {
                    ToolTip = 'Specifies the value of the Period field.', Comment = '%';
                }
                field("Period Date"; Rec."Period Date")
                {
                    ToolTip = 'Specifies the value of the Period Date field.', Comment = '%';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                }
                field("Tag No"; Rec."Tag No")
                {
                    ToolTip = 'Specifies the value of the Tag No field.', Comment = '%';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ToolTip = 'Specifies the value of the Year Code field.', Comment = '%';
                }
            }
        }
    }
}
