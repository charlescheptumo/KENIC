page 50049 "Previous ApplicationsSubstance"
{
    Caption = 'Previous ApplicationsSubstance';
    PageType = ListPart;
    SourceTable = "TUE Medication Details";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Athlete No."; Rec."Athlete No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Athlete No. field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Prohibited Substance"; Rec."Prohibited Substance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prohibited Substance field.';
                }
                field("Substance Description"; Rec."Substance Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prohibited Substance Description field.';
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Category field.';
                }

            }
        }
    }
}
