namespace KICD.KICD;

page 50289 "Managerial Attributes Lines"
{
    ApplicationArea = All;
    Caption = 'Managerial Attributes Lines';
    PageType = ListPart;
    SourceTable = "Managerial Attributes Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Managerial Template ID"; Rec."Managerial Template ID")
                {
                    ToolTip = 'Specifies the value of the Managerial Template ID field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
