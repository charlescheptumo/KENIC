/// <summary>
/// Read-only list of KRA eTIMS country codes (code, country name, description) used as the reference data set for item origin country.
/// </summary>
page 50715 "eTims-Country Codes List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Country Codes List';
    PageType = List;
    SourceTable = "eTims-Country Codes";
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
                field("Country Name"; Rec."Country Name")
                {
                    ToolTip = 'Specifies the value of the Country Name field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
