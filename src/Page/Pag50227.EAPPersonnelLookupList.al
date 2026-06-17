page 50279 "EAP Personnel Lookup List"
{
    ApplicationArea = All;
    Caption = 'EAP Personnel Lookup List';
    PageType = List;
    SourceTable = "EAP Personnel Lookup Buffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("EAP Personnel Buffer"; Rec."EAP Personnel Buffer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EAP Personnel Buffer field.', Comment = '%';
                }
            }
        }
    }
}
