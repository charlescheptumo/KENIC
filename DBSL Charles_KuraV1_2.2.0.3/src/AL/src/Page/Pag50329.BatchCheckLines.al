namespace KICD.KICD;

page 50329 "Batch Check Lines"
{
    ApplicationArea = All;
    Caption = 'Batch Check Lines';
    PageType = ListPart;
    SourceTable = "Batch Check Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Vendor No"; Rec."Vendor No")
                {
                    ToolTip = 'Specifies the value of the Vendor No field.', Comment = '%';
                }
                field("Vedor Name"; Rec."Vedor Name")
                {
                    Caption = 'Vendor Name';
                    ToolTip = 'Specifies the value of the Vedor Name field.', Comment = '%';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ToolTip = 'Specifies the value of the Net Amount field.', Comment = '%';
                }
                field("PV No"; Rec."PV No")
                {
                    ToolTip = 'Specifies the value of the PV No field.', Comment = '%';
                }
            }
        }
    }
}
