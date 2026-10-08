/// <summary>
/// Simple setup list page for maintaining "Invoice Status Code" records used to classify invoice statuses for eTIMS reporting.
/// </summary>
page 50731 "Invoice Status"
{
    ApplicationArea = Basic;
    Caption = 'Invoice Status';
    PageType = List;
    SourceTable = "Invoice Status Code";

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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
