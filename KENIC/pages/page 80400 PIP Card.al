page 90400 "PIP Card"
{
    Caption = 'Performance Improvement Plan';
    PageType = Card;
    SourceTable = "PIP Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = IsOpen;

                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting Quarter Code"; Rec."Reporting Quarter Code")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating"; Rec."Performance Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("PIP Period")
            {
                Editable = IsOpen;

                field("PIP Duration (Days)"; Rec."PIP Duration (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(AreasOfConcern; "PIP Areas of Concern")
            {
                ApplicationArea = Basic;
                Caption = 'Areas of Concern';
                SubPageLink = "PIP No." = field(No);
                Editable = IsOpen;
            }
            part(Goals; "PIP Improvement Goals")
            {
                ApplicationArea = Basic;
                Caption = 'Step 1: Improvement Goals';
                SubPageLink = "PIP No." = field(No);
                Editable = IsOpen;
            }
            part(Activities; "PIP Activities")
            {
                ApplicationArea = Basic;
                Caption = 'Step 2: Activity Goals';
                SubPageLink = "PIP No." = field(No);
                Editable = IsOpen;
            }
            part(Resources; "PIP Resources")
            {
                ApplicationArea = Basic;
                Caption = 'Step 3: Resources';
                SubPageLink = "PIP No." = field(No);
                Editable = IsOpen;
            }
            part(Expectations; "PIP Expectations")
            {
                ApplicationArea = Basic;
                Caption = 'Step 4: Expectations';
                SubPageLink = "PIP No." = field(No);
                Editable = IsOpen;
            }
            part(Checkpoints; "PIP Checkpoints")
            {
                ApplicationArea = Basic;
                Caption = 'Step 5: Progress Checkpoints';
                SubPageLink = "PIP No." = field(No);
            }
            group("Outcome and Sign-off")
            {
                field("PIP Outcome"; Rec."PIP Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Acknowledged"; Rec."Employee Acknowledged")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Acknowledged On"; Rec."Employee Acknowledged On")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Signed"; Rec."Supervisor Signed")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Signed On"; Rec."Supervisor Signed On")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Checkpoints")
            {
                ApplicationArea = Basic;
                Caption = 'Generate 30/60/90-Day Checkpoints';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                    Rec.SuggestCheckpoints();
                    CurrPage.Update(false);
                end;
            }
            separator(Action30)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                    Rec.ValidateBeforeSubmit();

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    CurrPage.Update(false);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    CurrPage.Update(false);
                end;
            }
            separator(Action31)
            {
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Upload Documents';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        IsOpen := Rec."Approval Status" = Rec."Approval Status"::Open;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        IsOpen := true;
    end;

    var
        IsOpen: Boolean;
}
