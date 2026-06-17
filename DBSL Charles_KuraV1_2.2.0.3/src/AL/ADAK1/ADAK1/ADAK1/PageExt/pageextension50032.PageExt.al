#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50032 "pageextension50032" extends "G/L Budget Entries"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""G/L Budget Entries"(Page 120)".

    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Directorates';
                ToolTip = 'Specifies the value of the Directorates field.';
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Division/Section';
                ToolTip = 'Specifies the value of the Division/Section field.';
            }
            field("Project Code"; Rec."Project Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project Code field.';
            }
            field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
            {
                ApplicationArea = Basic;
                Caption = 'ADAK Budget Code';
                ToolTip = 'Specifies the value of the ADAK Budget Code field.';
            }
            field("Project Type"; Rec."Project Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project Type field.';
            }
            field("Works Type"; Rec."Works Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Works Type field.';
            }
            field("Original Budget"; Rec."Original Budget")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Original Budget field.';
            }
            field("Budget Type 1"; Rec."Budget Type 1")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Type 1 field.';
            }
        }
        addafter(Description)
        {
            field("Key Input"; '')
            {
                ApplicationArea = Basic;
                Caption = 'Key Output';
                ToolTip = 'Specifies the value of the Key Output field.';
            }
        }
        addafter("Entry No.")
        {
            field("Budget Type"; Rec."Budget Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Type field.';
            }
        }
    }
}

