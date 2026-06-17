page 50113 "Submitted Suggestions Box"
{
    ApplicationArea = All;
    Caption = 'Submitted Suggestions Box';
    PageType = List;
    SourceTable = "Suggestion Box";
    UsageCategory = Lists;
    CardPageId = "Submitted Suggestion Box";
    SourceTableView = where(Submitted = const(true), "Process Status" = filter("Under ICT"));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
                field("Requested By Name"; Rec."Requested By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By Name field.', Comment = '%';
                }
                field("System Type"; Rec."System Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the System Type field.';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
            }
        }
    }
}
