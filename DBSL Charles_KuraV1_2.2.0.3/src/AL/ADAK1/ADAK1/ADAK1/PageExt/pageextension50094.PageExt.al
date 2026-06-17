#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50094 "pageextension50094" extends Qualifications
{
    layout
    {
        addafter(Description)
        {
            field("Academic Hierachy Code"; Rec."Academic Hierachy Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Academic Hierachy Code field.';
            }
            field("Qualification Category"; Rec."Qualification Category")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Qualification Category field.';
            }
        }
    }
}

