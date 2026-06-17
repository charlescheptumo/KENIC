page 95397 "RetroActive Exception"
{
    Caption = 'RetroActive Exception';
    PageType = ListPart;
    SourceTable = "Retroactive App Exception";
    PopulateAllFields = true;
    ApplicationArea = All;
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
