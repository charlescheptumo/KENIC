page 95384 Sports
{
    ApplicationArea = All;
    Caption = 'Sports';
    PageType = List;
    SourceTable = Sport;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Sport Code"; Rec."Sport Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sport Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Discipline; Rec.Discipline)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline field.';
                }
                field("Discipline Description"; Rec."Discipline Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Description field.';
                }
            }
        }
    }
}
