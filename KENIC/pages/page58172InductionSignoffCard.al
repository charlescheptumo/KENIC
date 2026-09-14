#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
#pragma implicitwith disable

page 58172 "Induction Signoff Card"
{
    PageType = Card;
    SourceTable = "Induction Signoff Form";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = PageEditable;

                field("Induction No."; Rec."Induction No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unique document number for the induction signoff form.';

                    // trigger OnAssistEdit()
                    // begin
                    //     if Rec.AssistEdit(xRec) then
                    //         CurrPage.Update();
                    // end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the document was created.';
                }
                field("Offer ID"; Rec."Offer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment offer reference associated with this induction.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the application number linked to the candidate.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the candidate number.';
                }
                field("Intern Name"; Rec."Intern Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the full name of the candidate/intern.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the ID of the position being offered.';
                }
                field("Position Title"; Rec."Position Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the title of the position.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the scheduled reporting or start date.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the related job vacancy ID.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the overall processing status of the signoff document.';
                }
            }
            group("Supervisor Details")
            {
                Caption = 'Supervisor Details';
                Editable = PageEditable;

                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the supervisor assigned to oversee the induction process.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the name of the assigned supervisor.';
                }
            }
            group("Section Sign-offs")
            {
                Caption = 'Section Sign-offs';
                Editable = PageEditable;

                field("Documentation Signed"; Rec."Documentation Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether documentation clearance is signed off.';
                }
                field("Orientation Signed"; Rec."Orientation Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether orientation modules are signed off.';
                }
                field("Health & Safety Signed"; Rec."Health & Safety Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether health & safety orientation is signed off.';
                }
                field("Marketing & Comm Signed"; Rec."Marketing & Comm Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether marketing & communications overview is signed off.';
                }
                field("Business Dev Signed"; Rec."Business Dev Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether business development overview is signed off.';
                }
                field("Data Protection & QA Signed"; Rec."Data Protection & QA Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether data protection and quality assurance orientation is signed off.';
                }
                field("Conditions of Work Signed"; Rec."Conditions of Work Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether working conditions orientation is signed off.';
                }
                field("Finance & Strategy Signed"; Rec."Finance & Strategy Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether finance & strategy briefing is signed off.';
                }
                field("Technical & Security Signed"; Rec."Technical & Security Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether technical and security protocols are signed off.';
                }
                field("CEO Connect Signed"; Rec."CEO Connect Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the CEO connect briefing is signed off.';
                }
            }
            group("Audit Details")
            {
                Caption = 'Audit Details';
                Editable = false;

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the user who generated this record.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the exact date and time the record was created.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number series used to allocate the document number.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control66; Outlook)
            {
            }
            systempart(Control67; Notes)
            {
            }
            systempart(Control68; MyNotes)
            {
            }
            systempart(Control69; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Complete Signoff")
            {
                ApplicationArea = Basic;
                Caption = 'Complete Signoff';
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Marks the overall induction signoff process as fully completed.';

                trigger OnAction()
                var
                    ConfirmTxt: Label 'Are you sure you want to mark this Induction Signoff as completed?';
                begin
                    Rec.TestField(Status, Rec.Status::"In Progress");
                    
                    if Confirm(ConfirmTxt) then begin
                        Rec.Status := Rec.Status::Completed;
                        Rec.Modify(true);
                        Message('Induction Signoff document %1 has been completed.', Rec."Induction No.");
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print Signoff Form';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Prints the Induction Signoff Form.';

                trigger OnAction()
                begin
                    Rec.SetRange("Induction No.", Rec."Induction No.");
                    // Update report object ID/Name once created
                    // Report.Run(Report::"Induction Signoff Form Report", true, false, Rec);
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';

                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Sends the document for approval.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancels the pending approval request.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetPageEditability();
    end;

    trigger OnOpenPage()
    begin
        SetPageEditability();
    end;

    var
        PageEditable: Boolean;

    local procedure SetPageEditability()
    begin
        PageEditable := (Rec.Status = Rec.Status::Open) or (Rec.Status = Rec.Status::"In Progress");
    end;
}

#pragma implicitwith restore