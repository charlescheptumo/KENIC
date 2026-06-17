#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70057 "Inspection Lines"
{
    PageType = ListPart;
    SourceTable = "Inspection Lines1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Quantity Ordered"; Rec."Quantity Ordered")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quantity Ordered field.';
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accepted Quantity';
                    ToolTip = 'Specifies the value of the Accepted Quantity field.';
                }
                field("Inspection Decision"; Rec."Inspection Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Decision field.';
                }
                field("Rejected Quantity"; Rec."Rejected Quantity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Variance';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Variance field.';
                }
                field("Reasons for Rejection"; Rec."Reasons for Rejection")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reasons for Variance';
                    ToolTip = 'Specifies the value of the Reasons for Variance field.';
                }
                field("Received Qty"; Rec."Received Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Received Qty field.';
                }
            }
        }
    }

    actions
    {
    }
}

