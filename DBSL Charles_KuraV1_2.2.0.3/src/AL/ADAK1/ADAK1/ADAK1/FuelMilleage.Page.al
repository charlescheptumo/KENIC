#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59128 "Fuel Milleage"
{
    PageType = ListPart;
    SourceTable = "Fuel Milleage Req";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month field.';
                }
                field("Details of the Journey"; Rec."Details of the Journey")
                {
                    ApplicationArea = Basic;
                }
                field("Oil Drawn"; Rec."Oil Drawn(Ltr)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Oil Drawn.';
                }
                field("Fuel Drawn"; Rec."Fuel Drawn(Ltr)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Drawn field.';
                }
                field("Time In"; Rec."Time in")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Out field.';
                }
                field("Speedo at end of journey"; Rec."Speedo at end of journey")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Speedo at end of journey field.';
                }
                field("Mileage (KM)"; Rec."Mileage (KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mileage (KM) field.';
                    Caption = 'Km of Journey';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the No field.';
                }
            }
        }
    }

    actions
    {
    }
}

