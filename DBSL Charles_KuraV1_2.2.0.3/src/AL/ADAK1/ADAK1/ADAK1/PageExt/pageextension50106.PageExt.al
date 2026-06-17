#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50106 "pageextension50106" extends "Responsibility Center Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Responsibility Center Card"(Page 5714)".

    layout
    {
        modify(Address)
        {
            Caption = 'Postal Adress';
        }
        modify("Address 2")
        {
            Caption = 'Physical Address';
        }

        //Unsupported feature: Property Modification (Level) on "Contact(Control 14)".


        //Unsupported feature: Property Modification (ControlType) on "Contact(Control 14)".


        //Unsupported feature: Property Modification (Name) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (SubPageLink) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (PagePartID) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (PartType) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (Visible) on ""Fax No."(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Contact(Control 14)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Contact(Control 14)".


        //Unsupported feature: Property Deletion (SourceExpr) on "Contact(Control 14)".

        modify("Global Dimension 2 Code")
        {
            Visible = false;
        }
        addafter("Global Dimension 1 Code")
        {
            field(HQ; Rec.HQ)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the HQ field.';
            }
        }
        addafter("Location Code")
        {
            field("Operating Unit Type"; Rec."Operating Unit Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Operating Unit Type field.';
            }
            field("Direct Reports To"; Rec."Direct Reports To")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Direct Reports To field.';
            }
            field("Indirect Reports To"; Rec."Indirect Reports To")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Indirect Reports To field.';
            }
            field("Hierarchical  Level ID"; Rec."Hierarchical  Level ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Hierarchical  Level ID field.';
            }
            field("Headed By (Title)"; Rec."Headed By (Title)")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Headed By (Title) field.';
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Current Head field.';
            }
            field(Identifier; Rec.Identifier)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Identifier field.';
            }
        }
        moveafter("Country/Region Code"; "Global Dimension 1 Code")
    }
}

