#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50075 "pageextension50075" extends "Contact Card"
{
    Caption = 'Collaborator Card';

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Contact Card"(Page 5050)".

    layout
    {
        modify("Salesperson Code")
        {
            Caption = 'Principal Investigator Code';

            //Unsupported feature: Property Insertion (Visible) on ""Salesperson Code"(Control 24)".

        }
        addafter("Language Code")
        {
            field(Group; Rec.Group)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Group field.';
            }
            field("Sub-Group"; Rec."Sub-Group")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Sub-Group field.';
            }
            field("Parent Contact ID"; Rec."Parent Contact ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Parent Contact ID field.';
            }
        }
    }
}

