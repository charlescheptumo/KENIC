/// <summary>
/// Read-only list of KRA eTIMS refund reason codes (code, name, description, sort order, in-use flag), used as the reference data set for credit note refund reasons.
/// </summary>
page 50720 "eTims-Refund Reasons List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Refund Reasons List';
    PageType = List;
    SourceTable = "eTims-Refund Reasons";
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
                field("Code Name"; Rec."Code Name")
                {
                    ToolTip = 'Specifies the value of the Code Name field.';
                }
                field("Code Description"; Rec."Code Description")
                {
                    ToolTip = 'Specifies the value of the Code Description field.';
                }
                field("Sort Order"; Rec."Sort Order")
                {
                    ToolTip = 'Specifies the value of the Sort Order field.';
                }
                field(UseYN; Rec.UseYN)
                {
                    ToolTip = 'Specifies the value of the UseYN field.';
                }
            }
        }
    }
}
