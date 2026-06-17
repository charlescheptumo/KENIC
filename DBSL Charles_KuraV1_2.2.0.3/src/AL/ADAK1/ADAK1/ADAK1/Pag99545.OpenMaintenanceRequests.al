page 99545 "Open Maintenance Requests"
{
    Caption = 'Open Maintenance Requests';
    PageType = List;

    ApplicationArea = Basic;
    CardPageID = "Maintenance Request";
    DeleteAllowed = false;
    Editable = false;

    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Status = const(Open),
                            Type = filter(Maintenance));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleRegNoEditable;
                    ToolTip = 'Specifies the value of the Vehicle Reg No field.';
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = vendorEditable;
                    LookupPageID = "Vendor List";
                    ToolTip = 'Specifies the value of the Vendor(Dealer) field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Odometer Reading field.';
                }
                field("Previous Odometer Reading"; Rec."Previous Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Odometer Reading field.';
                }
                field("Next Odometer Reading"; Rec."Next Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Odometer Reading field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Date Taken for Maintenance"; Rec."Date Taken for Maintenance")
                {
                    ApplicationArea = Basic;
                    Editable = PoCreated;
                    Visible = PoCreated;
                    ToolTip = 'Specifies the value of the Date Taken for Maintenance field.';
                }
                field("Date Returned from Maintenance"; Rec."Date Returned from Maintenance")
                {
                    ApplicationArea = Basic;
                    Editable = PoCreated;
                    Visible = PoCreated;
                    ToolTip = 'Specifies the value of the Date Returned from Maintenance field.';
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Code field.';
                }
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Name field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = closedbyEditable;
                    LookupPageID = "User Setup";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = DateclosedEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("Vendor Invoice No"; Rec."Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                    Editable = vendorInvoiceEditable;
                    LookupPageID = "Purchase Invoices";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vendor Invoice No field.';
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted LSO';
                    Editable = postedInvoiceEditable;
                    LookupPageID = "Posted Purchase Invoice";
                    Visible = true;
                    ToolTip = 'Specifies the value of the Posted LSO field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            // action("Cancel Approval Request")
            // {
            //     ApplicationArea = Basic;
            //     Image = CancelApprovalRequest;
            //     Promoted = true;

            //     trigger OnAction()
            //     begin
            //         //ApprovalMgt.CancelMaintApprovalRequest(Rec,TRUE,TRUE);

            //         // ApprovalsMgmt.OnCancelMaintenaceApprovalRequest(Rec);
            //     end;
            // }
            // action(Approvals)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Approvals';
            //     Image = Approvals;
            //     Promoted = true;
            //     PromotedCategory = New;
            //     PromotedIsBig = false;

            //     trigger OnAction()
            //     var
            //         ApprovalEntries: Page "Approval Entries";
            //     begin

            //         //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
            //     end;
            // }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //CheckAllocationDetails;
                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                        //MESSAGE('Requision approved...');
                        CurrPage.Close;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Reject action.';

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Delegate action.';

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //CheckAllocationDetails;
                        // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Print action.';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Rec."Requisition No", Rec."Requisition No");
                        Report.Run(59020, true, true, Rec);
                    end;
                }
            }
        }
    }

    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // ApprovalMgt: Codeunit "Approvals Mgmt.";
        VehicleRegNoEditable: Boolean;
        vendorEditable: Boolean;
        RequestDateEditable: Boolean;
        DateofMaintenanceEditable: Boolean;
        typeofmaintenanceEditable: Boolean;
        chequenoEditable: Boolean;
        closedbyEditable: Boolean;
        DateclosedEditable: Boolean;
        vendorInvoiceEditable: Boolean;
        postedInvoiceEditable: Boolean;
        GLSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LineNo2: Code[20];
        gCuNoSeriesMngmnt: Codeunit "No. Series";
        PurchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        DocAtt: Record "Document Attachment";
        Attachments: Integer;
        PoCreated: Boolean;
}


