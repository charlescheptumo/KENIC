/// <summary>
/// List page over the Language table (with eTIMS-specific description/active/sort-order fields) used to map Business Central languages to eTIMS locale codes.
/// </summary>
page 50724 "eTims-Locale"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Locale';
    PageType = List;
    SourceTable = Language;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the code for a language.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of the language.';
                }
                field("Code Description"; Rec."Code Description")
                {
                    ToolTip = 'Specifies the value of the Code Description field.';
                }
                field(UseYN; Rec.UseYN)
                {
                    ToolTip = 'Specifies the value of the UseYN field.';
                }
                field("Sort Order"; Rec."Sort Order")
                {
                    ToolTip = 'Specifies the value of the Sort Order field.';
                }
            }
        }
    }
}
