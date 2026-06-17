namespace KICD.KICD;

page 50291 "Attributes and Behavioral"
{
    ApplicationArea = All;
    Caption = 'Attributes and Behavioral';
    PageType = ListPart;
    SourceTable = "Attributes and Behavioral";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Attributes Template ID"; Rec."Attributes Template ID")
                {
                    ToolTip = 'Specifies the value of the Attributes Template ID field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Explanatory Notes"; Rec."Explanatory Notes")
                {
                    ToolTip = 'Specifies the value of the Explanatory Notes field.', Comment = '%';
                }
               
            }
        }
    }
}
