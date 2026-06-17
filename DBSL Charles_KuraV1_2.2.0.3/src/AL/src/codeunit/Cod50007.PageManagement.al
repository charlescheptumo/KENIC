codeunit 67011 "Page Management Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        if PageID = 0 then
            PageID := GetConditionalCardPageID(RecordRef);
        if PageID = 175 then
            PageID := GetConditionalCardPageID(RecordRef);
        if PageID = 53 then
           PageID := GetConditionalCardPageID(RecordRef);




    end;

    local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    var
        PV: Record "Payments";
        Payments: Record Payments;
        imprest: Record "Imprest Memo";
        Corporate: Record "Corporate Strategic Plans";
        pavement: Record "Pavement Test Header";
        ifp: record "Request For Information";
        pplan: record "Procurement Plan";
        PURCHREQ: Record "Purchase Header";
        Gbatch: record 232;
        Payroll: record "Payroll Header";
        measure: record "Measurement &  Payment Header";
        comm: record "ifs tender committee";
        gen: record 81;
        Sales: record "Sales Header";
        Leave: record "HR Leave Applications";
        Receipts: record "Receipts Header1";
        StaffAppointment: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
        TUE: Record "TUE Application Header";
        StandardPurchaseCode: Record "Standard Purchase Code";
        CommiteeAppointmentVoucher: Record "Commitee Appointment Voucher";
        Employee: Record Employee;
        EmpOffer: Record "Employment Offer";
        SuggBox: Record "Suggestion Box";
        // Budget: Record "Budget Header";
        // TS: Record "Consultant Time Sheet";
        // BankRec: Record "Bank Acc. Reconciliation";
        NumberPlateRequest: Record "Number Plate Request";
        RecruitmentPlan: Record "Recruitment Plan";
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        ExitClearanceHeader: Record "Staff Exit Clearance Header";
        JobApplications: Record "Job Applications";
        TransportRequisition: Record "Transport Requisition";
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        PEval: Record "Perfomance Evaluation";
        StoreReturnsHeader: Record "Store Returns Header";
    begin
        case RecordRef.Number of
            database::"Gen. Journal Batch":
                begin
                    RecordRef.SetTable(Gbatch);
                    exit(Page::"General Journal")
                end;
            database::"Gen. Journal line":
                begin
                    RecordRef.SetTable(gen);
                    exit(Page::"General Journal")
                end;


            database::"Payments":
                begin
                    RecordRef.SetTable(PV);
                    if pv."Payment Type" = pv."Payment Type"::"Payment Voucher" then
                        exit(Page::"Payment Voucher")
                    else
                        if pv."Payment Type" = pv."Payment Type"::"Surrender" then
                            exit(Page::"Imprest Surrender")
                        else
                            if pv."Payment Type" = pv."Payment Type"::Imprest then
                                exit(Page::"Imprest Requisition Card")
                            else
                             if pv."Payment Type" = pv."Payment Type"::"Standing Imprest" then
                                exit(Page::"Standing Imprest Requsitions")
                            else
                             if pv."Payment Type" = pv."Payment Type"::"Standing Imprest Surrender" then
                                exit(Page::"Standing Imprest Surrender")
                            else
                                if pv."Payment Type" = pv."Payment Type"::"Staff Claim" then
                                    exit(Page::"Staff Claim")
                                else
                                    if pv."Payment Type" = pv."Payment Type"::"Petty Cash" then
                                        exit(Page::"Petty Cash Voucher")
                                    else
                                        if pv."Payment Type" = pv."Payment Type"::"Petty Cash Surrender" then
                                            exit(Page::"Petty Cash Surrender")
                                        else
                                            if pv."Payment Type" = pv."Payment Type"::"Bank Transfer" then
                                                exit(Page::"Bank Transfer")
                                            else
                                                if pv."Payment Type" = pv."Payment Type"::"Salary Advance" then
                                                    exit(Page::"Salary Advance Card")
                                                else
                                                    if pv."Payment Type" = pv."Payment Type"::"Salary Advance Memo" then
                                                        exit(Page::"Salary Advance Memo")
                                                    else
                                                        exit(Page::"Imprest Requisition");
                end;
            Database::"Corporate Strategic Plans":
                begin
                    RecordRef.SetTable(Corporate);
                    exit(Page::"All CSP CARD")
                end;
            Database::"Pavement Test Header":
                begin
                    RecordRef.SetTable(pavement);
                    exit(Page::"Pavement Lab Test")
                end;
            Database::"Sales Header":
                begin
                    RecordRef.SetTable(sales);
                    exit(Page::"Sales Invoice")
                end;
            Database::"Receipts Header1":
                begin
                    RecordRef.SetTable(Receipts);
                    exit(Page::"Receipt")
                end;
            Database::"HR Leave Applications":
                begin
                    RecordRef.SetTable(Leave);
                    case Leave."Document Type" of
                        Leave."Document Type"::"Leave Application":
                            exit(Page::"Leave Applications Card");
                        Leave."Document Type"::"Additional Leave Days Memo":
                            exit(Page::"Additional Leave Days Memo")
                    end;
                end;
            Database::"Payroll Header":
                begin
                    RecordRef.SetTable(Payroll);
                    exit(Page::"Payroll Header")
                end;
            Database::"Measurement &  Payment Header":
                begin
                    RecordRef.SetTable(measure);
                    Case measure."Document Type" of
                        measure."Document Type"::"Contractor Payment Request":
                            begin
                                Case measure."Payment Certificate Type" of
                                    measure."Payment Certificate Type"::"Advance Payment":
                                        exit(Page::"Advance Payment Certificate");
                                    measure."Payment Certificate Type"::"Interim Payment":
                                        exit(Page::"Interim Payment Request");
                                End;
                            end;
                    End;


                end;
            Database::"Request For Information":
                begin
                    RecordRef.SetTable(ifp);
                    exit(Page::"IFP Card")
                end;
            Database::"Procurement Plan":
                begin
                    RecordRef.SetTable(pplan);
                    exit(Page::"Procurement Plan Card")
                end;
            Database::"ifs tender committee":
                begin
                    RecordRef.SetTable(comm);
                    exit(Page::"IFS Tender Committee Card")
                end;
            Database::"Vehicle Fuel Card Lines":
                begin
                    RecordRef.SetTable(VehicleFuelCardLines);
                    exit(Page::"Fuel Expenses Card");
                end;
            Database::"Purchase Header":
                begin
                    RecordRef.SetTable(PURCHREQ);
                    Case PURCHREQ."Document Type" of
                        PURCHREQ."Document Type"::Order:
                            exit(Page::"Purchase Order");
                        PURCHREQ."Document Type"::Invoice:
                            exit(Page::"Purchase Invoice");
                        PURCHREQ."Document Type"::"Store Requisition":
                            exit(Page::"Store Requisition");
                        PURCHREQ."Document Type"::"Loan Issue Requisition":
                            exit(Page::"Loan Issue Request Card");
                        PURCHREQ."Document Type"::"Loan Issue Surrender":
                            exit(Page::"Loan Issue Surrender Card");
                        PURCHREQ."Document Type"::"Purchase Requisition":
                            begin
                                if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::Standard then
                                    exit(Page::"Standard Purchase Requisition")
                                else
                                    if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::"Project Works" then
                                        exit(Page::"Projects Works PRNs")
                            end;
                    End;

                end;
            Database::"Imprest Memo":
                begin
                    RecordRef.SetTable(imprest);
                    exit(Page::"Imprest Memo")
                end;
            Database::"Project Staff Voucher":
                begin
                    RecordRef.SetTable(StaffAppointment);
                    Case StaffAppointment."Document Type" of
                        StaffAppointment."Document Type"::Appointment:
                            exit(Page::"Project Staff Appointment Card");
                        StaffAppointment."Document Type"::Termination:
                            exit(Page::"Project Staff Termination");
                    End;
                end;
            Database::"Project Mobilization Header":
                begin
                    RecordRef.SetTable(ProjectMobilization);
                    Case ProjectMobilization."Document Type" of
                        ProjectMobilization."Document Type"::"Order-To-Commence":
                            exit(Page::"Project Commencement Order");
                        ProjectMobilization."Document Type"::"Work Execution Programme":
                            exit(Page::"Work Execution Plan");
                        ProjectMobilization."Document Type"::"Mobilization Checklist":
                            exit(page::"Mobilization Checklist");
                        ProjectMobilization."Document Type"::"Mobilization Checklist Status Report":
                            exit(page::"Mobilization Checklist");
                    End;
                end;
            Database::"TUE Application Header":
                begin
                    RecordRef.SetTable(TUE);
                    exit(Page::"TUE Application Card");
                end;
            Database::"Standard Purchase Code":
                begin
                    RecordRef.SetTable(StandardPurchaseCode);
                    exit(GetStandardPurchaseCodePageID(RecordRef))
                end;
            Database::"Commitee Appointment Voucher":
                begin
                    RecordRef.SetTable(CommiteeAppointmentVoucher);
                    exit(Page::"Commitee Appointment Voucher")
                end;
            Database::Employee:
                begin
                    RecordRef.SetTable(Employee);
                    case Employee."Document Type" of
                        Employee."Document Type"::"Staff Exit":
                            exit(Page::"Staff Exit Card");
                        Employee."Document Type"::"Staff Reinstatement":
                            exit(Page::"Staff Reinstatement");
                    end;
                end;
            Database::"Employment Offer":
                begin
                    RecordRef.SetTable(EmpOffer);
                    exit(Page::"Employment Offer")
                end;
            Database::"Suggestion Box":
                begin
                    RecordRef.SetTable(SuggBox);
                    exit(Page::"Suggestion Box")
                end;
            Database::"Number Plate Request":
                begin
                    RecordRef.SetTable(NumberPlateRequest);
                    exit(Page::"Number Plate Request")
                end;
            Database::"Recruitment Plan":
                begin
                    RecordRef.SetTable(RecruitmentPlan);
                    case RecruitmentPlan."Recruitment Plan Type" of
                        RecruitmentPlan."Recruitment Plan Type"::"Functional Plan":
                            exit(Page::"Functional Recruitment Plan");
                        RecruitmentPlan."Recruitment Plan Type"::"Annual HR Plan":
                            exit(Page::"Recruitment Plan")
                    end;
                end;
            Database::"Recruitment Requisition Header":
                begin
                    RecordRef.SetTable(RecruitmentRequisitionHeader);
                    case RecruitmentRequisitionHeader."Document Type" of
                        RecruitmentRequisitionHeader."Document Type"::"Recruitment Requisition":
                            exit(Page::"Recruitment Requisition");
                    end;

                end;
            Database::"Staff Exit Clearance Header":
                begin
                    RecordRef.SetTable(ExitClearanceHeader);
                    exit(Page::"Staff Exit Clearance Header")
                end;
            Database::"Job Applications":
                begin
                    RecordRef.SetTable(JobApplications);
                    exit(Page::"All Job Applications")
                end;
            Database::"Transport Requisition":
                begin
                    RecordRef.SetTable(TransportRequisition);
                    exit(Page::"Pending Requisition Card")
                end;
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecordRef.SetTable(FuelMaintenanceRequisition);
                    case FuelMaintenanceRequisition.Type of
                        FuelMaintenanceRequisition.Type::Maintenance:
                            exit(page::"Maintenance Request");
                        FuelMaintenanceRequisition.Type::Fuel:
                            exit(page::"Fuel Requisition Card")
                    end;
                end;
            Database::"Perfomance Evaluation":
                begin
                    RecordRef.SetTable(PEval);
                    case PEval."Evaluation Type" of
                        PEval."Evaluation Type"::"Standard Appraisal/Supervisor Score Only":
                            exit(page::"Standard Perform Appraisal");
                        PEval."Evaluation Type"::"Self-Appraisal with Supervisor Score":
                            exit(page::"Self-Supervisor Appraisal");
                        PEval."Evaluation Type"::"360-Degree/Group Appraisal":
                            exit(page::"Group Appraisal");
                    end;
                end;
            Database::"Store Returns Header":
                begin
                    RecordRef.SetTable(StoreReturnsHeader);
                    exit(Page::"Store Returns Card")
                end;
        end;
    end;

    local procedure GetStandardPurchaseCodePageID(RecRef: RecordRef): Integer
    var
        Payment: Record "Standard Purchase Code";
    begin
        RecRef.SetTable(Payment);
        case Payment."Procurement Method" of
            Payment."Procurement Method"::RFQ:
                exit(Page::"Request For Quotation (RFQ)");
            Payment."Procurement Method"::RFP:
                exit(Page::"Request For Proposal Card");
        end;
    end;

}
