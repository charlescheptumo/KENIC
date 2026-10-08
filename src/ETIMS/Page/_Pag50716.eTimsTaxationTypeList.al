/// <summary>
/// Read-only list of KRA eTIMS taxation type codes and their rates (A-E tax bands), used as the reference data set for VAT calculation on ETIMS submissions.
/// </summary>
page 50716 "eTims-Taxation Type List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Taxation Type List';
    PageType = List;
    SourceTable = "eTims-Taxation Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Rate; Rec.Rate)
                {
                    ToolTip = 'Specifies the value of the Rate field.';
                }
            }
        }
    }
}
