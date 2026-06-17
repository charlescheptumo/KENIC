#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60013 "Visitors Vehicle List"
{
    CardPageID = "Visitors Vehicle Card";
    PageType = List;
    SourceTable = "Visitors Management";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Vehicle Owner Type"; Rec."Vehicle Owner Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Owner Type field.';
                }
                field("Registration Number"; Rec."Registration Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Number field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Drivers Number"; Rec."Drivers Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drivers Number field.';
                }
                field("Drivers Name"; Rec."Drivers Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drivers Name field.';
                }
                field("Arrival Time"; Rec."Arrival Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arrival Time field.';
                }
                field("Exit Time"; Rec."Exit Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Time field.';
                }
            }
        }
    }

    actions
    {
    }
}

