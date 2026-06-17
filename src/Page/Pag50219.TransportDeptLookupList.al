page 50268 "Transport Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Transport Dept Lookup List';
    PageType = List;
    SourceTable = "Transport Dept Lookup Buffer";
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
                field("Transport Buffer"; Rec."Transport Buffer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Buffer field.', Comment = '%';
                }
            }
        }
    }
}
