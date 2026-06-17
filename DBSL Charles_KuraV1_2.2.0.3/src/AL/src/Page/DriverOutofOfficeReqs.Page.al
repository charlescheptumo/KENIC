#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59079 "Driver Out of Office Reqs"
{
    ApplicationArea = Basic;
    CardPageID = "Driver Out of Office Req";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Driver Out of Office Req";
    UsageCategory = Tasks;

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Driver No"; Rec."Driver No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver No field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Trip No"; Rec."Trip No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip No field.';
                }
                field("Trip Descrption"; Rec."Trip Descrption")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip Descrption field.';
                }
                field("Trip Starting Date"; Rec."Trip Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip Starting Date field.';
                }
                field("Trip Duration"; Rec."Trip Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip Duration field.';
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip End Date field.';
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Reg No field.';
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

