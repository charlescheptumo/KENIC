page 50116 "Item Brand"
{
    ApplicationArea = All;
    Caption = 'Item Brand';
    PageType = List;
    SourceTable = "Item Brand";
    UsageCategory = Documents;

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
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.', Comment = '%';
                }
            }
        }
    }
}
