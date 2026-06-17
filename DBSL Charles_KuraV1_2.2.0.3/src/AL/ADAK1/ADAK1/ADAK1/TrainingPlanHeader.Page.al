#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69195 "Training Plan Header"
{
    PageType = Card;
    SourceTable = "Training Plan Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Status;
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Internal Training"; Rec."Internal Training")
                {
                    ApplicationArea = Basic;
                    Caption = 'Internal Training Estimated Cost';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Internal Training Estimated Cost field.';
                }
                field("External Training"; Rec."External Training")
                {
                    ApplicationArea = Basic;
                    Caption = 'External Training Estimated Cost';
                    Editable = false;
                    ToolTip = 'Specifies the value of the External Training Estimated Cost field.';
                }
                field("Total Estimated Cost"; Rec."Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Estimated Cost field.';
                }
                field("Bugdet Available"; Rec."Bugdet Available")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Allocation';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Allocation field.';
                }
                field("Budget Allocation"; Rec."Budget Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Available';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Available field.';
                }
                field("Budget Utilized"; Rec."Budget Utilized")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Utilized field.';
                }
                field("Approved Status"; Rec."Approved Status")
                {
                    ApplicationArea = Basic;
                    Caption = ' Status';
                    ToolTip = 'Specifies the value of the  Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control16; "Training Plan Lines")
            {
                Enabled = Status;
                SubPageLink = "Training Plan Code" = field(No);
            }
            part(Control17; "Training Plan Lines2")
            {
                Caption = 'Other Training Plans';
                Enabled = Status;
                SubPageLink = "Training Plan Code" = field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';

                trigger OnAction()
                begin
                    Message('');
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to send an approval request', true) = false then exit;
                    // if ApprovalsMgmt.CheckTPlanApprovalsWorkflowEnabled(Rec) then
                    //   ApprovalsMgmt.OnSendTPlanForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                begin
                    Rec.TestField("Approved Status", Rec."approved status"::"Pending Approval");
                    if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                    //   ApprovalsMgmt.OnCancelTPlanApprovalRequest(Rec);
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Caption = 'Re-Open';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the Re-Open action.';

                trigger OnAction()
                begin
                    Rec."Approved Status" := Rec."approved status"::Open;
                    Rec.Modify(true);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(69145, true, false, Rec);
                end;
            }
            action("Suggest Costs and Applicants")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Suggest Costs and Applicants action.';
            }
        }
        area(processing)
        {
            action("Training Plan Goals")
            {
                ApplicationArea = Basic;
                Image = Planning;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Training Goal Setup";
                RunPageLink = "Training Plan ID" = field(No);
                ToolTip = 'Executes the Training Plan Goals action.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        Status := true;
        if Rec."Approved Status" = Rec."approved status"::"Pending Approval" then
            Status := false else
            Status := true;
    end;

    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Status: Boolean;

    local procedure SuggestCosts(TrainingNeed: Record "Advertisement Channels")
    var
        TrainingCost: Record "Training Cost";
    begin
    end;

    local procedure SuggestParticipants()
    begin
    end;
}

#pragma implicitwith restore

