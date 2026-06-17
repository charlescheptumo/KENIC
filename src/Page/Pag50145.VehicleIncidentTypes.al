page 50145 "Vehicle Incident Types"
{
    ApplicationArea = All;
    Caption = 'Vehicle Incident Types';
    PageType = List;
    SourceTable = "Vehicle Incident Types";
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
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
