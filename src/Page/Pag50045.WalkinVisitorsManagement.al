page 50045 "Walkin Visitors Management"
{
    ApplicationArea = All;
    Caption = 'Walkin Visitors Management';
    PageType = List;
    CardPageId = "Walkin Visitors Card";
    SourceTable = "Visitors Vehicle Occupants";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Passenger Type"; Rec."Passenger Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passenger Type field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Visitors Number"; Rec."Visitors Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitors Number field.';
                }
                field("Visitors Name"; Rec."Visitors Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitors Name field.';
                }
                field("Tag/ Visitors Pass No"; Rec."Tag/ Visitors Pass No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tag/ Visitors Pass No field.';
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
                field("Reason for Visit"; Rec."Reason for Visit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Visit field.';
                }
                field("Officer to Visit"; Rec."Officer to Visit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer to Visit field.';
                }
                field("Officer to Visit Name"; Rec."Officer to Visit Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer to Visit Name field.';
                }
            }
        }
    }

    actions
    {
    }
}
