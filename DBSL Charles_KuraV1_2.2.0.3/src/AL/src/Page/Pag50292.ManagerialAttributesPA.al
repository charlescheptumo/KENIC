namespace KICD.KICD;

page 50292 "Managerial Attributes PA"
{
    ApplicationArea = All;
    Caption = 'Managerial Attributes PA';
    PageType = ListPart;
    SourceTable = "Managerial Attributes PA";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Performance Evaluation ID"; Rec."Performance Evaluation ID")
                {
                    ToolTip = 'Specifies the value of the Performance Evaluation ID field.', Comment = '%';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Very good"; Rec."Very good1")
                {
                    ToolTip = 'Specifies the value of the Very good field.', Comment = '%';
                }
                field(Good; Rec.Good)
                {
                    ToolTip = 'Specifies the value of the Good field.', Comment = '%';
                }
                field(Satifactory; Rec.Satifactory)
                {
                    ToolTip = 'Specifies the value of the Satifactory field.', Comment = '%';
                }
                field(Fair; Rec.Fair)
                {
                    ToolTip = 'Specifies the value of the Fair field.', Comment = '%';
                }
                field(Poor; Rec.Poor)
                {
                    ToolTip = 'Specifies the value of the Poor field.', Comment = '%';
                }
            }
        }
    }
}
