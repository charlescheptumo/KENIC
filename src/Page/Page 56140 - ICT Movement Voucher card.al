page 56140 "ICT Movement Voucher card"
{
    PageType = Card;
    SourceTable = 56061;
    PromotedActionCategories = 'New,Process,Report,Approvals,Move,Approvals,Request Approvals';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = corec;
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ToolTip = 'Specifies the value of the Issued To User ID field.';
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ToolTip = 'Specifies the value of the Issued To No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    Caption = 'Date of Movement';
                    ToolTip = 'Specifies the value of the Date of Movement field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Branch';
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    Caption = 'Processed By';
                    ToolTip = 'Specifies the value of the Processed By field.';
                }
            }

            part("Movement Voucher Lines"; "Movement Voucher Lines")
            {

                SubPageLink = "No." = field("No."), Type = const(Movement);

            }

        }
        area(factboxes)
        {

        }
    }
    actions
    {
        area(navigation)
        {
            action(Print)
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETRANGE("No.", Rec."No.");
                    REPORT.RUN(56243, TRUE, TRUE, Rec);
                end;
            }
            action(Submit)
            {
                Caption = 'Move';
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Move action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD(Status, Rec.Status::Released);
                    Rec.TESTFIELD(Posted, FALSE);
                    ICTIssuanceVoucherLines.RESET;
                    ICTIssuanceVoucherLines.SETRANGE("No.", Rec."No.");
                    ICTIssuanceVoucherLines.SETRANGE(Type, Rec.Type);
                    IF ICTIssuanceVoucherLines.FINDSET THEN BEGIN
                        REPEAT
                            ICTIssuanceEntries.INIT;
                            ICTIssuanceEntries."Entry No" := ICTIssuanceEntries."Entry No" + 100;
                            ICTIssuanceEntries."No." := Rec."No.";
                            ICTIssuanceEntries."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                            ICTIssuanceEntries.Directorate := Rec.Directorate;
                            ICTIssuanceEntries.Department := Rec.Department;
                            ICTIssuanceEntries."Division/Unit" := Rec."Division/Unit";
                            ICTIssuanceEntries.Code := ICTIssuanceVoucherLines.Code;
                            ICTIssuanceEntries.Description := ICTIssuanceVoucherLines.Description;
                            ICTIssuanceEntries."Serial No." := ICTIssuanceVoucherLines."Serial No.";
                            ICTIssuanceEntries."FA No" := ICTIssuanceVoucherLines."FA No";
                            ICTIssuanceEntries.Type := ICTIssuanceVoucherLines.Type;
                            ICTIssuanceEntries."Reason For Movement" := ICTIssuanceVoucherLines."Reason For Movement";
                            ICTIssuanceEntries."Issued To User ID" := Rec."Issued To User ID";
                            ICTIssuanceEntries."Issued To No." := Rec."Issued To No.";
                            ICTIssuanceEntries."Issued By" := Rec."Issued By";
                            ICTIssuanceEntries."Issued Date" := Rec."Issued Date";
                            ICTIssuanceEntries.Name := Rec.Name;
                            ICTIssuanceEntries."Duration of Use" := ICTIssuanceVoucherLines."Duration of Use";
                            ICTIssuanceEntries."Duration of Use end date" := ICTIssuanceVoucherLines."Duration of Use end date";
                            ICTIssuanceEntries."Duration of Use start date" := ICTIssuanceVoucherLines."Duration of Use start date";
                            ICTIssuanceEntries."Previously Assigned Dpt" := ICTIssuanceVoucherLines."Dpt Current Assigned";
                            ICTIssuanceEntries."Previously Assigned To" := ICTIssuanceVoucherLines."Current Assigned Employee";
                            ICTIssuanceEntries.INSERT(TRUE);
                        UNTIL ICTIssuanceVoucherLines.NEXT = 0;
                        ICTInventory.RESET;
                        ICTInventory.SETRANGE(Code, ICTIssuanceVoucherLines.Code);
                        IF ICTInventory.FINDSET THEN BEGIN
                            ICTInventory."Current Assigned Employee" := Rec."Issued To No.";
                            ICTInventory."Current Assigned Division/Unit" := Rec.Department;
                            ICTInventory.MODIFY(TRUE);
                        END;
                    END;
                    Rec.Posted := TRUE;
                    Rec."Posting Date" := TODAY;
                    Rec.MODIFY(TRUE);
                    //send email
                    //         Helpdesk.GET;
                    //          ObjComInfo.GET;
                    //          IF UserSetup.GET("Issued To User ID") THEN
                    //          Body:='Please note that the attached items requested through the request no. '+ '  '+"No."+' '+'has been issued to you';
                    //          SMTP.CreateMessage(COMPANYNAME,ObjComInfo."E-Mail",UserSetup."E-Mail",'ICT MOVEMENT'+ ' '+"No.",Body,TRUE);
                    //          ICTIssuanceV.RESET;
                    //          ICTIssuanceV.SETRANGE("No.","No.");
                    //          IF ICTIssuanceV.FINDSET THEN BEGIN
                    //           FileDirectory :=  'C:\DOCS\';
                    //           FileName := 'Movement_NO'+ICTIssuanceV."No."+'.pdf';
                    //           REPORT.SAVEASPDF(56243,FileDirectory+FileName,ICTIssuanceV);
                    //         END;
                    //          SMTP.AddBCC(Helpdesk."ICT Email");
                    //          SMTP.AddAttachment(FileDirectory+FileName,FileName);
                    //           SMTP.Send();
                    //         MESSAGE('Moved Successfully');
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TESTFIELD(Status, Rec.Status::Open);
                    // Status:=Status::Released;
                    Rec."Document Status" := Rec."Document Status"::Submitted;
                    Rec.MODIFY(TRUE);
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) = true then begin
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                    // MESSAGE('Approved Successfully');

                    //  IF ApprovalsMgmt.CheckICTIssuanceApprovalPossible(Rec) THEN
                    //   ApprovalsMgmt.OnSendICTIssuanceForApproval(Rec);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approval Management Ext";
                    WorkflowWebhookMgt: Codeunit 1543;
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TESTFIELD(Status, Rec.Status::Released);
                    // Status:=Status::Open;
                    Rec."Document Status" := Rec."Document Status"::Open;
                    Rec.MODIFY(TRUE);
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    // MESSAGE('Approval Request Cancelled');
                    //   ApprovalsMgmt.OnCancelICTIssuanceApprovalRequest(Rec);
                    //   WorkflowWebhookMgt.FindAndCancel(RECORDID);
                end;
            }
            action(Approvals)
            {
                AccessByPermission = TableData 454 = R;
                ApplicationArea = Suite;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                trigger OnAction()
                var
                    WorkflowsEntriesBuffer: Record 832;
                    ApprovalsMgmt: Codeunit 1535;
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RECORDID);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // IF "Document Status"="Document Status"::Submitted THEN
        //  CurrPage.EDITABLE:=FALSE;
        // MODIFY(TRUE);
        corec := TRUE;
        IF Rec.Status = Rec.Status::Released THEN
            corec := FALSE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Movement;
    end;

    trigger OnOpenPage()
    begin
        /*IF "Document Status"="Document Status"::Submitted THEN
          CurrPage.EDITABLE:=FALSE;
        MODIFY(TRUE);
        */
        corec := TRUE;
        IF Rec.Status = Rec.Status::Released THEN
            corec := FALSE;

    end;

    var
        ICTIssuanceEntries: Record "ICT Issuance Entries";
        ICTIssuanceVoucherLines: Record "ICT Issuance Voucher Lines";
        ICTInventory: Record "ICT Inventory";
        corec: Boolean;
        EditValue: Boolean;
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        // SMTP: Codeunit 400;
        Body: Text;
        Helpdesk: Record "ICT Helpdesk Global Parameters";
        ICTHelpdesk: Record "ICT Helpdesk";
        FileDirectory: Text[100];
        FileName: Text[100];
        ICTIssuanceV: Record "ICT Issuance Voucher";
}

