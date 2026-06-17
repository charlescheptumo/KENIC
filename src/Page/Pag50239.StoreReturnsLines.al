namespace KICD.KICD;

page 50239 "Store Returns Lines"
{
    ApplicationArea = All;
    Caption = 'Item Lines';
    PageType = ListPart;
    SourceTable = "Store Returns Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Receipt field.', Comment = '%';
                }
                field("Current Status"; Rec."Current Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Status field.', Comment = '%';
                }
                field("Estimated Residual Value"; Rec."Estimated Residual Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Residual Value field.', Comment = '%';
                }
                field("Estimated Residual Amount"; Rec."Estimated Residual Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Residual Amount field.', Comment = '%';
                    Visible = false;
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendations By Tech. Unit field.', Comment = '%';
                }
            }
        }
    }
}
