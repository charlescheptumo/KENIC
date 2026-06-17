#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50074 "pageextension50074" extends "Workflow User Groups"
{
    layout
    {
        addafter(Description)
        {
            field("Region Code"; Rec."Region Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Region Code field.';
            }
        }
    }
}

