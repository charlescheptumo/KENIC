page 95396 "TUE Previous Applications"
{
    Caption = 'TUE Previous Applications';
    PageType = ListPart;
    SourceTable = "TUE Medication Details";
    Editable = false;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Athlete No."; Rec."Athlete No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Athlete No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
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
                field("Route Of Administration"; Rec."Route Of Administration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Of Administration field.';
                }
                field(Dosage; Rec.Dosage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dosage field.';
                }

                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Duration of Treatment"; Rec."Duration of Treatment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duration of Treatment field.';
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved field.';
                }
            }
        }
    }
}
