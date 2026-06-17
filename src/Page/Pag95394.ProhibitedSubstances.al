page 95394 "Prohibited Substances"
{
    ApplicationArea = All;
    Caption = 'Prohibited Substances';
    PageType = List;
    SourceTable = "Prohibited Substances";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Substance Code"; Rec."Substance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Substance Code field.';
                }
                field("Substance Description"; Rec."Substance Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Substance Description field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Category field.';
                }
            }
        }
    }
}
