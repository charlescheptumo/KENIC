page 50111 "Suggestion Box"
{
    ApplicationArea = All;
    Caption = 'Suggestion Box';
    PageType = Card;
    SourceTable = "Suggestion Box";
    PromotedActionCategories = 'Approvals';

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
                    Editable = false;
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
                field("Raised Date"; Rec."Raised Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raised Date field.';
                }

                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                    Editable = false;
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                    Editable = false;
                }
                field("Process Status"; Rec."Process Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Status field.', Comment = '%';
                    Editable = false;
                }
            }
            part("Suggestion Box Lines"; "Suggestion Box Lines")
            {
                ApplicationArea = Basic;
                SubPageLink = No = field(No);
            }
        }
        area(FactBoxes)
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
            action("Send Suggestion")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send Suggestion action.';

                trigger OnAction()
                begin
                    UserSet.Reset();
                    UserSet.SetRange("System Admin", true);
                    if UserSet.Find('-') then begin
                        Rec."Admin Name" := UserSet."Employee Name";
                        Rec."Admin Email" := UserSet."E-Mail";
                        ;
                    end;
                    Recepient := Rec."Admin Email";

                    Subject := 'Submitted Suggestion';
                    Body += 'Dear ' + Rec."Admin Name" + ',';
                    Body += '<br>There are suggestions that have been made by ' + Rec."Requested By Name" + 'for the' + Format(Rec."System Type") + 'system.';
                    Body += '<br>Below are the suggestions made: <br>';
                    SuggestLines.Reset();
                    SuggestLines.SetRange(No, Rec.No);
                    if SuggestLines.FindSet then begin
                        repeat
                            SugList := SuggestLines.Proposal;
                        until SuggestLines.Next() = 0;
                    end;
                    Body += '<ul><li>' + SugList + '</li></ul>';
                    Body += '<br><br>Kind Regards,<br>' + Rec."Requested By Name" + '.';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);

                    Rec."Process Status" := Rec."Process Status"::"Under ICT";
                    Rec.Submitted := true;
                    Rec.Modify(true);
                end;
            }
            action("Send For Approval")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                Image = SendApprovalRequest;
                Caption = '&Send For Approval';
                Visible = false;
                ToolTip = 'Executes the &Send For Approval action.';

                trigger OnAction()
                begin
                    VarVariant := Rec;
                    if CustomApproval.CheckApprovalsWorkflowEnabled(VarVariant) = true then begin
                        CustomApproval.OnSendDocForApproval(VarVariant);
                    end;
                end;
            }
            action("Cancel Approval")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                Image = CancelApprovalRequest;
                Caption = '&Cancel Approval';
                Visible = false;
                ToolTip = 'Executes the &Cancel Approval action.';

                trigger OnAction()
                begin
                    VarVariant := Rec;
                    if CustomApproval.CheckApprovalsWorkflowEnabled(VarVariant) = true then begin
                        CustomApproval.OnCancelDocApprovalRequest(VarVariant);
                    end;
                end;
            }
            group(Approvals)
            {
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve', comment = 'NLB="YourLanguageCaption"';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    Image = Approve;
                    ToolTip = 'Executes the Approve action.';

                    trigger OnAction()
                    begin

                    end;
                }
            }
        }
    }


    var
        Recepient, Subject, Body : Text;
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        UserSet: Record "User Setup";
        SugList: Text;
        SuggestLines: Record "Suggestion Box Lines";
        VarVariant: Variant;
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}
