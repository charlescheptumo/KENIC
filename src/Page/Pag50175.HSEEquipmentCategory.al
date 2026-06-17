page 50175 "HSE Equipment Category"
{
    ApplicationArea = All;
    Caption = 'HSE Equipment Category';
    PageType = List;
    SourceTable = "HSE Equipment Category";
    UsageCategory = Lists;

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
                field("No. Of Equipement Types"; Rec."No. Of Equipement Types")
                {
                    ToolTip = 'Specifies the value of the No. Of Equipement Types field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
        }
    }
}
