page 50134 "Rejected Suggestions"
{
    ApplicationArea = All;
    Caption = 'Rejected Suggestions';
    PageType = List;
    SourceTable = "Suggestion Box";
    UsageCategory = Lists;
    CardPageId = "Rejected Suggestion";
    SourceTableView = where("Process Status" = const(Rejected));

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
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
                field("ICT Feedback"; Rec."ICT Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Feedback field.', Comment = '%';
                }
                field("Requester Email"; Rec."Requester Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester Email field.', Comment = '%';
                }
                field("System Type"; Rec."System Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Type field.', Comment = '%';
                }
                field("Raised Date"; Rec."Raised Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised Date field.', Comment = '%';
                }
                field("Process Status"; Rec."Process Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Status field.', Comment = '%';
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejection Reason field.', Comment = '%';
                }
            }
        }
    }
}
