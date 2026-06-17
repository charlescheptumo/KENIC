#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50107 "pageextension50107" extends "Responsibility Center List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Responsibility Center List"(Page 5715)".

    layout
    {
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
            field(HQ; Rec.HQ)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the HQ field.';
            }
        }
    }

    //Unsupported feature: Property Deletion (Editable).

}

