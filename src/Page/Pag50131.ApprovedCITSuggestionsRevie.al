page 50131 "Approved CIT Suggestions Revi"
{
    ApplicationArea = All;
    Caption = 'Approved CIT Suggestions Review';
    PageType = Card;
    SourceTable = "Suggestion Box";
    // SourceTableView = where("Process Status" = const("Under CIT Completion"));

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
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
                field("Created Preliminary Report"; Rec."Created Preliminary Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Preliminary Report field.', Comment = '%';
                }
                field("Created TOR"; Rec."Created TOR")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created TOR field.', Comment = '%';
                }
                field("Minimum Requirements"; Rec."Minimum Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Requirements field.', Comment = '%';
                }
                field("Reviewed User Requirements/Technical Specifications"; Rec."Reviewed User Requirements/Technical Specifications")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reviewed User Requirements/Technical Specifications field.', Comment = '%';
                }
                field("Checked Workplan and Verified Budget"; Rec."Checked Workplan and Verified Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checked Workplan and Verified Budget field.', Comment = '%';
                }
                field("Logical and Physical Design Upload"; Rec."Logical and Physical Design Upload")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Logical and Physical Design Upload field.', Comment = '%';
                }
                field("System Testing"; Rec."System Testing")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Testing field.', Comment = '%';
                }
                field("User Manual"; Rec."User Manual")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Manual field.', Comment = '%';
                }
                field("Training Report"; Rec."Training Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Report field.', Comment = '%';
                }
                field("System Acceptance Report"; Rec."System Acceptance Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Acceptance Report field.', Comment = '%';
                }
                field("Handing Over Report"; Rec."Handing Over Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Handing Over Report field.', Comment = '%';
                }
            }
            part("Suggestion Box Lines"; "Suggestion Box Lines")
            {
                Editable = false;
                ApplicationArea = Basic;
                SubPageLink = No = field(No);
            }
        }
        area(Factboxes)
        {
            part("Attached Documents1"; "Doc. Attachment List Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(50049), "No." = FIELD(No);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Post Suggestion")
            {
                ApplicationArea = All;
                Caption = 'Post Suggestion', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = PostDocument;
                ToolTip = 'Executes the Post Suggestion action.';

                trigger OnAction()
                begin
                    Rec."Process Status" := Rec."Process Status"::Reviewed;
                    Rec.Modify(true);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec."Process Status" := Rec."Process Status"::"Under CIT Completion";
        Rec.Modify(true);
    end;

    trigger OnAfterGetRecord()
    begin
        Rec."Process Status" := Rec."Process Status"::"Under CIT Completion";
        Rec.Modify(true);
    end;
}
