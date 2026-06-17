page 80222 "Approved Internal Policy Card1"
{
    PageType = Card;
    SourceTable = Policy;
    SourceTableView = WHERE(Type = CONST(Internal));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("External Ref No"; Rec."External Ref No")
                {
                    ToolTip = 'Specifies the value of the External Ref No field.';
                }
                field("Policy Dev Institution ID"; Rec."Policy Dev Institution ID")
                {
                    ToolTip = 'Specifies the value of the Policy Dev Institution ID field.';
                }
                field("Policy Overview"; Rec."Policy Overview")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Overview field.';
                }
                field("Policy Goal"; Rec."Policy Goal")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Goal field.';
                }
                field("Policy Purpose"; Rec."Policy Purpose")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Purpose field.';
                }
                field("Policy Rationale"; Rec."Policy Rationale")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Rationale field.';
                }
                field("Policy Scope"; Rec."Policy Scope")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Scope field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Process Owner ID"; Rec."Process Owner ID")
                {
                    ToolTip = 'Specifies the value of the Process Owner ID field.';
                }
                field("Process Owner Name"; Rec."Process Owner Name")
                {
                    ToolTip = 'Specifies the value of the Process Owner Name field.';
                }
                field("Process Owner Title"; Rec."Process Owner Title")
                {
                    ToolTip = 'Specifies the value of the Process Owner Title field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
                field("Approver Name"; Rec."Approver Name")
                {
                    ToolTip = 'Specifies the value of the Approver Name field.';
                }
                field("Policy Stage"; Rec."Policy Stage")
                {
                    ToolTip = 'Specifies the value of the Policy Stage field.';
                }
                field("No. of Policy Revisions"; Rec."No. of Policy Revisions")
                {
                    ToolTip = 'Specifies the value of the No. of Policy Revisions field.';
                }
                field("Employee Policy Attestations"; Rec."Employee Policy Attestations")
                {
                    Caption = 'Employee Policy Circulation';
                    ToolTip = 'Specifies the value of the Employee Policy Circulation field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part("Policy Thematic AreaS"; "Policy Thematic Area")
            {
                Caption = 'Policy Thematic AreaS';
                SubPageLink = "Policy ID" = FIELD(Code);
            }
            group("Key Dates")
            {
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Drafting Date"; Rec."Drafting Date")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Drafting Date field.';
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ToolTip = 'Specifies the value of the Approval Date field.';
                }
                field("Last Revision Date"; Rec."Last Revision Date")
                {
                    ToolTip = 'Specifies the value of the Last Revision Date field.';
                }
                field("Employee Attestation Due Date"; Rec."Employee Attestation Due Date")
                {
                    ToolTip = 'Specifies the value of the Employee Attestation Due Date field.';
                }
            }
            group("Company Information")
            {
                Caption = 'Organization Information';
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ToolTip = 'Specifies the value of the Vision Statement field.';
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ToolTip = 'Specifies the value of the Mission Statement field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Performance)
            {
                Caption = 'Performance';
                Image = Vendor;
                action("Policy Core Value")
                {
                    Caption = 'Organiation Core Values';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Core Value";
                    RunPageLink = "Policy ID" = FIELD(Code);
                    ToolTip = 'Executes the Organiation Core Values action.';
                }
                action("Policy Objectives")
                {
                    Caption = 'Policy Objectives';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Objectives";
                    RunPageLink = "Policy ID" = FIELD(Code);
                    ToolTip = 'Executes the Policy Objectives action.';
                }
                action("Policy Guiding Principle")
                {
                    Caption = 'Policy Guiding Principle';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Guiding Principle";
                    RunPageLink = "Policy ID" = FIELD(Code);
                    ToolTip = 'Executes the Policy Guiding Principle action.';
                }
                action("Policy Related Framework")
                {
                    Caption = 'Policy Related Framework';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Related Framework";
                    RunPageLink = "Policy ID" = FIELD(Code);
                    ToolTip = 'Executes the Policy Related Framework action.';
                }
                action("Policy Stakeholder")
                {
                    Caption = 'Policy Stakeholder';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Stakeholder";
                    RunPageLink = "Policy ID" = FIELD(Code);
                    ToolTip = 'Executes the Policy Stakeholder action.';
                }
                action("Policy Information Sources")
                {
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Information Sources";
                    RunPageLink = "Policy ID" = FIELD(Code);
                    ToolTip = 'Executes the Policy Information Sources action.';
                }
                action("Policy Committee Member")
                {
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Committee Member";
                    RunPageLink = "Policy ID" = FIELD(UPPERLIMIT(Code));
                    ToolTip = 'Executes the Policy Committee Member action.';
                }
            }
            // separator()
            // {
            // }
            action(Approvals)
            {
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);

                    Rec."Approval Status" := Rec."Approval Status"::Released;
                    Rec.MODIFY;
                    MESSAGE('Document has been approved Automatically');
                end;
            }
            action("Cancel Approval Request")
            {
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                ApprovalsMgmt.""(Rec);*/
                    Rec."Approval Status" := Rec."Approval Status"::Open;
                    Rec.MODIFY;
                    MESSAGE('Document has been Re-Opened');

                end;
            }
            // separator()
            // {
            // }
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    MESSAGE('Testing');
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Generate Attestation Invites")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Generate Circulation Invites';
                    Ellipsis = true;
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    // RunObject = Report 80013;
                    ToolTip = 'Generate Attestation Invites';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                    end;
                }
                action("Attestation Invitations")
                {
                    Caption = 'Circulation  Invitations';
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Attestation Invitations";
                    RunPageLink = "Policy ID" = FIELD(Code);
                    ToolTip = 'Executes the Circulation  Invitations action.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Internal;
    end;

    trigger OnOpenPage()
    begin
        Rec.Type := Rec.Type::Internal;
    end;

    var
        PolicyVersion: Record "Policy Version";
}

