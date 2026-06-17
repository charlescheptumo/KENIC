namespace KICD.KICD;

page 50295 "Core attributes&Attributes"
{
    ApplicationArea = All;
    Caption = 'Core attributes&Attributes';
    PageType = ListPart;
    SourceTable = "Core Values & Attributes PA";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Explanatory Note"; Rec."Explanatory Note")
                {
                    ToolTip = 'Specifies the value of the Explanatory Note field.', Comment = '%';
                }
                field("Score Attained"; Rec."Score Attained")
                {
                    ToolTip = 'Specifies the value of the Score Attained field.', Comment = '%';
                }
                field(Comments; Rec.Comments)
                {
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                }
            }
        }
    }
}
