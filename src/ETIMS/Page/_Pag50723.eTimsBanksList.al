/// <summary>
/// List/setup page for maintaining eTims-Banks codes (code, name, description, active flag, sort order) used as bank reference data in eTIMS submissions.
/// </summary>
page 50723   "eTims-Banks List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Banks List';
    PageType = List;
    SourceTable = "eTims-Banks";

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
                field(UseYN; Rec.UseYN)
                {
                    ToolTip = 'Specifies the value of the UseYN field.';
                }
                field(sortOder; Rec.sortOder)
                {
                    ToolTip = 'Specifies the value of the sortOder field.';
                }
            }
        }
    }
}
