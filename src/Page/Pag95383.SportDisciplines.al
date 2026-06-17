page 95383 "Sport Disciplines"
{
    ApplicationArea = All;
    Caption = 'Sport Disciplines';
    PageType = List;
    SourceTable = "Sport Discipline";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Discipline Code"; Rec."Discipline Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
