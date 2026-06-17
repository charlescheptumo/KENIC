#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72477 "Contract Variation Ledgers"
{
    PageType = Document;
    SourceTable = "Contract Variation Ledger";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Document Type field.';
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Document No. field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Original Quantity"; Rec."Original Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Quantity field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Original Total Cost (LCY)"; Rec."Original Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Total Cost (LCY) field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("New Quantity"; Rec."New Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Quantity field.';
                }
                field("New Total Cost (LCY)"; Rec."New Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Total Cost (LCY) field.';
                }
                field("Net Change (Quantity)"; Rec."Net Change (Quantity)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Change (Quantity) field.';
                }
                field("Net Change (Total Cost LCY)"; Rec."Net Change (Total Cost LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Change (Total Cost LCY) field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

