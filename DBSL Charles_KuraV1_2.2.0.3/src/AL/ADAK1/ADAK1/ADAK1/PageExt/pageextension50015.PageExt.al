#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50015 "pageextension50015" extends "Item Journal"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 1 Code"(Control 21)".


        //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 2 Code"(Control 19)".


        //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode3(Control 17)".

        addafter("Reason Code")
        {
            field("Primary Region"; Rec."Primary Region")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Primary Region field.';
            }
            field("Primary Directorate"; Rec."Primary Directorate")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Primary Directorate field.';
            }
            field("Primary Department"; Rec."Primary Department")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Primary Department field.';
            }
            field(Consitituency; Rec.Consitituency)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Consitituency field.';
            }
        }
    }
}

