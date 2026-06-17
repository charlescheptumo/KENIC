page 50137 "ICT Issuance Voucher Lines"
{
    ApplicationArea = Basic;
    Caption = 'ICT Issuance Voucher Lines';
    PageType = ListPart;
    SourceTable = "ICT Issuance Voucher Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Comments; Rec.Comments)
                {
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                }
                field("Current Assigned Employee"; Rec."Current Assigned Employee")
                {
                    ToolTip = 'Specifies the value of the Current Assigned Employee field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                }
                field("Duration of Use start date"; Rec."Duration of Use start date")
                {
                    ToolTip = 'Specifies the value of the Duration of Use start date field.', Comment = '%';
                }

                field("Duration of Use end date"; Rec."Duration of Use end date")
                {
                    ToolTip = 'Specifies the value of the Duration of Use end date field.', Comment = '%';
                }

                field("Duration of Use"; Rec."Duration of Use")
                {
                    ToolTip = 'Specifies the value of the Duration of Use field.', Comment = '%';
                    Editable = false;
                }
                field("FA No"; Rec."FA No")
                {
                    ToolTip = 'Specifies the value of the FA No field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Reason For Movement"; Rec."Reason For Movement")
                {
                    ToolTip = 'Specifies the value of the Reason For Movement field.', Comment = '%';
                }
                field("Return Condition"; Rec."Return Condition")
                {
                    ToolTip = 'Specifies the value of the Return Condition field.', Comment = '%';
                }
                field("Return Reason"; Rec."Return Reason")
                {
                    ToolTip = 'Specifies the value of the Return Reason field.', Comment = '%';
                }


            }
        }
    }
}
