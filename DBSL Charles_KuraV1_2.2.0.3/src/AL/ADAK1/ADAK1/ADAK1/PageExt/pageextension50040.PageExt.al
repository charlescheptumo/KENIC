#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50040 "pageextension50040" extends "Resource Costs"
{
    layout
    {
        addafter("Work Type Code")
        {
            field("Consumption Rate"; Rec."Consumption Rate")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Consumption Rate field.';
            }
        }
        addafter("Cost Type")
        {
            field("Currency code"; Rec."Currency code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Currency code field.';
            }
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = basic;
                ToolTip = 'Specifies the value of the Blocked field.';
            }
        }
    }
}

#pragma implicitwith restore

