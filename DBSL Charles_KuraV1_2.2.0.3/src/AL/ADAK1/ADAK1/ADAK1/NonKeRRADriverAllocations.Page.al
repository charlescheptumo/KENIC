
Page 59122 "Non ADAK Driver Allocations"
{
    PageType = ListPart;
    SourceTable = "Non-KeRRA Driver Allocation";
    Caption = 'Non-ADAK Driver Allocation';
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID No"; Rec."ID No")
                {

                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field("DL Number"; Rec."DL Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DL Number field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Address field.';
                }
                field("Vehicle Registration No"; Rec."Vehicle Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Registration No field.';
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Description field.';
                }
            }
        }
    }

    actions
    {
    }
}



