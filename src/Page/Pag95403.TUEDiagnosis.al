page 95403 "TUE Diagnosis"
{
    Caption = 'TUE Diagnosis';
    PageType = ListPart;
    SourceTable = "TUE Diagnosis";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Diagnosis; Rec.Diagnosis)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Diagnosis field.';
                }
            }
        }
    }
}
