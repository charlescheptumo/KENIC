/// <summary>
/// Read-only list of KRA eTIMS payment method codes (code, name, description), used as the reference data set for payment method classification on ETIMS submissions.
/// </summary>
page 50721 "eTims-Payment Methods List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Payment Methods List';
    PageType = List;
    SourceTable = "eTims-Payment Methods";
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
            }
        }
    }
}
