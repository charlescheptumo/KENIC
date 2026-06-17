#pragma warning disable AA0005, AA0008, AA0018,AL0603, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

codeunit 50018 "Custom Function"
{
    Permissions = TableData "Approval Entry" = RIMD;
    trigger OnRun()
    begin

    end;

    var
        CurrExchRate: Record "Currency Exchange Rate";
        //table approval workflow
        UserIdNotInSetupErr: Label 'User ID %1 does not exist in the Approval User Setup window.', Comment = 'User ID NAVUser does not exist in the Approval User Setup window.';
        ApproverUserIdNotInSetupErr: Label 'You must set up an approver for user ID %1 in the Approval User Setup window.', Comment = 'You must set up an approver for user ID NAVUser in the Approval User Setup window.';
        WFUserGroupNotInSetupErr: Label 'The workflow user group member with user ID %1 does not exist in the Approval User Setup window.', Comment = 'The workflow user group member with user ID NAVUser does not exist in the Approval User Setup window.';
        SubstituteNotFoundErr: Label 'There is no substitute, direct approver, or approval administrator for user ID %1 in the Approval User Setup window.', Comment = 'There is no substitute for user ID NAVUser in the Approval User Setup window.';
        NoSuitableApproverFoundErr: Label 'No qualified approver was found.';
        DelegateOnlyOpenRequestsErr: Label 'You can only delegate open approval requests.';
        NoWFUserGroupMembersErr: Label 'The workflow must have at least one member';
        WorkflowManagement: Codeunit "Workflow Management";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'This record is not supported by related approval workflow.';

        Connected: Boolean;

    [EventSubscriber(ObjectType::Page, 51, 'OnBeforeActionEvent', 'SendApprovalRequest', false, false)]
    local procedure SendApproval(var Rec: Record "Purchase Header")
    var
        CheckDimensions: Codeunit "Check Dimensions";
        PurchLine: Record "Purchase Line";
    begin
        CheckDimensions.CheckPurchDim(Rec, PurchLine);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice", 'OnBeforeActionEvent', 'SendApprovalRequest', false, false)]
    local procedure SendApprovalSales(var Rec: Record "Sales Header")
    var
        CheckDimensions: Codeunit "Check Dimensions";
        SalesLine: Record "Sales Line" temporary;
    begin
        CheckDimensions.CheckSalesDim(Rec, SalesLine);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeCheckPurchaseApprovalPossible', '', false, false)]
    local procedure OnBeforeCheckPurchaseApprovalPossible(PurchaseHeader: Record "Purchase Header"; var Result: Boolean; var IsHandled: Boolean)
    var
        PurchaseLine: Record "Purchase Line";
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
            PurchaseHeader.TestField("Quotation No.");
            PurchaseHeader.TestField("Quotation Description");
            PurchaseHeader.TestField("PP Preference/Reservation Code");
            PurchaseLine.Reset();
            PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
            PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
            if PurchaseLine.FindSet() then begin
                repeat
                    PurchaseLine.TestField("Gen. Bus. Posting Group");
                    PurchaseLine.TestField("Gen. Prod. Posting Group");
                    PurchaseLine.TestField("Location Code");
                    PurchaseLine.TestField("Unit of Measure");
                    PurchaseLine.TestField("Qty. to Receive");
                    PurchaseLine.TestField("Qty. to Invoice");
                until PurchaseLine.Next() = 0;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Print", OnBeforePrintCheckProcedure, '', false, false)]
    local procedure "Document-Print_OnBeforePrintCheckProcedure"(var NewGenJnlLine: Record "Gen. Journal Line"; var GenJournalLine: Record "Gen. Journal Line"; var IsPrinted: Boolean)
    var
        BankAccount: code[20];
    begin
        BankAccount := NewGenJnlLine."Bal. Account No.";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnInitInsertOnBeforeInitRecord', '', false, false)]
    local procedure OnInitInsertOnBeforeInitRecord(var PurchaseHeader: Record "Purchase Header"; var xPurchaseHeader: Record "Purchase Header")
    var
        usersetup: Record "User Setup";
        Emp: Record Employee;
    begin
        PurchaseHeader."Requester ID" := UserId;
        if usersetup.get(UserId) then begin
            if not usersetup."Portal User" then begin
                PurchaseHeader.Region := usersetup."Region Code";
                PurchaseHeader."Request-By No." := usersetup."Employee No.";
                PurchaseHeader."Request-By Name" := usersetup."Employee Name";
                PurchaseHeader."Location Code" := usersetup."Responsibility Center";
                if Emp.Get(usersetup."Employee No.") then begin
                    PurchaseHeader.Validate("Directorate Code", Emp."Directorate Code");
                    PurchaseHeader.Validate("Department Code", Emp."Department Code");
                end
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeCheckPurchLines', '', false, false)]
    local procedure OnBeforeCheckPurchLines(var PurchaseHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition" then
            IsHandled := true;
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Loan Issue Requisition" then
            IsHandled := true;
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Loan Issue Surrender" then
            IsHandled := true;
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Item Rejection" then
            IsHandled := true;
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Meals Requisition" then
            IsHandled := true;

    end;

    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
     local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
     begin
         IF PurchaseHeader."Buy-from Vendor No." = '' THEN
             PurchaseHeader."Buy-from Vendor No." := 'VEND0153'
     end;

     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnCodeOnAfterCheck', '', false, false)]
     local procedure OnCodeOnAfterCheck(PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; var LinesWereModified: Boolean)
     begin
         if PurchaseHeader."Buy-from Vendor No." = 'VEND0153' then
             PurchaseHeader.Validate("Buy-from Vendor No.", '');
     end;*/
    //Update job planning lines amounts
    [EventSubscriber(ObjectType::Table, Database::"Job Planning Line", 'OnAfterUpdateAllAmounts', '', false, false)]
    local procedure OnAfterUpdateAllAmounts(var JobPlanningLine: Record "Job Planning Line"; var xJobPlanningLine: Record "Job Planning Line")
    var
        AmountRoundingPrecision: Decimal;
        AmountRoundingPrecisionFCY: Decimal;
        Currency: Record Currency;
    begin
        if (AmountRoundingPrecision = 0) or
         (AmountRoundingPrecisionFCY = 0)
      then begin
            Clear(Currency);
            Currency.InitRoundingPrecision;
            AmountRoundingPrecision := Currency."Amount Rounding Precision";
            AmountRoundingPrecisionFCY := Currency."Amount Rounding Precision";
        end;
        JobPlanningLine.Validate("VAT Bus. Posting Group");
        JobPlanningLine."Total Cost Incl. VAT" := Round(JobPlanningLine."Unit Cost Inc VAT" * JobPlanningLine.Quantity, AmountRoundingPrecisionFCY);
        JobPlanningLine."Total Cost Incl. VAT LCY" := ConvertAmountToLCY(JobPlanningLine, JobPlanningLine."Total Cost Incl. VAT", AmountRoundingPrecision);
    end;

    local procedure ConvertAmountToLCY(JobPlanningLine: Record "Job Planning Line"; AmountFCY: Decimal; Precision: Decimal): Decimal;
    begin
        exit(ConvertAmountToLCY(JobPlanningLine, JobPlanningLine."Currency Date", AmountFCY, JobPlanningLine."Currency Factor", Precision));
    end;

    local procedure ConvertAmountToLCY(JobPlanningLine: Record "Job Planning Line"; PostingDate: Date; AmountFCY: Decimal; CurrencyFactor: Decimal; Precision: Decimal) AmountLCY: Decimal;
    begin
        AmountLCY :=
            Round(
                CurrExchRate.ExchangeAmtFCYToLCY(
                    PostingDate, JobPlanningLine."Currency Code", AmountFCY, CurrencyFactor),
                Precision);
    end;
    //Update job planning lines amounts
    //modify inserting purchase receipt header
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchRcptHeaderInsert', '', false, false)]
    local procedure OnBeforePurchRcptHeaderInsert(var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean; WarehouseReceiptHeader: Record "Warehouse Receipt Header"; WhseReceive: Boolean; WarehouseShipmentHeader: Record "Warehouse Shipment Header"; WhseShip: Boolean)
    begin
        PurchRcptHeader.Description := PurchaseHeader.Description;
        PurchRcptHeader."Quotation No." := PurchaseHeader."Quotation No.";
        PurchRcptHeader."Quotation Description" := PurchaseHeader."Quotation Description";
        PurchRcptHeader."PP Preference/Reservation Code" := PurchaseHeader."PP Preference/Reservation Code";
    end;

    ///Modify Approvals


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCreateApprovalRequestsOnElseCase', '', false, false)]
    local procedure OnCreateApprovalRequestsOnElseCase(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntryArgument: Record "Approval Entry")
    var
        PCSumExpensing: Record "Request for PC sum Expensing";
        ProjectApprovalSetup: Record "Project Approval Setup Matrix";
        MeasurementHeader: Record "Measurement &  Payment Header";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        RAMWorkplanHeader: Record "RAM Workplan Header";
        PurchHeader: Record "Purchase Header";
        CommunicationPlan: Record "Communication Plan Header";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        RepaymentSchedule: Record "RE Payment Schedule Header";
        ProjectVariation: Record "Project Variation Header";
        Subcontracting: Record "Subcontracting Header";
        ContractorInspectionRequest: Record "Contractor Inspection Request";
        RiskManagementplan: Record "Risk Management Plan";
        InspectionHeaderss: Record "Inspection Headersss";
        InspectionHeader: Record "Inspection Header1";
        SiteInstructions: Record "Site Instructions Header";
        Jobs: Record Job;
        RecRef: RecordRef;
        ApproverId: Code[50];
        SequenceNo: Integer;
        IsHandled: Boolean;
        ApprovalsMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
        ProjectID: Code[20];
    begin
        case WorkflowStepArgument."Approver Type" of
            WorkflowStepArgument."Approver Type"::"Use Table":
                begin
                    //  RecRef := ApprovalEntryArgument."Record ID to Approve".GetRecord();
                    RecRef.Get(ApprovalEntryArgument."Record ID to Approve");
                    // if not UserSetup.Get(UserId) then
                    //     Error(UserIdNotInSetupErr, UserId);
                    // SequenceNo := ApprovalsMgt.GetLastSequenceNo(ApprovalEntryArgument);
                    case RecRef.Number of
                        Database::"Request for PC sum Expensing":
                            begin
                                RecRef.setTable(PCSumExpensing);
                                GetFromProjectApprovalSetup(PCSumExpensing."Project ID", ApprovalEntryArgument);
                                ProjectID := PCSumExpensing."Project ID";
                            end;
                        Database::"Measurement &  Payment Header":
                            begin
                                RecRef.setTable(MeasurementHeader);
                                GetFromProjectApprovalSetup(MeasurementHeader."Project ID", ApprovalEntryArgument);
                                ProjectID := MeasurementHeader."Project ID";
                            end;
                        Database::"Project Staff Voucher":
                            begin
                                RecRef.setTable(ProjectStaffVoucher);
                                GetFromProjectApprovalSetup(ProjectStaffVoucher."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectStaffVoucher."Project ID";
                            end;
                        Database::"Project Mobilization Header":
                            begin
                                RecRef.Settable(ProjectMobilization);
                                GetFromProjectApprovalSetup(ProjectMobilization."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectMobilization."Project ID";
                            end;
                        Database::"Project Meeting Register":
                            begin
                                RecRef.SetTable(ProjectMeetingRegister);
                                GetFromProjectApprovalSetup(ProjectMeetingRegister."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectMeetingRegister."Project ID";
                            end;
                        Database::"RAM Workplan Header":
                            begin
                                RecRef.SetTable(RAMWorkplanHeader);
                                Error('No link to project');
                                // GetFromProjectApprovalSetup(RAMWorkplanHeader.);
                                //ProjectID :=RAMWorkplanHeader.
                            end;
                        Database::Job:
                            begin
                                RecRef.SetTable(Jobs);
                                GetFromProjectApprovalSetup(Jobs."No.", ApprovalEntryArgument);
                                ProjectID := Jobs."No.";
                            end;
                        Database::"Purchase Header":
                            begin
                                RecRef.SetTable(PurchHeader);
                                GetFromProjectApprovalSetup(PurchHeader."Project No", ApprovalEntryArgument);
                                ProjectID := PurchHeader."Project No";
                            end;
                        Database::"Communication Plan Header":
                            begin
                                RecRef.SetTable(CommunicationPlan);
                                GetFromProjectApprovalSetup(CommunicationPlan."Project ID", ApprovalEntryArgument);
                                ProjectID := CommunicationPlan."Project ID";
                            end;
                        Database::"Insurance/Guarantee Header":
                            begin
                                RecRef.SetTable(InsuranceGuarantee);
                                GetFromProjectApprovalSetup(InsuranceGuarantee."Project ID", ApprovalEntryArgument);
                                ProjectID := InsuranceGuarantee."Project ID";
                            end;
                        Database::"WEP Contractor Submission":
                            begin
                                RecRef.SetTable(WEPContractorSubmission);
                                GetFromProjectApprovalSetup(WEPContractorSubmission."Project No", ApprovalEntryArgument);
                                ProjectID := WEPContractorSubmission."Project No";
                            end;
                        Database::"RE Payment Schedule Header":
                            begin
                                RecRef.SetTable(RepaymentSchedule);
                                GetFromProjectApprovalSetup(RepaymentSchedule."Project ID", ApprovalEntryArgument);
                                ProjectID := RepaymentSchedule."Project ID";
                            end;
                        Database::"Project Variation Header":
                            begin
                                RecRef.SetTable(ProjectVariation);
                                GetFromProjectApprovalSetup(ProjectVariation."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectVariation."Project ID";
                            end;
                        Database::"Subcontracting Header":
                            begin
                                RecRef.SetTable(Subcontracting);
                                GetFromProjectApprovalSetup(Subcontracting."Project Code", ApprovalEntryArgument);
                                ProjectID := Subcontracting."Project Code";
                            end;
                        Database::"Contractor Inspection Request":
                            begin
                                RecRef.SetTable(ContractorInspectionRequest);
                                GetFromProjectApprovalSetup(ContractorInspectionRequest."Project ID", ApprovalEntryArgument);
                                ProjectID := ContractorInspectionRequest."Project ID";
                            end;
                        Database::"Risk Management Plan":
                            begin
                                RecRef.SetTable(RiskManagementplan);
                                GetFromProjectApprovalSetup(RiskManagementplan."Project ID", ApprovalEntryArgument);
                                ProjectID := RiskManagementplan."Project ID";
                            end;
                        Database::"Inspection Headersss":
                            begin
                                RecRef.SetTable(InspectionHeaderss);
                                GetFromProjectApprovalSetup(InspectionHeaderss."Project ID", ApprovalEntryArgument);
                                ProjectID := InspectionHeaderss."Project ID";
                            end;
                        Database::"Inspection Header1":
                            begin
                                RecRef.SetTable(InspectionHeader);
                                error('No linked project');
                                // GetFromProjectApprovalSetup(InspectionHeader."Project ID,ApprovalEntryArgument);
                                // ProjectID :=InspectionHeader."Project ID";
                            end;
                        Database::"Site Instructions Header":
                            begin
                                RecRef.SetTable(SiteInstructions);
                                GetFromProjectApprovalSetup(SiteInstructions."Project ID", ApprovalEntryArgument);
                                ProjectID := SiteInstructions."Project ID";
                            end;
                        else
                            Error('Please contact the administrator to  set up the project approval for this record');
                    end;
                    CreateApprReqForApprTypeWorkflowUserGroup(WorkflowStepArgument, ApprovalEntryArgument, ProjectID);
                end;
        end;
    end;

    Local procedure CreateApprReqForApprTypeWorkflowUserGroup(WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntryArgument: Record "Approval Entry"; UserGroup: Code[20])
    var
        UserSetup: Record "User Setup";
        WorkflowUserGroupMember: Record "Workflow User Group Member";
        ApproverId: Code[50];
        SequenceNo: Integer;
        IsHandled: Boolean;
        ApprovalsMgt: Codeunit "Approvals Mgmt.";
    begin
        IsHandled := false;
        if not IsHandled then begin
            if not UserSetup.Get(UserId) then
                Error(UserIdNotInSetupErr, UserId);
            SequenceNo := ApprovalsMgt.GetLastSequenceNo(ApprovalEntryArgument);
            WorkflowUserGroupMember.Reset();
            WorkflowUserGroupMember.SetRange("Workflow User Group Code", UserGroup);
            if WorkflowUserGroupMember.FindSet() then begin
                // SetCurrentKey("Workflow User Group Code", "Sequence No.");
                repeat
                    ApproverId := WorkflowUserGroupMember."User Name";
                    if not UserSetup.Get(ApproverId) then
                        Error(WFUserGroupNotInSetupErr, ApproverId);
                    ApprovalsMgt.MakeApprovalEntry(ApprovalEntryArgument, SequenceNo + WorkflowUserGroupMember."Sequence No.", ApproverId, WorkflowStepArgument);
                until WorkflowUserGroupMember.Next() = 0;
            end
            else
                Error(NoWFUserGroupMembersErr);
        end;

    end;

    Local procedure GetFromProjectApprovalSetup(ProjectID: Code[20]; ApprovalEntry: Record "Approval Entry")
    var
        ProjectApprovalSetup: Record "Project Approval Setup Matrix";
    begin
        clearusergroup(ProjectID);
        InsertUserGroup(ProjectID, true);
        ProjectApprovalSetup.Reset();
        ProjectApprovalSetup.SetRange("Project ID", ProjectID);
        ProjectApprovalSetup.SetRange("Document Type", ApprovalEntry."Project Document Type");
        IF ProjectApprovalSetup.FindSet() then begin
            repeat
                InsertUserGroupMembers(ProjectID, ProjectApprovalSetup."Approver ID", ProjectApprovalSetup."Sequence No.");
            until ProjectApprovalSetup.next() = 0;
        end
        else
            Error('Please create an approval setup for the project %1', ProjectID);
    end;

    local Procedure InsertUserGroup(UserGroupCode: Code[20]; ProjectBased: Boolean)
    var
        UserGroup: Record "Workflow User Group";
        Jobs: Record Job;
    begin
        UserGroup.Init();
        UserGroup.Code := UserGroupCode;
        UserGroup."Project Based" := ProjectBased;
        Jobs.Reset();
        Jobs.SetRange("No.", UserGroupCode);
        if Jobs.FindFirst() then begin
            UserGroup."Project Name" := Jobs.Description;
            UserGroup."Project ID" := jobs."No.";
        end;
        UserGroup.Insert();
    end;

    local procedure clearusergroup(UserGroupCode: Code[20])
    var
        UserGroup: Record "Workflow User Group";
        UserGroupMember: Record "Workflow User Group Member";
    begin
        UserGroup.Reset();
        UserGroup.SetRange(Code, UserGroupCode);
        if UserGroup.FindFirst() then begin
            UserGroup.DeleteAll();
            UserGroupMember.Reset();
            UserGroupMember.SetRange("Workflow User Group Code", UserGroupCode);
            if UserGroupMember.FindSet() then
                UserGroupMember.DeleteAll();
        end;
        //exit;
    end;

    local procedure InsertUserGroupMembers(UserGroupCode: Code[20]; UserName: Code[50]; Sequence: Integer)
    var
        //UserGroup: Record "Table Approval User Groups";
        UserGroupMember: Record "Workflow User Group Member";
    begin
        UserGroupMember.Init();
        UserGroupMember."Workflow User Group Code" := UserGroupCode;
        UserGroupMember."User Name" := UserName;
        UserGroupMember."Sequence No." := Sequence;
        UserGroupMember."Project ID" := UserGroupCode;
        UserGroupMember.insert();
    end;

    //DimensionName
    /// <summary>
    /// DimensionName.
    /// </summary>
    /// <param name="DimensionNo">Integer.</param>
    /// <param name="DimensionCode">Code[20].</param>
    /// <returns>Return value of type Text.</returns>
    procedure DimensionName(DimensionNo: Integer; DimensionCode: Code[20]): Text
    var
        DimensionValues: Record "Dimension Value";
    begin
        DimensionValues.Reset();
        DimensionValues.SetRange("Global Dimension No.", DimensionNo);
        DimensionValues.SetRange(Code, DimensionCode);
        if DimensionValues.FindFirst() then
            exit(DimensionValues.Name);
    end;
    //Make document attachments uneditable when documents are not open
    procedure CheckDocAttachmentStatusOpen(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
        Item: Record Item;
        Employee: Record Employee;
        FixedAsset: Record "Fixed Asset";
        Resource: Record Resource;
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
        Job: Record Job;
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        VATReportHeader: Record "VAT Report Header";
        PaymentTerms: Record "Payments";
        PayTerms: Record "Payment Terms";
        PHeader: Record "Purchase Header";
        Receipts: record "Receipts Header1";
        imemo: record "Imprest Memo";
        Measurements: Record "Measurement &  Payment Header";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        SiteInstructionsHeader: Record "Site Instructions Header";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        TemporarySupervisionReq: Record "Temporary Supervision Requirem";
        WeeklyWorkPlan: Record "Work Plan Header";
        ContractorInspectionRequest: Record "Contractor Inspection Request";
        DailyWorkRecord: Record "Daily Work Records";
        SurveyQualityCheckH: Record "Survey Quality Check Header";
        MaterialTestRecord: Record "Material Test Record";
        InspectionHeader: Record "Inspection Headersss";
        InspectionHeader1: Record "Inspection Header1";
        PostedDocumentErr: Label 'You cannot add/modify attachments for a posted document. %1, %2';
        Jobs: Record Job;
    begin
        //  RecRef.Close();
        case DocumentAttachment."Table ID" of
            0:
                exit;
            DATABASE::Customer:
                begin
                    //RecRef.Open(DATABASE::Customer);
                    if Customer.Get(DocumentAttachment."No.") then
                        Customer.TestField(Status, Customer.Status::Open);
                end;
            DATABASE::Vendor:
                begin
                    //RecRef.Open(DATABASE::Vendor);
                    if Vendor.Get(DocumentAttachment."No.") then
                        Vendor.TestField(Status, Vendor.Status::Open);
                end;
            DATABASE::Item:
                begin
                    // RecRef.Open(DATABASE::Item);
                    if Item.Get(DocumentAttachment."No.") then
                        exit;
                end;
            DATABASE::Employee:
                begin
                    RecRef.Open(DATABASE::Employee);
                    if Employee.Get(DocumentAttachment."No.") then
                        exit;//Employee.TestField(Status, Employee.Status::Open);
                end;
            DATABASE::"Fixed Asset":
                begin
                    //RecRef.Open(DATABASE::"Fixed Asset");
                    if FixedAsset.Get(DocumentAttachment."No.") then
                        exit;//FixedAsset.TestField(Status, FixedAsset.Status::Open);
                end;
            DATABASE::Resource:
                begin
                    //RecRef.Open(DATABASE::Resource);
                    if Resource.Get(DocumentAttachment."No.") then
                        exit; //Resource.TestField(Status, Resource.Status::Open);
                end;
            DATABASE::Job:
                begin
                    // RecRef.Open(DATABASE::Job);
                    if Job.Get(DocumentAttachment."No.") then
                        Job.TestField("Approval Status", Job."Approval Status"::Open);
                end;
            DATABASE::"Sales Header":
                begin
                    // RecRef.Open(DATABASE::"Sales Header");
                    if SalesHeader.Get(DocumentAttachment."Document Type", DocumentAttachment."No.") then
                        SalesHeader.TestField(Status, SalesHeader.Status::Open);
                end;
            DATABASE::"Sales Invoice Header":
                begin
                    // RecRef.Open(DATABASE::"Sales Invoice Header");
                    if SalesInvoiceHeader.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, SalesInvoiceHeader.TableCaption, SalesInvoiceHeader."No.");
                end;
            DATABASE::"Sales Cr.Memo Header":
                begin
                    // RecRef.Open(DATABASE::"Sales Cr.Memo Header");
                    if SalesCrMemoHeader.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, SalesCrMemoHeader.TableCaption, SalesCrMemoHeader."No.");
                end;
            DATABASE::"Purchase Header":
                begin
                    // RecRef.Open(DATABASE::"Purchase Header");
                    if PurchaseHeader.Get(DocumentAttachment."Document Type", DocumentAttachment."No.") then
                        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
                            if not (PurchaseHeader.Status in [
                                                PurchaseHeader.Status::Open,
                                                PurchaseHeader.Status::"Pending Approval",
                                                PurchaseHeader.Status::Released])
                                            then
                                Error('Document %1 must have status Open, Pending Approval, or Released.', PurchaseHeader."No.");
                        end else
                            PurchaseHeader.TestField(Status, PurchaseHeader.Status::Open);
                end;
            DATABASE::"Purch. Inv. Header":
                begin
                    //  RecRef.Open(DATABASE::"Purch. Inv. Header");
                    if PurchInvHeader.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, PurchInvHeader.TableCaption, PurchInvHeader."No.");
                end;
            DATABASE::"Purch. Cr. Memo Hdr.":
                begin
                    // RecRef.Open(DATABASE::"Purch. Cr. Memo Hdr.");
                    if PurchCrMemoHdr.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, PurchCrMemoHdr.TableCaption, PurchCrMemoHdr."No.");
                end;
            DATABASE::"VAT Report Header":
                begin
                    // RecRef.Open(DATABASE::"VAT Report Header");
                    if VATReportHeader.Get(DocumentAttachment."VAT Report Config. Code", DocumentAttachment."No.") then
                        VATReportHeader.TestField(Status, VATReportHeader.Status::Open);
                end;
            DATABASE::"Payments":
                begin
                    // RecRef.Open(DATABASE::"Payments");
                    if PaymentTerms.Get(DocumentAttachment."No.") then
                        PaymentTerms.TestField(Status, PaymentTerms.Status::Open);
                end;
            DATABASE::"Imprest Memo":
                begin
                    //RecRef.Open(DATABASE::"Imprest Memo");
                    if imemo.Get(DocumentAttachment."No.") then
                        imemo.TestField(Status, imemo.Status::Open);
                end;
            DATABASE::"Payment Terms":
                begin
                    ////  RecRef.Open(DATABASE::"Payment Terms");
                    if PayTerms.Get(DocumentAttachment."No.") then
                        Exit;//PayTerms.TestField(Status, PayTerms.Status::Open);
                end;
            DATABASE::"Receipts Header1":
                begin
                    // RecRef.Open(DATABASE::"Receipts Header1");
                    if Receipts.Get(DocumentAttachment."No.") then
                        Receipts.TestField(Status, Receipts.Status::Open);
                end;
            Database::"Measurement &  Payment Header":
                begin
                    //RecRef.Open(Database::"Measurement &  Payment Header");
                    Measurements.Reset();
                    Measurements.SetRange("Document No.", DocumentAttachment."No.");
                    if Measurements.findfirst() then
                        Measurements.TestField(Status, Measurements.Status::Open);
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    //RecRef.Open(Database::"Insurance/Guarantee Header");
                    InsuranceGuarantee.Reset();
                    InsuranceGuarantee.SetRange("Document No.", DocumentAttachment."No.");
                    if InsuranceGuarantee.findfirst() then
                        InsuranceGuarantee.TestField(Status, InsuranceGuarantee.Status::Open);
                end;
            Database::"Site Instructions Header":
                begin
                    // RecRef.Open(Database::"Site Instructions Header");
                    SiteInstructionsHeader.Reset();
                    SiteInstructionsHeader.SetRange("Document No.", DocumentAttachment."No.");
                    if SiteInstructionsHeader.FindFirst() then
                        SiteInstructionsHeader.TestField(Status, SiteInstructionsHeader.Status::Open);
                end;
            Database::"Project Staff Voucher":
                begin
                    //RecRef.Open(Database::"Project Staff Voucher");
                    ProjectStaffVoucher.Reset();
                    ProjectStaffVoucher.SetRange("Document No.", DocumentAttachment."No.");
                    if ProjectStaffVoucher.findfirst() then
                        ProjectStaffVoucher.TestField(Status, ProjectStaffVoucher.Status::Open);
                end;
            Database::"Project Mobilization Header":
                begin
                    //RecRef.Open(Database::"Project Mobilization Header");
                    ProjectMobilization.Reset();
                    ProjectMobilization.SetRange("Document No.", DocumentAttachment."No.");
                    if ProjectMobilization.findfirst() then
                        ProjectMobilization.TestField(Status, ProjectMobilization.Status::Open);
                end;
            Database::"Project Meeting Register":
                begin
                    //RecRef.Open(Database::"Project Meeting Register");
                    ProjectMeetingRegister.Reset();
                    ProjectMeetingRegister.SetRange("Meeting ID", DocumentAttachment."No.");
                    if ProjectMeetingRegister.findfirst() then
                        ProjectMeetingRegister.TestField(Status, ProjectMeetingRegister.Status::Open);
                end;
            Database::"WEP Contractor Submission":
                begin
                    //RecRef.Open(Database::"WEP Contractor Submission");
                    WEPContractorSubmission.Reset();
                    WEPContractorSubmission.SetRange("Document No", DocumentAttachment."No.");
                    if WEPContractorSubmission.findfirst() then
                        WEPContractorSubmission.TestField(Status, WEPContractorSubmission.Status::Open);
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    //  RecRef.Open(Database::"Temporary Supervision Requirem");
                    TemporarySupervisionReq.Reset();
                    TemporarySupervisionReq.SetRange("Document No", DocumentAttachment."No.");
                    if TemporarySupervisionReq.findfirst() then
                        TemporarySupervisionReq.TestField(Status, TemporarySupervisionReq.Status::Open);
                end;
            Database::"Work Plan Header":
                begin
                    //RecRef.Open(Database::"Work Plan Header");
                    WeeklyWorkPlan.Reset();
                    WeeklyWorkPlan.SetRange("Document No.", DocumentAttachment."No.");
                    if WeeklyWorkPlan.findfirst() then
                        WeeklyWorkPlan.TestField(Status, WeeklyWorkPlan.Status::Open);
                end;
            Database::"Contractor Inspection Request":
                begin
                    //RecRef.Open(Database::"Contractor Inspection Request");
                    ContractorInspectionRequest.Reset();
                    ContractorInspectionRequest.SetRange("Document No.", DocumentAttachment."No.");
                    if ContractorInspectionRequest.findfirst() then
                        ContractorInspectionRequest.TestField("Approval Status", ContractorInspectionRequest."Approval Status"::Open);
                end;
            Database::"Daily Work Records":
                begin
                    //  RecRef.Open(Database::"Daily Work Records");
                    DailyWorkRecord.Reset();
                    DailyWorkRecord.SetRange("Daily Work No", DocumentAttachment."No.");
                    if DailyWorkRecord.findfirst() then
                        exit;//DailyWorkRecord.TestField(Status, DailyWorkRecord.Status::Open);
                end;
            Database::"Survey Quality Check Header":
                begin
                    // RecRef.Open(Database::"Survey Quality Check Header");
                    SurveyQualityCheckH.Reset();
                    SurveyQualityCheckH.SetRange("Document No", DocumentAttachment."No.");
                    if SurveyQualityCheckH.findfirst() then
                        SurveyQualityCheckH.TestField(Status, SurveyQualityCheckH.Status::Open);
                end;
            Database::"Material Test Record":
                begin
                    //RecRef.Open(Database::"Material Test Record");
                    MaterialTestRecord.Reset();
                    MaterialTestRecord.SetRange(Code, DocumentAttachment."No.");
                    if MaterialTestRecord.findfirst() then
                        MaterialTestRecord.TestField(Status, MaterialTestRecord.Status::Open);
                end;
            Database::"Inspection Headersss":
                begin
                    // RecRef.Open(Database::"Inspection Headersss");
                    InspectionHeader.Reset();
                    InspectionHeader.SetRange("Inspection No", DocumentAttachment."No.");
                    if InspectionHeader.findfirst() then
                        InspectionHeader.TestField(Status, InspectionHeader.Status::Open);
                end;
            Database::"Inspection Header1":
                begin
                    //RecRef.Open(Database::"Inspection Header1");
                    InspectionHeader1.Reset();
                    InspectionHeader1.SetRange("Inspection No", DocumentAttachment."No.");
                    if InspectionHeader1.findfirst() then
                        InspectionHeader1.TestField(Status, InspectionHeader.Status::Open);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnBeforeInsertAttachment', '', false, false)]
    local procedure OnBeforeInsertAttachment(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
        CheckDocAttachmentStatusOpen(DocumentAttachment, RecRef);
    end;
    //[EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false,false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
        //  CheckDocAttachmentStatusOpen(DocumentAttachment, RecRef);
    end;

    //Get Region Head
    procedure GetReportsTo(operatingUnitType: Enum "Responsibility Center Operating unit types"; UnitCode: Code[20]): Text
    var
        ResponsibilityCenter: Record "Responsibility Center";
        ResponsibilityCenter2: Record "Responsibility Center";
        Positions: Record "Company Positions";
    begin
        ResponsibilityCenter.Reset();
        ResponsibilityCenter.SetRange("Operating Unit Type", operatingUnitType);
        ResponsibilityCenter.SetRange(Code, UnitCode);
        if ResponsibilityCenter.FindFirst() then begin
            Positions.Reset();
            Positions.SetRange("Position ID", ResponsibilityCenter."Headed By (Title)");
            if Positions.FindFirst() then
                if Positions."Job Title" <> '' then
                    exit(Positions."Job Title")
                else begin
                    ResponsibilityCenter2.Reset();
                    ResponsibilityCenter2.SetRange(Code, ResponsibilityCenter."Direct Reports To");
                    if ResponsibilityCenter2.FindFirst() then begin
                        Positions.Reset();
                        Positions.SetRange("Position ID", ResponsibilityCenter2."Headed By (Title)");
                        if Positions.FindFirst() then
                            if Positions."Job Title" <> '' then
                                exit(Positions."Job Title")
                            else
                                exit('Director General');
                    end;
                end;

        end
        else
            exit('Director General');
    end;

    Procedure IsHoliday(CheckDate: Date): Boolean
    var
        BaseCalendar1: Record "Base Calendar Change";
        CompanyInformation: Record "Human Resources Setup";
        HolidayMonthNo: Integer;
        CurrentMonthNo: Integer;
        HolidayDate: Integer;
        CurrentDate: Integer;
    begin
        CompanyInformation.Get();
        BaseCalendar1.Reset;
        BaseCalendar1.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
        BaseCalendar1.SetRange("Recurring System", BaseCalendar1."Recurring System"::"Annual Recurring");
        BaseCalendar1.SetRange(Nonworking, true);
        if BaseCalendar1.FindSet() then begin
            repeat
                CurrentMonthNo := Date2DMY(CheckDate, 2);
                CurrentDate := Date2DMY(CheckDate, 1);
                HolidayMonthNo := Date2DMY(BaseCalendar1.Date, 2);
                HolidayDate := Date2DMY(BaseCalendar1.Date, 1);
                IF (CurrentMonthNo = HolidayMonthNo) and (CurrentDate = HolidayDate) then begin
                    exit(true);
                end;
            until BaseCalendar1.next() = 0;
        end;
    end;

    Procedure BaseCalendarRemoveNonWorkingDays("Start Date": Date; "No. of Days": Decimal; "Includes Holidays": Boolean; "Includes Saturday": Boolean; "Includes Sunday": Boolean) "End Date": Date
    var
        HumanResSetup: Record "Human Resources Setup";
        BaseCalendar: Record "Base Calendar Change";

        Weekend: Decimal;
        Holidays: Decimal;
        Saturdays: Decimal;
        Sundays: Decimal;
        FromDate: Date;
        ToDate: Date;
        TotalDays: Decimal;
        CompanyInformation: Record "Human Resources Setup";
    begin
        CompanyInformation.get();
        if ("Start Date" <> 0D) and ("No. of Days" <> 0) then begin
            if (not "Includes Holidays") or (not "Includes Saturday") or (not "Includes Sunday") then begin
                Holidays := 0;
                Saturdays := 0;
                Sundays := 0;
                FromDate := "Start Date";
                ToDate := FromDate + "No. of Days";
                if not "Includes Holidays" then begin
                    BaseCalendar.Reset;
                    BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                    BaseCalendar.SetFilter(Date, '%1..%2', FromDate, ToDate);
                    BaseCalendar.SetRange(Nonworking, true);
                    if BaseCalendar.FindSet() then begin
                        repeat
                            if IsHoliday(BaseCalendar.Date) then
                                Holidays += 1;
                        until BaseCalendar.Next() = 0;
                    end;
                end;
                ToDate := FromDate + ("No. of Days" + Holidays);
                if not "Includes Saturday" then begin
                    BaseCalendar.Reset;
                    BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                    BaseCalendar.SetFilter(Date, '%1..%2', FromDate, ToDate);
                    BaseCalendar.SetRange(Day, 6);
                    if BaseCalendar.FindSet() then begin
                        repeat
                            Saturdays += 1;
                        until BaseCalendar.Next() = 0;
                    end;
                end;
                ToDate := FromDate + ("No. of Days" + Holidays + Saturdays);
                if not "Includes Sunday" then begin
                    BaseCalendar.Reset;
                    BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                    BaseCalendar.SetFilter(Date, '%1..%2', FromDate, ToDate);
                    BaseCalendar.SetRange(Day, 7);
                    if BaseCalendar.FindSet() then begin
                        repeat
                            Sundays += 1;
                        until BaseCalendar.Next() = 0;
                    end;
                end;
                TotalDays := ("No. of Days" + Holidays + Saturdays + Sundays);
                "End Date" := "Start Date" + TotalDays;
            end else begin
                "End Date" := "Start Date" + "No. of Days";
            end;
            "End Date" := "End Date" - 1;
            //   Message(Format("End Date"));
        end;
    end;

    Procedure BaseCalendarAddNonWorkingDays("Start Date": Date; "No. of Days": Decimal; "Includes Holidays": Boolean; "Includes Saturday": Boolean; "Includes Sunday": Boolean) "End Date": Date
    var
        HumanResSetup: Record "Human Resources Setup";
        BaseCalendar: Record "Base Calendar Change";
        Weekend: Decimal;
        Holidays: Decimal;
        Saturdays: Decimal;
        Sundays: Decimal;
        FromDate: Date;
        ToDate: Date;
        TotalDays: Decimal;
        CompanyInformation: Record "Human Resources Setup";
        Typehelper: Codeunit "Type Helper";
    begin
    end;

    Procedure CheckIfEndDateIsNonWorking("End Date": Date; "Includes Holidays": Boolean; "Includes Saturday": Boolean; "Includes Sunday": Boolean): Date
    var
        BaseCalendar: Record "Base Calendar Change";
        CompanyInformation: Record "Human Resources Setup";
    begin
        CompanyInformation.Get();
        if (not "Includes Holidays") or (not "Includes Saturday") or (not "Includes Sunday") then begin
            if not "Includes Holidays" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange(BaseCalendar."Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange("Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
                BaseCalendar.SetRange(Nonworking, true);
                BaseCalendar.SetRange(Date, "End Date");
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            if not "Includes Sunday" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange(Date, "End Date");
                BaseCalendar.SetRange(Day, 7);
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            if not "Includes Saturday" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange(Date, "End Date");
                BaseCalendar.SetRange(Day, 6);
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            if not "Includes Holidays" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange(BaseCalendar."Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange("Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
                BaseCalendar.SetRange(Nonworking, true);
                BaseCalendar.SetRange(Date, "End Date");
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            exit("End Date");
        end;
    end;

    //Transfer Custom fields on approval
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApprovalEntryInsert', '', false, false)]
    local procedure OnBeforeApprovalEntryInsert(var ApprovalEntry: Record "Approval Entry"; ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepArgument: Record "Workflow Step Argument"; ApproverId: Code[50]; var IsHandled: Boolean)
    var
        EmpLeaveApp: Record "Employee Leave Application";
        UserSetup: Record "User Setup";
        HrSetup: Record "Human Resources Setup";
    begin
        ApprovalEntry."Project Document Type" := ApprovalEntryArgument."Project Document Type";
        //  ApprovalEntry."Statement No." :=ApprovalEntryArgument."Statement No.";
    end;


    //Modify CompanyAddress format
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Format Address", 'OnBeforeCompany', '', false, false)]
    local procedure OnBeforeCompany(var AddrArray: array[8] of Text[100]; var CompanyInfo: Record "Company Information"; var IsHandled: Boolean)
    var
        FormatAddress: Codeunit "Format Address";
    begin
        AddrArray[1] := UpperCase(CompanyInfo.Name);
        AddrArray[2] := CompanyInfo.Address;
        AddrArray[3] := CompanyInfo."Address 2" + ' ' + 'NAIROBI' + ', ' + CompanyInfo."Country/Region Name";
        if CompanyInfo."Tel Phone" <> '' then
            AddrArray[4] := CompanyInfo."Phone No." + '/' + CompanyInfo."Phone No. 2" + '/' + CompanyInfo."Tel Phone"
        else
            AddrArray[4] := CompanyInfo."Phone No." + ' / ' + CompanyInfo."Phone No. 2";
        AddrArray[5] := CompanyInfo."E-Mail" + '   ' + CompanyInfo."Home Page";
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Format Address", 'OnBeforeRespCenter', '', false, false)]
    local procedure OnBeforeRespCenter(var AddrArray: array[8] of Text[100]; var RespCenter: Record "Responsibility Center"; var IsHandled: Boolean)
    var
        CompanyInfo: Record "Company Information";
        FormatAddress: Codeunit "Format Address";
    begin
        CompanyInfo.Get();
        AddrArray[1] := UpperCase(CompanyInfo.Name);
        AddrArray[2] := RespCenter.Name;
        AddrArray[3] := RespCenter.Address;
        AddrArray[4] := RespCenter."Address 2";
        AddrArray[5] := RespCenter."Phone No.";
        AddrArray[6] := RespCenter."E-Mail" + '   ' + CompanyInfo."Home Page";
        // FormatAddress.FormatAddr(
        //       AddrArray, CompanyInfo.Name, RespCenter.Name, RespCenter.Contact, RespCenter.Address, RespCenter."Address 2",
        //       RespCenter.City, RespCenter."Post Code", RespCenter.County, RespCenter."Country/Region Code");
        IsHandled := true;
    end;


    //Modify CompanyAddress format


    procedure ApproverLabel(var ApproverArray: array[8] of Text[100])
    var
        FormatAddress: Codeunit "Format Address";
    begin
        ApproverArray[1] := 'Checked By: ';
        ApproverArray[2] := 'Confirmed By: ';
        ApproverArray[3] := 'Label 3';
        ApproverArray[4] := 'Label 4';
        ApproverArray[5] := 'Label 5';
    end;

    procedure PositionLabel(var TitleArray: array[8] of Text[100]; CompanyPositions: Record "Company Positions")
    begin
        TitleArray[1] := 'Direcror General: ';
        TitleArray[2] := 'Deputy Director: ';
        TitleArray[3] := 'Resident Engineer: ';
        TitleArray[4] := 'Engineer: ';
        TitleArray[5] := 'Other: ';
    end;



    ///Copy Attachments
    procedure CopyAttachments(var FromRecRef: RecordRef; var ToRecRef: RecordRef; FromDocNoFieldNo: Integer; FromDocumentType: Enum "Attachment Document Type"; ToDocNoFieldNo: Integer; ToDocumentType: Enum "Attachment Document Type")
    var
        FromDocumentAttachment: Record "Document Attachment";
        ToDocumentAttachment: Record "Document Attachment";
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        FromNo: Code[20];
        ToNo: Code[20];
        IsHandled: Boolean;
    begin
        FromDocumentAttachment.SetRange("Table ID", FromRecRef.Number);
        FromDocumentAttachment.SetRange("Document Type", FromDocumentType);
        FromFieldRef := FromRecRef.Field(FromDocNoFieldNo);
        FromNo := FromFieldRef.Value();
        FromDocumentAttachment.SetRange("No.", FromNo);
        if FromDocumentAttachment.FindSet() then begin
            repeat
                Clear(ToDocumentAttachment);
                ToDocumentAttachment.Init();
                ToDocumentAttachment.TransferFields(FromDocumentAttachment);
                ToDocumentAttachment.Validate("Table ID", ToRecRef.Number);
                ToFieldRef := ToRecRef.Field(ToDocNoFieldNo);
                ToNo := ToFieldRef.Value();
                ToDocumentAttachment.Validate("No.", ToNo);
                ToDocumentAttachment.Validate("Document Type", ToDocumentType);
                ToDocumentAttachment.Insert(true);
            until FromDocumentAttachment.Next() = 0;
        end;
    end;

    local procedure CopyAttachmentsLines(var FromRecRef: RecordRef; var ToRecRef: RecordRef)
    var
        FromDocumentAttachmentLines: Record "Document Attachment";
        ToDocumentAttachmentLines: Record "Document Attachment";
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        FromDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        FromNo: Code[20];
        ToNo: Code[20];
    begin
        FromFieldRef := FromRecRef.Field(3);
        FromNo := FromFieldRef.Value();
        FromDocumentAttachmentLines.Reset();

        FromFieldRef := FromRecRef.Field(1);
        FromDocumentType := FromFieldRef.Value();
        FromDocumentAttachmentLines.SetRange("Document Type", FromDocumentType);

        ToFieldRef := ToRecRef.Field(3);
        ToNo := ToFieldRef.Value();

        case FromRecRef.Number() of
            DATABASE::"Sales Header":
                FromDocumentAttachmentLines.SetRange("Table ID", DATABASE::"Sales Line");
            DATABASE::"Purchase Header":
                FromDocumentAttachmentLines.SetRange("Table ID", DATABASE::"Purchase Line");
        end;
        FromDocumentAttachmentLines.SetRange("No.", FromNo);
        FromDocumentAttachmentLines.SetRange("Document Type", FromDocumentType);

        if FromDocumentAttachmentLines.FindSet() then
            repeat
                ToDocumentAttachmentLines.TransferFields(FromDocumentAttachmentLines);
                case ToRecRef.Number of
                    DATABASE::"Sales Invoice Header":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Sales Invoice Line");
                    DATABASE::"Sales Cr.Memo Header":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Sales Cr.Memo Line");
                    DATABASE::"Purch. Inv. Header":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Purch. Inv. Line");
                    DATABASE::"Purch. Cr. Memo Hdr.":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Purch. Cr. Memo Line");
                end;

                Clear(ToDocumentAttachmentLines."Document Type");
                ToDocumentAttachmentLines.Validate("No.", ToNo);

                if ToDocumentAttachmentLines.Insert(true) then;
            until FromDocumentAttachmentLines.Next() = 0;
    end;


    Procedure GetEmployeeNameFromUserID(UsersID: Code[50]): Text
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.get(UsersID) then
            exit(UserSetup."Employee Name");
    end;


    //Sto checking job status when posting invoice
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Check Line", 'OnRunCheckOnBeforeTestFieldJobStatus', '', false, false)]

    local procedure OnRunCheckOnBeforeTestFieldJobStatus(var IsHandled: Boolean; var JobJnlLine: Record "Job Journal Line")
    begin
        IsHandled := true;
    end;


    //Get document
    Procedure GetDocument(FilePath: Text)
    var
        ImportXmlFile: File;
        XmlINStream: InStream;
        FileManagement: Codeunit "File Management";
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;
        InputFile: File;
        FileDoesNotExistErr: Label 'The file %1 does not exist.', Comment = '%1 File Path';
    begin
        if FileManagement.ServerFileExists(FilePath) then begin
            FileManagement.IsAllowedPath(FilePath, false);

            // if not FILE.Exists(FilePath) then
            //     Error(FileDoesNotExistErr, FilePath);

            // InputFile.Open(FilePath);
            // InputFile.CreateInStream(InStream);
            TempBlob.CreateOutStream(OutStream);
            CopyStream(OutStream, InStream);
            FileManagement.GetFileName(FilePath);
            FileManagement.GetFileNameMimeType(FilePath);
        end;


    end;

    /********************************Commitment Entries*********************/
    // [Scope('OnPrem')]
    procedure FnCommitAmount(Amount: Decimal; "Account Type": Enum "Gen. Journal Account Type"; AccountNo: Code[50]; Budget: Code[50]; DocNo: Code[50]; SourceType: Enum "Commitment Document Type"; Dim1: Code[30]; Dim2: Code[30]; Dim3: Code[30]; DocDate: Date; "Commitment Type": Enum "Commitment Type"; Description: Text[250])
    var
        CommitmentEntries1: Record "Commitment Entries";
        LastEnrtyNo: Integer;
    begin
        TestFieldDatesOnGLBudgets();
        CommitmentEntries1.Init;
        CommitmentEntries1."Entry No" := FnGetLastCommitmentEntryNo() + 1;
        CommitmentEntries1."Commitment Type" := "Commitment Type";
        CommitmentEntries1."Account Type" := "Account Type";
        CommitmentEntries1."Account No." := AccountNo;
        CommitmentEntries1.Validate("Account No.");
        CommitmentEntries1."Budget Year" := Budget;
        CommitmentEntries1."Commitment No" := DocNo;
        // CommitmentEntries1."Document No" := DocNo;
        CommitmentEntries1."Committed Amount" := Amount;
        CommitmentEntries1."Global Dimension 1 Code" := Dim1;
        CommitmentEntries1."Global Dimension 2 Code" := Dim2;
        CommitmentEntries1."Shortcut Dimension 3 Code" := Dim3;
        CommitmentEntries1.Description := Description;
        CommitmentEntries1."Source Type" := SourceType;
        CommitmentEntries1."Commitment Date" := DocDate;
        CommitmentEntries1."Time Stamp" := CurrentDateTime;
        CommitmentEntries1."Commitment Date" := Today;
        CommitmentEntries1.User := UserId;
        if Amount <> 0 then
            CommitmentEntries1.Insert(true);
    end;

    procedure FnGetLastCommitmentEntryNo(): Integer
    var
        ObjCommEntries: Record "Commitment Entries";
    begin
        ObjCommEntries.Reset();
        ObjCommEntries.SetCurrentKey("Entry No");
        if ObjCommEntries.FindLast() then
            exit(ObjCommEntries."Entry No")
        else
            exit(0);
    end;


    Procedure TestFieldDatesOnGLBudgets()
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Reset();
        GLBudgetName.SetFilter(Name, '<>%1', '');
        if GLBudgetName.findset() then begin
            repeat
                if (GLBudgetName."Start Date" = 0D) or (GLBudgetName."End Date" = 0D) then
                    error('Budget %1 must have both start and end Date', GLBudgetName.Name);
            until GLBudgetName.next() = 0;
        end;
    end;

    Procedure GetBudgetYear(PostingDate: Date): Code[10]
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Reset();
        GLBudgetName.SetFilter("Start Date", '<=%1', PostingDate);
        GLBudgetName.SetFilter("End Date", '>=%1', PostingDate);
        if GLBudgetName.FindFirst() then
            exit(GLBudgetName.Name);
    end;

    Procedure GetBudgetYearStartDate(FY: Code[30]): Date
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Reset();
        GLBudgetName.SetRange(Name, FY);
        if GLBudgetName.FindFirst() then
            exit(GLBudgetName."Start Date");
    end;


    Procedure GetCommittedAmount(AccountNo: Code[20]; FinancialYear: Code[20]; "Global Dimension 1 Code": Code[20]; "Global Dimension 2 Code": Code[20]; "Shortcut Dimension 3 Code": Code[20]): Decimal
    var
        CommitmentEntries: Record "Commitment Entries";
        CommittedAmount: Decimal;
        Dimensions: Record Dimension;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        CommittedAmount := 0;
        CommitmentEntries.Reset();
        CommitmentEntries.SetRange("Account No.", AccountNo);
        CommitmentEntries.SETRANGE("Budget Year", FinancialYear);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 1 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            CommitmentEntries.SetRange("Global Dimension 1 Code", "Global Dimension 1 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 2 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            CommitmentEntries.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Shortcut Dimension 3 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            CommitmentEntries.SetRange("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");
        if CommitmentEntries.FindSet() then begin
            repeat
                CommittedAmount := CommittedAmount + CommitmentEntries."Committed Amount";
            until CommitmentEntries.next() = 0;
        end;
        exit(CommittedAmount);
    end;

    Procedure GetActualSpent(AccountNo: Code[20]; "Global Dimension 1 Code": Code[20]; "Global Dimension 2 Code": Code[20]; "Shortcut Dimension 3 Code": Code[20]): Decimal
    var
        GLEntry: Record "G/L Entry";
        "Actual Spent": Decimal;
        Dimensions: Record Dimension;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        "Actual Spent" := 0;
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."G/L Account No.", AccountNo);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 1 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            GLEntry.SetRange("Global Dimension 1 Code", "Global Dimension 1 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 2 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            GLEntry.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Shortcut Dimension 3 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            GLEntry.SetRange("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");
        if GLEntry.Findset() then begin
            repeat
                if GetBudgetYear(GLEntry."Posting Date") = GLSetup."Current Budget" then
                    "Actual Spent" := "Actual Spent" + GLEntry.Amount;
            until GLEntry.next() = 0
        end;
        exit("Actual Spent");
    end;

    Procedure GetBudgtedAmount(AccountNo: Code[20]; Dim1: Code[20]; Dim2: Code[20]; Dim3: Code[20]): Decimal
    var
        BudgetEntry: Record "G/L Budget Entry";
        GLSetup: Record "General Ledger Setup";
        CMS: Record "Cash Management Setup";
        BudgettedAmount: Decimal;
        Dimensions: Record Dimension;
    begin
        BudgettedAmount := 0;
        CMS.Get;
        GLSetup.get();
        BudgetEntry.Reset();
        BudgetEntry.SetRange(BudgetEntry."Budget Name", CMS."Current Budget");
        BudgetEntry.SetRange(BudgetEntry."G/L Account No.", AccountNo);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 1 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            BudgetEntry.SetRange(BudgetEntry."Global Dimension 1 Code", Dim1);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 2 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            BudgetEntry.SetRange(BudgetEntry."Global Dimension 2 Code", Dim2);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Shortcut Dimension 3 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            BudgetEntry.SetRange(BudgetEntry."Shortcut Dimension 3 Code", Dim3);
        if BudgetEntry.FindFirst() then begin
            BudgetEntry.CalcSums(Amount);
            BudgettedAmount := BudgetEntry.Amount;
        end;
        exit(BudgettedAmount);
    end;

    Procedure CommitImprest(ImprestMemo: Record "Imprest Memo")
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        Casual: Record Casuals;
        ProjectMembers2: Record "Project Members";

        Casual2: Record Casuals;
        PaymentTypes: Record "Receipts and Payment Types1";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentEntries: Record "Commitment Entries";
        CommitmentType: Enum "Commitment Type";
        CustomFunction: Codeunit "Custom Function";
        WorkTypes: Record "Work Type";
    begin

        //project members
        ProjectMembers.Reset();
        ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if ProjectMembers.findset() then begin
            repeat
                //if ProjectMembers."Available Amount" < (OtherLineAmountsProject(ProjectMembers) + ProjectMembers."Total Entitlement") then
                //Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', ProjectMembers."Available Amount", ProjectMembers."Budgeted Amount", ProjectMembers."Total Entitlement");
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, ProjectMembers."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(ProjectMembers."Total Entitlement", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Committed, CopyStr('Approval Request ' + ImprestMemo."Project Description", 1, 2048));
            until ProjectMembers.next() = 0;
        end;
        //casuals
        Casual.Reset();
        Casual.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if Casual.findset() then begin
            repeat
                // if Casual."Available Amount" < (OtherLineAmountsCasuals(Casual)+ Casual.Amount) then
                //     Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', Casual."Available Amount", Casual."Budgeted Amount", Casual.Amount);
                WorkTypes.Reset();
                WorkTypes.SetRange(Code, Casual."Work Type");
                if WorkTypes.FindFirst() then
                    CustomFunction.FnCommitAmount(Casual.Amount, "Account Type"::"G/L Account", WorkTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Committed, CopyStr('Approval Request ' + ImprestMemo."Project Description", 1, 2048));
            until Casual.next() = 0;
        end;
        //other costs
        OtherCosts.Reset();
        OtherCosts.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if OtherCosts.findset() then begin
            repeat
                // if OtherCosts."Available Amount" < ( OtherCosts."Line Amount" +OtherLineAmountsOtherCosts(OtherCosts)) then
                //     Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', OtherCosts."Available Amount", OtherCosts."Budgeted Amount", OtherCosts."Vote Amount");
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, OtherCosts."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(OtherCosts."Line Amount", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Committed, CopyStr('Approval Request ' + ImprestMemo."Project Description", 1, 2048));
            until OtherCosts.next() = 0;
        end;
    end;

    local procedure OtherLineAmountsCasuals(Casual: Record Casuals): Decimal
    var
        Casual2: Record Casuals;
        LineAmount: Decimal;
    begin
        LineAmount := 0;
        Casual2.Reset();
        Casual2.SetRange("Imprest Memo No.", Casual."Imprest Memo No.");
        Casual2.SetRange("Work Type", Casual."Work Type");
        Casual2.Setfilter("Resource No.", '<>%1', Casual."Resource No.");
        if Casual2.findset() then begin
            repeat
                LineAmount := LineAmount + Casual2.Amount;
            until Casual2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Local Procedure OtherLineAmountsProject(ProjectMembers: Record "Project Members"): Decimal
    var
        ProjectMembers2: Record "Project Members";
        LineAmount: Decimal;
    begin
        LineAmount := 0;
        ProjectMembers2.Reset();
        ProjectMembers2.SetRange("No.", ProjectMembers."No.");
        ProjectMembers2.SetRange("Vote Item", ProjectMembers."Vote Item");
        ProjectMembers2.Setfilter("Line No", '<>%1', ProjectMembers."Line No");
        if ProjectMembers2.findset() then begin
            repeat
                LineAmount := LineAmount + ProjectMembers2."Vote Amount";
            until ProjectMembers2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Local Procedure OtherLineAmountsOtherCosts(OtherCosts: Record "Other Costs"): Decimal
    var
        OtherCosts2: Record "Other Costs";
        LineAmount: Decimal;
    begin
        LineAmount := 0;
        OtherCosts2.Reset();
        OtherCosts2.SetRange("No.", OtherCosts."No.");
        OtherCosts2.SetRange(Type, OtherCosts2.Type::"G/L Account");
        OtherCosts2.SetRange("Vote Item", OtherCosts."Vote Item");
        OtherCosts2.Setfilter("Line No.", '<>%1', OtherCosts."Line No.");
        if OtherCosts2.findset() then begin
            repeat
                LineAmount := LineAmount + OtherCosts2."Vote Amount";
            until OtherCosts2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Procedure UnCommitImprest(ImprestMemo: Record "Imprest Memo")
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        PaymentTypes: Record "Receipts and Payment Types1";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentEntries: Record "Commitment Entries";
        CommitmentType: Enum "Commitment Type";
        CustomFunction: Codeunit "Custom Function";
        Casual: Record Casuals;
        WorkTypes: Record "Work Type";
    begin
        //project members
        ProjectMembers.Reset();
        ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if ProjectMembers.findset() then begin
            repeat
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, ProjectMembers."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(-ProjectMembers."Total Entitlement", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until ProjectMembers.next() = 0;
        end;
        //casuals
        Casual.Reset();
        Casual.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if Casual.findset() then begin
            repeat
                WorkTypes.Reset();
                WorkTypes.SetRange(Code, Casual."Work Type");
                if WorkTypes.FindFirst() then
                    CustomFunction.FnCommitAmount(-Casual.Amount, "Account Type"::"G/L Account", WorkTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until Casual.next() = 0;
        end;
        //other costs
        OtherCosts.Reset();
        OtherCosts.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if OtherCosts.findset() then begin
            repeat
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, OtherCosts."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(-OtherCosts."Vote Amount", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until OtherCosts.next() = 0;
        end;
    end;

    /********************************Commitment Entries******************/

    /****************Try to add a teams meeting to outlook**********/
    // local procedure GenerateICS(Cancel: Boolean; LeaveApplication: Record "Employee Leave Application") ICS: Text
    // var
    //     // StringBuilder: DotNet StringBuilder;
    //     Location: Text;
    //     Summary: Text;
    //     Status: Text;
    //     Method: Text;
    //     Description: Text;
    //     ProdIDTxt: Label '//Microsoft Corporation//Dynamics 365//EN', Locked = true;
    //     DateTimeFormatTxt: Label '<Year4><Month,2><Day,2>T<Hours24,2><Minutes,2><Seconds,2>', Locked = true;
    //     StartTime:Time;
    //     EndTime:Time;
    // begin
    //     Location := GetLocation();
    //     Summary := StrSubstNo('%1 LEAVE :%2', LeaveApplication."Leave Code", LeaveApplication."Employee Name");

    //     if Cancel then begin
    //         Method := 'CANCEL';
    //         Status := 'CANCELLED';
    //     end else begin
    //         Method := 'REQUEST';
    //         Status := 'CONFIRMED';
    //     end;
    //     Description := GetDescription(LeaveApplication);

    //     StringBuilder := StringBuilder.StringBuilder;
    //     with StringBuilder do begin
    //         AppendLine('BEGIN:VCALENDAR');
    //         AppendLine('VERSION:2.0');
    //         AppendLine('PRODID:-' + ProdIDTxt);
    //         AppendLine('METHOD:' + Method);
    //         AppendLine('BEGIN:VEVENT');
    //         AppendLine('UID:' + DelChr(LeaveApplication."User ID", '<>', '{}'));
    //         AppendLine('ORGANIZER:' + GetOrganizer);
    //         AppendLine('LOCATION:' + '');
    //         Evaluate(EndTime, '08:00');
    //         Evaluate(StartTime, '08:30');
    //         AppendLine('DTSTART;TZID=E. Africa Standard Time:' + format(CreateDateTime(WorkDate,StartTime),0, DateTimeFormatTxt));
    //         AppendLine('DTEND;TZID=E. Africa Standard Time:' + format(CreateDateTime(WorkDate,EndTime),0, DateTimeFormatTxt));
    //         AppendLine('SUMMARY:' + Summary);
    //         AppendLine('DESCRIPTION:' + Description);
    //         AppendLine('X-ALT-DESC;FMTTYPE=' + GetHtmlDescription(Description));
    //         AppendLine('isOnlineMeeting: true');
    //         AppendLine('onlineMeetingProvider: teamsForBusiness');
    //         AppendLine('SEQUENCE:' + Format('Document No'));
    //         AppendLine('STATUS:' + Status);
    //         AppendLine('END:VEVENT');
    //         AppendLine('END:VCALENDAR');
    //     end;

    //     ICS := StringBuilder.ToString;
    // end;
    //             local procedure GetLocation(): Text
    // var
    //     CompanyInfo: Record "Company Information";
    // begin
    //     if CompanyInfo.get() then begin
    //         exit(StrSubstNo('%1, %2, %3', CompanyInfo.Address, CompanyInfo.City, CompanyInfo."Country/Region Code"));
    //     end;
    // end;

    //             local procedure GetOrganizer(): Text
    // var
    //     CompanyInfo: Record "Company Information";
    // begin
    //     if CompanyInfo.Get() then
    //         exit(CompanyInfo."E-Mail");
    // end;

    local procedure GetHtmlDescription(Description: Text) HtmlAppointDescription: Text
    var
        Regex: Codeunit Regex;
    begin
        HtmlAppointDescription := Regex.Replace(Description, '\\r', '');
        HtmlAppointDescription := Regex.Replace(HtmlAppointDescription, '\\n', '<br>');
        HtmlAppointDescription := 'text/html:<html><body>' + HtmlAppointDescription + '</html></body>';
    end;



    local procedure GetDescription(var LeaveApplication: Record "Employee Leave Application") AppointmentDescription: Text
    var
        AppointmentFormat: Text;
        Application: Text;
        Emp: Text;
        LeaveCode: Text;
        StartDat: Text;
        EndDate: Text;
        NoOfDays: Text;
    begin
        Application := 'Application No: ' + LeaveApplication."Application No";
        Emp := 'Employee: ' + LeaveApplication."Employee Name";
        LeaveCode := 'Leave Code: ' + LeaveApplication."Leave Code";
        StartDat := 'Start Date: ' + format(LeaveApplication."Start Date", 0, 4);
        EndDate := 'End Date: ' + format(LeaveApplication."End Date", 0, 4);
        NoOfDays := 'No of Days: ' + format(LeaveApplication."Approved Days");
        AppointmentFormat := Application + '\n\n';
        AppointmentFormat += Emp + '\n\n';
        AppointmentFormat += LeaveCode + '\n\n';
        AppointmentFormat += StartDat + '\n\n';
        AppointmentFormat += EndDate + '\n\n';
        AppointmentFormat += NoOfDays;
        AppointmentDescription := AppointmentFormat;
    end;

    procedure GenerateEmail(var RecipientEmail: Text[80]; Cancel: Boolean)
    var
        TempBlob: Codeunit "Temp Blob";
        Stream: OutStream;
        InStream: Instream;
        ICS: Text;
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        LeaveApplication: Record "Employee Leave Application";
    begin
        LeaveApplication.Reset();
        if LeaveApplication.FindLast() then
            // ICS := GenerateICS(Cancel, LeaveApplication);
        TempBlob.CreateOutStream(Stream, TextEncoding::UTF8);
        Stream.Write(ICS);
        TempBlob.CreateInStream(InStream);

        // TempEmailItem.Initialize;
        // TempEmailItem.Subject := StrSubstNo('%1 LEAVE: %2', LeaveApplication."Leave Code", LeaveApplication."Employee Name");
        // TempEmailItem.AddAttachment(InStream, StrSubstNo('%1,%2,%3.ics', LeaveApplication.TableCaption, LeaveApplication."Application No", LeaveApplication."Employee No"));
        // TempEmailItem."Send to" := RecipientEmail;
        // TempEmailItem.SetBodyText(GetBody(LeaveApplication));

        // TempEmailItem.GetBodyText();
        Mail.Create(RecipientEmail, 'Tech Bid Opening', GetBody, true);
        Mail.AddAttachment('bidopening.ics', '.ics', InStream);
        Email.Send(Mail);
    end;

    local procedure GetBody() Bodytext: Text
    var
        Employee: Record Employee;
        EmployeeMail: Text;
        Recepients: list of [Text];
        Outs: OutStream;
        Parameters: Text;
        RecRef: RecordRef;
        EmailItem: Record "Email Item";
        Subject: Text;
        FRef: FieldRef;
        TempBlob: Codeunit "Temp Blob";
        Ins: InStream;
        Body: Text;
    begin
        // TempBlob.CreateOutStream(Outs);
        // RecRef.Open(Database::"Employee Leave Application");
        // FRef := RecRef.Field(2);
        // Fref.SetRange(LeaveApplication."Application No");
        // Report.Saveas(Report::"Leave Approval  Notification", '', ReportFormat::Html, Outs, RecRef);
        // TempBlob.CreateInStream(Ins);
        // Ins.ReadText(Body);
        Bodytext := 'Please plan accordingly';
    end;

    Procedure CreateMeeting() Response: Text
    var
        JsonObj: JsonObject;
        JsonObj1: JsonObject;
        JsonObj2: JsonObject;
        JsonObj3: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Contents: HttpContent;
        Headers: HttpHeaders;
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        httprequest: HttpRequestMessage;
        DateTimeFormatTxt: Label '<Year4><Month,2><Day,2>T<Hours24,2><Minutes,2><Seconds,2>', Locked = true;
        StartTime: Time;
        EndTime: Time;
        JArray: JsonArray;
        url: Text;
        ContentText: Text;
        Token: Text;
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        TokenB: Text;
        ObjOrganizer: JsonObject;
        ArrOrganizer: JsonArray;
        objid: JsonObject;
    begin

        //Token := 'eyJ0eXAiOiJKV1QiLCJub25jZSI6IjZCY29hdWZVRW0zTGs0emFuaHkzN1pISUJJYUFNR0ZJRXB5cFVvZlc3VW8iLCJhbGciOiJSUzI1NiIsIng1dCI6IlhSdmtvOFA3QTNVYVdTblU3Yk05blQwTWpoQSIsImtpZCI6IlhSdmtvOFA3QTNVYVdTblU3Yk05blQwTWpoQSJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLm1pY3Jvc29mdC5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9lMDdlMmVhYS02YzdmLTQ0MzYtYjZjYS02ZjAxOTQzMWNhZjMvIiwiaWF0IjoxNzEwMTcyNjQzLCJuYmYiOjE3MTAxNzI2NDMsImV4cCI6MTcxMDE3NjU0MywiYWlvIjoiRTJOZ1lKQ09uN2pCN2NHbGFScXZEZm80YkxtbkFnQT0iLCJhcHBfZGlzcGxheW5hbWUiOiJLZWxseSIsImFwcGlkIjoiZmI1YTlmNDUtMDdiOC00NmZlLTlmMjktMGYxNjQyMDM4ZTE2IiwiYXBwaWRhY3IiOiIxIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZTA3ZTJlYWEtNmM3Zi00NDM2LWI2Y2EtNmYwMTk0MzFjYWYzLyIsImlkdHlwIjoiYXBwIiwib2lkIjoiMDdlNzcyMzctNGRmZi00OThkLWEzNTEtMDdhZTZiODg1MWRlIiwicmgiOiIwLkFTRUFxaTUtNEg5c05rUzJ5bThCbERISzh3TUFBQUFBQUFBQXdBQUFBQUFBQUFBaEFBQS4iLCJyb2xlcyI6WyJPbmxpbmVNZWV0aW5ncy5SZWFkLkFsbCIsIk9ubGluZU1lZXRpbmdzLlJlYWRXcml0ZS5BbGwiXSwic3ViIjoiMDdlNzcyMzctNGRmZi00OThkLWEzNTEtMDdhZTZiODg1MWRlIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFGIiwidGlkIjoiZTA3ZTJlYWEtNmM3Zi00NDM2LWI2Y2EtNmYwMTk0MzFjYWYzIiwidXRpIjoiVnBPZFJFczRyRWFGa000VzhFVk5BQSIsInZlciI6IjEuMCIsIndpZHMiOlsiMDk5N2ExZDAtMGQxZC00YWNiLWI0MDgtZDVjYTczMTIxZTkwIl0sInhtc190Y2R0IjoxNDg3MzMxMDk4fQ.W5UHbS-j4828V7MsQJ55WSutH0DTtCNUzScSuNlhKyvJgg65pW3RSgP_XlQoqriODNPllf1J0MEzapTf4NJ1GUZMiZhLAUnIyKDK2iTuWg20gXtMZUS6LZtFRku0ia9xkDo-K3aZYo5kcgdna5spGJSABxpNBCE8CVSZXmxGBD3Mur55ReMiHdtjzdi7B7Oy1gz3-EWynypSl90hZfrMOBlIERIkDYimYzCWtxYqjccURwhUwL2_RiyLR_zpwiH8UQ1QnmlHWTOZfI-3zDusom4oC6-r_0_uT8TrJD-QGyCYFWMjge6BF8ToBcUWFfNyq5DwRnCgE1VQJxvxYN70tg';
        Token := GetAccessToken;
        TokenB := 'Bearer ' + Token;
        Clear(JsonObj);
        clear(Headers);
        Clear(JsonObj1);
        Clear(JsonObj2);
        Clear(JsonObj3);
        Clear(ObjOrganizer);
        Clear(ArrOrganizer);
        Evaluate(EndTime, '09:00');
        Evaluate(StartTime, '08:30');
        JsonObj.add('startDateTime', '2024-03-12T14:30:34.2444915-07:00');// format(CreateDateTime(WorkDate, StartTime), 0, DateTimeFormatTxt));
        JsonObj.add('endDateTime', '2024-03-12T15:00:34.2464912-07:00');//format(CreateDateTime(WorkDate, EndTime), 0, DateTimeFormatTxt));
        JsonObj.add('subject', 'Test Meeting');
        JsonObj.Add('body', 'Add body here');
        JsonObj.Add('isOnlineMeeting', true);
        JsonObj.Add('onlineMeetingProvider', 'teamsForBusiness');
        JsonObj1.Add('address', 'kellykiprotich.dynasoft.co.ke');
        JsonObj2.Add('emailAddress', JsonObj1);
        ObjOrganizer.Add('user', '');
        objid.Add('id', 'kellykiprotich.dynasoft.co.ke');
        JArray.Add(JsonObj2);
        ArrOrganizer.Add(ObjOrganizer);
        JsonObj3.Add('attendees', JArray);
        //JsonObj3.Add('Organizer', ArrOrganizer);
        // JsonObj.Add('participants', JsonObj3);
        JsonObj.WriteTo(ContentText);
        Message(ContentText);
        Contents.Clear();

        Contents.WriteFrom(ContentText);
        //Contents.WriteFrom('{"startDateTime":"2024-03-12T14:30:34.2444915-07:00","endDateTime":"2024-03-12T15:00:34.2464912-07:00","subject":"User meeting in Microsoft Teams channel."}');
        Contents.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Remove('Charset');
        Headers.Add('Content-Type', 'application/json');
        httpRequest.GetHeaders(Headers);
        //Contents.WriteFrom('{"startDateTime":"2024-03-10T14:30:34.2444915-07:00","endDateTime":"2024-03-10T15:00:34.2464912-07:00","subject":"User Token Meeting"}');
        httpRequest.Content(Contents);
        httpRequest.Method('POST');
        url := 'https://graph.microsoft.com/v1.0/users/17555c57-5b87-4e68-b707-d389e9b4a867/onlineMeetings';
        //  url := 'https://graph.microsoft.com/beta/users/81666d68-949f-4300-9185-74519e6f4bae/onlineMeetings';
        //url := 'https://graph.microsoft.com/beta/me/onlineMeetings';
        client.Clear();
        Client.SetBaseAddress(url);
        Client.DefaultRequestHeaders.Add('Charset', 'utf-8');
        //Client.DefaultRequestHeaders.Add('Content-Type','application/json');
        Client.DefaultRequestHeaders.Add('Authorization', TokenB);
        if Client.Post(url, contents, ResponseMessage) then
            //if Client.Send(httpRequest, ResponseMessage) then
                ResponseMessage.Content.ReadAs(Response);
        if ResponseMessage.IsSuccessStatusCode = false then
            Error(Response);
        Clear(ResultObj);
        ResultObj.ReadFrom(Response);
        ResultObj.get('joinUrl', ResultJtoken);
        Response := ResultJtoken.AsValue().AsText();
        Mail.Create('kellykiprotich@dynasoft.co.ke', 'Online Meeting', '<a href="' + Response + '"">Meeting Link</a>', true);
        Email.Send(Mail);
    end;


    Procedure GetAccessToken() Response: Text
    var
        BearerToken: Text;
        graph: Record "Microsoft Graphs";
        JsonObj: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Contents: HttpContent;
        Headers: HttpHeaders;
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        httprequest: HttpRequestMessage;
        ContentText: Text;
        url: Text;
        BodyText: JsonArray;
        objbody: JsonObject;
        Body: Text;
        oauth2: Codeunit OAuth2;
        Scope: List of [Text];
        IdToken: Text;
        accesstoken: Text;
    // ScopesArray: DotNet StringArray;
    // CompoundToken: DotNet CompoundTokenInfo;
    // AuthFlow: DotNet ALAzureAdCodeGrantFlow;
    begin

        Clear(objbody);
        Clear(BodyText);
        Clear(JsonObj);
        Clear(Headers);
        graph.Reset();
        graph.SetRange(Type, graph.Type::Graph);
        if graph.FindFirst() then begin


            //  JsonObj.Add('grant_type', 'client_credentials');
            JsonObj.Add('Host', graph.Host);
            JsonObj.Add('client_id', graph."Client ID");
            JsonObj.Add('client_secret', graph."Client Secret");
            JsonObj.Add('resource', 'https://graph.microsoft.com');
            //  JsonObj.Add('scope', 'OnlineMeetings.ReadWrite.All');

            url := 'https://login.microsoftonline.com/' + graph."Tenant ID" + '/oauth2/token';

            objbody.Add('grant_type', 'client_credentials');
            objbody.Add('scope', 'OnlineMeetings.ReadWrite.All');
            BodyText.Add(objbody);
            JsonObj.Add('Body Text', 'grant_type=client_credentials');//BodyText);
                                                                      // 

            Body := 'client_id=' + graph."Client ID" + '&client_secret=' + graph."Client Secret" + '&grant_type=client_credentials&resource=' + 'https://graph.microsoft.com';
            Clear(JsonObj);
            JsonObj.Add('', Body);
            Contents.Clear();
            //JsonObj.WriteTo(ContentText);
            ContentText := Body;
            //Message(ContentText);
            Contents.WriteFrom(ContentText);
            Contents.GetHeaders(Headers);
            Headers.Remove('Content-Type');
            Headers.Remove('Charset');
            Headers.Add('Content-Type', 'application/x-www-form-urlencoded');
            // Headers.Add('Host','https://login.microsoftonline.com');
            httpRequest.GetHeaders(Headers);
            // Scope.Add('OnlineMeetings.ReadWrite.All');
            // Scope.Add('https://graph.microsoft.com/.default');
            // if oauth2.AcquireTokensWithUserCredentials(url, graph."Client ID", Scope, 'Kellykiprotich@dynasoft.co.ke', 'Ledger@1', accesstoken, IdToken) then begin
            //     Message(accesstoken);
            //     Message(IdToken);
            //     //oauth2.
            // end;

            if Client.Post(url, contents, ResponseMessage) then
                //if Client.Send(httpRequest, ResponseMessage) then
                ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode = false then
                Error(Response);
            Clear(ResultObj);
            ResultObj.ReadFrom(Response);
            ResultObj.get('access_token', ResultJtoken);
            Response := ResultJtoken.AsValue().AsText()
        end;
    end;
    /****************Try to add a teams meeting to outlook**********/
    //Trim Spaces

    //Add Event to Outlook - Start

    procedure CreateEvent(CEOAppointment: Record "CEO Appointment") Response: Text
    var
        Client: HttpClient;
        Resp: HttpResponseMessage;
        Request: HttpRequestMessage;
        Header: HttpHeaders;
        Token: secretText;
        RefreshToken: Text;
        Graph: Record "Microsoft Graphs";
        URL: Text;
        Content: HttpContent;
        ContentText: Text;
        JsonPayload: JsonObject;
        JsonPayload1: JsonObject;
        JsonPayload2: JsonObject;
        JsonPayload3: JsonObject;
        JsonPayload4: JsonObject;
        JsonPayload5: JsonObject;
        JsonPayload6: JsonObject;
        JArray: JsonArray;
        JObjStartTime: JsonObject;
        JObjEndTime: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        StartDate: Date;
        StartTime, StartingTime : Text;
        StartingDate, EndingDate : Text;
        EndDate: Date;
        TwelveHrsConversion: Decimal;
        FinalTwelveHrsConversion: Time;
        StartTimeZone, EndTimeZone : Time;
        SuitableTimeZone: Decimal;
        StartLessTwelveHours, EndLessTwelveHours : Text;
        EndTime, EndingTime : Text;
        Description: Text;
        Subj: Text;
        AttendeeName, AttendeeEmail, Recepient : Text;
        OnlineMeet: Boolean;
        MeetVenue: Text;
        GraphClient: Codeunit "Graph Client";
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Emp: Record Employee;
        Subject, Body, Body1, Body2, Body3, Body4 : Text;
        UserSet: Record "User Setup";
        HumanResSetup: Record "Human Resources Setup";
    begin
        graph.Reset();
        graph.SetRange(Type, graph.Type::Graph);
        if graph.FindFirst() then begin
            URL := Graph."Microsoft Graph Outlook Events URL";
            // RefreshToken := ReceiveAccessToken;
            TwelveHrsConversion := 43200000;
            SuitableTimeZone := 10800000;
            //Token := 'Bearer ' + RefreshToken;
            Token := GeneratedToke;
            OnlineMeet := false;


            clear(JsonPayload);
            clear(JsonPayload1);
            clear(JsonPayload2);
            clear(JsonPayload3);
            clear(JsonPayload4);
            clear(JsonPayload5);
            clear(JsonPayload6);
            clear(JObjStartTime);
            clear(JObjEndTime);

            // Fix on date, time and Timezone
            StartingDate := FORMAT(CEOAppointment."Appointment Date", 10, '<Year4>-<Month,2>-<Day,2>');
            StartTime := Format(CEOAppointment."Appointment Time");
            if CopyStr(StartTime, 9, 11) = ' PM' then begin
                if CopyStr(EndTime, 1, 2) = '10' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Appointment Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '11' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Appointment Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '12' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Appointment Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else begin
                    FinalTwelveHrsConversion := CEOAppointment."Appointment Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end;
            end else if CopyStr(StartTime, 9, 11) = ' AM' then begin
                if CopyStr(StartTime, 1, 2) = '10' then begin
                    StartTimeZone := CEOAppointment."Appointment Time" - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(StartTime, 1, 2) = '11' then begin
                    StartTimeZone := CEOAppointment."Appointment Time" - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(StartTime, 1, 2) = '12' then begin
                    StartTimeZone := CEOAppointment."Appointment Time" - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else begin
                    StartTimeZone := CEOAppointment."Appointment Time" - SuitableTimeZone;
                    StartingTime := CopyStr('0' + Format(StartTimeZone), 1, 8);
                end;
            end else begin
                StartTimeZone := CEOAppointment."Appointment Time" - SuitableTimeZone;
                StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
            end;
            EndingDate := FORMAT(CEOAppointment."Appointment End Date", 10, '<Year4>-<Month,2>-<Day,2>');
            EndTime := Format(CEOAppointment."Appointment End Time");
            if CopyStr(EndTime, 9, 11) = ' PM' then begin
                if CopyStr(EndTime, 1, 2) = '10' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Appointment End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '11' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Appointment End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone + TwelveHrsConversion;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '12' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Appointment End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else begin
                    // EndingTime := CopyStr('0' + EndTime, 1, 8);
                    FinalTwelveHrsConversion := CEOAppointment."Appointment End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end;
            end else if CopyStr(EndTime, 9, 11) = ' AM' then begin
                if CopyStr(EndTime, 1, 2) = '10' then begin
                    EndTimeZone := CEOAppointment."Appointment End Time" - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '11' then begin
                    EndTimeZone := CEOAppointment."Appointment End Time" - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '12' then begin
                    EndTimeZone := CEOAppointment."Appointment End Time" - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else begin
                    EndTimeZone := CEOAppointment."Appointment End Time" - SuitableTimeZone;
                    EndingTime := CopyStr('0' + Format(EndTimeZone), 1, 8);
                end;
            end else begin
                EndTimeZone := CEOAppointment."Appointment End Time" - SuitableTimeZone;
                EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
            end;

            if CopyStr(StartingTime, 1, 2) = '12' then begin
                StartingTime := StartingTime;
            end else if CopyStr(StartingTime, 1, 2) = '11' then begin
                StartingTime := StartingTime;
            end else if CopyStr(StartingTime, 1, 2) = '10' then begin
                StartingTime := StartingTime;
                // end else if CopyStr(StartingTime, 1, 2) = ('9' or '8' or '7' or '6') then begin
            end else begin
                StartingTime := '0' + CopyStr(StartingTime, 2, 8);
            end;

            if CopyStr(EndingTime, 1, 2) = '12' then begin
                EndingTime := EndingTime;
            end else if CopyStr(EndingTime, 1, 2) = '11' then begin
                EndingTime := EndingTime;
            end else if CopyStr(EndingTime, 1, 2) = '10' then begin
                EndingTime := EndingTime;
            end else begin
                EndingTime := '0' + CopyStr(EndingTime, 2, 8);
            end;

            // Fix on date, time and Timezone

            Description := CEOAppointment.Description;
            Subj := CEOAppointment."Meeting Subject";
            AttendeeName := CEOAppointment."Requested by Employee Name";
            AttendeeEmail := CEOAppointment."Requested By Employee Email";
            if CEOAppointment."Is Online?" then
                OnlineMeet := true;
            MeetVenue := CEOAppointment."Meeting Venue";

            JObjStartTime.Add('dateTime', StartingDate + 'T' + StartingTime + 'Z');
            JObjStartTime.Add('timeZone', 'UTC');

            JObjEndTime.Add('dateTime', EndingDate + 'T' + EndingTime + 'Z');
            JObjEndTime.Add('timeZone', 'UTC');

            JsonPayload.add('subject', Subj);
            JsonPayload.add('start', JObjStartTime);
            JsonPayload.add('end', JObjEndTime);

            JsonPayload.add('isOnlineMeeting', OnlineMeet);
            JsonPayload6.add('displayName', MeetVenue);
            JsonPayload.Add('location', JsonPayload6);


            // Attendees
            JsonPayload1.Add('name', AttendeeName);
            JsonPayload1.Add('address', AttendeeEmail);
            JsonPayload2.Add('emailAddress', JsonPayload1);
            JArray.Add(JsonPayload2);
            JsonPayload.Add('attendees', JArray);
            JsonPayload.Add('isReminderOn', 'true');

            JsonPayload.WriteTo(ContentText);

            Message(ContentText);

            Content.WriteFrom(ContentText);
            Content.GetHeaders(Header);
            Header.Remove('Content-Type');
            Header.Add('Content-Type', 'application/json');
            Request.GetHeaders(Header);
            Request.GetHeaders(Header);

            Header.Add('Authorization', Token);


            Client.DefaultRequestHeaders.Add('Authorization', token);
            if Client.Post(url, Content, Resp) then
                Resp.Content.ReadAs(Response);
            if not Resp.IsSuccessStatusCode then
                Error('Request was not successful: %1', Response);



            // // Send Email
            Emp.Get(CEOAppointment."Requested by Employee No");
            if Emp."E-Mail" = '' then
                Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

            Recepient := Emp."E-Mail";

            Subject := 'Booking for an Appointment';
            Body += 'Dear ' + Emp."First Name" + ',';
            Body += '<br>Your Appointment has been approved. <br> ';
            Body += '<br>Kindly keep mind to attend the appointment. <br> ';
            Body += '<br>Kind Regards,<br><br>The CEO.<br><br>';

            EmailMess.Create(Recepient, Subject, Body, true);
            Email.Send(EmailMess, EmailScen::Default);

            //Notification Email
            HumanResSetup.Get();
            if HumanResSetup."CEO Notification Email" <> '' then begin
                Recepient := HumanResSetup."CEO Notification Email";
                Subject := 'Booking for an Appointment';
                Body3 += 'Dear ' + 'ADMIN' + ' ,';
                // Body3 += '<br>I am currently booking for an appointment at this date and time' + CEOAppointment."Appointment Date" + '.';
                Body3 += '<br> The Appointment ' + CEOAppointment.No + ' for ' + CEOAppointment."Requested by Employee Name" + ' has been approved.<br>';
                // Body3 += '<br>Kindly keep mind to attend the appointment.<br>';
                Body3 += '<br> Kind Regards, <br> <br>The CEO. <br><br> ';

                EmailMess.Create(Recepient, Subject, Body3, true);
                Email.Send(EmailMess, EmailScen::Default);
            end;

            //CEO Email Notification

            CEOAppointment."Appointment Status" := CEOAppointment."Appointment Status"::Accepted;
            CEOAppointment.Modify();


            Message('You have accepted the Appointment');
        end;
    end;
    //

    procedure ReceiveAccessToken(): Text
    var
        AuthCode: Text;
        ElapsedSecs: Integer;
        Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.find('-') then begin
            if (Graph."Authorization Time" <> 0DT) then begin
                ElapsedSecs := Round((CurrentDateTime() - Graph."Authorization Time") / 1000, 1, '>');
                if ElapsedSecs >= Graph."Expires In" then
                    RefreshAccessToken();
            end else begin
                AuthCode := GetAuthorizationCode();
                GetAccessToken(AuthCode);
            end;
            exit(AccessTokenToText());
        end;
    end;

    procedure AccessTokenToText(): Text
    var
        IStream: InStream;
        Buffer: TextBuilder;
        Line: Text;
        Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.find('-') then begin
            Graph.CalcFields("Access Token");
            if Graph."Access Token".HasValue then begin
                Graph."Access Token".CreateInStream(IStream, TextEncoding::UTF8);
                while not IStream.EOS do begin
                    IStream.ReadText(Line, 1024);
                    Buffer.Append(Line);
                end;
            end;

            exit(Buffer.ToText())
        end;
    end;

    procedure GetAuthorizationCode() AuthorizationCode: Text
    var
        AuthURL: Text;
        DotNetUriBuilder: Codeunit Uri;
        OAuth2Dialog: Page OAuth2Dialog;
        State: text;
        Graph: Record "Microsoft Graphs";
        OAuth2: Codeunit OAuth2;
        Scopes: List of [Text];
        OAuth2ControlAddin: Page OAuth2ControlAddin;
        PromptInteraction: Enum "Prompt Interaction";
        AccessToken: Text;
        TokenCache: Text;
        Error: Text;
        IsSuccess: Boolean;
        OAuth2Dialog2: Page OAuth2Dialog2;
        ErrorText: Text;
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.find('-') then begin
            State := Format(CreateGuid(), 0, 4);
            Scopes.Add(DotNetUriBuilder.EscapeDataString(Graph."Authorization Scope"));

            AuthURL := Graph."Authorization URL" + '?' +
                        'client_id=' + DotNetUriBuilder.EscapeDataString(Graph."Client ID") +
                        '&redirect_uri=' + DotNetUriBuilder.EscapeDataString(Graph."Redirect URL") +
                        '&state=' + DotNetUriBuilder.EscapeDataString(State) +
                        '&scope=' + DotNetUriBuilder.EscapeDataString(Graph."Authorization Scope") +
                        '&response_type=code' +
                        '&response_mode=query';

            AccessToken := 'code';
            TokenCache := 'code';
            Error := '';


            /// <summary>
            /// Gets the access token and token cache state with authorization code flow.
            /// </summary>
            /// <param name="ClientId">The Application (client) ID that the "Azure portal – App registrations" experience assigned to your app.</param>
            /// <param name="ClientSecret">The Application (client) secret configured in the "Azure Portal - Certificates &amp; Secrets".</param>
            /// <param name="OAuthAuthorityUrl">The identity authorization provider URL.</param>
            /// <param name="RedirectURL">The redirectURL of your app, where authentication responses can be sent and received by your app. It must exactly match one of the redirectURLs you registered in the portal. If this parameter is empty, the default Business Central URL will be used.</param>
            /// <param name="Scopes">A list of scopes that you want the user to consent to.</param>
            /// <param name="PromptInteraction">Indicates the type of user interaction that is required.</param>
            /// <param name="AccessToken">Exit parameter containing the access token. When this parameter is empty, check the Error for a description of the error.</param>
            /// <param name="TokenCache">Exit parameter containing the token cache acquired when the access token was requested.</param>
            /// <param name="Error">Exit parameter containing the encountered error in the authorization code grant flow. This parameter will be empty in case the token is aquired successfuly.</param>

            // procedure AcquireTokenAndTokenCacheByAuthorizationCode(ClientId: Text; ClientSecret: Text; OAuthAuthorityUrl: Text; RedirectURL: Text; Scopes: List of [Text]; PromptInteraction: Enum "Prompt Interaction"; var AccessToken: Text; var TokenCache: Text; var Error: Text)
            // IsSuccess := OAuth2.AcquireTokenAndTokenCacheByAuthorizationCode(Graph."Client ID", Graph."Client Secret", Graph."Authorization URL", Graph."Redirect URL", Scopes, PromptInteraction::Consent, AccessToken, TokenCache, Error);


            // ErrorText := 'Not Working';
            // IsSuccess := AcquireToken(ErrorText);


            // OAuth2Dialog2.SetOAuth2Properties(AuthURL, State);
            // OAuth2Dialog2.RunModal();
            // AuthorizationCode := OAuth2Dialog2.GetAuthCode();


            OAuth2Dialog.SetOAuth2Properties(AuthURL, State);
            OAuth2Dialog.RunModal();

            AuthorizationCode := OAuth2Dialog.GetAuthCode();
            // InitializeGraphConnection();
            // AuthorizationCode:='';

            if AuthorizationCode = '' then
                Error('Error: Authorization code is invalid.');
        end;
    end;

    procedure AcquireToken(var ErrorText: Text): Boolean
    var
        OAuth2: Codeunit OAuth2;
        Graph: Record "Microsoft Graphs";
        IsHandled, IsSuccess : Boolean;
        ClientId: Text;
        ClientSecretTxt: Text;
        ClientSecret: Text;
        AccessToken: secretText;
        AuthCodeErr: Text;
        AadTenantId: Text;
        Scopes: List of [Text];
        ExpiryDate: DateTime;
        AuthorityTxt: Label 'https://login.microsoftonline.com/%1/oauth2/v2.0/authorize', Comment = '%1 = AAD tenant ID', Locked = true;
        BearerTxt: Label 'Bearer %1', Comment = '%1 - Token', Locked = true;
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.Find('-') then begin
            AadTenantId := Graph."Tenant ID";
            ClientId := Graph."Client ID";
            ClientSecretTxt := Graph."Client Secret";

            // 🔒 Convert Text to SecretText for BC27+
            //  ClientSecret := SecretText.SecretStrSubstNo(ClientSecretTxt);

            Scopes.Add(Graph."Authorization Scope");
            //     AccessToken := '';
            ExpiryDate := 0DT;

            OnBeforeGetToken(IsHandled, IsSuccess, ErrorText, AccessToken);

            if not IsHandled then begin
                IsSuccess :=
                    OAuth2.AcquireTokenByAuthorizationCode(
                        ClientId,
                     ClientSecret,
                        StrSubstNo(AuthorityTxt, AadTenantId),
                        '',
                        Scopes,
                        "Prompt Interaction"::None,
                        AccessToken,
                        AuthCodeErr);

                if not IsSuccess then
                    if AuthCodeErr <> '' then
                        ErrorText := AuthCodeErr
                    else
                        ErrorText := GetLastErrorText();
            end;

            exit(IsSuccess);
        end;
    end;


    [InternalEvent(false, true)]
    local procedure OnBeforeGetToken(var IsHandled: Boolean; var IsSuccess: Boolean; var ErrorText: Text; var AccessToken: SecretText)
    begin
    end;

    procedure GetAccessToken(AuthCode: Text): Boolean
    var
        DotNetUriBuilder: Codeunit Uri;
        ContentText: Text;
        ResponseText: Text;
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        JAccessToken: JsonObject;
        Success: Boolean;
        JToken: JsonToken;
        Property: Text;
        OStream: OutStream;
        ElapsedSecs: Integer;
        Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.find('-') then begin
            Graph."Authorization Time" := CurrentDateTime();

            ContentText := 'grant_type=authorization_code' +
                                    '&code=' + AuthCode +
                                    '&redirect_uri=' + DotNetUriBuilder.EscapeDataString(Graph."Redirect URL") +
                                    '&client_id=' + DotNetUriBuilder.EscapeDataString(Graph."Client ID") +
                                    '&client_secret=' + DotNetUriBuilder.EscapeDataString(Graph."Client Secret");

            Content.WriteFrom(ContentText);
            Content.GetHeaders(ContentHeaders);
            ContentHeaders.Remove('Content-Type');
            ContentHeaders.Add('Content-Type', 'application/x-www-form-urlencoded');

            Request.Method := 'POST';
            Request.SetRequestUri(Graph."Access Token URL");
            Request.Content(Content);

            if Client.Send(Request, Response) then
                if Response.IsSuccessStatusCode() then
                    if Response.Content.ReadAs(ResponseText) then
                        Success := JAccessToken.ReadFrom(ResponseText);

            if Success then begin
                foreach Property in JAccessToken.Keys() do begin
                    JAccessToken.Get(Property, JToken);
                    case Property of
                        'token_type',
                        'scope':
                            ;
                        'expires_in':
                            Graph."Expires In" := JToken.AsValue().AsInteger();
                        'ext_expires_in':
                            Graph."Ext. Expires In" := JToken.AsValue().AsInteger();
                        'access_token':
                            begin
                                Graph."Access Token".CreateOutStream(OStream, TextEncoding::UTF8);
                                OStream.WriteText(JToken.AsValue().AsText());
                            end;
                        'refresh_token':
                            begin
                                Graph."Refresh Token".CreateOutStream(OStream, TextEncoding::UTF8);
                                OStream.WriteText(JToken.AsValue().AsText());
                            end;
                        else
                            Error('Invalid Access Token Property %1, Value:  %2', Property, JToken.AsValue().AsText());
                    end;
                end;
                Graph.Modify();
                Commit();
            end;
            exit(Success);
        end;
    end;

    procedure RefreshAccessToken(): Boolean
    var
        RefreshToken: Text;
        DotNetUriBuilder: Codeunit Uri;
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        ContentText: Text;
        ResponseText: Text;
        JToken: JsonToken;
        Property: Text;
        OStream: OutStream;
        JAccessToken: JsonObject;
        Success: Boolean;
        Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.find('-') then begin
            RefreshToken := RefreshTokenToText();
            if RefreshToken = '' then
                exit;

            Graph."Authorization Time" := CurrentDateTime();

            ContentText := 'grant_type=refresh_token' +
                '&refresh_token=' + DotNetUriBuilder.EscapeDataString(RefreshToken) +
                '&redirect_uri=' + DotNetUriBuilder.EscapeDataString(Graph."Redirect URL") +
                '&client_id=' + DotNetUriBuilder.EscapeDataString(Graph."Client ID") +
                '&client_secret=' + DotNetUriBuilder.EscapeDataString(Graph."Client Secret");
            Content.WriteFrom(ContentText);

            Content.GetHeaders(ContentHeaders);
            ContentHeaders.Remove('Content-Type');
            ContentHeaders.Add('Content-Type', 'application/x-www-form-urlencoded');

            Request.Method := 'POST';
            Request.SetRequestUri(Graph."Access Token URL");
            Request.Content(Content);

            if Client.Send(Request, Response) then
                if Response.IsSuccessStatusCode() then
                    if Response.Content.ReadAs(ResponseText) then
                        Success := JAccessToken.ReadFrom(ResponseText);

            if Success then begin
                foreach Property in JAccessToken.Keys() do begin
                    JAccessToken.Get(Property, JToken);
                    case Property of
                        'token_type',
                        'scope':
                            ;
                        'expires_in':
                            Graph."Expires In" := JToken.AsValue().AsInteger();
                        'ext_expires_in':
                            Graph."Ext. Expires In" := JToken.AsValue().AsInteger();
                        'access_token':
                            begin
                                Graph."Access Token".CreateOutStream(OStream, TextEncoding::UTF8);
                                OStream.WriteText(JToken.AsValue().AsText());
                            end;
                        'refresh_token':
                            begin
                                Graph."Refresh Token".CreateOutStream(OStream, TextEncoding::UTF8);
                                OStream.WriteText(JToken.AsValue().AsText());
                            end;
                        else
                            Error('Invalid Access Token Property %1, Value:  %2', Property, JToken.AsValue().AsText());
                    end;
                end;
                Graph.Modify();
                Commit();
            end;
            exit(Success);
        end;
    end;

    local procedure RefreshTokenToText(): Text
    var
        IStream: InStream;
        Buffer: TextBuilder;
        Line: Text;
        Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.find('-') then begin
            Graph.CalcFields("Refresh Token");
            if Graph."Refresh Token".HasValue then begin
                Graph."Refresh Token".CreateInStream(IStream, TextEncoding::UTF8);
                while not IStream.EOS do begin
                    IStream.ReadText(Line, 1024);
                    Buffer.Append(Line);
                end;
            end;

            exit(Buffer.ToText())
        end;
    end;

    procedure ResetAccessToken()
    Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.find('-') then begin
            Graph."Authorization Time" := 0DT;
            Clear(Graph."Access Token");
            Clear(Graph."Refresh Token");
            Graph.Modify();
        end;
    end;
    //

    procedure RefreshMSGraphToken() Response: Text
    var
        Client: HttpClient;
        Headers: HttpHeaders;
        ResponseMessage: HttpResponseMessage;
        Request: HttpRequestMessage;
        Content: HttpContent;
        Token: Text;
        Url: Text;
        Resp: Text;
        Graph: Record "Microsoft Graphs";
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Assert, Body, AadTenantId : Text;
        httprequest: HttpRequestMessage;
        Assertion: Interface "Graph Authorization";
        HttpAuth: Interface "Http Authentication";
        Dict: Dictionary of [Text, Text];
        Scope: Text;
    begin
        graph.Reset();
        graph.SetRange(Type, graph.Type::Graph);
        if graph.FindFirst() then begin
            Url := 'https://login.microsoftonline.com/' + Graph."Tenant ID" + '/oauth2/v2.0/token';

            Content.Clear();
            Headers.Clear();
            AadTenantId := 'https://graph.microsoft.com';
            Assertion := GetGraphAuthorization(AadTenantId);
            Scope := 'https://graph.microsoft.com/.default';
            Body := 'grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=' + Assert + '&requested_token_use=on_behalf_of&client_id=' + Graph."Client ID" + '&client_secret=' + Graph."Client Secret" + '&scope=' + Scope + '&tenant_id=' + Graph."Tenant ID";

            Content.WriteFrom(Body);
            Content.GetHeaders(Headers);
            Headers.Remove('Content-Type');
            Headers.Remove('Charset');
            Headers.Add('Content-Type', 'application/x-www-form-urlencoded');
            httpRequest.GetHeaders(Headers);

            if Client.Post(Url, Content, ResponseMessage) then
                ResponseMessage.Content.ReadAs(Response);
            if not ResponseMessage.IsSuccessStatusCode then
                Error('Request was not successful: %1', ResponseMessage);
            Clear(ResultObj);
            ResultObj.ReadFrom(Response);
            ResultObj.get('access_token', ResultJtoken);
            Response := ResultJtoken.AsValue().AsText();
        end;
    end;

    //Reschedule Meeting
    procedure RescheduleEvent(CEOAppointment: Record "CEO Appointment") Response: Text
    var
        Client: HttpClient;
        Resp: HttpResponseMessage;
        Request: HttpRequestMessage;
        Header: HttpHeaders;
        Token: secretText;
        RefreshToken: Text;
        Graph: Record "Microsoft Graphs";
        URL: Text;
        Content: HttpContent;
        ContentText: Text;
        JsonPayload: JsonObject;
        JsonPayload1: JsonObject;
        JsonPayload2: JsonObject;
        JsonPayload3: JsonObject;
        JsonPayload4: JsonObject;
        JsonPayload5: JsonObject;
        JsonPayload6: JsonObject;
        JArray: JsonArray;
        JObjStartTime: JsonObject;
        JObjEndTime: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        StartDate: Date;
        StartTime, StartingTime : Text;
        StartingDate, EndingDate : Text;
        EndDate: Date;
        TwelveHrsConversion: Decimal;
        FinalTwelveHrsConversion: Time;
        StartTimeZone, EndTimeZone : Time;
        SuitableTimeZone: Decimal;
        StartLessTwelveHours, EndLessTwelveHours : Text;
        EndTime, EndingTime : Text;
        Description: Text;
        Subj: Text;
        AttendeeName, AttendeeEmail, Recepient : Text;
        OnlineMeet: Boolean;
        MeetVenue: Text;
        GraphClient: Codeunit "Graph Client";
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Emp: Record Employee;
        Subject, Body, Body1, Body2, Body3, Body4 : Text;
        UserSet: Record "User Setup";
    begin
        graph.Reset();
        graph.SetRange(Type, graph.Type::Graph);
        if graph.FindFirst() then begin
            URL := Graph."Microsoft Graph Outlook Events URL";
            // RefreshToken := RefreshMSGraphToken;
            // RefreshToken := ReceiveAccessToken;
            TwelveHrsConversion := 43200000;
            SuitableTimeZone := 10800000;
            Token := GeneratedToke;
            OnlineMeet := false;


            clear(JsonPayload);
            clear(JsonPayload1);
            clear(JsonPayload2);
            clear(JsonPayload3);
            clear(JsonPayload4);
            clear(JsonPayload5);
            clear(JsonPayload6);
            clear(JObjStartTime);
            clear(JObjEndTime);

            // Fix on date, time and Timezone
            StartingDate := FORMAT(CEOAppointment."Rescheduled Date", 10, '<Year4>-<Month,2>-<Day,2>');
            StartTime := Format(CEOAppointment."Rescheduled Start Time");
            if CopyStr(StartTime, 9, 11) = ' PM' then begin
                if CopyStr(EndTime, 1, 2) = '10' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled Start Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '11' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled Start Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '12' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled Start Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else begin
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled Start Time" + TwelveHrsConversion;
                    StartTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end;
            end else if CopyStr(StartTime, 9, 11) = ' AM' then begin
                if CopyStr(StartTime, 1, 2) = '10' then begin
                    StartTimeZone := CEOAppointment."Rescheduled Start Time" - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(StartTime, 1, 2) = '11' then begin
                    StartTimeZone := CEOAppointment."Rescheduled Start Time" - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else if CopyStr(StartTime, 1, 2) = '12' then begin
                    StartTimeZone := CEOAppointment."Rescheduled Start Time" - SuitableTimeZone;
                    StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
                end else begin
                    StartTimeZone := CEOAppointment."Rescheduled Start Time" - SuitableTimeZone;
                    StartingTime := CopyStr('0' + Format(StartTimeZone), 1, 8);
                end;
            end else begin
                StartTimeZone := CEOAppointment."Rescheduled Start Time" - SuitableTimeZone;
                StartingTime := CopyStr(Format(StartTimeZone), 1, 8);
            end;
            EndingDate := FORMAT(CEOAppointment."Appointment End Date", 10, '<Year4>-<Month,2>-<Day,2>');
            EndTime := Format(CEOAppointment."Rescheduled End Time");
            if CopyStr(EndTime, 9, 11) = ' PM' then begin
                if CopyStr(EndTime, 1, 2) = '10' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '11' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone + TwelveHrsConversion;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '12' then begin
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else begin
                    // EndingTime := CopyStr('0' + EndTime, 1, 8);
                    FinalTwelveHrsConversion := CEOAppointment."Rescheduled End Time" + TwelveHrsConversion;
                    EndTimeZone := FinalTwelveHrsConversion - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end;
            end else if CopyStr(EndTime, 9, 11) = ' AM' then begin
                if CopyStr(EndTime, 1, 2) = '10' then begin
                    EndTimeZone := CEOAppointment."Rescheduled End Time" - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '11' then begin
                    EndTimeZone := CEOAppointment."Rescheduled End Time" - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else if CopyStr(EndTime, 1, 2) = '12' then begin
                    EndTimeZone := CEOAppointment."Rescheduled End Time" - SuitableTimeZone;
                    EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
                end else begin
                    EndTimeZone := CEOAppointment."Rescheduled End Time" - SuitableTimeZone;
                    EndingTime := CopyStr('0' + Format(EndTimeZone), 1, 8);
                end;
            end else begin
                EndTimeZone := CEOAppointment."Rescheduled End Time" - SuitableTimeZone;
                EndingTime := CopyStr(Format(EndTimeZone), 1, 8);
            end;

            if CopyStr(StartingTime, 1, 2) = '12' then begin
                StartingTime := StartingTime;
            end else if CopyStr(StartingTime, 1, 2) = '11' then begin
                StartingTime := StartingTime;
            end else if CopyStr(StartingTime, 1, 2) = '10' then begin
                StartingTime := StartingTime;
                // end else if CopyStr(StartingTime, 1, 2) = ('9' or '8' or '7' or '6') then begin
            end else begin
                StartingTime := '0' + CopyStr(StartingTime, 2, 8);
            end;

            if CopyStr(EndingTime, 1, 2) = '12' then begin
                EndingTime := EndingTime;
            end else if CopyStr(EndingTime, 1, 2) = '11' then begin
                EndingTime := EndingTime;
            end else if CopyStr(EndingTime, 1, 2) = '10' then begin
                EndingTime := EndingTime;
            end else begin
                EndingTime := '0' + CopyStr(EndingTime, 2, 8);
            end;

            // Fix on date, time and Timezone

            Description := CEOAppointment.Description;
            Subj := CEOAppointment."Meeting Subject";
            AttendeeName := CEOAppointment."Requested by Employee Name";
            AttendeeEmail := CEOAppointment."Requested By Employee Email";
            if CEOAppointment."Is Online?" then
                OnlineMeet := true;
            MeetVenue := CEOAppointment."Meeting Venue";

            JObjStartTime.Add('dateTime', StartingDate + 'T' + StartingTime + 'Z');
            JObjStartTime.Add('timeZone', 'UTC');

            JObjEndTime.Add('dateTime', EndingDate + 'T' + EndingTime + 'Z');
            JObjEndTime.Add('timeZone', 'UTC');

            JsonPayload.add('subject', Subj);
            JsonPayload.add('start', JObjStartTime);
            JsonPayload.add('end', JObjEndTime);

            JsonPayload.add('isOnlineMeeting', OnlineMeet);
            JsonPayload6.add('displayName', MeetVenue);
            JsonPayload.Add('location', JsonPayload6);


            // Attendees
            JsonPayload1.Add('name', AttendeeName);
            JsonPayload1.Add('address', AttendeeEmail);
            JsonPayload2.Add('emailAddress', JsonPayload1);
            JArray.Add(JsonPayload2);
            JsonPayload.Add('attendees', JArray);
            JsonPayload.Add('isReminderOn', 'true');

            JsonPayload.WriteTo(ContentText);

            Content.WriteFrom(ContentText);
            Content.GetHeaders(Header);
            Header.Remove('Content-Type');
            Header.Add('Content-Type', 'application/json');
            Request.GetHeaders(Header);
            Request.GetHeaders(Header);

            Header.Add('Authorization', Token);


            Client.DefaultRequestHeaders.Add('Authorization', token);
            if Client.Post(url, Content, Resp) then
                Resp.Content.ReadAs(Response);
            if not Resp.IsSuccessStatusCode then
                Error('Request was not successful: %1', Response);


            // Send Email
            CEOAppointment.TestField(CEOAppointment."Rescheduled Date");
            CEOAppointment.TestField(CEOAppointment."Rescheduled Start Time");
            CEOAppointment.TestField(CEOAppointment."Rescheduled End Time");
            Emp.Get(CEOAppointment."Requested by Employee No");
            if Emp."E-Mail" = '' then
                Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

            Recepient := Emp."E-Mail";

            Subject := 'Booking for an Appointment';
            Body += 'Dear ' + Emp."First Name" + ' ,';
            // Body += '<br>I am currently booking for an appointment at this date and time' + CEOAppointment."Appointment Date" + '.';
            Body += '<br> Your Appointment has been rescheduled to ' + Format(CEOAppointment."Rescheduled Date") + 'at ' + Format(CEOAppointment."Rescheduled Start Time") + ' to ' + Format(CEOAppointment."Rescheduled End Time") + '.<br>';
            // Body += '<br>Kindly keep mind to attend the appointment.<br>';
            Body += '<br> Kind Regards, <br> <br>The CEO. <br><br> ';

            EmailMess.Create(Recepient, Subject, Body, true);
            Email.Send(EmailMess, EmailScen::Default);

            //CEOAppointmentepitionist
            // UserSet.Reset();
            // UserSet.SetRange("CEO Appointment Notifications", true);
            // if UserSet.FindSet then begin
            //     Recepient := UserSet."E-Mail";
            //     Subject := 'Booking for an Appointment';
            //     Body1 += 'Dear ' + UserSet."Employee Name" + ' ,';
            //     // Body1 += '<br>I am currently booking for an appointment at this date and time' + CEOAppointment."Appointment Date" + '.';
            //     Body1 += '<br> The Appointment ' + CEOAppointment.No + ' for ' + CEOAppointment."Requested by Employee Name" + ' has been rescheduled to ' + Format(CEOAppointment."Rescheduled Start Time") + ' to ' + Format(CEOAppointment."Rescheduled End Time") + '.<br>';
            //     // Body1 += '<br>Kindly keep mind to attend the appointment.<br>';
            //     Body1 += '<br> Kind Regards, <br> <br>The CEO. <br><br> ';

            //     EmailMess.Create(Recepient, Subject, Body1, true);
            //     Email.Send(EmailMess, EmailScen::Default);
            // end;
            //CEOAppointmentepitionist

            CEOAppointment."Appointment Status" := CEOAppointment."Appointment Status"::Rescheduled;
            CEOAppointment.Modify();
            Message('You have Rescheduled the Appointment');
        end;
    end;

    procedure InitializeGraphConnection() Response: Text
    var
        AadTenantId: Text;
        Diag: Interface "HTTP Diagnostics";
        SharePointList: Record "SharePoint List" temporary;
        GraphClient: Codeunit "Graph Client";
        Graph: Record "Microsoft Graphs";
        Url: Text;
        GraphAPIVersion: Enum "Graph API Version";
        AuthURL: Text;
        DotNetUriBuilder: Codeunit Uri;
        State: text;
        Host: Text;
        Uri: Codeunit Uri;
        OnMicrosoftTxt: Label '.onmicrosoft.com';
    begin
        Graph.Reset();
        Graph.SetRange(Type, graph.Type::Graph);
        if Graph.FindFirst() then begin
            if Connected then //A global variable Connected is used to store the value to prevent from needlessly repeating the function.
                exit;


            // AadTenantId := 'https://graph.microsoft.com';
            Uri.Init(Graph."Authorization URL");
            Host := Uri.GetHost();
            AadTenantId := CopyStr(Host, 1, StrPos(Host, '.microsoftonline.com') - 1) + OnMicrosoftTxt;
            GraphClient.Initialize(GraphAPIVersion::"v1.0", GetGraphAuthorization(AadTenantId)); //Initializes the client

            Connected := true; //Set the connection status to true so that we won't have to re-connect when already connected.
        end;
    end;

    local procedure GetGraphAuthorization(AadTenantId: Text): Interface "Graph Authorization"
    // procedure CreateAuthorizationWithClientCredentials(AadTenantId: Text, ClientId: Text, ClientSecret: SecretText, Scope: Text): Interface "Graph Authorization"
    var
        Graph: Record "Microsoft Graphs";
        Scopes: List of [Text];
        GraphAuth: Codeunit "Graph Authorization";
        AuthURL: Text;
        DotNetUriBuilder: Codeunit Uri;
        State: text;
    begin
        Graph.Reset();
        Graph.SetRange(Type, graph.Type::Graph);
        if Graph.FindFirst() then begin
            Scopes.Add('https://graph.microsoft.com/.default');
            State := Format(CreateGuid(), 0, 4);

            AuthURL := Graph."Authorization URL" + '?' +
                        'client_id=' + DotNetUriBuilder.EscapeDataString(Graph."Client ID") +
                        '&redirect_uri=' + DotNetUriBuilder.EscapeDataString(Graph."Redirect URL") +
                        '&state=' + DotNetUriBuilder.EscapeDataString(State) +
                        '&scope=' + DotNetUriBuilder.EscapeDataString(Graph."Authorization Scope") +
                        '&response_type=code' +
                        '&response_mode=query';


            exit(GraphAuth.CreateAuthorizationWithClientCredentials(AadTenantId, DotNetUriBuilder.EscapeDataString(Graph."Client ID"), DotNetUriBuilder.EscapeDataString(Graph."Client Secret"), DotNetUriBuilder.EscapeDataString(Graph."Authorization Scope")));
        end;
    end;

    procedure HyperLinkUrl(Link: Text) Response: Text
    var
        Window: Dialog;
        Connected: Boolean;
    begin
        if Connected then
            exit;
        Window.Open(Link);
        Hyperlink(Link);
        while Connected <> true do begin
            Sleep(1000);
            Window.Update();
            if Response <> '' then
                Connected := true;
        end;
        Window.Close();
        exit(Response);

    end;

    internal procedure GetAadTenantId(): Text
    var
        AzureADTenant: Codeunit "Azure AD Tenant";
    begin
        exit(AzureADTenant.GetAadTenantId());
    end;

    internal procedure GetAuthorization(): Text
    var
        GraphAuthorization: Codeunit "Graph Authorization";
        Graph: Record "Microsoft Graphs";
    begin
        graph.Reset();
        graph.SetRange(Type, graph.Type::Graph);
        if graph.FindFirst() then
            GraphAuthorization.CreateAuthorizationWithClientCredentials(GetAadTenantId(), Graph."Client ID", Graph."Client Secret", Graph.Scope);
    end;

    //Get User Id
    Procedure GetUserId() Response: Text
    var
        Client: HttpClient;
        Headers: HttpHeaders;
        ResponseMessage: HttpResponseMessage;
        Request: HttpRequestMessage;
        Content: HttpContent;
        Token: Text;
        TokenB: Text;
        Url: Text;
        Resp: Text;
        Graph: Record "Microsoft Graphs";
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Assert, Body : Text;
        httprequest: HttpRequestMessage;
    begin
        graph.Reset();
        graph.SetRange(Type, graph.Type::Graph);
        if graph.FindFirst() then begin
            Url := Graph."Microsoft Graph UserId";
            Token := GetAccessToken;
            TokenB := 'Bearer ' + Token;

            Content.Clear();
            Headers.Clear();

            Content.GetHeaders(Headers);
            httpRequest.GetHeaders(Headers);
            Headers.Add('Authorization', TokenB);


            if Client.Get(Url, ResponseMessage) then
                ResponseMessage.Content.ReadAs(Response);
            if not ResponseMessage.IsSuccessStatusCode then
                Error('Request was not successful: %1', ResponseMessage);
            Clear(ResultObj);
            ResultObj.ReadFrom(Response);
            ResultObj.get('id', ResultJtoken);
            Response := ResultJtoken.AsValue().AsText();
            // Message(Response);
        end;

    end;
    //Get User Id

    //Add Event to Outlook - End 


    Procedure ReduceSpaces(InputString: Text) OutputString: Text
    var
        n: integer;
        i: integer;
    begin
        n := STRLEN(InputString);
        FOR i := 1 TO n DO
            IF (InputString[i] = ' ') AND (i < n) THEN BEGIN
                IF NOT (InputString[i + 1] IN [32 .. 47, 58 .. 63]) THEN //if the next char is special as 'empty space,.,!' etc we do not copy the current space
                    OutputString += FORMAT(InputString[i])
            END ELSE
                OutputString += FORMAT(InputString[i]);

        OutputString := DELCHR(OutputString, '<>', ' ');
    end;
    //Trim Spaces
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Check Dimensions", 'OnBeforeCheckPurchDim', '', false, false)]
    local procedure OnBeforeCheckPurchDim(PurchaseHeader: Record "Purchase Header"; var TempPurchaseLine: Record "Purchase Line" temporary; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;


    ///Copy custom job planning lines to ledger entry
    [EventSubscriber(ObjectType::Table, Database::"Job Ledger Entry", 'OnAfterCopyTrackingFromJobJnlLine', '', false, false)]
    local procedure OnAfterCopyTrackingFromJobJnlLine(var JobLedgerEntry: Record "Job Ledger Entry"; JobJnlLine: Record "Job Journal Line")
    begin
        JobLedgerEntry."Road Code" := JobJnlLine."Road Code";
        JobLedgerEntry."Road Section No" := JobJnlLine."Road Section No";
        JobLedgerEntry."Constituency ID" := JobJnlLine."Constituency ID";
        JobLedgerEntry."County ID" := JobJnlLine."County ID";
        JobLedgerEntry."Region ID" := JobJnlLine."Region ID";
        JobLedgerEntry."Road Project Category" := JobJnlLine."Road Project Category";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnBeforeOnDelete, '', false, false)]
    local procedure SkipCheckPrintedOnDelete(var GenJournalLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    begin

        IsHandled := true;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnPostBankAccOnAfterBankAccLedgEntryInsert, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnPostBankAccOnAfterBankAccLedgEntryInsert"(var Sender: Codeunit "Gen. Jnl.-Post Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; BankAccount: Record "Bank Account")
    var
        BankAcc: Record "Bank Account";
        BankAccLedgEntry: Record "Bank Account Ledger Entry";
        CheckLedgEntry: Record "Check Ledger Entry";
        CheckLedgEntry2: Record "Check Ledger Entry";
        BankAccPostingGr: Record "Bank Account Posting Group";
    begin
        if GenJournalLine."Bank Payment Type" = GenJournalLine."Bank Payment Type"::"Computer Check" then begin
            GenJournalLine.TestField("Check Printed", true);
            CheckLedgEntry.LockTable();
            CheckLedgEntry.Reset();
            CheckLedgEntry.SetCurrentKey("Bank Account No.", "Entry Status", "Check No.");
            CheckLedgEntry.SetRange("Bank Account No.", GenJournalLine."Account No.");
            CheckLedgEntry.SetRange("Entry Status", CheckLedgEntry."Entry Status"::Printed);
            CheckLedgEntry.SetRange("Check No.", GenJournalLine."External Document No.");
            OnPostBankAccOnAfterCheckLedgEntrySetFilters(CheckLedgEntry, GenJournalLine);
            if CheckLedgEntry.FindSet() then
                repeat
                    CheckLedgEntry2 := CheckLedgEntry;
                    CheckLedgEntry2."Entry Status" := CheckLedgEntry2."Entry Status"::Posted;
                    CheckLedgEntry2."Bank Account Ledger Entry No." := BankAccountLedgerEntry."Entry No.";
                    OnPostBankAccOnBeforeCheckLedgEntry2Modify(CheckLedgEntry, BankAccountLedgerEntry, CheckLedgEntry2);
                    CheckLedgEntry2.Modify();
                until CheckLedgEntry.Next() = 0;
        end;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnPostBankAccOnAfterCheckLedgEntrySetFilters(var CheckLedgEntry: Record "Check Ledger Entry"; GenJnlLine: Record "Gen. Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPostBankAccOnBeforeCheckLedgEntry2Modify(var CheckLedgEntry: Record "Check Ledger Entry"; var BankAccLedgEntry: Record "Bank Account Ledger Entry"; var CheckLedgerEntry2: Record "Check Ledger Entry")
    begin
    end;





    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromPlanningLineToJnlLine', '', false, false)]
    local procedure OnAfterFromPlanningLineToJnlLine(var JobJournalLine: Record "Job Journal Line"; JobPlanningLine: Record "Job Planning Line")
    begin
        JobJournalLine."Road Code" := JobPlanningLine."Road Code";
        JobJournalLine."Road Section No" := JobPlanningLine."Road Section No";
        JobJournalLine."Constituency ID" := JobPlanningLine."Constituency ID";
        JobJournalLine."County ID" := JobPlanningLine."County ID";
        JobJournalLine."Region ID" := JobPlanningLine."Region ID";
        JobJournalLine."Road Project Category" := JobPlanningLine."Road Project Category";
    end;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterCreateVendor', '', false, false)]
    local procedure OnAfterCreateVendor(var Contact: Record Contact; var Vendor: Record Vendor)
    var
        RandomDigit: Text[50];
        Email: Codeunit Email;
        Mail: Codeunit "Email Message";
        Header: Text;
        Recepient: List of [Text];
        Body: Text;
        CompanyInfo: Record "Company Information";
        ProcurementSetup: Record "Procurement Setup";
        Portal: Record "Dynasoft Portal User";
        Cont: Page "Contact Card";
    begin
        RandomDigit := '';
        RandomDigit := CreateGuid;
        RandomDigit := DelChr(RandomDigit, '=', '{}-01');
        RandomDigit := CopyStr(RandomDigit, 1, 8);
        Clear(Recepient);
        Header := '';
        Body := '';
        Header := 'Account Creations Successful';
        CompanyInfo.Get();
        ProcurementSetup.Get();
        Portal.Init();
        Portal."Full Name" := Contact.Name;
        Portal."Authentication Email" := Contact."E-Mail";
        Portal."Mobile Phone No." := Contact."Phone No.";
        Portal.State := Portal.State::Enabled;
        Portal."Record Type" := Portal."Record Type"::Vendor;
        Portal."Record ID" := Vendor."No.";
        // Portal."Password Value" := RandomDigit;
        Portal."Login Type" := Portal."Login Type"::Contractor;
        Portal."Change Password" := true;
        if Portal.Insert(true) then begin
            Body := 'Dear ' + Contact.Name + ',<br><br> Your have successfully signed up  as a vendor to ' + CompanyInfo.Name + '. <br><br>Your email address is your username. <br><br>Your one time password to the supplier portal is <b> ' + RandomDigit + '</b>.<br> <br> Please use the  link below to login and change your password, to begin the registration process using <a href="' + ProcurementSetup."Procurement Link" + '">link</a> to change your password. <br> Regards, <br> ' + CompanyInfo.Name;
            Recepient.Add(contact."E-Mail");
            Mail.Create(Recepient, Header, Body, TRUE);
            Email.Send(Mail);
        end;
    end;

    procedure AdditionalItemstoStoreReqfromBoard(BoardRoomManagementHeader: Record "Board Room Management Header")
    var
        AdditionalRequests: Record "Additional Requests";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        Item: Record Item;
        NoSeriesMgt: Codeunit "No. Series";
        PurchSetup: Record "Procurement Setup";
    begin
        BoardRoomManagementHeader.Reset();
        BoardRoomManagementHeader.SetRange(No, BoardRoomManagementHeader.No);
        if BoardRoomManagementHeader.Find('-') then begin
            AdditionalRequests.Reset();
            AdditionalRequests.SetRange(Code, BoardRoomManagementHeader.No);
            if AdditionalRequests.FindSet then begin
                repeat
                    Item.Get(AdditionalRequests."Item No.");
                    if Item.find('-') then begin
                        //To be readded
                        // if Item.Inventory = 0 then
                        //     Error('The item requested does not have quantity in the store!');
                        // if AdditionalRequests.Quantity > Item.Inventory then
                        //     Error('There is not enough quantity for the request to be processed');

                        PurchaseHeader.Init();
                        PurchaseHeader."No." := NoSeriesMgt.GetNextNo(PurchSetup."Store Req No", Today, true);
                        PurchaseHeader."Requester ID" := UserId;
                        PurchaseHeader.Validate("Requester ID");
                        PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Store Requisition";
                        PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::"Internal Use";
                        PurchaseHeader."Order Date" := Today;
                        PurchaseHeader.Insert();

                        // PurchaseLine.Init;
                        PurchaseLine.Reset();
                        PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                        if PurchaseLine.find('-') then begin
                            PurchaseLine."Document No." := PurchaseHeader."No.";
                            PurchaseLine.Type := PurchaseLine.Type::Item;
                            PurchaseLine."No." := AdditionalRequests."Item No.";
                            PurchaseLine.Validate("No.");
                            PurchaseLine."Qty. Requested" := AdditionalRequests.Quantity;
                            PurchaseLine."Employee No" := PurchaseHeader."Request-By No.";
                            PurchaseLine.Insert();
                        end;

                    end;
                until AdditionalRequests.Next = 0;
            end;
        end else begin
            Message('The Store Requisition has not been processed!');
        end;
    end;

    //Create PV 
    //  [EventSubscriber(ObjectType::CodeUnit, CodeUnit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]

    // local procedure InvoicePostingCreatePV(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    //     var
    //     Payments: Record Payments;
    //     CMSSetup: Record "Cash Management Setup";
    //     NoSeriesMgt: Codeunit "No. Series";
    //     PVLines: Record "PV Lines"; 
    //     PInvHeader : Record "Purch. Inv. Header";
    //     PurchaseLine: Record "Purch. Inv. Line"; 

    // begin
    //     PInvHeader.Reset();
    //     PInvHeader.SetRange("No.", PurchInvHdrNo);
    //     PInvHeader.FindFirst();
    //     PurchaseLine.Reset();
    //     PurchaseLine.SetRange("Document No.", PInvHeader."No.");
    //     if PurchaseLine.findSet then begin
    //         Payments.Init;
    //                 CMSSetup.Get();
    //                 CMSSetup.TestField("PV Nos");
    //                 Payments."No." := NoSeriesMgt.DoGetNextNo(CMSSetup."PV Nos", Today, true, true);
    //                 Payments.Date := Today;
    //                 if Payments.insert(true) then begin
    //                             PVLines.Init;
    //                             PVLines."No" := Payments."No.";
    //                             PVLines."Account Type" := PvLines."Account Type"::Vendor;
    //                             PVLines."Account No" := PInvHeader."Buy-from Vendor No.";
    //                             PVLines."Applies to Doc. No" := PInvHeader."No.";
    //                             PVLines.Insert(true);
    //                             Message('Succesfully created Payment Voucher No: %1',Payments."No.");
    //                     end;
    //                 PAGE.Run(PAGE::"Payment Voucher",Payments);
    //             end;

    //     end;

    procedure SharePointDocumentTypeSelector(DocType: Enum "Approval Document Type") SharePointURL: Text
    var
        // DocType: Enum "Approval Document Type";
        SharePointSetup: Record "Sharepoint Connector Setup";
    begin
        SharePointSetup.Get();
        case DocType of
            DocType::Quote:
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup.Quote;
            DocType::Order:
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup.Order;
            DocType::Invoice:
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup.Invoice;
            DocType::"Credit Memo":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Credit Memo";
            DocType::"Return Order":
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup."Return Order";
            DocType::Payment:
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup.Payment;
            DocType::"Imprest Memo":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Imprest Memo";
            DocType::"staff Claims":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."staff Claims";
            DocType::"Payment Voucher":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Payment Voucher";
            DocType::"Petty Cash":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Petty Cash";
            DocType::Imprest:
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup.Imprest;
            DocType::Surrender:
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup.Surrender;
            DocType::Payroll:
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup.Payroll;
            DocType::"Store Requisition":
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup."Store Requisition";
            DocType::"Purchase Requisition":
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup."Purchase Requisition";
            DocType::"Leave Application":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Leave Application";
            DocType::"Bank Transfer":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Bank Transfer";
            DocType::"Transport Requisition":
                SharePointURL := SharePointSetup."Transport Documents" + SharePointSetup."Transport Requisition";
            DocType::Sclaims:
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup.Sclaims;
            DocType::"Salary Voucher":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Salary Voucher";
            DocType::Procurement:
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup.Procurement;
            DocType::"Salary Advance":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Salary Advance";
            DocType::"File Movement":
                SharePointURL := SharePointSetup."ICT Documents" + SharePointSetup."File Movement";
            DocType::RFI:
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup.RFI;
            DocType::IFS:
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup.IFS;
            DocType::"Vend Debarment":
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup."Vend Debarment";
            DocType::"Temp Salary Voucher":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Temp Salary Voucher";
            DocType::"AIE Funds Transfer":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."AIE Funds Transfer";
            DocType::"Training Plan":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Training Plan";
            DocType::"Training Application":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Training Application";
            DocType::"Bank Rec":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Bank Rec";
            DocType::"Asset Transfer":
                SharePointURL := SharePointSetup."Supply Chain Management Documents" + SharePointSetup."Asset Transfer";
            DocType::"Cash Request":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Cash Request";
            DocType::"Bill Discounting":
                SharePointURL := SharePointSetup."Bill Discounting";
            DocType::Maintenance:
                SharePointURL := SharePointSetup."Transport Documents" + SharePointSetup.Maintenance;
            DocType::FuelReq:
                SharePointURL := SharePointSetup."Transport Documents" + SharePointSetup.FuelReq;
            DocType::SAV:
                SharePointURL := SharePointSetup.SAV;
            DocType::"Recruitment Header":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Recruitment Header";
            DocType::"Driver Out Of Office Req":
                SharePointURL := SharePointSetup."Transport Documents" + SharePointSetup."Driver Out Of Office Req";
            DocType::"Batch Payment":
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup."Batch Payment";
            DocType::"Staff Appointment":
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup."Staff Appointment";
            DocType::Mobilization:
                SharePointURL := SharePointSetup.Mobilization;
            DocType::Meeting:
                SharePointURL := SharePointSetup."Human Capital & Administration Documents" + SharePointSetup.Meeting;
            DocType::Payments:
                SharePointURL := SharePointSetup."Finance & Accounts Documents" + SharePointSetup.Payments;
        end;
    end;

    procedure MemosToSharePoint(DocType: Enum "Approval Document Type"; DocNo: Text) SharePointURL: Text
    var
        SharePointSetup: Record "Sharepoint Connector Setup";
        GeneralCorrespondenceHeader: Record "General Correspondence Header";
        OriginalDocNo: Code[100];
    begin
        OriginalDocNo := ConvertStr(DocNo, '_', '/');
        if DocType = DocType::Memos then begin
            GeneralCorrespondenceHeader.Reset();
            GeneralCorrespondenceHeader.SetRange("Document No", OriginalDocNo);
            if GeneralCorrespondenceHeader.find('-') then begin
                //Division
                // if GeneralCorrespondenceHeader."Division Code" = 'Finance & Accounts' then
                //     SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Finance & Accounts Memos";
                // if GeneralCorrespondenceHeader."Division Code" = 'Human Capital & Administration' then
                //     SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Human Capital & Administration Memos";
                // if GeneralCorrespondenceHeader."Department Code" = 'SCM' then
                //     SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Supply Chain Management Memos";
                // if GeneralCorrespondenceHeader."Division Code" = 'Corporate Communication' then
                //     SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Corporate Communication Memos";
                // if GeneralCorrespondenceHeader."Division Code" = 'Information Communication Technology' then
                //     SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."ICT Memos";
                SharePointSetup.Get();
                case GeneralCorrespondenceHeader."Department Code" of
                    'Finance & Accounts':
                        SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Finance & Accounts Memos";
                    'Human Capital & Administration':
                        SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Human Capital & Administration Memos";
                    'Corporate Communication':
                        SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Corporate Communication Memos";
                    'Information Communication Technology':
                        SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."ICT Memos";
                    'Internal Audit':
                        SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Internal Audit Memos";
                    'SCM':
                        SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Supply Chain Management Memos";
                end;
                // //Department
                // if GeneralCorrespondenceHeader."Department Code" = 'Standard & Compliance' then begin
                //     // SharePointURL := SharePointSetup."Standard & Compliance Memos";
                //     if GeneralCorrespondenceHeader."Division Code" = 'Testing' then
                //         SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Testing Memos";
                //     if GeneralCorrespondenceHeader."Division Code" = 'Compliance' then
                //         SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Compliance Memos";
                // end;
                // if GeneralCorrespondenceHeader."Division Code" = 'Internal Audit' then
                //     SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Internal Audit Memos";
                // if GeneralCorrespondenceHeader."Department Code" = 'Legal Services' then
                //     SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Legal Services Memos";
                // if GeneralCorrespondenceHeader."Department Code" = 'Education & Research' then begin
                //     // SharePointURL := SharePointSetup."Education & Research Memos";
                //     if GeneralCorrespondenceHeader."Division Code" = 'Anti-doping Education' then
                //         SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Anti-Doping Education Memos";
                //     if GeneralCorrespondenceHeader."Division Code" = 'Research & Development' then
                //         SharePointURL := SharePointSetup."Main Memo Directory" + SharePointSetup."Research & Development Memos";
                // end

            end;
        end;
    end;

    procedure GeneratedToke(): secretText
    var
        GraphClient: Codeunit "Graph Client";
        GraphAPI: Enum "Graph API Version";
        RelativeUriToResource: Text;
        GraphOptionalParameters: Codeunit "Graph Optional Parameters";
        Content: Text;
        GraphConflictBehavior: Enum "Graph ConflictBehavior";
        RequestHttpContent: Codeunit "Http Content";
        HttpResponseMessage: Codeunit "Http Response Message";
        OAuth2: Codeunit OAuth2;
        Graph: Record "Microsoft Graphs";
        PromptInteraction: Enum "Prompt Interaction";
        AccessToken: SecretText;
        AuthCodeError: Text;
        Scopes: List of [Text];
        ClientSecretText: Text;
        ClientSecret: Text;
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if Graph.Find('-') then begin
            Scopes.Add(Graph.Scope);

            // Convert Client Secret (Text) → SecretText
            ClientSecretText := Graph."Client Secret";
            //  ClientSecret := SecretText.FromText(ClientSecretText);

            // Call OAuth2 with proper SecretText
            if not OAuth2.AcquireTokenByAuthorizationCode(
                    Graph."Client ID",
                    ClientSecret,
                    Graph."Authorization URL",
                    Graph."Redirect URL",
                    Scopes,
                    PromptInteraction::Login,
                    AccessToken,
                    AuthCodeError)
            then
                Error(AuthCodeError);
        end else
            Error('No Microsoft Graph setup found.');

        // if (AccessToken  ) or (AuthCodeError <> '') then
        //      Error(AuthCodeError);

        exit(AccessToken);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", OnBeforeConfirmSalesPost, '', false, false)]
    local procedure "Sales-Post (Yes/No)_OnBeforeConfirmSalesPost"(var SalesHeader: Record "Sales Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer; var PostAndSend: Boolean)
    begin
        SalesHeader.TestField(Status, SalesHeader.Status::Released);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnApproveApprovalRequest, '', false, false)]
    local procedure "Approvals Mgmt._OnApproveApprovalRequest"(var ApprovalEntry: Record "Approval Entry")
    begin
        // Approve all entries in the same sequence
        ApproveSameSequence(ApprovalEntry);
        // If it's the last sequence, then release document
        if IsLastSequenceApproved(ApprovalEntry) then
            ReleaseDocument(ApprovalEntry."Table ID", ApprovalEntry."Document No.");
        if ApprovalEntry."Table ID" = Database::"HR Leave Applications" then begin
            HandleApproval(ApprovalEntry);
        end;

    end;


    local procedure ApproveSameSequence(CurrentApprovalEntry: Record "Approval Entry")
    var
        ApprovalEntries: Record "Approval Entry";
    begin
        ApprovalEntries.Reset();
        ApprovalEntries.SetRange("Table ID", CurrentApprovalEntry."Table ID");
        ApprovalEntries.SetRange("Document No.", CurrentApprovalEntry."Document No.");
        ApprovalEntries.SetRange("Sequence No.", CurrentApprovalEntry."Sequence No.");

        if ApprovalEntries.FindSet() then
            repeat
                if ApprovalEntries.Status <> ApprovalEntries.Status::Approved then begin
                    ApprovalEntries.Status := ApprovalEntries.Status::Approved;
                    ApprovalEntries.Modify(true);
                end;
            until ApprovalEntries.Next() = 0;
    end;

    local procedure IsLastSequenceApproved(CurrentApprovalEntry: Record "Approval Entry"): Boolean
    var
        ApprovalEntries: Record "Approval Entry";
        LastSeqNo: Integer;
    begin
        // Get the highest sequence number for this document
        ApprovalEntries.Reset();
        ApprovalEntries.SetRange("Table ID", CurrentApprovalEntry."Table ID");
        ApprovalEntries.SetRange("Document No.", CurrentApprovalEntry."Document No.");
        if ApprovalEntries.FindLast() then
            LastSeqNo := ApprovalEntries."Sequence No."
        else
            exit(false);

        // Only release if the current sequence is the last one
        if CurrentApprovalEntry."Sequence No." <> LastSeqNo then
            exit(false);

        // Check if ALL entries in the last sequence are approved
        ApprovalEntries.Reset();
        ApprovalEntries.SetRange("Table ID", CurrentApprovalEntry."Table ID");
        ApprovalEntries.SetRange("Document No.", CurrentApprovalEntry."Document No.");
        ApprovalEntries.SetRange("Sequence No.", LastSeqNo);

        if ApprovalEntries.FindSet() then
            repeat
                if ApprovalEntries.Status <> ApprovalEntries.Status::Approved then
                    exit(false);
            until ApprovalEntries.Next() = 0;

        exit(true);
    end;

    local procedure ReleaseDocument(TableId: Integer; DocumentNo: Code[20])
    var
        Payments: Record Payments;
        PurchHeader: Record "Purchase Header";
        SalesHeader: Record "Sales Header";
        LeaveApp: Record "HR Leave Applications";
    begin
        case TableId of
            Database::Payments:
                if Payments.Get(DocumentNo) then
                    if Payments.Status <> Payments.Status::Released then begin
                        Payments.Status := Payments.Status::Released;
                        Payments.Modify(true);
                    end;

            Database::"Purchase Header":
                if PurchHeader.Get(PurchHeader."Document Type"::Order, DocumentNo) then
                    if PurchHeader.Status <> PurchHeader.Status::Released then begin
                        PurchHeader.Status := PurchHeader.Status::Released;
                        PurchHeader.Modify(true);

                    end;

            Database::"Sales Header":
                if SalesHeader.Get(SalesHeader."Document Type"::Order, DocumentNo) or
                   SalesHeader.Get(SalesHeader."Document Type"::Invoice, DocumentNo) then
                    if SalesHeader.Status <> SalesHeader.Status::Released then begin
                        SalesHeader.Status := SalesHeader.Status::Released;
                        SalesHeader.Modify(true);
                    end;
            Database::"HR Leave Applications":
                if LeaveApp.Get(DocumentNo) then
                    if LeaveApp.Status <> LeaveApp.Status::Released then begin
                        LeaveApp.Status := LeaveApp.Status::Released;
                        LeaveApp.Modify(true);
                    end;
        end;
        //

    end;

    //


    [EventSubscriber(ObjectType::Table, Database::"Detailed CV Ledg. Entry Buffer", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure "Detailed CV Ledg. Entry Buffer_OnAfterCopyFromGenJnlLine"(var DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"; GenJnlLine: Record "Gen. Journal Line")
    begin
        DtldCVLedgEntryBuffer."Vendor Name" := GenJnlLine.Description;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure "Vendor Ledger Entry_OnAfterCopyVendLedgerEntryFromGenJnlLine"(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."Vendor Name" := GenJournalLine.Description;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnPostEmployeeOnBeforeEmployeeLedgerEntryInsert, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnPostEmployeeOnBeforeEmployeeLedgerEntryInsert"(var GenJnlLine: Record "Gen. Journal Line"; var EmployeeLedgerEntry: Record "Employee Ledger Entry"; GLRegister: Record "G/L Register")
    var
        Payment: Record payments;
        CashMgt: Record "Cash Management Setup";
        BatchImprestVoucherLines: Record "Batch Imprest Voucher Lines";
    begin
        CashMgt.Get();
        Payment.Reset;
        Payment.SetFilter("Document Type", '%1|%2', Payment."Document Type"::"Standing Imprest", Payment."Document Type"::"Standing Imprest Surrender");
        Payment.SetRange("No.", GenJnlLine."Document No.");
        If Payment.Findfirst then begin
            case Payment."Document Type" of
                Payment."Document Type"::"Standing Imprest":
                    EmployeeLedgerEntry."Imprest Document Type" := EmployeeLedgerEntry."Imprest Document Type"::"Standing Imprest";

                Payment."Document Type"::"Standing Imprest Surrender":
                    EmployeeLedgerEntry."Imprest Document Type" := EmployeeLedgerEntry."Imprest Document Type"::"Standing Imprest Surrender";
            end;
            EmployeeLedgerEntry."Financial Year" := CashMgt."Current Financial Year";

        end;

        BatchImprestVoucherLines.Reset();
        BatchImprestVoucherLines.SetRange("No.", GenJnlLine."Document No.");
        BatchImprestVoucherLines.SetRange("Account No.", GenJnlLine."Account No.");
        BatchImprestVoucherLines.SetRange("Imprest Req. No.", GenJnlLine."External Document No.");
        if BatchImprestVoucherLines.FindFirst() then begin
            EmployeeLedgerEntry."EXternal Document No." := BatchImprestVoucherLines."Imprest Req. No.";
        end;


    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnBeforeCheckPostingGroupChange, '', false, false)]
    local procedure "Gen. Journal Line_OnBeforeCheckPostingGroupChange"(var GenJournalLine: Record "Gen. Journal Line"; var xGenJournalLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    Var
        CashMgt: Record "Cash Management Setup";
        Employee: Record Employee;
    begin
        if GenJournalLine."Account Type" <> GenJournalLine."Account Type"::Employee then
            exit;
        if (GenJournalLine."Posting Group" <> xGenJournalLine."Posting Group") and (xGenJournalLine."Posting Group" <> '') then begin
            GenJournalLine.TestField("Account No.");
            if Employee.Get(GenJournalLine."Account No.") then begin
                if CashMgt."StandingImprest Posting Group" <> '' then
                    //if not CashMgt."StandingImprest Posting Group" then
                    Error('Changing posting group for Employees is not allowed in the cash Managemet Setup');
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        PurchaseHeader: Record "Purchase Header";
        ApprovalEntry2: Record "Approval Entry";
        AllApproved: Boolean;
    begin
        if ApprovalEntry."Table ID" <> DATABASE::"Purchase Header" then
            exit;

        if not PurchaseHeader.Get(PurchaseHeader."Document Type"::"Store Requisition", ApprovalEntry."Document No.") then
            exit;

        if PurchaseHeader.Status <> PurchaseHeader.Status::"Pending Approval" then
            exit;

        AllApproved := true;
        ApprovalEntry2.Reset();
        ApprovalEntry2.SetRange("Table ID", DATABASE::"Purchase Header");
        ApprovalEntry2.SetRange("Document Type", PurchaseHeader."Document Type");
        ApprovalEntry2.SetRange("Document No.", PurchaseHeader."No.");
        ApprovalEntry2.SetRange("Sequence No.", 1);
        if ApprovalEntry2.FindSet() then begin
            repeat
                if ApprovalEntry2.Status <> ApprovalEntry2.Status::Approved then
                    AllApproved := false;
            until ApprovalEntry2.Next() = 0;
        end;

        if AllApproved then begin
            PurchaseHeader.Status := PurchaseHeader.Status::Released;
            PurchaseHeader.Modify(true);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    local procedure OnApproveApprovalRequest1(var ApprovalEntry: Record "Approval Entry")
    var
        PayrollHeader: Record "Payroll Header";
        ApprovalEntry2: Record "Approval Entry";
        AllApproved: Boolean;
    begin
        if ApprovalEntry."Table ID" <> DATABASE::"Payroll Header" then
            exit;

        if not PayrollHeader.Get(ApprovalEntry."Document No.") then
            exit;

        if PayrollHeader.Status <> PayrollHeader.Status::"Pending Approval" then
            exit;

        AllApproved := true;
        ApprovalEntry2.Reset();
        ApprovalEntry2.SetRange("Table ID", DATABASE::"Payroll Header");
        ApprovalEntry2.SetRange("Document No.", PayrollHeader."No.");
        ApprovalEntry2.SetRange("Sequence No.", 1);
        if ApprovalEntry2.FindSet() then begin
            repeat
                if ApprovalEntry2.Status <> ApprovalEntry2.Status::Approved then
                    AllApproved := false;
            until ApprovalEntry2.Next() = 0;
        end;

        if AllApproved then begin
            PayrollHeader.Status := PayrollHeader.Status::Released;
            PayrollHeader.Modify(true);
        end;
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Approval Entry", 'OnAfterModifyEvent', '', false, false)]
    // local procedure ApprovalEntry_OnAfterModifyEvent(var Rec: Record "Approval Entry"; var xRec: Record "Approval Entry"; RunTrigger: Boolean)
    // var
    //     NextEntry: Record "Approval Entry";
    // begin
    //     if Rec.IsTemporary() then
    //         exit;
    //     if Rec."Table ID" <> DATABASE::"HR Leave Applications" then
    //         exit;
    //     if (xRec.Status = Rec.Status) or (Rec.Status <> Rec.Status::Approved) then
    //         exit;
    //     NextEntry.Reset();
    //     NextEntry.SetRange("Table ID", Rec."Table ID");
    //     NextEntry.SetRange("Document No.", Rec."Document No.");
    //     NextEntry.SetFilter("Sequence No.", '>%1', Rec."Sequence No.");
    //     // NextEntry.SetOrder("Sequence No.");
    //     if NextEntry.FindFirst() then begin
    //         if NextEntry.Status <> NextEntry.Status::Created then begin
    //             NextEntry.Status := NextEntry.Status::Open;
    //             NextEntry.Modify(true);
    //         end;
    //     end;
    // end;


    procedure HandleApproval(ApprovalEntry: Record "Approval Entry")
    var
        NextApprovalEntry: Record "Approval Entry";
    begin
        if ApprovalEntry."Table ID" = Database::"HR Leave Applications" then begin
            if ApprovalEntry.Status = ApprovalEntry.Status::Approved then begin
                NextApprovalEntry.Reset();
                NextApprovalEntry.SetRange("Table ID", ApprovalEntry."Table ID");
                NextApprovalEntry.SetRange("Document No.", ApprovalEntry."Document No.");
                NextApprovalEntry.SetFilter("Sequence No.", '%1', ApprovalEntry."Sequence No." + 1);
                NextApprovalEntry.SetRange(Status, NextApprovalEntry.Status::Created);

                if NextApprovalEntry.FindFirst() then begin
                    NextApprovalEntry.Status := NextApprovalEntry.Status::Open;
                    NextApprovalEntry.Modify(true);
                end;
            end;
        end;
    end;

    // Subscriber 1 - handles Employee, Paying Bank, Narration (fires at init time)
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', false, false)]
    local procedure OnAfterInitGLEntry(var GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line"; Amount: Decimal; AddCurrAmount: Decimal; UseAddCurrAmount: Boolean; var CurrencyFactor: Decimal; var GLRegister: Record "G/L Register")
    begin
        GLEntry."Employee No." := CopyStr(GenJournalLine."Employee No.", 1, 20);
        GLEntry."Employee Name" := CopyStr(GenJournalLine."Employee Name", 1, 100);
        GLEntry."Paying Bank Account" := CopyStr(GenJournalLine."Paying Bank Account", 1, 20);
        GLEntry."Destination Narration" := CopyStr(GenJournalLine."Destination Narration", 1, 250);
        GLEntry."Bank Name" := CopyStr(GenJournalLine."Bank Name.", 1, 200);

        GLEntry."Global Dimension 1 Code" := GenJournalLine."Shortcut Dimension 1 Code";
        GLEntry."Global Dimension 2 Code" := GenJournalLine."Shortcut Dimension 2 Code";

        GLEntry."Paying Bank Account" := GenJournalLine."Paying Bank Account";
    end;

    // Subscriber 2 - handles Dimensions only, fires just BEFORE final insert so no Modify needed
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertGlobalGLEntry', '', false, false)]
    local procedure OnBeforeInsertGlobalGLEntryDimensions(var GlobalGLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register"; FiscalYearStartDate: Date)
    begin
        GlobalGLEntry."Global Dimension 1 Code" := GenJournalLine."Shortcut Dimension 1 Code";
        GlobalGLEntry."Global Dimension 2 Code" := GenJournalLine."Shortcut Dimension 2 Code";
    end;


    [EventSubscriber(ObjectType::Page, Page::"Check Preview", 'OnBeforeFormatTextFieldsForCheck', '', false, false)]
    local procedure OverridePayee(
        var CheckToAddr: array[8] of Text[100];
        CheckAmount: Decimal;
        var GenJournalLine: Record "Gen. Journal Line";
        var Customer: Record Customer;
        var BankAccount: Record "Bank Account";
        var Employee: Record Employee;
        var Vendor: Record Vendor;
        Rec: Record "Gen. Journal Line";
        var IsHandled: Boolean)
    var
        PVHeader: Record "Batch Check Voucher";
    begin
        if PVHeader.Get(Rec."Document No.") then begin
            if PVHeader.Payee <> '' then begin
                Clear(CheckToAddr);
                CheckToAddr[1] := PVHeader.Payee;
                IsHandled := true;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitVendLedgEntry', '', false, false)]
    local procedure OnAfterInitVendLedgEntry(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry.WHT := GenJournalLine."WHT Code";
        VendorLedgerEntry."VAT Witheld" := GenJournalLine."VAT Withheld Code PV";
        VendorLedgerEntry.PPRA := GenJournalLine."PPRA Code PV";
        VendorLedgerEntry.Retention := GenJournalLine."Retention Code PV";
        VendorLedgerEntry.PAYE := GenJournalLine."PAYE Code PV";
        VendorLedgerEntry."Remaining Amount" := GenJournalLine."Remaining Amount";
        VendorLedgerEntry."Paying Bank Account" := GenJournalLine."Paying Bank Code";
        VendorLedgerEntry."Bank Name" := GenJournalLine."Bank Name";
        VendorLedgerEntry."Global Dimension 1 Code" := GenJournalLine."Shortcut Dimension 1 Code";
        VendorLedgerEntry."Global Dimension 2 Code" := GenJournalLine."Shortcut Dimension 2 Code";
    end;


}

