page 50128 "CIT Suggestions Reviews"
{
    ApplicationArea = All;
    Caption = 'CIT Suggestions Reviews';
    PageType = List;
    SourceTable = "Suggestion Box";
    SourceTableView = where("Process Status" = filter("Under CIT Review"));
    CardPageId = "CIT Suggestion Review";
    UsageCategory = Lists;

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
                field(Proposal; Rec.Proposal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal field.', Comment = '%';
                    Visible = false;
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
                field("System Type"; Rec."System Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Type field.', Comment = '%';
                }
                field("ICT Feedback"; Rec."ICT Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Feedback field.', Comment = '%';
                }
                field("Has Feedback"; Rec."Has Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Feedback field.', Comment = '%';
                }
                field("Raised Date"; Rec."Raised Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised Date field.', Comment = '%';
                }

            }
        }
    }
}
