#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59029 "Fuel Card Lines"
{
    PageType = ListPart;
    SourceTable = "Vehicle Fuel Card Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reciept No"; Rec."Reciept No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reciept No field.';
                }
                field("Amount in Litres"; Rec."Amount in Litres")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount in Litres field.';
                }
                field("Amount in Shillings"; Rec."Amount in Shillings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount in Shillings field.';
                }
                field("Other Expenses"; Rec."Other Expenses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Expenses field.';
                }
                field("Date of Fueling"; Rec."Date of Fueling")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Fueling field.';
                }
                field("Vehicle RegNo"; Rec."Vehicle RegNo")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Vehicles List";
                    ToolTip = 'Specifies the value of the Vehicle RegNo field.';
                }
                field("vehicle Make"; Rec."vehicle Make")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the vehicle Make field.';
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Drivers List";
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Names"; Rec."Driver Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Names field.';
                }
            }
        }
    }

    actions
    {
    }
}

