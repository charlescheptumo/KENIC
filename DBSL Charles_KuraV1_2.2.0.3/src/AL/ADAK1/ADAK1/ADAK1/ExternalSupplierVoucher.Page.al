#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75408 "External Supplier Voucher"
{
    PageType = Card;
    SourceTable = "External Supplier Voucher";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Authority Code"; Rec."External Authority Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Authority Code field.';
                }
                field("External Authority Name"; Rec."External Authority Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Authority Name field.';
                }
                field("Procurement  Category ID"; Rec."Procurement  Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement  Category ID field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("IFS Description"; Rec."IFS Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("DateTime Posted"; Rec."DateTime Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateTime Posted field.';
                }
                field("Procurement Category Name"; Rec."Procurement Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category Name field.';
                }
            }
            part(Control18; "External Supplier Voucher Line")
            {
                SubPageLink = "Document No" = field("Document No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    /*IF ApprovalsMgmt.CheckIFSApprovalPossible(Rec) THEN
                      ApprovalsMgmt.OnSendIFSForApproval(Rec);*/


                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Enabled = CanCancelApprovalForRecord;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //   WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                begin
                    /*ApprovalsMgmt.OnCancelIFSApprovalRequest(Rec);
                    WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'F9';
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::Released);

                    //Check If Lines exist
                    ExternalSupplierVoucherLine.Reset;
                    ExternalSupplierVoucherLine.SetRange(ExternalSupplierVoucherLine."Document No", Rec."Document No");
                    if ExternalSupplierVoucherLine.IsEmpty then
                        Error('Please add atleast one line');


                    ExternalSupplierVoucherLine.Reset;
                    ExternalSupplierVoucherLine.SetRange(ExternalSupplierVoucherLine."Document No", Rec."Document No");
                    if ExternalSupplierVoucherLine.FindSet then
                        repeat
                            //Create entries to Vendor
                            Vendor.Init;
                            Vendor."No." := '';
                            Vendor."VAT Registration No." := ExternalSupplierVoucherLine."KRA PIN";
                            Vendor.Name := ExternalSupplierVoucherLine."Supplier Name";
                            Vendor."E-Mail" := ExternalSupplierVoucherLine."Primary Email";
                            Vendor.Tel := ExternalSupplierVoucherLine."Telephone No.";
                            Vendor.Reset;
                            Vendor.SetRange(Vendor."VAT Registration No.", ExternalSupplierVoucherLine."KRA PIN");
                            if not Vendor.FindSet then begin
                                if not Vendor.Insert(true) then
                                    Vendor.Modify(true)
                            end
                            else
                                Error('The vendor with %1 already exists', ExternalSupplierVoucherLine."KRA PIN");


                            //Create Entries to External Supplier Entry
                            VendorExternalEntry.Init;
                            VendorExternalEntry."Entry No" := VendorExternalEntry.Count + 1;
                            VendorExternalEntry."Vendor No." := Vendor."No.";
                            VendorExternalEntry."Vendor Name" := ExternalSupplierVoucherLine."Supplier Name";
                            VendorExternalEntry."Procurement Category Code" := ExternalSupplierVoucherLine."Procurement Category ID";
                            VendorExternalEntry."IFP No." := Rec."IFS Code";
                            VendorExternalEntry.Description := Rec."IFS Description";
                            if not VendorExternalEntry.Insert(true) then
                                VendorExternalEntry.Modify(true);
                        until ExternalSupplierVoucherLine.Next = 0;

                    //Mark As Posted
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."DateTime Posted" := CreateDatetime(Today, Time);
                    Rec.Modify(true);
                    Message('Posted successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    ///ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Release action.';

                trigger OnAction()
                begin
                    if Rec.Status in [Rec.Status::Open, Rec.Status::"Pending Approval"] then begin
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify();
                        Message('This document %1 has been successfully released', Rec."Document No");
                    end
                    else
                        Error('The status must be open or pending approval. Current value is %1', Format(Rec.Status));
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reopen action.';

                trigger OnAction()
                begin

                    if Rec.Status in [Rec.Status::Released, Rec.Status::"Pending Approval"] then begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                        Message('This document %1 has been successfully reopened', Rec."Document No");
                    end
                    else
                        Error('The status must be released or pending approval. Current value is %1', Format(Rec.Status));
                end;
            }
        }
    }

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VendorExternalEntry: Record "Vendor External  Entry";
        ExternalSupplierVoucherLine: Record "External Supplier Voucher Line";
        Vendor: Record Vendor;
}

