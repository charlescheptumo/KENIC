page 50270 "ICT Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'ICT Dept Lookup List';
    PageType = List;
    SourceTable = "ICT Dept Lookup Buffer";
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
                field("ICT Buffer"; Rec."ICT Buffer")
                {
                    Caption = 'NRC Buffer';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Buffer field.', Comment = '%';
                }
            }
        }
    }
}
