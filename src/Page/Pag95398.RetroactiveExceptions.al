page 95398 "Retroactive Exceptions"
{
    ApplicationArea = All;
    Caption = 'Retroactive Exceptions';
    PageType = List;
    SourceTable = "Retroactive Exceptions";
    UsageCategory = Lists;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Exception; Rec.Exception)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exception field.';
                }
            }
        }
    }
}
