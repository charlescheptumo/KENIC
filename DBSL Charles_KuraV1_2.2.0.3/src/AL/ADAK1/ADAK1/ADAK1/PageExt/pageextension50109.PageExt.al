#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50109 "pageextension50109" extends "Warehouse Receipt"
{
    layout
    {
        addafter("Sorting Method")
        {
            field("Source Document"; Rec."Source Document")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Source Document field.';
            }
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Source No. field.';
            }
            field("Inspection Team Setup?"; Rec."Inspection Team Setup?")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Inspection Team Setup? field.';
            }
            field("Inspection Completed?"; Rec."Inspection Completed?")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Inspection Completed? field.';
            }
        }
    }
}

