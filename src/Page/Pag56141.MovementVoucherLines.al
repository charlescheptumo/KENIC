page 56141 "Movement Voucher Lines"
{
    ApplicationArea = All;
    Caption = 'Movement Voucher Lines';
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                }
                field("FA No"; Rec."FA No")
                {
                    ToolTip = 'Specifies the value of the FA No field.', Comment = '%';
                }
                field("Current Assigned Employee"; Rec."Current Assigned Employee")
                {
                    ToolTip = 'Specifies the value of the Current Assigned Employee field.', Comment = '%';
                }
                field("Dpt Current Assigned"; Rec."Dpt Current Assigned")
                {
                    ToolTip = 'Specifies the value of the Dpt Current Assigned field.', Comment = '%';
                }
            }
        }
    }
}
