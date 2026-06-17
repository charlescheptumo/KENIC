page 56136 "ICT Issuance Voucher card"
{
    PageType = Card;
    SourceTable = 56061;
    PromotedActionCategories = 'Home,Process,Report,Issue,Test,Work,Return,Approval Entries, Approval';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Helpdesk No."; Rec."Helpdesk No.")
                {
                    ToolTip = 'Specifies the value of the Helpdesk No. field.';
                    Visible = false;
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
                field("Internal\external"; Rec."Internal\external")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ToolTip = 'Specifies the value of the Issued Date field.';
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
                    Caption = 'Approval Status';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
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
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
            }
            part("ICT Issuance Voucher Lines"; "ICT Issuance Voucher Lines")
            {
                // SubPageLink="No." =FIELD(No.),Type=CONST(Issuance);
                SubPageLink = "No." = field("No."), Type = const(Issuance);
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
                    REPORT.RUN(56242, TRUE, TRUE, Rec);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit "1535";
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TESTFIELD(Status, Rec.Status::Open);
                    // Status:=Status::Released;
                    Rec."Document Status" := Rec."Document Status"::Submitted;
                    Rec.MODIFY(TRUE);


                    VarVariant := Rec;
                    // IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                    //     CustomApprovals.OnSendDocForApproval(VarVariant);


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
                PromotedCategory = Category9;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit 1535;
                    // WorkflowWebhookMgt: Codeunit 1543;
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin

                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;

                    //if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) = true then begin
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //Rec.Modify(true);
                end;
                // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                // Status:=Status::Open;
                //  "Document Status":="Document Status"::Open;
                //  MODIFY(TRUE);
                // // MESSAGE('Approval Request Cancelled');
                //   ApprovalsMgmt.OnCancelICTIssuanceApprovalRequest(Rec);
                //   WorkflowWebhookMgt.FindAndCancel(RECORDID);
                //end;
            }
            action(Submit)
            {
                Caption = 'Issue';
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Issue action.';

                trigger OnAction()
                begin
                    IF Rec."Internal\external" = Rec."Internal\external"::External THEN
                        Rec.TESTFIELD(Status, Rec.Status::Released);

                    //TESTFIELD("Document Status","Document Status"::Submitted);
                    Rec.TESTFIELD(Posted, FALSE);
                    Rec.TestField("Issued To No.");
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
                            //ICTIssuanceEntries."Receiving Officer Name":=ICTIssuanceVoucherLines."Current Assigned Employee";
                            // ICTIssuanceEntries."Receiving Officer":=ICTIssuanceVoucherLines."Dpt Current Assigned";
                            ICTIssuanceEntries.INSERT(TRUE);
                        //MESSAGE('%1',Description);
                        UNTIL ICTIssuanceVoucherLines.NEXT = 0;
                        ICTInventory.RESET;
                        ICTInventory.SETRANGE(Code, ICTIssuanceVoucherLines.Code);
                        IF ICTInventory.FINDSET THEN BEGIN
                            ICTInventory."Current Assigned Employee" := Rec."Issued To No.";
                            ICTInventory."Current Assigned Division/Unit" := Rec.Department;
                            ICTInventory.MODIFY(TRUE);
                        END;
                    END;
                    //GET THE helpdesk issue and close it
                    ICTHelpdesk.RESET;
                    ICTHelpdesk.SETRANGE("Job No.", Rec."Helpdesk No.");
                    IF ICTHelpdesk.FINDFIRST THEN BEGIN
                        ICTHelpdesk.Status := ICTHelpdesk.Status::Resolved;
                        ICTHelpdesk.MODIFY(TRUE);
                    END;

                    Rec.Posted := TRUE;

                    Rec."Posting Date" := TODAY;
                    Rec."Document Status" := Rec."Document Status"::Issued;
                    Rec.MODIFY(TRUE);

                    //send email
                    // Helpdesk.GET;
                    //  ObjComInfo.GET;
                    //  IF UserSetup.GET("Issued To User ID") THEN
                    //  Body:='Please note that the item requested through the request no. '+ '  '+"No."+' '+'has been issued to you';
                    //  SMTP.CreateMessage(COMPANYNAME,ObjComInfo."E-Mail",UserSetup."E-Mail",'ICT ISSUANCE'+ ' '+"No.",Body,TRUE);
                    //  ICTIssuanceV.RESET;
                    //  ICTIssuanceV.SETRANGE("No.","No.");
                    //  IF ICTIssuanceV.FINDSET THEN BEGIN
                    //   FileDirectory :=  'C:\DOCS\';
                    //   FileName := 'ISSUANCE_NO'+ICTIssuanceV."No."+'.pdf';
                    // //   REPORT.SAVEASPDF(56242,FileDirectory+FileName,ICTIssuanceV);
                    // END;
                    //  SMTP.AddBCC(Helpdesk."ICT Email");
                    //  SMTP.AddAttachment(FileDirectory+FileName,FileName);
                    //   SMTP.Send();
                    // MESSAGE('Issued Successfully To %1',Name);
                end;
            }
            action(Accept)
            {
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Accept action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Document Status", Rec."Document Status"::Issued);
                    Rec."Document Status" := Rec."Document Status"::Verified;
                    Rec."Acceptance Status" := Rec."Acceptance Status"::Accept;
                    Rec.MODIFY(TRUE);
                    MESSAGE('Accepted Successfully');
                end;
            }
            action(Reject)
            {
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Reject action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Document Status", Rec."Document Status"::Issued);
                    Rec."Document Status" := Rec."Document Status"::Submitted;
                    Rec."Acceptance Status" := Rec."Acceptance Status"::Reject;
                    Rec.MODIFY(TRUE);
                    //send email
                    Helpdesk.GET;
                    ObjComInfo.GET;
                    IF UserSetup.GET(Rec."Issued To User ID") THEN
                        Body := 'Please note that the item requested through the request no. ' + '  ' + Rec."No." + ' ' + 'has been rejected';
                    //  SMTP.CreateMessage(COMPANYNAME,ObjComInfo."E-Mail",UserSetup."E-Mail",'ICT ISSUANCE'+ ' '+"No.",Body,TRUE);
                    //  SMTP.AddBCC(Helpdesk."ICT Email");
                    //   SMTP.Send();
                    MESSAGE('Rejected Successfully');
                end;
            }
            action(Return)
            {
                Image = Return;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Executes the Return action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Document Status", Rec."Document Status"::Issued);
                    Rec."Document Status" := Rec."Document Status"::Returned;
                    Rec."Acceptance Status" := Rec."Acceptance Status"::Accept;
                    Rec.MODIFY(TRUE);

                    ICTIssuanceVoucherLines.Reset;
                    ICTIssuanceVoucherLines.setRange("No.", Rec."No.");
                    If ICTIssuanceVoucherLines.FindSet() then begin
                        repeat
                            ICTInventory.RESET;
                            ICTInventory.SETRANGE(Code, ICTIssuanceVoucherLines.Code);
                            IF ICTInventory.FINDSET THEN BEGIN
                                ICTInventory."Current Assigned Employee" := '';
                                ICTInventory."Current Assigned Division/Unit" := '';
                                ICTInventory.MODIFY(TRUE);
                            END;

                        until ICTIssuanceVoucherLines.Next() = 0;
                    End;
                    //send email
                    Helpdesk.GET;
                    ObjComInfo.GET;
                    IF UserSetup.GET(Rec."Issued To User ID") THEN
                        Body := 'Please note that the item requested through the request no. ' + '  ' + Rec."No." + ' ' + 'has been returned to the ICT';
                    //  SMTP.CreateMessage(COMPANYNAME,ObjComInfo."E-Mail",UserSetup."E-Mail",'ICT ISSUANCE'+ ' '+"No.",Body,TRUE);
                    //  SMTP.AddBCC(Helpdesk."ICT Email");
                    //   SMTP.Send();

                    MESSAGE('Returned Successfully');
                end;
            }
            action(Approvals)
            {
                AccessByPermission = TableData 454 = R;
                ApplicationArea = Suite;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                trigger OnAction()
                var
                    // WorkflowsEntriesBuffer: Record "832";
                    // ApprovalsMgmt: Codeunit "1535";
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
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
        IF (Rec.Status = Rec.Status::Released) AND (Rec."Document Status" = Rec."Document Status"::Submitted) THEN
            corec := FALSE;
        corec1 := TRUE;
        IF (Rec.Status = Rec.Status::Released) AND (Rec."Document Status" = Rec."Document Status"::Issued) THEN
            corec1 := FALSE;
        corec2 := TRUE;
        IF (Rec.Status = Rec.Status::Released) AND (Rec."Document Status" = Rec."Document Status"::Verified)
          AND (Rec."Acceptance Status" = Rec."Acceptance Status"::Accept) THEN
            corec2 := FALSE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Issuance;
        Rec."Document Status" := Rec."Document Status"::Open;
        Rec."Issuance type" := Rec."Issuance type"::"Temporary";
    end;

    trigger OnOpenPage()
    begin
        /*IF "Document Status"="Document Status"::Submitted THEN
          CurrPage.EDITABLE:=FALSE;
        MODIFY(TRUE);
        */
        IF Rec.Status = Rec.Status::"Pending Approval" THEN
            corec := FALSE;
        corec := TRUE;
        IF (Rec.Status = Rec.Status::Released) AND (Rec."Document Status" = Rec."Document Status"::Submitted) THEN
            corec := FALSE;
        corec1 := TRUE;
        IF (Rec.Status = Rec.Status::Released) AND (Rec."Document Status" = Rec."Document Status"::Issued) THEN
            corec1 := FALSE;
        corec2 := TRUE;
        IF (Rec.Status = Rec.Status::Released) AND (Rec."Document Status" = Rec."Document Status"::Verified) THEN
            corec2 := FALSE;

    end;

    var
        ICTIssuanceEntries: Record 56064;
        ICTIssuanceVoucherLines: Record 56062;
        ICTInventory: Record 56060;
        corec: Boolean;
        corec1: Boolean;
        corec2: Boolean;
        corec3: Boolean;
        EditValue: Boolean;
        ObjComInfo: Record 79;
        UserSetup: Record 91;
        SMTP: Codeunit Email;
        Body: Text;
        Helpdesk: Record 56056;
        ICTHelpdesk: Record 56050;
        FileDirectory: Text[100];
        FileName: Text[100];
        ICTIssuanceV: Record 56061;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

        OpenApprovalEntriesExist: Boolean;

}

