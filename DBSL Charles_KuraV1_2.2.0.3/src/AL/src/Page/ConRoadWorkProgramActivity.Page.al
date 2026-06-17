#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72238 "Con Road Work Program Activity"
{
    PageType = List;
    SourceTable = "Con Road Work Program Activity";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Program ID field.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Package No. field.';
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Technology Type"; Rec."Technology Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technology Type field.';
                }
                field("Labour %"; Rec."Labour %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Labour % field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Planned Rate (Unit Cost)"; Rec."Planned Rate (Unit Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Rate (Unit Cost) field.';
                }
                field("Planned Quantity"; Rec."Planned Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Quantity field.';
                }
                field("Contingency %"; Rec."Contingency %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contingency % field.';
                }
                field("Engineer's Rate (Unit Cost)"; Rec."Engineer's Rate (Unit Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer''s Rate (Unit Cost) field.';
                }
                field("Packaged Quantity"; Rec."Packaged Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Packaged Quantity field.';
                }
                field("Line Amount Excl. VAT"; Rec."Line Amount Excl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount Excl. VAT field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Line Amount Incl. VAT"; Rec."Line Amount Incl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount Incl. VAT field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Default Job Task No."; Rec."Default Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Job Task No. field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted Job No."; Rec."Posted Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Job No. field.';
                }
                field("Posted Job Task No."; Rec."Posted Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Job Task No. field.';
                }
                field("Posted Job Planning Line No."; Rec."Posted Job Planning Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Job Planning Line No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
            }
        }
    }

    actions
    {
    }
}

