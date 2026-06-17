page 95393 "Medication Details"
{
    Caption = 'Medication Details';
    PageType = ListPart;
    SourceTable = "TUE Medication Details";
    PopulateAllFields = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field(Dosage; Rec.Dosage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dosage field.';
                }
                field("Route Of Administration"; Rec."Route Of Administration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Of Administration field.';
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
