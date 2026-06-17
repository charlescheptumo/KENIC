page 50132 "Posted CIT Suggestions Reviews"
{
    ApplicationArea = All;
    Caption = 'Posted CIT Suggestions Reviews';
    PageType = List;
    SourceTable = "Suggestion Box";
    CardPageId = "Posted CIT Suggestions Review";
    UsageCategory = Lists;
    SourceTableView = where("Process Status" = const(Reviewed));

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
                field("ICT Feedback"; Rec."ICT Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Feedback field.', Comment = '%';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
                field("Has Feedback"; Rec."Has Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Feedback field.', Comment = '%';
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
                field("Project Team"; Rec."Project Team")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team field.', Comment = '%';
                }
                field("Project Team Name"; Rec."Project Team Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team Name field.', Comment = '%';
                }
                field("Process Status"; Rec."Process Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Status field.', Comment = '%';
                }
            }
        }
    }
}
