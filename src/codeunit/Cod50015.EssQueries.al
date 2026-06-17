#pragma warning disable AL0198
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
codeunit 50015 "EssQueries"
{
    trigger OnRun()


    begin


    end;

    var
        //  tbl_HrPortalUsers: Record HRPortalUsers;
        tbl_employee: Record Employee;
        tbl_IctHelpDesk: Record "ICT Helpdesk";
        tbl_performanceManagementPlan: Record "Performance Management Plan";
        tbl_annualStrategyWorkPlan: Record "Annual Strategy Workplan";
        tbl_strategyWorkPlanLines: Record "Strategy Workplan Lines";
        tbl_imprestMemo: Record "Imprest Memo";
        tbl_PCObjective: Record "PC Objective";
        tbl_secondaryPCObjective: Record "Secondary PC Objective";
        tbl_PCJobDescription: Record "PC Job Description";
        tbl_hrLeaveApplications: Record "HR Leave Applications";
        tbl_performanceDiaryLog: Record "Performance Diary Log";
        tbl_plogLines: Record "Plog Lines";
        tbl_payments: Record payments;
        tbl_performanceAppraisal: Record "Perfomance Evaluation";

        tbl_performanceContractHeader: Record "Perfomance Contract Header";
        tbl_fuelAndMaintainanceRequisition: Record "Fuel & Maintenance Requisition";
        tbl_portalApprovalEntry: Record "PortalApproval Entry";
        tbl_corporateStrategicPlans: Record "Corporate Strategic Plans";
        tbl_strategyCoreValue: Record "Strategy Core Value";
        tbl_strategicTheme: Record "Strategic Theme";
        tbl_strategicObjective: Record "Strategic Objective";
        tbl_strategy: Record Strategy;
        tbl_strategicInitiative: Record "Strategic Initiative";
        tbl_cspPlannedYears: Record "CSP Planned Years";
        tbl_employeeRequisition: Record "Employee Requisitions";
        tbl_performanceEvalutionDetails: Record "Perfomance Evaluation";
        tbl_purchaseLine: Record "Purchase Line";
        tbl_pvLines: Record "PV Lines";
        PettySurrender: Record "Petty Cash Lines";
        tbl_subPCObjective: Record "Sub PC Objective";
        tbl_transportRequisition: Record "Transport Requisition";
        tbl_vehicleDriverAllocation: Record "Vehicle Driver Allocation";
        tbl_approvalCommentLine: Record "Approval Comment Line";
        tbl_approvalEntry: Record "Approval Entry";
        tbl_objectiveEvaluationResult: Record "Objective Evaluation Result";
        tbl_proficiencyEvaluationResult: Record "Proficiency Evaluation Result";
        tbl_evaluationTrainingNeeds: Record "Evaluation Training needs";
        tbl_subPlogLines: Record "Sub Plog Lines";
        tbl_purchaseHeader: Record "Purchase Header";
        tbl_evaluationPip: Record "Evaluation PIP";
        tbl_imprestLines: Record "Imprest Lines";
        tbl_performancePlanTask: Record "Performance Plan Task";
        tbl_brSurveySection: Record "BR Survey Section";
        tbl_brResponseQuestion: Record "BR Response Question";
        tbl_brResponse: Record "Business Research Response";
        tbl_brResponseSection: Record "BR Response Section";
        tbl_travelStaffRequisition: Record "Travel Requisition Staff";
        tbl_travelNonStaffRequisition: Record "Travel Requisition Non Staff";
        tbl_hrJobApplications: Record "HR Job Applications";
        tbl_ictIssueCategory: Record "ICT Helpdesk Category";
        tbl_resource: Record Resource;
        tbl_payslip: Record "Payroll PeriodX";
        tbl_leaveTypes: Record "HR Leave Types";
        tbl_job: Record Job;
        tbl_responsibilityCenter: Record "Responsibility Center";
        tbl_fleetVehicles: Record "Fleet Vehicles.";
        tbl_serviceItems: Record "Service Items";
        tbl_jobtask: Record "Job Task";
        tbl_fundcode: Record "Fund Code";
        tbl_fndSource: Record "Funding Source";
        tbl_business_posting: Record "Gen. Business Posting Group";
        tbl_workTypes: Record "Work Type";
        tbl_receiptsTypes: Record "Receipts and Payment Types1";
        tbl_budget: Record "Budget Commitment";
        tbl_procurementSetup: Record "Procurement Setup";
        tbl_procurementPlan: Record "Procurement Plan";
        tbl_unitOfMeasure: Record "Unit of Measure";
        tbl_procurementPlanEntry: Record "Procurement Plan Entry";
        tbl_trainingVendor: Record Vendor;
        tbl_items: Record Item;
        tbl_projectMembers: Record "Project Members";
        tbl_casualMembers: Record Casuals;
        tbl_otherCosts: Record "Other Costs";
        tbl_userSetup: Record "User Setup";
        tbl_dimensionsValue: Record "Dimension Value";
        hrLeaveLedgerEntry: Record "HR Leave Ledger Entries";
        tbl_receiptsHeader: Record "Receipts Header1";
        tbl_itemLedgerEntry: Record "Item Ledger Entry";
        tbl_procurementPlanLines: Record "Procurement Plan Lines";
        tbl_generalCorrespondenceLines: Record "General Correspondence Line";
        tbl_generalCorrespondenceApproval: Record "General Correspond Approval";
        tbl_generalCorrespondenceHeader: Record "General Correspondence Header";
        CorrespondenceContact: Record "Correspondence Contact";
        tbl_location: Record Location;
        fixedAsset: Record "Fixed Asset";



    procedure fnGetEmployeeDetail(empNumber: Code[30]) data: Text
    begin
        tbl_employee.Reset();
        tbl_employee.SetRange("No.", empNumber);
        if tbl_employee.FindSet(true) then begin
            data := data + tbl_employee."E-Mail" + '*' + tbl_employee."Phone No." + '*' + Format(tbl_employee."Leave Outstanding Bal") + '*' + tbl_employee."ID Number" + '*' + Format(tbl_employee."Study Leave Acc") + '*' + Format(tbl_employee."Sick Leave Acc.") + '*' + Format(tbl_employee."Paternity Leave Acc.") + '*' + Format(tbl_employee."Maternity Leave Acc.") + '*' + Format(tbl_employee."Compassionate Leave Acc.") + '*' + Format(tbl_employee."Annual Leave Account") + '*' + Format(tbl_employee."Allocated Leave Days") + '*' + Format(tbl_employee."Reimbursed Leave Days") + '*' + Format(tbl_employee."Total (Leave Days)") + '*' + Format(tbl_employee."Department Code") + '*' + Format(tbl_employee.Division) + '*' + Format(tbl_employee."Job Title") + ':';
        end;
        Exit(data);
    end;

    procedure fnGetEmployeesDetails() data: Text
    begin
        tbl_employee.Reset();
        if tbl_employee.FindSet() then begin
            repeat
                data := data + tbl_employee."No." + '*' + tbl_employee."First Name" + tbl_employee."Last Name" + '::::';
            until tbl_employee.Next() = 0;

        end;
        Exit(data);
    end;

    procedure fnGetUserDetails(username: Text) data: Text
    var
        loginId: Text;
    begin
        loginId := username;
        tbl_userSetup.Reset();
        tbl_userSetup.SetRange("User ID", loginId);
        if tbl_userSetup.findset(true) then begin
            data += 'success*' + tbl_userSetup."Employee No.";
        end else begin
            data += 'danger*Sorry, we could not proceed. Request the system administrator to set you up in the user setup...';

        end;
        exit(data);
    end;

    procedure fnGetUsers() data: Text
    begin
        tbl_userSetup.Reset();
        if tbl_userSetup.findset() then begin
            repeat
                data += Format(tbl_userSetup."User ID") + '*' + tbl_userSetup."Employee No." + '::::';
            until tbl_userSetup.Next() = 0;
        end;
        exit(data);
    end;

    procedure fnGetGeneralCorrespondenceLinesRecipient(docNo: code[100]) data: Text
    begin
        tbl_generalCorrespondenceLines.Reset();
        tbl_generalCorrespondenceLines.SetRange("Document No", docNo);
        tbl_generalCorrespondenceLines.SetRange("Notification Type", tbl_generalCorrespondenceLines."Notification Type"::Receipient);
        if tbl_generalCorrespondenceLines.findset() then begin
            repeat
                data += Format(tbl_generalCorrespondenceLines."Entry No") + '*' +
                Format(tbl_generalCorrespondenceLines."Notification Type") + '*' +
                Format(tbl_generalCorrespondenceLines."Recipient Type") + '*' +
                Format(tbl_generalCorrespondenceLines."Recipient Name") + '*' +
                Format(tbl_generalCorrespondenceLines.Position) + '::::';
            until tbl_generalCorrespondenceLines.Next() = 0;
        end;
        exit(data);
    end;

    procedure fnGetGeneralCorrespondenceLinesCC(docNo: code[100]) data: Text
    begin
        tbl_generalCorrespondenceLines.Reset();
        tbl_generalCorrespondenceLines.SetRange("Document No", docNo);
        tbl_generalCorrespondenceLines.SetRange("Notification Type", tbl_generalCorrespondenceLines."Notification Type"::CC);
        if tbl_generalCorrespondenceLines.findset() then begin
            repeat
                data += Format(tbl_generalCorrespondenceLines."Entry No") + '*' +
                Format(tbl_generalCorrespondenceLines."Notification Type") + '*' +
                Format(tbl_generalCorrespondenceLines."Recipient Type") + '*' +
                Format(tbl_generalCorrespondenceLines."Recipient Name") + '*' +
                Format(tbl_generalCorrespondenceLines.Position) + '::::';
            until tbl_generalCorrespondenceLines.Next() = 0;

        end;
        exit(data);
    end;

    procedure fnGetGeneralCorrespondenceApprovals(docNo: code[100]) data: Text
    begin
        tbl_generalCorrespondenceApproval.Reset();
        tbl_generalCorrespondenceApproval.SetRange("Document No", docNo);
        if tbl_generalCorrespondenceApproval.findset() then begin
            repeat
                data += Format(tbl_generalCorrespondenceApproval."User ID") + '*' + Format(tbl_generalCorrespondenceApproval."Employee Name") + '*' + Format(tbl_generalCorrespondenceApproval.Sequence) + '*' + Format(tbl_generalCorrespondenceApproval."Employee No") + '::::';
            until tbl_generalCorrespondenceApproval.Next() = 0;
        end;
        exit(data);
    end;

    procedure fnGetGeneralCorrespondenceHeader(empNo: code[100]) data: Text
    begin
        tbl_generalCorrespondenceHeader.Reset();
        tbl_generalCorrespondenceHeader.SetRange("Sender No", empNo);
        if tbl_generalCorrespondenceHeader.findset() then begin
            repeat
                data += Format(tbl_generalCorrespondenceHeader."Document No") + '*' + Format(tbl_generalCorrespondenceHeader."Communication Subject") + '*' + Format(tbl_generalCorrespondenceHeader.Status) + '*' + Format(tbl_generalCorrespondenceHeader."Rejection Comments") + '*' + Format(tbl_generalCorrespondenceHeader.Type) + '::::';
            until tbl_generalCorrespondenceHeader.Next() = 0;
        end;
        exit(data);
    end;

    procedure fnGetGeneralCorrespondenceHeaderIndividual(docNo: code[100]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("No.", docNo);
        if tbl_payments.findset() then begin
            repeat
                data += Format(tbl_payments."No.") + '*' + Format(tbl_generalCorrespondenceHeader."Communication Subject") + '*' + Format(tbl_generalCorrespondenceHeader.Status) + '*' + Format(tbl_generalCorrespondenceHeader.Type) + '::::';
            until tbl_payments.Next() = 0;
        end;
        exit(data);
    end;

    procedure fnGetSalaryAdvanceApplication(empNo: code[100]) data: Text
    var
        Payments: Record payments;
    begin
        Payments.Reset();
        Payments.SetRange("Account No.", empNo);
        if Payments.findset() then begin
            repeat
                data += Format(Payments."No.") + '*' + Format(Payments."Salary Advance") + '*' + Format(Payments."No of months deducted") + '*' + Format(Payments."Monthly Installment") + '*' + Format(Payments.Status) + '*' + Format(Payments.Purpose) + '::::';
            until Payments.Next() = 0;
        end;
        exit(data);
    end;

    procedure fngetgeneralcorespondencedetails(docNo: Code[100]) data: Text
    var
        General: Record "General Correspondence Header";
    begin
        General.Reset();
        General.SetRange("Document No", docNo);
        if General.FindSet(true) then begin
            data += Format(General.Type) + '*' + General."Communication Content" + '*' + General."Communication Subject" + '*' + General."Communication Content2" + '*' + General."Communication Content3" + '::::';
        end;
        exit(data);
    end;

    procedure fnGetSalaryAdvanceApplicationIndividual(docNo: code[100]) data: Text
    var
        Payments: Record payments;
    begin
        Payments.Reset();
        Payments.SetRange("No.", docNo);
        if Payments.findset() then begin
            repeat
                data += Format(Payments."No.") + '*' + Format(Payments."Salary Advance") + '*' + Format(Payments."No of months deducted") + '*' + Format(Payments."Monthly Installment") + '*' + Format(Payments.Status) + '*' + Format(Payments.Purpose) + '*' + Format(Payments."Salary Advance Memo No") + '*' + Format(Payments."Recovery Start Month") + '*' + Format(Payments."Pay Mode") + '::::';
            until Payments.Next() = 0;
        end;
        exit(data);
    end;

    procedure PayrollPeriods() data: Text
    var
        PayPeriods: Record "Payroll PeriodX";
    begin
        PayPeriods.Reset();
        if PayPeriods.findset() then begin
            repeat
                data += Format(PayPeriods."Starting Date") + '*' + Format(PayPeriods.Name) + '*' + Format(PayPeriods."Pay Date") + '::::';
            until PayPeriods.Next() = 0;
        end;
        exit(data);
    end;

    procedure PayModes() data: Text
    var
        PayModes: Record "Pay Mode";
    begin
        PayModes.Reset();
        if PayModes.findset() then begin
            repeat
                data += Format(PayModes.Code) + '*' + Format(PayModes.Description) + '::::';
            until PayModes.Next() = 0;
        end;
        exit(data);
    end;

    procedure loginUser(empNumber: Code[30]) data: Text
    begin
        tbl_employee.reset();

        tbl_employee.SetRange("No.", empNumber);
        if tbl_employee.FindSet(true) then begin
            data := 'success* ' + tbl_employee.FullName + '*' + tbl_employee."Global Dimension 1 Code" + '*' + tbl_employee."ID Number" + '*' + tbl_employee."Directorate Code" + '*' + tbl_employee."Department Code" + '*' + tbl_employee.Division + '*' + Format(tbl_employee."ICT Help Desk Admin") + '*' + Format(tbl_employee.Gender) + '*' + tbl_employee."No." + '*' + tbl_employee."Global Dimension 2 Code" + '*' + FORMAT(tbl_employee."HOD") + '*' + tbl_employee."User ID";
        end;
        exit(data);
    end;

    procedure fnGetMyHeldeskRequests(empNumber: Code[20]) data: Text
    begin
        tbl_IctHelpDesk.Reset();
        tbl_IctHelpDesk.SetRange("Employee No", empNumber);
        IF tbl_IctHelpDesk.FindSet(true) then begin
            repeat
                data := data + tbl_IctHelpDesk."Job No." + '*' + tbl_IctHelpDesk."Employee No" + '*' + tbl_IctHelpDesk."Description of the issue" + '*' + Format(tbl_IctHelpDesk."Request Date") + '*' + Format(tbl_IctHelpDesk."Request Time") + '*' + tbl_IctHelpDesk."Escalated To" + '*' + Format(tbl_IctHelpDesk.Status) + '*' + tbl_IctHelpDesk."Assigned To" + '*' + tbl_IctHelpDesk."Action Taken" + '*' + tbl_IctHelpDesk."ICT Issue Category" + '::::';
            until tbl_IctHelpDesk.NEXT = 0;
        end;
        EXIT(data);

    end;

    procedure fnGetPerformanceManagementPlan() data: Text
    begin
        tbl_performanceManagementPlan.Reset();
        tbl_performanceManagementPlan.SetRange("Evaluation Type", tbl_performanceManagementPlan."Evaluation Type"::"Standard Appraisal/Supervisor Score Only");
        If tbl_performanceManagementPlan.FindSet(true) then begin
            repeat
                data := data + tbl_performanceManagementPlan."Executive Summary" + '*' + Format(tbl_performanceManagementPlan."Start Date") + '*' + Format(tbl_performanceManagementPlan."End Date") + '*' + Format(tbl_performanceManagementPlan."Evaluation Type") + '*' + tbl_performanceManagementPlan.Description + '*' + tbl_performanceManagementPlan.No + '::::';

            until tbl_performanceManagementPlan.Next = 0;
        end;

        EXIT(data);
    end;

    procedure fnGetAnnualStrategyWorkplan() data: Text
    begin
        tbl_annualStrategyWorkPlan.Reset();
        tbl_annualStrategyWorkPlan.SetRange(tbl_annualStrategyWorkPlan."Current AWP", true);
        tbl_annualStrategyWorkPlan.SetRange(tbl_annualStrategyWorkPlan."Approval Status", tbl_annualStrategyWorkPlan."Approval Status"::Released);
        If tbl_annualStrategyWorkPlan.FindSet(true) then begin
            repeat
                data := data + tbl_annualStrategyWorkPlan.Description + '*' + tbl_annualStrategyWorkPlan.No + '*' + tbl_annualStrategyWorkPlan."Year Reporting Code" + '*' + format(tbl_annualStrategyWorkPlan."Start Date") + '*' + Format(tbl_annualStrategyWorkPlan."End Date") + '*' + Format(tbl_annualStrategyWorkPlan."Current AWP") + '*' + Format(tbl_annualStrategyWorkPlan."Approval Status") + '::::';
            until tbl_annualStrategyWorkPlan.Next = 0;
        end;
        EXIT(data);
    end;


    procedure fnGetStrategyWorkPlanLines(planNumber: Code[50]; crossCuttingStatus: Boolean) data: Text
    begin
        tbl_strategyWorkPlanLines.Reset();
        tbl_strategyWorkPlanLines.SetRange(No, planNumber);
        // tbl_strategyWorkPlanLines.SetRange(); --> Filter by Cross Cutting
        if tbl_strategyWorkPlanLines.FindSet(true) then begin
            repeat
                data := data + tbl_strategyWorkPlanLines."Activity ID" + '*' + tbl_strategyWorkPlanLines.Description + '*' + tbl_strategyWorkPlanLines."Key Performance Indicator" + '*' + tbl_strategyWorkPlanLines."Unit of Measure" + '*' + tbl_strategyWorkPlanLines."Primary Directorate Name" + '*' + tbl_strategyWorkPlanLines."Primary Department Name" + '::::';
            until tbl_strategyWorkPlanLines.Next = 0;
        end;
        EXIT(data);
    end;


    procedure fnGetImprestMemoForFleet(employeeNumber: Code[50]) data: Text
    var
        projectmember: Record "Project Members";
    begin
        projectmember.Reset();
        projectmember.SetRange("No.", employeeNumber);
        projectmember.SetRange(Status, projectmember.Status::Released);
        if projectmember.FindSet(true) Then begin
            repeat
                data += projectmember."Imprest Memo No." + '*' + format(projectmember."Return Date") + '*' + projectmember.Name + '::::';
            until projectmember.Next = 0;
        end;
        EXIT(data);
    end;

    // procedure fnGetUserDetailsByEmail(email: Text) data: Text
    // var
    //     loginId: Text;
    // begin
    //     tbl_Employee.Reset();
    //     // tbl_userSetup.Reset();
    //     tbl_Employee.SetRange("Company E-Mail", email);
    //     // tbl_Employee.SetRange("Blocked from ESS", false);
    //     if tbl_Employee.FindFirst() then begin
    //         data += 'success*' + tbl_Employee."No.";
    //     end else begin
    //         data += 'danger*Sorry, we could not proceed. Request the system administrator to set you up in the user setup...';
    //     end;
    //     exit(data);
    // end;
    procedure fnGetUserDetailsByEmail(email: Text) data: Text
    var
        loginId: Text;
    begin

        tbl_userSetup.Reset();
        tbl_userSetup.SetRange("E-Mail", email);
        tbl_userSetup.SetRange("Blocked from ESS", false);
        if tbl_userSetup.FindFirst() then begin
            data += 'success*' + tbl_userSetup."Employee No.";
        end else begin
            data += 'danger*Sorry, we could not proceed. Request the system administrator to set you up in the user setup...';
        end;
        exit(data);
    end;

    procedure fnGetSalaryVoucher(docNo: code[50]) data: Text
    var

        salaryvoucher: Record "Payroll Header";
    begin

        salaryvoucher.Reset();
        salaryvoucher.SetRange("No.", docNo);

        if salaryvoucher.FindFirst() then begin
            salaryvoucher.CalcFields("Gross Pay", "Net Pay", "Total Deductions");

            data += salaryvoucher."No." + '*' + Format(salaryvoucher."Document Date") + '*' + Format(salaryvoucher."Payroll Period")
             + '*' + Format(salaryvoucher."Global Dimension 2 Code") + '*' + Format(salaryvoucher."Gross Pay") + '*' + Format(salaryvoucher."Net Pay")
             + '*' + Format(salaryvoucher."Total Deductions") + '::::';
        end;
        exit(data);
    end;

    procedure fngetportalusers(usernam: Text; pass: Text) status: Text
    Var
        hrportal: Record HRPortalUsers;
    begin
        if (usernam = '') or (pass = '') then
            status := 'error*Username and Password cannot be empty.';
        hrportal.Reset();
        hrportal.SetRange(employeeNo, usernam);
        hrportal.SetRange(Password, pass);
        if hrportal.FindFirst() then begin
            status := 'success*Successfully Authenticated*' + Format(hrportal.changedPassword);
        end else begin
            status := 'danger*Invalid Credentials.Kindly Ensure that the Password is Correct';
        end;

    end;

    procedure fnGetImprestMemo(employeeNumber: Code[50]; status: Boolean) data: Text
    begin
        tbl_imprestMemo.Reset();
        tbl_imprestMemo.SetRange(Requestor, employeeNumber);
        // tbl_imprestMemo.SetRange(Status, tbl_imprestMemo.Status::Released);
        // tbl_imprestMemo.SetRange(Posted, true);
        if tbl_imprestMemo.FindSet(true) Then begin
            repeat
                data += tbl_imprestMemo."No." + '*' + format(tbl_imprestMemo.Date) + '*' + tbl_imprestMemo.Subject + '*' + format(tbl_imprestMemo."Total Subsistence Allowance") + '*' + Format(tbl_imprestMemo.Status) + '*' + Format(tbl_imprestMemo."Total Subsistence Allowance") + '*' + Format(tbl_imprestMemo."Imprest Naration") + '*' + Format(tbl_imprestMemo."Start Date") + '*' + Format(tbl_imprestMemo."No. of days") + '*' + Format(tbl_imprestMemo.Job) + '*' + Format(tbl_imprestMemo."Job  Task") + '*' + Format(tbl_imprestMemo."Shortcut Dimension 2 Code") + '::::';
            until tbl_imprestMemo.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetImprestMemo1(appNo: Code[50]) data: Text
    begin
        tbl_imprestMemo.Reset();
        tbl_imprestMemo.SetRange("No.", appNo);
        // tbl_imprestMemo.SetRange(Status, tbl_imprestMemo.Status::Released);
        // tbl_imprestMemo.SetRange(Posted, true);
        if tbl_imprestMemo.FindFirst() Then begin

            data += tbl_imprestMemo."No." + '*' + format(tbl_imprestMemo.Date) + '*' + tbl_imprestMemo.Subject + '*' + format(tbl_imprestMemo."Total Subsistence Allowance") + '*' + Format(tbl_imprestMemo.Status) + '*' + Format(tbl_imprestMemo."Total Subsistence Allowance") + '*' + Format(tbl_imprestMemo."Imprest Naration") + '*' + Format(tbl_imprestMemo."Start Date") + '*' + Format(tbl_imprestMemo."No. of days") + '*' + Format(tbl_imprestMemo.Job) + '*' + Format(tbl_imprestMemo."Job  Task") + '*' + Format(tbl_imprestMemo."Shortcut Dimension 2 Code") + '::::';

        end;
        EXIT(data);
    end;

    procedure fnGetPCObjective(PCNumber: Code[30]) data: Text
    begin
        tbl_PCObjective.Reset();
        tbl_PCObjective.SetRange("Workplan No.", PCNumber);
        if tbl_PCObjective.Findset(true) Then begin
            repeat
                data := data + tbl_PCObjective."Objective/Initiative" + '*' + format(tbl_PCObjective."Start Date") + '*' + format(tbl_PCObjective."Due Date") + '*' + format(tbl_PCObjective."Imported Annual Target Qty") + '*' + format(tbl_PCObjective."Assigned Weight (%)") + '*' + tbl_PCObjective."Additional Comments" + '*' + Format(tbl_PCObjective."Initiative Type") + '*' + Format(tbl_PCObjective."Unit of Measure") + '*' + Format(tbl_PCObjective."Strategy Plan ID") + '*' + Format(tbl_PCObjective."Year Reporting Code") + '*' + Format(tbl_PCObjective.EntryNo) + '*' + tbl_PCObjective."Outcome Perfomance Indicator" + '*' + Format(tbl_PCObjective."Desired Perfomance Direction") + '*' + Format(tbl_PCObjective."Previous Annual Target Qty") + '*' + tbl_PCObjective."Initiative No." + '::::';
            until tbl_PCObjective.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetSecondaryPCObjective(PCNumber: Code[30]) data: Text
    begin
        tbl_secondaryPCObjective.Reset();
        tbl_secondaryPCObjective.SetRange("Workplan No.", PCNumber);
        if tbl_secondaryPCObjective.FindSet(true) then begin
            repeat
                data := data + tbl_secondaryPCObjective."Objective/Initiative" + '*' + format(tbl_secondaryPCObjective."Start Date") + '*' + format(tbl_secondaryPCObjective."Due Date") + '*' + format(tbl_secondaryPCObjective."Imported Annual Target Qty") + '*' + format(tbl_secondaryPCObjective."Assigned Weight (%)") + '*' + tbl_secondaryPCObjective.Comments + ':';
            until tbl_secondaryPCObjective.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetPCJobDescription(PCNumber: Code[30]) data: Text
    begin
        tbl_PCJobDescription.Reset();
        tbl_PCJobDescription.SetRange("Workplan No.", PCNumber);
        if tbl_PCJobDescription.FindSet(true) then begin
            repeat
                data := data + tbl_PCJobDescription.Description + '*' + Format(tbl_PCJobDescription."Imported Annual Target Qty") + '*' + format(tbl_PCJobDescription."Assigned Weight (%)") + ':';
            until tbl_PCJobDescription.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetHrLeaveApplications(employeeNumber: Code[30]) data: Text
    begin
        tbl_hrLeaveApplications.Reset();
        tbl_hrLeaveApplications.SetRange("Employee No", employeeNumber);
        //tbl_hrLeaveApplications.SetRange(Status, tbl_hrLeaveApplications.Status::Released);
        if tbl_hrLeaveApplications.FindSet(true) then begin
            repeat
                data += Format(tbl_hrLeaveApplications."Application Code") + '*' + tbl_hrLeaveApplications."Leave Type" + '*' + format(tbl_hrLeaveApplications."Days Applied") + '*' + format(tbl_hrLeaveApplications."Start Date") + '*' + format(tbl_hrLeaveApplications."Return Date") + '*' + Format(tbl_hrLeaveApplications.Status) + '*' + Format(tbl_hrLeaveApplications.Posted) + '*' + Format(tbl_hrLeaveApplications."Date of Exam") + '*' + Format(tbl_hrLeaveApplications."Details of Examination") + '*' + Format(tbl_hrLeaveApplications."E-mail Address") + '*' + Format(tbl_hrLeaveApplications."Cell Phone Number") + '*' + Format(tbl_hrLeaveApplications."Annual Leave Type") + '*' + Format(tbl_hrLeaveApplications.Reliever) + '*' + Format(tbl_hrLeaveApplications.Resumed) + '::::';
            until tbl_hrLeaveApplications.Next = 0;
        end;
        EXIT(data);
    end;

    // procedure fnGetLeaveApplicationsDetails1(leaveNo: Code[20]) data: Text
    // begin
    //     tbl_hrLeaveApplications.Reset();
    //     //tbl_hrLeaveApplications.SetRange("Employee No", employeeNumber);
    //     tbl_hrLeaveApplications.SetRange("Application Code", leaveNo);
    //     if tbl_hrLeaveApplications.FindSet(true) then begin

    //         data := Format(tbl_hrLeaveApplications."Application Code") + '*' + tbl_hrLeaveApplications."Leave Type" + '*' + format(tbl_hrLeaveApplications."Days Applied") + '*' + format(tbl_hrLeaveApplications."Start Date") + '*' + format(tbl_hrLeaveApplications."Return Date") + '*' + Format(tbl_hrLeaveApplications.Status) + '*' + Format(tbl_hrLeaveApplications.Posted) + '*' + Format(tbl_hrLeaveApplications."Date of Exam") + '*' + Format(tbl_hrLeaveApplications."Details of Examination") + '*' + Format(tbl_hrLeaveApplications."E-mail Address") + '*' + Format(tbl_hrLeaveApplications."Cell Phone Number") + '*' + Format(tbl_hrLeaveApplications."Annual Leave Type") + '*' + Format(tbl_hrLeaveApplications.Reliever);
    //     end;
    //     EXIT(data);

    // end;

    procedure fnGetLeaveApplicationsDetails(employeeNumber: Code[30]; leaveNo: Code[20]) data: Text

    begin

        tbl_hrLeaveApplications.Reset();

        tbl_hrLeaveApplications.SetRange("Employee No", employeeNumber);

        tbl_hrLeaveApplications.SetRange("Application Code", leaveNo);

        if tbl_hrLeaveApplications.FindSet(true) then begin

            data := Format(tbl_hrLeaveApplications."Application Code") + '*' + tbl_hrLeaveApplications."Leave Type" + '*' + format(tbl_hrLeaveApplications."Days Applied") + '*' + format(tbl_hrLeaveApplications."Start Date") + '*' + format(tbl_hrLeaveApplications."Return Date") + '*' + Format(tbl_hrLeaveApplications.Status) + '*' + Format(tbl_hrLeaveApplications.Posted) + '*' + Format(tbl_hrLeaveApplications."Date of Exam") + '*' + Format(tbl_hrLeaveApplications."Details of Examination") + '*' + Format(tbl_hrLeaveApplications."E-mail Address") + '*' + Format(tbl_hrLeaveApplications."Cell Phone Number") + '*' + Format(tbl_hrLeaveApplications."Annual Leave Type") + '*' + Format(tbl_hrLeaveApplications.Reliever);

        end;

        EXIT(data);

    end;

    procedure fnGetLeaveApplicationsDetails1(leaveNo: Code[20]) data: Text
    var
        name: Text;
        empNo: Code[50];
    begin

        tbl_hrLeaveApplications.Reset();
        tbl_hrLeaveApplications.SetRange("Application Code", leaveNo);
        if tbl_hrLeaveApplications.FindSet(true) then begin
            empNo := tbl_hrLeaveApplications."Employee No";
            if tbl_employee.Get(empNo) then
                name := tbl_employee."First Name" + ' ' + tbl_employee."Last Name";
            data := Format(tbl_hrLeaveApplications."Application Code") + '*' + tbl_hrLeaveApplications."Leave Type" + '*' + format(tbl_hrLeaveApplications."Days Applied") + '*'
            + format(tbl_hrLeaveApplications."Start Date") + '*' + format(tbl_hrLeaveApplications."Return Date") + '*' + Format(tbl_hrLeaveApplications.Status) + '*' +
            Format(tbl_hrLeaveApplications.Posted) + '*' + Format(tbl_hrLeaveApplications."Date of Exam") + '*' + Format(tbl_hrLeaveApplications."Details of Examination") + '*' +
            Format(tbl_hrLeaveApplications."E-mail Address") + '*' + Format(tbl_hrLeaveApplications."Cell Phone Number") + '*' + Format(tbl_hrLeaveApplications."Annual Leave Type") + '*' +
            Format(tbl_hrLeaveApplications.Reliever) + '*' + tbl_hrLeaveApplications."Employee No" + '*'
            + tbl_hrLeaveApplications."Reliever Name" + '*' + name;
        end;
        EXIT(data);

    end;

    procedure fnGetOnePerformanceLog(logNumber: Code[20]) data: Text
    begin
        tbl_performanceDiaryLog.Reset();
        tbl_performanceDiaryLog.SetRange(No, logNumber);
        if tbl_performanceDiaryLog.FindSet(true) then begin
            data := Format(tbl_performanceDiaryLog."Activity Start Date") + '*' + Format(tbl_performanceDiaryLog."Activity End Date") + '*' + tbl_performanceDiaryLog."AWP ID" + '*' + tbl_performanceDiaryLog."CSP ID" + '*' + tbl_performanceDiaryLog.Description + '*' + Format(tbl_performanceDiaryLog."Year Reporting Code");
        end;
        exit(data);

    end;

    procedure fnGetPerformanceDiaryLog(employeeNumber: Code[30]; plogType: Text; approvalStatus: Text) data: Text
    begin
        tbl_performanceDiaryLog.Reset();
        tbl_performanceDiaryLog.SetRange("Employee No.", employeeNumber);

        if approvalStatus = 'Released' then begin
            tbl_performanceDiaryLog.SetRange(Posted, true);
            tbl_performanceDiaryLog.SetRange("Approval Status", tbl_performanceDiaryLog."Approval Status"::Released);

            if tbl_performanceDiaryLog.FindSet(true) then begin
                repeat
                    data += tbl_performanceDiaryLog.No + '*' +                              // arr[0]
                            tbl_performanceDiaryLog.Description + '*' +                      // arr[1]
                            tbl_performanceDiaryLog."Personal Scorecard ID" + '*' +         // arr[2]
                            format(tbl_performanceDiaryLog."Activity Start Date") + '*' +   // arr[3]
                            format(tbl_performanceDiaryLog."Activity End Date") + '*' +     // arr[4]
                            Format(tbl_performanceDiaryLog."AWP ID") + '*' +                // arr[5]
                            Format(tbl_performanceDiaryLog."CEO PC ID") + '*' +             // arr[6] - CSP (CEO PC ID field 22)
                            Format(tbl_performanceDiaryLog."Year Reporting Code") + '::::'; // arr[7] - Year Code (field 29)
                until tbl_performanceDiaryLog.Next = 0;
            end;
            EXIT(data);

        end else begin
            tbl_performanceDiaryLog.SetRange(Posted, false);

            if tbl_performanceDiaryLog.FindSet(true) then begin
                repeat
                    data += tbl_performanceDiaryLog.No + '*' +                              // arr[0]
                            tbl_performanceDiaryLog.Description + '*' +                      // arr[1]
                            tbl_performanceDiaryLog."Personal Scorecard ID" + '*' +         // arr[2]
                            format(tbl_performanceDiaryLog."Activity Start Date") + '*' +   // arr[3]
                            format(tbl_performanceDiaryLog."Activity End Date") + '*' +     // arr[4]
                            Format(tbl_performanceDiaryLog."Approval Status") + '*' +       // arr[5]
                            Format(tbl_performanceDiaryLog."CEO PC ID") + '*' +             // arr[6] - CSP (CEO PC ID field 22)
                            Format(tbl_performanceDiaryLog."Year Reporting Code") + '::::'; // arr[7] - Year Code (field 29)
                until tbl_performanceDiaryLog.Next = 0;
            end;
            EXIT(data);
        end;
    end;

    // procedure fnGetPlogLines(employeeNumber: Code[30]; plogNumber: Code[30]) data: Text
    // begin
    //     tbl_plogLines.Reset();
    //     tbl_plogLines.SetRange("Employee No.", employeeNumber);
    //     tbl_plogLines.SetRange("PLog No.", plogNumber);
    //     if tbl_plogLines.FindSet(true) then begin
    //         repeat
    //             data := data + tbl_plogLines."Initiative No." + '*' + format(tbl_plogLines."Achieved Date") + '*' + format(tbl_plogLines."Due Date") + '*' + format(tbl_plogLines."Target Qty") + '*' + Format(tbl_plogLines."Achieved Target") + '*' + tbl_plogLines.Comments + '*' + tbl_plogLines."PLog No." + '*' + tbl_plogLines."Personal Scorecard ID" + '*' + tbl_plogLines."Sub Intiative No" + '*' + Format(tbl_plogLines.EntryNo) + '*' + Format(tbl_plogLines."Remaining Targets") + '*' + Format(tbl_plogLines."Unit of Measure") + '*' + Format(tbl_plogLines."Activity Type") + '*' + Format(tbl_plogLines."Planned Date") + ':';
    //         until tbl_plogLines.Next = 0;
    //     end;
    //     EXIT(data);

    // end;
    // //!! When using this method. Remember to always check the documentType value passed from the portal. The indexes returned might be different!! --> Amos

    procedure fnGetPlogLines(employeeNumber: Code[30]; plogNumber: Code[30]) data: Text
    begin
        tbl_plogLines.Reset();
        tbl_plogLines.SetRange("Employee No.", employeeNumber);
        tbl_plogLines.SetRange("PLog No.", plogNumber);
        if tbl_plogLines.FindSet(true) then begin
            repeat
                data := data +
                    tbl_plogLines."Initiative No." + '*' +
                    Format(tbl_plogLines."Achieved Date") + '*' +
                    Format(tbl_plogLines."Due Date") + '*' +
                    Format(tbl_plogLines."Target Qty") + '*' +
                    Format(tbl_plogLines."Achieved Target") + '*' +
                    RemoveNewLines(tbl_plogLines.Comments) + '*' +
                    tbl_plogLines."PLog No." + '*' +
                    tbl_plogLines."Personal Scorecard ID" + '*' +
                    RemoveNewLines(tbl_plogLines."Sub Intiative No") + '*' +
                    Format(tbl_plogLines.EntryNo) + '*' +
                    Format(tbl_plogLines."Remaining Targets") + '*' +
                    RemoveNewLines(tbl_plogLines."Unit of Measure") + '*' +
                    RemoveNewLines(Format((tbl_plogLines."Activity Type"))) + '*' +
                    Format(tbl_plogLines."Planned Date") + '::::';
            until tbl_plogLines.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetPlogLines1(employeeNumber: Code[30]; plogNumber: Code[30]) data: Text
    var
        tbl_plogLines: Record "Plog Lines";
    begin
        tbl_plogLines.Reset();
        tbl_plogLines.SetRange("Employee No.", employeeNumber);
        tbl_plogLines.SetRange("PLog No.", plogNumber);

        if tbl_plogLines.FindSet(false) then begin
            repeat
                data := data +
                    tbl_plogLines."Initiative No." + '*' +
                    Format(tbl_plogLines."Achieved Date") + '*' +
                    Format(tbl_plogLines."Due Date") + '*' +
                    Format(tbl_plogLines."Target Qty") + '*' +
                    Format(tbl_plogLines."Achieved Target") + '*' +
                    RemoveNewLines(tbl_plogLines.Comments) + '*' +
                    tbl_plogLines."PLog No." + '*' +
                    tbl_plogLines."Personal Scorecard ID" + '*' +
                    RemoveNewLines(tbl_plogLines."Key Performance Indicator") + '*' +
                    Format(tbl_plogLines.EntryNo) + '*' +
                    Format(tbl_plogLines."Remaining Targets") + '*' +
                    RemoveNewLines(tbl_plogLines."Unit of Measure") + '*' +
                    RemoveNewLines(Format(tbl_plogLines."Activity Type")) + '*' +
                    Format(tbl_plogLines."Planned Date") + '*' +
                    Format(tbl_plogLines."Weight %") + '::::';
            until tbl_plogLines.Next = 0;
        end;

        exit(data);
    end;


    procedure RemoveNewLines(inputText: Text): Text
    begin
        inputText := StrSubstNo(inputText, '%1', '');
        inputText := StrSubstNo(inputText, '%2', '');
        EXIT(inputText);
    end;


    procedure fnGetPayments(salaryNumber: Code[30]; employeeNumber: Code[30]; documentType: Text; status: Text) data: Text
    var
        counter: Decimal;
    begin
        if documentType = 'Standing Imprest' then begin
            if status = 'Closed' then begin
                tbl_payments.Reset();
                tbl_payments.SetRange("Account No.", employeeNumber);
                tbl_payments.SetRange("No.", salaryNumber);
                tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Standing Imprest");
                tbl_payments.SetRange(Status, tbl_payments.Status::Closed);
                if tbl_payments.FindSet(true) then begin
                    repeat
                        data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments."Total Amount") + '*' + Format(tbl_payments.Status) + '::::';
                    until tbl_payments.Next = 0;
                end;
                EXIT(data);
            end else begin
                tbl_payments.Reset();
                tbl_payments.SetRange("Account No.", employeeNumber);
                tbl_payments.SetRange("No.", salaryNumber);
                tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Standing Imprest");
                if tbl_payments.FindSet(true) then begin
                    repeat
                        data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments."Total Amount") + '*' + Format(tbl_payments.Status) + '::::';
                    until tbl_payments.Next = 0;
                end;
                EXIT(data);
            end;

        end;
        if documentType = 'Salary Advance' then begin
            if status = 'Open' then begin
                tbl_payments.Reset();
                tbl_payments.SetRange("Account No.", employeeNumber);
                tbl_payments.SetRange("No.", salaryNumber);
                tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Salary Advance");
                tbl_payments.SetRange(Status, tbl_payments.Status::Open);
                if tbl_payments.FindSet(true) then begin
                    repeat
                        data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '::::';
                    until tbl_payments.Next = 0;
                end;
                EXIT(data);
            end;
            if status = 'Closed' then begin
                tbl_payments.Reset();
                tbl_payments.SetRange("Account No.", employeeNumber);
                tbl_payments.SetRange("No.", salaryNumber);
                tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Salary Advance");
                tbl_payments.SetRange(Status, tbl_payments.Status::Closed);
                if tbl_payments.FindSet(true) then begin
                    repeat
                        data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '::::';
                    until tbl_payments.Next = 0;
                end;
                EXIT(data);
            end;


        end;

        if documentType = 'Petty Cash' then begin
            tbl_payments.Reset();
            tbl_payments.SetRange("Account No.", employeeNumber);
            tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Petty Cash");
            tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Petty Cash");
            if tbl_payments.FindSet(true) then begin
                repeat
                    data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments.Posted) + '::::';
                until tbl_payments.Next = 0;
            end;
            exit(data);

        end;


        if documentType = 'Petty Cash Surrender' then begin
            tbl_payments.Reset();
            tbl_payments.SetRange("Account No.", employeeNumber);
            tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Petty Cash Surrender");
            tbl_payments.SetRange(Status, tbl_payments.Status::Released);
            if tbl_payments.FindSet(true) then begin
                repeat
                    data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' + tbl_payments.Job + tbl_payments."Job Task No" + '*' + Format(tbl_payments."Total Amount") + '::::';
                until tbl_payments.Next = 0;
            end;
            exit(data);

        end;
        if documentType = 'Staff Claim' then begin
            tbl_payments.Reset();
            tbl_payments.SetRange("Account No.", employeeNumber);
            tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Staff Claim");
            if tbl_payments.FindSet(true) then begin
                repeat
                    data += tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + tbl_payments."Payment Narration" + '*' + format(tbl_payments."Funding Source") + '::::';
                until tbl_payments.Next = 0;
            end;
            exit(data);

        end;
        if documentType = 'Imprest' then begin
            tbl_payments.Reset();
            tbl_payments.SetRange("Account No.", employeeNumber);
            tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::Imprest);
            tbl_payments.Setrange("Archive Document", false);
            if tbl_payments.FindSet(true) then begin
                repeat

                begin
                    counter := 0;
                    tbl_imprestLines.Reset;
                    tbl_imprestLines.SetRange("No", tbl_payments."No.");
                    if tbl_imprestLines.FindSet(True) then begin
                        repeat
                            counter := counter + (tbl_imprestLines."Daily Rate" * tbl_imprestLines."No. of Days");
                        until tbl_imprestLines.Next() = 0;
                    end;
                end;


                data += tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' + Format(tbl_payments."Imprest Amount") + '*' + tbl_payments.Payee + '*' + Format(tbl_payments.Surrendered) + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments.Reversed) + '*' + Format(tbl_payments."Archive Document") + '*' + Format(counter) + '::::';
                until tbl_payments.Next = 0;
            end;
            exit(data);

        end;
        if documentType = 'Standing Imprest Surrender' then begin
            tbl_payments.Reset();
            tbl_payments.SetRange("Account No.", employeeNumber);
            tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Standing Imprest Surrender");
            if tbl_payments.FindSet(true) then begin
                repeat
                    data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' + tbl_payments.Payee + '::::';
                until tbl_payments.Next = 0;
            end;
            exit(data);

        end;

        if documentType = 'Surrender' then begin
            tbl_payments.Reset();
            tbl_payments.SetRange("Account No.", employeeNumber);
            tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::Surrender);
            if tbl_payments.FindSet(true) then begin
                repeat
                    tbl_payments.CalcFields("Imprest Amount");
                    data += tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' +
                    Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' +
                    Format(tbl_payments."Monthly Installment") + '*' +
                    Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' +
                     Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' +
                      tbl_payments.Payee + '*' + Format(tbl_payments."Imprest Amount") + '*' +
                       Format(tbl_payments."Imprest Issue Doc. No") + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments.Purpose) + '*' + Format(tbl_payments."Imprest Amount") + '::::';
                until tbl_payments.Next = 0;
            end;
            exit(data);

        end;


    end;

    procedure fnGetImprestToSurrender(empNo: Code[20]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("Account No.", empNo);
        tbl_payments.SetRange(Status, tbl_payments.Status::Released);
        tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::Imprest);
        tbl_payments.SetRange(Posted, true);
        tbl_payments.SetRange(Surrendered, false);
        tbl_payments.SetRange(Reversed, false);
        if tbl_payments.FindSet() then begin
            repeat
                data += tbl_payments."No." + '*' + tbl_payments.Purpose + '::::';
            until tbl_payments.Next = 0;

        end;

    end;

    procedure fnGetLoansToSurrender(userid: Code[20]) data: Text
    begin
        tbl_purchaseHeader.Reset();
        tbl_purchaseHeader.SetRange("Requester ID", userid);
        tbl_purchaseHeader.SetRange(Status, tbl_payments.Status::Released);
        tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::"Loan Issue Requisition");
        tbl_purchaseHeader.SetRange("Requisition Type", tbl_purchaseHeader."Requisition Type"::Loan);
        tbl_purchaseHeader.SetRange("Fully Issued", true);
        if tbl_purchaseHeader.FindSet() then begin
            repeat
                data += tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader.Description + '::::';
            until tbl_purchaseHeader.Next = 0;

        end;

    end;

    procedure fnGetPayments(employeeNumber: Code[30]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("Account No.", employeeNumber);
        tbl_payments.SetRange(Status, tbl_payments.Status::Released);
        tbl_payments.Setrange("Payment Type", tbl_payments."Payment Type"::"Standing Imprest");

        if tbl_payments.FindSet(true) then begin
            repeat
                data := data + Format(tbl_payments.Date) + '*' + tbl_payments."Payment Narration" + '*' + Format(tbl_payments."Imprest Amount") + '::::';
            until tbl_payments.Next = 0;
        end;
        EXIT(data);

    end;

    procedure fnGetPerfomanceContractHeader(employeeNumber: Code[30]; documentType: Text; status: Text) data: Text

    begin
        if documentType = 'Individual Scorecard' then begin
            if status = 'Released' then begin
                tbl_performanceContractHeader.Reset();
                tbl_performanceContractHeader.SetRange("Responsible Employee No.", employeeNumber);
                // tbl_performanceContractHeader.SetRange("Score Card Type", tbl_performanceContractHeader."Score Card Type"::Staff);
                tbl_performanceContractHeader.SetRange("Approval Status", tbl_performanceContractHeader."Approval Status"::Released);
                // tbl_performanceContractHeader.SetRange("Document Type", tbl_performanceContractHeader."Document Type"::"Individual Scorecard");
                if tbl_performanceContractHeader.FindSet(true) then begin
                    repeat
                        data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + format(tbl_performanceContractHeader."Change Status") + '*' + format(tbl_performanceContractHeader.Status) + '*' + Format(tbl_performanceContractHeader."Approval Status") + '*' + tbl_performanceContractHeader."Employee Name" + '*' + Format(tbl_performanceContractHeader."Department/Center PC ID") + '::::';
                    until tbl_performanceContractHeader.Next = 0;
                    EXIT(data);
                end;
            end
            else begin
                tbl_performanceContractHeader.Reset();
                tbl_performanceContractHeader.SetRange("Responsible Employee No.", employeeNumber);
                tbl_performanceContractHeader.SetRange("Score Card Type", tbl_performanceContractHeader."Score Card Type"::Staff);
                tbl_performanceContractHeader.SetRange("Document Type", tbl_performanceContractHeader."Document Type"::"Individual Scorecard");
                if tbl_performanceContractHeader.FindSet(true) then begin
                    repeat
                        data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + format(tbl_performanceContractHeader."Change Status") + '*' + format(tbl_performanceContractHeader.Status) + '*' + Format(tbl_performanceContractHeader."Approval Status") + '*' + tbl_performanceContractHeader."Strategy Plan ID" + '::::';
                    until tbl_performanceContractHeader.Next = 0;
                    EXIT(data);
                end;
            end;
        end;

        if documentType = 'Board/Executive PC' then begin
            tbl_performanceContractHeader.Reset();
            //tbl_performanceContractHeader.SetRange("Responsible Employee No.", employeeNumber);
            tbl_performanceContractHeader.SetRange("Approval Status", tbl_performanceContractHeader."Approval Status"::Released);
            tbl_performanceContractHeader.SetRange("Document Type", tbl_performanceContractHeader."Document Type"::"Board/Executive PC");
            if tbl_performanceContractHeader.FindSet(true) then begin
                repeat
                    data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Strategy Plan ID" + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + Format(tbl_performanceContractHeader."Change Status") + '*' + Format(tbl_performanceContractHeader.Status) + '::::';
                until tbl_performanceContractHeader.Next = 0;
                EXIT(data);
            end;
        end;

        if documentType = 'Standard Appraisal/Supervisor Score Only' then begin
            tbl_performanceContractHeader.Reset();
            tbl_performanceContractHeader.SetRange("Evaluation Type", tbl_performanceContractHeader."Evaluation Type"::"Standard Appraisal/Supervisor Score Only");
            if tbl_performanceContractHeader.FindSet(true) then begin
                repeat
                    data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Strategy Plan ID" + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + Format(tbl_performanceContractHeader."Change Status") + '*' + Format(tbl_performanceContractHeader.Status) + '::::';
                until tbl_performanceContractHeader.Next = 0;
                EXIT(data);
            end;
        end;
    end;

    procedure fnGetApprovedFunctionalWorkplans(employeeNumber: Code[30]) data: Text
    var
        tbl_AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
    begin
        tbl_AnnualStrategyWorkplan.Reset();
        tbl_AnnualStrategyWorkplan.SetRange("Annual Strategy Type", tbl_AnnualStrategyWorkplan."Annual Strategy Type"::Functional);
        tbl_AnnualStrategyWorkplan.SetRange("Approval Status", tbl_AnnualStrategyWorkplan."Approval Status"::Released);
        tbl_AnnualStrategyWorkplan.SetRange(Archived, false);

        if tbl_AnnualStrategyWorkplan.FindSet(true) then begin
            repeat
                data := data +
                        tbl_AnnualStrategyWorkplan.No + '*' +
                        tbl_AnnualStrategyWorkplan.Description + '*' +
                        tbl_AnnualStrategyWorkplan."Strategy Plan ID" + '*' +
                        tbl_AnnualStrategyWorkplan."Year Reporting Code" + '*' +
                        Format(tbl_AnnualStrategyWorkplan."Start Date") + '*' +
                        Format(tbl_AnnualStrategyWorkplan."End Date") + '*' +
                        tbl_AnnualStrategyWorkplan.Department + '*' +
                        tbl_AnnualStrategyWorkplan."Department Name" + '::::';
            until tbl_AnnualStrategyWorkplan.Next = 0;
            EXIT(data);
        end;
    end;

    procedure fnGetStrategyWorkplanLines1(workplanNo: Code[30]) data: Text
    var
        tbl_StrategyWorkplanLines: Record "Strategy Workplan Lines";
    begin
        tbl_StrategyWorkplanLines.Reset();
        tbl_StrategyWorkplanLines.SetRange(No, workplanNo);

        if tbl_StrategyWorkplanLines.FindSet(true) then begin
            repeat
                data := data +
                        tbl_StrategyWorkplanLines.No + '*' +
                        tbl_StrategyWorkplanLines."Strategy Plan ID" + '*' +
                        tbl_StrategyWorkplanLines."Activity ID" + '*' +
                        tbl_StrategyWorkplanLines.Description + '*' +
                        Format(tbl_StrategyWorkplanLines."Imported Annual Target Qty") + '*' +
                        Format(tbl_StrategyWorkplanLines."Imported Annual Budget Est.") + '*' +
                        tbl_StrategyWorkplanLines."Primary Directorate" + '*' +
                        tbl_StrategyWorkplanLines."Primary Department" + '*' +
                        Format(tbl_StrategyWorkplanLines."Q1 Target") + '*' +
                        Format(tbl_StrategyWorkplanLines."Q1 Budget") + '*' +
                        Format(tbl_StrategyWorkplanLines."Q2 Target") + '*' +
                        Format(tbl_StrategyWorkplanLines."Q2 Budget") + '*' +
                        Format(tbl_StrategyWorkplanLines."Q3 Target") + '*' +
                        Format(tbl_StrategyWorkplanLines."Q3 Budget") + '*' +
                        Format(tbl_StrategyWorkplanLines."Q4 Target") + '*' +
                        Format(tbl_StrategyWorkplanLines."Q4 Budget") + '*' +
                        Format(tbl_StrategyWorkplanLines."Entry Type") + '*' +
                        tbl_StrategyWorkplanLines."Year Reporting Code" + '*' +
                        tbl_StrategyWorkplanLines."Perfomance Indicator" + '*' +
                        tbl_StrategyWorkplanLines."Source Of Fund" + '*' +
                        tbl_StrategyWorkplanLines."Unit of Measure" + '*' +
                        Format(tbl_StrategyWorkplanLines."Desired Perfomance Direction") + '*' +
                        tbl_StrategyWorkplanLines."Framework Perspective" + '*' +
                        tbl_StrategyWorkplanLines."Strategy Framework" + '*' +
                        Format(tbl_StrategyWorkplanLines."AnnualWorkplan Achieved Target") + '*' +
                        tbl_StrategyWorkplanLines."Primary Directorate Name" + '*' +
                        tbl_StrategyWorkplanLines."Primary Department Name" + '*' +
                        tbl_StrategyWorkplanLines."Key Performance Indicator" + '*' +
                        Format(tbl_StrategyWorkplanLines."Assigned Weight(%)") + '*' +
                        Format(tbl_StrategyWorkplanLines."Annual Target") + '*' +
                        Format(tbl_StrategyWorkplanLines."Annual Budget") + '*' +
                        tbl_StrategyWorkplanLines.Outcome + '*' +
                        tbl_StrategyWorkplanLines."Objective ID" + '*' +
                        Format(tbl_StrategyWorkplanLines."Departmental Activity Weight") + '::::';
            until tbl_StrategyWorkplanLines.Next = 0;
            EXIT(data);
        end;
    end;

    procedure fnGetPCObjectives(IndividualPCNo: Code[30]) data: Text
    var
        WPLines: Record "PC Objective";
    begin
        WPLines.Reset();
        WPLines.SetRange("Workplan No.", IndividualPCNo);

        if WPLines.FindSet() then begin
            repeat
                data := data +
                        Format(WPLines.EntryNo) + '*' +
                        WPLines."Initiative No." + '*' +
                        WPLines."Activity Description" + '*' +
                        WPLines."Key Performance Indicator" + '*' +
                        WPLines.Outcome + '*' +
                        Format(WPLines."Imported Annual Target Qty") + '*' +
                        Format(WPLines."Q1 Target Qty") + '*' +
                        Format(WPLines."Q2 Target Qty") + '*' +
                        Format(WPLines."Q3 Target Qty") + '*' +
                        Format(WPLines."Q4 Target Qty") + '*' +
                        Format(WPLines."Assigned Weight (%)") + '*' +
                        WPLines."Year Reporting Code" + '*' +
                        WPLines."Unit of Measure" + '*' +
                        Format(WPLines."Desired Perfomance Direction") + '*' +
                        WPLines."Department Plan ID" + '*' +
                        WPLines."Workplan No." + '*' +
                        WPLines."Additional Comments" + '::::';
            until WPLines.Next() = 0;
            EXIT(data);
        end;
    end;

    procedure fnGetPerformanceContract(contractNumber: Code[30]) data: Text
    begin
        tbl_performanceContractHeader.Reset();
        tbl_corporateStrategicPlans.Reset();
        tbl_performanceContractHeader.SetRange(No, contractNumber);
        if tbl_performanceContractHeader.FindSet(true) then begin
            data := tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + Format(tbl_performanceContractHeader."End Date") + '*' + tbl_corporateStrategicPlans.Description;
        end;
        exit(data);

    end;

    procedure fnGetVehicleMaintainanceRequisition(employeeNumber: Code[30]; status: Text) data: Text
    begin
        if status = 'Approved' then begin
            tbl_fuelAndMaintainanceRequisition.Reset();
            tbl_fuelAndMaintainanceRequisition.SetRange("Driver", employeeNumber);
            //tbl_fuelAndMaintainanceRequisition.SetFilter("Requisition No", 'M*');
            tbl_fuelAndMaintainanceRequisition.SetRange(Status, tbl_fuelAndMaintainanceRequisition.Status::Approved);
            if tbl_fuelAndMaintainanceRequisition.FindSet(true) then begin
                repeat
                    data := data + tbl_fuelAndMaintainanceRequisition."Requisition No" + '*' + tbl_fuelAndMaintainanceRequisition."Vehicle Reg No" + '*' + Format(tbl_fuelAndMaintainanceRequisition."Odometer Reading") + '*' + Format(tbl_fuelAndMaintainanceRequisition."Request Date") + '*' + Format(tbl_fuelAndMaintainanceRequisition.Status) + ':';
                until tbl_fuelAndMaintainanceRequisition.Next = 0;
            end;
            exit(data);
        end else begin
            tbl_fuelAndMaintainanceRequisition.Reset();
            tbl_fuelAndMaintainanceRequisition.SetRange("Driver", employeeNumber);
            //tbl_fuelAndMaintainanceRequisition.SetFilter("Requisition No", 'M*');

            tbl_fuelAndMaintainanceRequisition.SetRange(Status, tbl_fuelAndMaintainanceRequisition.Status::Open, tbl_fuelAndMaintainanceRequisition.Status::"Pending Approval");
            if tbl_fuelAndMaintainanceRequisition.FindSet(true) then begin
                repeat
                    data := data + tbl_fuelAndMaintainanceRequisition."Requisition No" + '*' + tbl_fuelAndMaintainanceRequisition."Vehicle Reg No" + '*' + Format(tbl_fuelAndMaintainanceRequisition."Odometer Reading") + '*' + Format(tbl_fuelAndMaintainanceRequisition."Request Date") + '*' + Format(tbl_fuelAndMaintainanceRequisition.Status) + ':';
                until tbl_fuelAndMaintainanceRequisition.Next = 0;
            end;
            exit(data);
        end;
    end;

    procedure fnGetPerfomance(DocNo: Code[20]) data: Text
    var
        perfom: Record "Perfomance Evaluation";
    begin
        perfom.Reset();
        perfom.SetRange(No, DocNo);
        if perfom.FindFirst() then begin
            data += Format(perfom.No) + '*' + Format(perfom."Review Period") + '*' + Format(perfom."Personal Scorecard ID") + '*' +
             Format(perfom."Supervisor Staff No.") + '*' + Format(perfom."Second Supervisor Staff No.") + '*' + Format(perfom.Description)
             + '*' + Format(perfom."Review Period") + '*' + Format(perfom."Competency Template ID") + '*' +
             Format(perfom."Annual Reporting Code") + '*' + Format(perfom."Strategy Plan ID") + '*' + Format(perfom."Performance Mgt Plan ID")
             + '*' + Format(perfom."Performance Task ID") + '*' + Format(perfom."Document Date") + '*' + Format(perfom."Last Evaluation Date")
             + '*' + Format(perfom.Directorate) + '*' + Format(perfom.Department) + '*' + Format(perfom."Employee Name") + '*' + Format(perfom."Employee No.")
              + '::::';
        end
    end;


    procedure fnGetApprovalEntry(docNumber: Code[30]) data: Text
    begin
        tbl_approvalEntry.Reset();
        tbl_approvalEntry.SetRange("Document No.", docNumber);
        if tbl_approvalEntry.FindSet(true) then begin
            repeat
                tbl_approvalEntry.calcfields(Comment);
                data += Format(tbl_approvalEntry."Sequence No.") + '*' + Format(tbl_approvalEntry.Status) + '*' + Format(tbl_approvalEntry."Sender ID") + '*' + Format(tbl_approvalEntry."Approver ID") + '*' + Format(tbl_approvalEntry.Amount) + '*' + Format(tbl_approvalEntry."Due Date") + '*' + Format(tbl_approvalEntry."Date-Time Sent for Approval") + '*' + format(tbl_approvalEntry.Comment) + '*' + Format(tbl_approvalEntry."Table ID") + '*' + Format(tbl_approvalEntry."Record ID to Approve") + '*' + tbl_approvalEntry."Workflow Step Instance ID" + '::::';
            until tbl_approvalEntry.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetRecordsToApprove(approverId: Code[50]) data: Text
    var
        loginId: Text;
    begin
        tbl_approvalEntry.Reset();
        loginId := approverId;
        tbl_approvalEntry.SetRange("Approver ID", loginId);
        if tbl_approvalEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_approvalEntry."Sequence No.") + '*' + Format(tbl_approvalEntry.Status) + '*' + Format(tbl_approvalEntry."Sender ID") + '*' + Format(tbl_approvalEntry.Amount) + '*' + Format(tbl_approvalEntry."Due Date") + '*' + Format(tbl_approvalEntry."Date-Time Sent for Approval") + '*' + format(tbl_approvalEntry.Comment) + '*' + Format(tbl_approvalEntry."Record ID to Approve") + '*' + tbl_approvalEntry."Workflow Step Instance ID" + '*' + Format(tbl_approvalEntry."Document No.") + '*' + Format(tbl_approvalEntry.RecordDetails()) + '*' + Format(tbl_approvalEntry."Table ID") + '::::';
            until tbl_approvalEntry.Next = 0;

        end;

    end;

    procedure fnGetCorporateStrategicPlan() data: Text
    begin
        tbl_corporateStrategicPlans.reset();
        tbl_corporateStrategicPlans.SetRange("Approval Status", tbl_corporateStrategicPlans."Approval Status"::Released);
        tbl_corporateStrategicPlans.SetRange("Implementation Status", tbl_corporateStrategicPlans."Implementation Status"::Ongoing);
        repeat
            data += tbl_corporateStrategicPlans.Description + '*' + tbl_corporateStrategicPlans."Primary Theme" + '*' + Format(tbl_corporateStrategicPlans."Duration (Years)") + '*' + tbl_corporateStrategicPlans."Vision Statement" + '*' + tbl_corporateStrategicPlans."Mission Statement" + '*' + Format(tbl_corporateStrategicPlans."Start Date") + '*' + Format(tbl_corporateStrategicPlans."End Date") + '*' + Format(tbl_corporateStrategicPlans."Implementation Status") + '*' + tbl_corporateStrategicPlans.Code + '::::';
        until tbl_corporateStrategicPlans.Next = 0;
        Exit(data);


    end;

    procedure fnGetStrategicCoreValues(strategicPlanId: Code[30]) data: Text
    begin
        tbl_strategyCoreValue.Reset();
        tbl_strategyCoreValue.SetRange("Strategic Plan ID", strategicPlanId);
        if tbl_strategyCoreValue.FindSet(true) then begin
            repeat
                data += tbl_strategyCoreValue.Description + '*' + tbl_strategyCoreValue."Core Value" + '::::';
            until tbl_strategyCoreValue.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetStrategicObjectives(strategicPlanId: Code[30]) data: Text
    begin
        tbl_strategicObjective.Reset();
        tbl_strategicObjective.SetRange("Strategic Plan ID", strategicPlanId);
        if tbl_strategicObjective.findset(true) then begin
            repeat
                data := data + tbl_strategicObjective."Theme ID" + '*' + tbl_strategicObjective."Objective ID" + '*' + tbl_strategicObjective.Description + '::::';
            until tbl_strategicObjective.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStrategy(strategyID: Code[30]) data: Text
    begin
        tbl_strategy.Reset();
        tbl_strategy.SetRange("Strategic Plan ID", strategyID);
        if tbl_strategy.FindSet(true) then begin
            repeat
                data := data + tbl_strategy."Theme ID" + '*' + tbl_strategy."Objective ID" + '*' + tbl_strategy."Strategy ID" + '*' + tbl_strategy.Description + '::::';
            until tbl_strategy.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetStrategicInitiative(strategyID: Code[30]) data: Text
    begin
        tbl_strategicInitiative.Reset();
        tbl_strategicInitiative.SetRange("Strategic Plan ID", strategyID);
        if tbl_strategicInitiative.FindSet(true) then begin
            repeat
                data := data + tbl_strategicInitiative.Description + '*' + Format(tbl_strategicInitiative."Perfomance Indicator") + '*' + Format(tbl_strategicInitiative."Unit of Measure") + '*' + Format(tbl_strategicInitiative."CSP Planned Target") + '*' + tbl_strategicInitiative."Primary Directorate" + '*' + tbl_strategicInitiative."Primary Department" + '::::';
            until tbl_strategicInitiative.Next = 0;
        end;
        EXIT(data);

    end;

    procedure fnGetCspPlannedYear(cspCode: Code[30]) data: Text
    begin
        tbl_cspPlannedYears.Reset();
        tbl_cspPlannedYears.SetRange("CSP Code", cspCode);
        if tbl_cspPlannedYears.FindSet(true) then begin
            repeat
                data := data + tbl_cspPlannedYears."Annual Year Code" + '::::';
            until tbl_cspPlannedYears.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStrategicTheme(strategicPlanId: Code[30]) data: Text
    begin
        tbl_strategicTheme.Reset();
        tbl_strategicTheme.SetRange("Strategic Plan ID", strategicPlanId);
        if tbl_strategicTheme.FindSet(true) then begin
            repeat
                data := data + tbl_strategicTheme."Theme ID" + '*' + tbl_strategicTheme.Description + '*' + Format(tbl_strategicTheme."No. of Strategic Objectives") + '*' + Format(tbl_strategicTheme."No. of Strategies") + '*' + Format(tbl_strategicTheme."No. of Strategic Initiatives") + '::::';

            until tbl_strategicTheme.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetVacantPositions() data: Text
    begin
        tbl_employeeRequisition.Reset();
        tbl_employeeRequisition.SetRange("Closed Application", false);
        if tbl_employeeRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_employeeRequisition."Job ID" + '*' + tbl_employeeRequisition."Job Grade" + '*' + tbl_employeeRequisition."Job Title" + '*' + Format(tbl_employeeRequisition."Required Positions") + '*' + tbl_employeeRequisition."Job Description" + '*' + Format(tbl_employeeRequisition."Requisition Type") + '*' + Format(tbl_employeeRequisition.Status) + '*' + tbl_employeeRequisition."Requisition No." + ':';
            until tbl_employeeRequisition.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetTransportTrips(employeeNumber: Code[30]; status: Text) data: Text
    begin
        tbl_vehicleDriverAllocation.Reset();
        tbl_transportRequisition.Reset();
        tbl_transportRequisition.SetRange("Requested By", employeeNumber);
        // tbl_transportRequisition.SetRange(Status, tbl_transportRequisition.Status::Open);
        if tbl_transportRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_transportRequisition."Transport Requisition No" + '*' + tbl_transportRequisition.Commencement + '*' + tbl_transportRequisition."Vehicle Allocated" + '*' + tbl_transportRequisition."Driver Name" + '*' + Format(tbl_transportRequisition."Date of Request") + '*' + tbl_transportRequisition."Purpose of Trip" + '*' + Format(tbl_transportRequisition.Status) + '::::';
            until tbl_transportRequisition.Next = 0;
        end;
        EXIT(data);

    end;

    procedure fnGetPettyCashLinesdetails(lineNumber: Code[20]) data: Text
    begin
        tbl_pvLines.Reset();
        tbl_pvLines.SetRange(No, lineNumber);
        if tbl_pvLines.FindSet(true) then begin
            repeat
                data += Format(tbl_pvLines."Account Type") + '*' + Format(tbl_pvLines."Account No") + '*' + tbl_pvLines."Account Name" + '*' + Format(tbl_pvLines.Amount) + '*' + Format(tbl_pvLines."Line No") + '*' + Format(tbl_pvLines."Type of Expense") + '*' + Format(tbl_pvLines."Remaining Amount") + '*' + tbl_pvLines.Description + '*' + tbl_pvLines."Applies to Doc. No" + '*' + Format(tbl_pvLines.Type) + '*' + Format(tbl_pvLines.Amount) + '::::';
            until tbl_pvLines.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetPettyCashLines(lineNumber: Code[20]) data: Text
    begin
        PettySurrender.Reset();
        PettySurrender.SetRange(No, lineNumber);
        if PettySurrender.FindSet(true) then begin
            repeat
                data += Format(PettySurrender."Account Type") + '*' + Format(PettySurrender."Account No") + '*' + PettySurrender."Account Name" + '*' + Format(PettySurrender.Amount) + '*' + Format(PettySurrender."Line No") + '*' + Format(PettySurrender."Actual Spent") + '*' + Format(PettySurrender."Remaining Amount") + '*' + PettySurrender.Description + '*' + Format(PettySurrender."Line No") + '*' + Format(PettySurrender."Line No") + '*' + Format(PettySurrender.Amount) + '::::';
            until PettySurrender.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetPettyCashVoucherLines(lineNumber: Code[20]) data: Text
    begin
        PettySurrender.Reset();
        PettySurrender.SetRange(No, lineNumber);
        if PettySurrender.FindSet(true) then begin
            repeat
                data += Format(PettySurrender."Account Type") + '*' + Format(PettySurrender."Account No") + '*' + PettySurrender."Account Name" + '*' + Format(PettySurrender.Amount) + '*' + Format(PettySurrender."Line No") + '*' + Format(PettySurrender."Actual Spent") + '*' + Format(PettySurrender."Remaining Amount") + '*' + PettySurrender.Description + '*' + Format(PettySurrender."Line No") + '*' + Format(PettySurrender."Line No") + '*' + Format(PettySurrender.Amount) + '::::';
            until PettySurrender.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetApprovalCommentLine(tableId: Integer; recordToApprove: RecordId) data: Text
    begin
        tbl_approvalCommentLine.Reset();
        tbl_approvalCommentLine.SetRange("Table ID", tableId);
        tbl_approvalCommentLine.SetRange("Record ID to Approve", recordToApprove);
        if tbl_approvalCommentLine.FindSet(true) then begin
            repeat
                data += tbl_approvalCommentLine.Comment + '*' + Format(tbl_approvalCommentLine."User ID") + '*' + Format(tbl_approvalCommentLine."Date and Time") + '::::';
            until tbl_approvalCommentLine.Next = 0;
        end;
        Exit(data);

    end;

    procedure getApprovalEntry(documentNumber: Code[30]) data: Text
    begin
        tbl_approvalEntry.reset();
        tbl_approvalEntry.SetRange("Document No.", documentNumber);
        if tbl_approvalEntry.FindSet(true) then begin
            repeat
                data := data + Format(tbl_approvalEntry."Sequence No.") + '*' + Format(tbl_approvalEntry.Status) + '*' + tbl_approvalEntry."Sender ID" + '*' + Format(tbl_approvalEntry."Approver ID") + '*' + Format(tbl_approvalEntry.Amount) + '*' + Format(tbl_approvalEntry."Date-Time Sent for Approval") + '*' + Format(tbl_approvalEntry."Due Date") + '*' + Format(tbl_approvalEntry.Comment) + ':';
            until tbl_approvalEntry.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetPurchaseLine(docNumber: Code[30]) data: Text
    begin
        tbl_purchaseLine.Reset();
        tbl_purchaseLine.SetRange("Document No.", docNumber);
        if tbl_purchaseLine.findset(true) then begin
            repeat
                data += Format(tbl_purchaseLine."Line No.") + '*' + tbl_purchaseLine.Description + '*' +
                Format(tbl_purchaseLine."Unit of Measure") + '*' + Format(tbl_purchaseLine.Quantity) + '*' +
                 Format(tbl_purchaseLine."Direct Unit Cost") + '*' + Format(tbl_purchaseLine.Amount) + '*' +
                  Format(tbl_purchaseLine."Qty. Requested") + '*' + Format(tbl_purchaseLine."Service/Item Code") + '*' +
                   Format(tbl_purchaseLine."No.") + '::::';
            until tbl_purchaseLine.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetPurchaseHeader(empNumber: Code[30]; documentType: Text) data: Text
    begin
        tbl_purchaseHeader.Reset();
        if documentType = 'Purchase Requisition' then begin
            tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::"Purchase Requisition");
            tbl_purchaseHeader.SetRange("Request-By No.", empNumber);
            if tbl_purchaseHeader.FindSet(true) then begin
                repeat
                    data += tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader.Description + '*' + Format(tbl_purchaseHeader."Requisition Product Group") + '*' + Format(tbl_purchaseHeader."Priority Level") + '*' + Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."PP Planning Category" + '*' + tbl_purchaseHeader."Directorate Code" + '*' + tbl_purchaseHeader."Department Code" + '*' + tbl_purchaseHeader.job + '*' + tbl_purchaseHeader."Job Task No." + '*' + Format(tbl_purchaseHeader."Item Category Description") + '*' + Format(tbl_purchaseHeader."Cancelled?") + '*' + tbl_purchaseHeader."Gen. Bus. Posting Group" + '*' + Format(tbl_purchaseHeader."Document Date") + '::::';
                until tbl_purchaseHeader.Next = 0;
            end;
            Exit(data);
        end;

        if documentType = 'Store Requisition' then begin
            tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::"Store Requisition");
            tbl_purchaseHeader.SetRange("Request-By No.", empNumber);
            if tbl_purchaseHeader.FindSet(true) then begin
                repeat
                    data := data + tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader.Description + '*' +
                    Format(tbl_purchaseHeader."Requisition Product Group") + '*' + Format(tbl_purchaseHeader."Priority Level") + '*' +
                     Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."PP Planning Category" + '*' +
                      tbl_purchaseHeader."Shortcut Dimension 2 Code" + '*' + tbl_purchaseHeader."Gen. Bus. Posting Group" + '::::';
                until tbl_purchaseHeader.Next = 0;
            end;
            Exit(data);
        end;


    end;

    procedure fnGetPurchaseHeaderApprovals(appNo: Code[30]; documentType: Text) data: Text
    begin
        tbl_purchaseHeader.Reset();
        tbl_purchaseHeader.SetRange("No.", appNo);
        if tbl_purchaseHeader.FindSet(true) then begin
            repeat
                // tbl_purchaseHeader.CalcFields("PP Total Budget");
                data += tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader.Description + '*' + Format(tbl_purchaseHeader."Requisition Product Group") + '*' + Format(tbl_purchaseHeader."Priority Level") + '*' + Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."PP Planning Category" + '*' + tbl_purchaseHeader."Directorate Code" + '*' + tbl_purchaseHeader."Department Code" + '*' + tbl_purchaseHeader.job + '*' + tbl_purchaseHeader."Job Task No." + '*' + Format(tbl_purchaseHeader."Item Category Description") + '*' + Format(tbl_purchaseHeader."Cancelled?") + '*' + tbl_purchaseHeader.Region + '*' + tbl_purchaseHeader."Procurement Plan ID" + '*' + Format(tbl_purchaseHeader."PP Total Budget") + '*' + Format(tbl_purchaseHeader."Document Type") + '::::';
            until tbl_purchaseHeader.Next = 0;
        end;
    end;


    procedure fnGetSubPCObjective(initiativeNumber: Code[30]; workPlanNumber: Code[30]) data: Text
    begin
        tbl_subPCObjective.Reset();
        tbl_subPCObjective.SetRange("Initiative No.", initiativeNumber);
        tbl_subPCObjective.SetRange("Workplan No.", workPlanNumber);
        if tbl_subPCObjective.FindSet(true) then begin
            repeat
                data := data + tbl_subPCObjective."Objective/Initiative" + '*' + tbl_subPCObjective."Outcome Perfomance Indicator" + '*' + Format(tbl_subPCObjective."Unit of Measure") + '*' + Format(tbl_subPCObjective."Imported Annual Target Qty") + '*' + Format(tbl_subPCObjective."Due Date") + '*' + Format(tbl_subPCObjective."Entry Number") + '*' + Format(tbl_subPCObjective."Initiative No.") + ':';
            until tbl_subPCObjective.Next = 0;
        end;
        Exit(data);
    end;


    procedure fnGetObjectiveEvaluationResult(documentNumber: Code[30]) data: Text
    var
        delimiter: Text;
    begin
        delimiter := '';
        tbl_objectiveEvaluationResult.Reset();
        tbl_objectiveEvaluationResult.SetRange("Performance Evaluation ID", documentNumber);
        if tbl_objectiveEvaluationResult.FindSet(true) then begin
            repeat
                data := data + delimiter +
                        tbl_objectiveEvaluationResult."Objective/Initiative" + '*' +
                        Format(tbl_objectiveEvaluationResult."Scale Type") + '*' +
                        Format(tbl_objectiveEvaluationResult."Target Qty") + '*' +
                        Format(tbl_objectiveEvaluationResult."AppraiserReview Qty") + '*' +
                        Format(tbl_objectiveEvaluationResult."Final/Actual Qty") + '*' +
                        Format(tbl_objectiveEvaluationResult."Performance Evaluation ID");
                delimiter := ':';
            until tbl_objectiveEvaluationResult.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetClosedObjectiveEvaluationResult(documentNumber: Code[30]) data: Text
    var
        delimiter: Text;
        PerfEval: Record "Perfomance Evaluation";
    begin
        delimiter := '';
        tbl_objectiveEvaluationResult.Reset();
        tbl_objectiveEvaluationResult.SetRange("Performance Evaluation ID", documentNumber);
        PerfEval.Reset();
        PerfEval.SetRange(No, documentNumber);
        PerfEval.SetRange(Closed, true);
        if PerfEval.FindFirst() then begin
            if tbl_objectiveEvaluationResult.FindSet(true) then begin
                repeat
                    data := data + delimiter +
                            tbl_objectiveEvaluationResult."Objective/Initiative" + '*' +
                            Format(tbl_objectiveEvaluationResult."Scale Type") + '*' +
                            Format(tbl_objectiveEvaluationResult."Target Qty") + '*' +
                            Format(tbl_objectiveEvaluationResult."AppraiserReview Qty") + '*' +
                            Format(tbl_objectiveEvaluationResult."Final/Actual Qty") + '*' +
                            Format(tbl_objectiveEvaluationResult."Performance Evaluation ID");
                    delimiter := ':';
                until tbl_objectiveEvaluationResult.Next = 0;
            end;
        end;
        EXIT(data);
    end;

    procedure fnGetProficiencyEvaluationResults(docNumber: Code[30]) data: Text
    begin
        tbl_proficiencyEvaluationResult.Reset();
        tbl_proficiencyEvaluationResult.SetRange("Performance Evaluation ID", docNumber);
        if tbl_proficiencyEvaluationResult.FindSet(true) then begin
            repeat
                data := data + Format(tbl_proficiencyEvaluationResult."Scale Type") + '*' + Format(tbl_proficiencyEvaluationResult."Target Qty") + '*' + Format(tbl_proficiencyEvaluationResult."AppraiserReview Qty") + '*' + Format(tbl_proficiencyEvaluationResult."Final/Actual Qty") + '*' + tbl_proficiencyEvaluationResult.Description + ':';
            until tbl_proficiencyEvaluationResult.Next = 0;
        end;
        Exit(data);

    end;

    procedure fnGetEvaluationPip(docNumber: Code[30]) data: Text
    begin
        tbl_evaluationPip.Reset();
        tbl_evaluationPip.SetRange("Perfomance Evaluation No", docNumber);
        if tbl_evaluationPip.FindSet(true) then begin
            repeat
                data := data + tbl_evaluationPip."PIP Category" + '*' + tbl_evaluationPip.Description + ':';
            until tbl_evaluationPip.Next = 0;
        end;
        Exit(data);

    end;

    procedure fnGetEvaluationTrainingNeeds(docNumber: Code[30]) data: Text
    begin
        tbl_evaluationTrainingNeeds.Reset();
        tbl_evaluationTrainingNeeds.SetRange("Perfomance Evaluation No", docNumber);
        if tbl_evaluationTrainingNeeds.FindSet(true) then begin
            repeat
                data := data + tbl_evaluationTrainingNeeds."Training Need Category" + '*' + tbl_evaluationTrainingNeeds.Description + ':';
            until tbl_evaluationTrainingNeeds.Next = 0;
        end;
        Exit(data);

    end;

    procedure fnGetSubPlogLines(scoreCardId: Code[30]; plogNumber: Code[30]; iniativeNumber: Code[30]) data: Text
    begin
        tbl_subPlogLines.Reset();
        tbl_subPlogLines.SetRange("Personal Scorecard ID", scoreCardId);
        tbl_subPlogLines.SetRange("PLog No.", plogNumber);
        tbl_subPlogLines.SetRange("Initiative No.", iniativeNumber);
        if tbl_subPlogLines.FindSet(true) then begin
            repeat
                data := data + tbl_subPlogLines.Description + '*' + Format(tbl_subPlogLines."Planned Date") + '*' + Format(tbl_subPlogLines."Unit of Measure") + '*' + Format(tbl_subPlogLines."Target Qty") + '*' + Format(tbl_subPlogLines."Weight %") + '*' + Format(tbl_subPlogLines."Achieved Date") + '*' + Format(tbl_subPlogLines."Achieved Target") + '*' + tbl_subPlogLines.Comments + '*' + Format(tbl_subPlogLines.EntryNo) + ':';

            until tbl_subPlogLines.Next = 0;
        end;
        exit(data);
    end;


    procedure fnGetImprestLines(imprestNumber: Code[30]) data: Text
    begin
        tbl_imprestLines.Reset();
        tbl_imprestLines.SetRange(No, imprestNumber);
        if tbl_imprestLines.FindSet(true) then begin
            repeat
                data := data + tbl_imprestLines.Purpose + '*' + Format(tbl_imprestLines."Daily Rate") + '*' + Format(tbl_imprestLines."No. of Days") + '*' + Format(tbl_imprestLines.Amount) + '*' + Format(tbl_imprestLines."Line No") + '*' + Format(tbl_imprestLines."Actual Spent") + '::::';
            until tbl_imprestLines.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetLoanLines(imprestNumber: Code[30]) data: Text
    var
        PurchLines: Record "Purchase Line";
    begin
        PurchLines.Reset();
        PurchLines.SetRange("Document No.", imprestNumber);
        if PurchLines.FindSet(true) then begin
            repeat
                data := data + PurchLines.Description + '*' + Format(PurchLines.Quantity) + '*' + Format(PurchLines."Unit of Measure Code") + '*' + Format(PurchLines.Amount) + '*' + Format(PurchLines."Line No.") + '*' + Format(PurchLines."Quantity  issued") + '::::';
            until PurchLines.Next = 0;
        end;
        exit(data);
    end;


    procedure fnGetStandingImprestLines(imprestNumber: Code[30]) data: Text
    begin
        tbl_pvLines.Reset();
        tbl_pvLines.SetRange(No, imprestNumber);
        if tbl_pvLines.FindSet(true) then begin
            repeat
                data := data + tbl_pvLines.Description + '*' + Format(tbl_pvLines."Account Name") + '*' +
                Format(tbl_pvLines."Shortcut Dimension 1 Code") + '*' + Format(tbl_pvLines.Amount) + '*' +
                Format(tbl_pvLines."Line No") + '*' + Format(tbl_pvLines."Actual Spent") + '::::';
            until tbl_pvLines.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStandingImprestsOpen(employeeNo: Code[30]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("Account No.", employeeNo);
        tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Standing Imprest");
        if tbl_payments.FindSet(true) then begin
            repeat
            //data := data + tbl_payments."No." + '*' + Format(tbl_payments."Account No.") + '*' + Format(tbl_payments."Shortcut Dimension 2 Code") + '*' + Format(tbl_payments.Amount) + '*' + Format(tbl_payments."Line No") + '*' + Format(tbl_payments."Actual Spent") + '::::';
            until tbl_imprestLines.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPerformanceEvaluationDetails(employeeNumber: Code[30]) data: Text
    begin
        tbl_performanceEvalutionDetails.Reset();
        tbl_performanceEvalutionDetails.SetRange("Employee No.", employeeNumber);
        tbl_performanceEvalutionDetails.SetRange(Closed, true);
        tbl_performanceEvalutionDetails.SetRange("Evaluation Type", tbl_performanceEvalutionDetails."Evaluation Type"::"Standard Appraisal/Supervisor Score Only");
        tbl_performanceEvalutionDetails.SetRange("Document Type", tbl_performanceEvalutionDetails."Document Type"::"Performance Appraisal");
        if tbl_performanceEvalutionDetails.FindSet(true) then begin
            repeat
                data := data + tbl_performanceEvalutionDetails.No + '*' + tbl_performanceEvalutionDetails.Description + '*' + Format(tbl_performanceEvalutionDetails."Evaluation Start Date") + '*' + Format(tbl_performanceEvalutionDetails."Evaluation End Date") + '*' + tbl_performanceEvalutionDetails."Performance Mgt Plan ID" + '*' + tbl_performanceEvalutionDetails."Strategy Plan ID" + '*' + Format(tbl_performanceEvalutionDetails."Approval Status") + '*' + Format(tbl_performanceEvalutionDetails."Document Status") + '::::';
            until tbl_performanceEvalutionDetails.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetOnePerformanceEvaluationDetail(employeeNumber: Code[30]; pcNumber: Code[20]) data: Text
    begin
        tbl_performanceEvalutionDetails.Reset();
        tbl_performanceEvalutionDetails.SetRange("Employee No.", employeeNumber);
        tbl_performanceEvalutionDetails.SetRange(No, pcNumber);

        if tbl_performanceEvalutionDetails.FindSet(true) then begin
            repeat
                data := data + tbl_performanceEvalutionDetails.No + '*' + tbl_performanceEvalutionDetails.Description + '*' + Format(tbl_performanceEvalutionDetails."Evaluation Start Date") + '*' + Format(tbl_performanceEvalutionDetails."Evaluation End Date") + '*' + tbl_performanceEvalutionDetails."Performance Mgt Plan ID" + '*' + tbl_performanceEvalutionDetails."Strategy Plan ID" + '*' + Format(tbl_performanceEvalutionDetails."Approval Status") + '*' + Format(tbl_performanceEvalutionDetails."Document Status") + '*' + Format(tbl_performanceEvalutionDetails."Personal Scorecard ID") + '*' + Format(tbl_performanceEvalutionDetails."Supervisor Staff No.") + '::::';
            until tbl_performanceEvalutionDetails.Next = 0;
        end;
        EXIT(data);
    end;


    procedure fnGetCalendarDetails(performanceId: Code[30]) data: Text
    begin
        tbl_performancePlanTask.Reset();
        tbl_performancePlanTask.SetRange("Performance Mgt Plan ID", performanceId);
        // tbl_performancePlanTask.SetRange("Closed?", false);
        tbl_performancePlanTask.SetRange("Published?", true);
        if tbl_performancePlanTask.FindSet(true) then begin
            repeat
                data := data + tbl_performancePlanTask."Performance Mgt Plan ID" + '*' + Format(tbl_performancePlanTask."Task Category") + '*' + tbl_performancePlanTask.Description + '*' + Format(tbl_performancePlanTask."Processing Start Date") + '*' + Format(tbl_performancePlanTask."Processing Due Date") + '*' + Format(tbl_performancePlanTask."Calendar Type") + '*' + Format(tbl_performancePlanTask."Event Type") + '*' + tbl_performancePlanTask."Event Agenda" + '*' + tbl_performancePlanTask."Event Name" + '*' + tbl_performancePlanTask."Event Venue" + '*' + tbl_performancePlanTask."Department Code" + ':';
            until tbl_performancePlanTask.Next = 0;
        end;

    end;

    procedure fnGetBRResponseQuestion(documentNumber: Code[20]; sectionCode: Code[20]) data: Text
    begin
        tbl_brResponseQuestion.Reset();
        tbl_brResponseQuestion.SetRange("Survey Response ID", documentNumber);
        tbl_brResponseQuestion.SetRange("Section Code", sectionCode);
        if tbl_brResponseQuestion.FindSet(true) then begin
            repeat
                data := data + tbl_brResponseQuestion.Question + '*' + tbl_brResponseQuestion."General Response Statement" + '*' + Format(tbl_brResponseQuestion."Rating Type") + '*' + Format(tbl_brResponseQuestion."Question ID") + ':';
            until tbl_brResponseQuestion.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetBusinessResearchResponse(participantId: Code[30]) data: Text
    begin
        tbl_brResponse.Reset();
        tbl_brResponse.SetRange("Participant ID", participantId);
        if tbl_brResponse.FindSet(true) then begin
            repeat
                data := data + Format(tbl_brResponse."Document Date") + '*' + tbl_brResponse."Document No." + '*' + tbl_brResponse.Name + '*' + tbl_brResponse.Description + ':';
            until tbl_brResponse.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetBRResponseSection(docNo: Code[30]) data: Text
    begin
        tbl_brResponseSection.Reset();
        tbl_brResponseSection.SetRange("Survey Response ID", docNo);
        if tbl_brResponseSection.FindSet(true) then begin
            repeat
                data := data + tbl_brResponseSection.Description + '*' + Format(tbl_brResponseSection."No. of Questions") + '*' + tbl_brResponseSection."Section Completion Instruction" + '*' + tbl_brResponseSection."Section Code" + ':';
            until tbl_brResponseSection.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetTravelStaffRequisition(docNo: Code[20]) data: Text
    begin
        tbl_travelStaffRequisition.Reset();
        tbl_travelStaffRequisition.SetRange("Req No", docNo);
        if tbl_travelStaffRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_travelStaffRequisition."Employee No" + '*' + tbl_travelStaffRequisition."Employee Name" + '*' + Format(tbl_travelStaffRequisition.EntryNo) + '::::';
            until tbl_travelStaffRequisition.Next = 0;
        end;
        Exit(data);

    end;

    procedure fnGetTravelNonStaffRequisition(docNo: Code[20]) data: Text
    begin
        tbl_travelNonStaffRequisition.Reset();
        tbl_travelNonStaffRequisition.SetRange("Req No", docNo);
        if tbl_travelNonStaffRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_travelNonStaffRequisition.Name + '*' + tbl_travelNonStaffRequisition."ID No" + '*' + tbl_travelNonStaffRequisition."Phone Number" + '*' + tbl_travelNonStaffRequisition.Position + '*' + Format(tbl_travelNonStaffRequisition.EntryNo) + '::::';
            until tbl_travelNonStaffRequisition.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetJobApplications(idNumber: Code[30]) data: Text
    begin
        tbl_hrJobApplications.Reset();
        tbl_hrJobApplications.SetRange("ID Number", idNumber);
        if tbl_hrJobApplications.FindSet(true) then begin
            repeat
                data := data + tbl_hrJobApplications."Application No" + '*' + Format(tbl_hrJobApplications."Date Applied") + '*' + tbl_hrJobApplications."Job Applied For" + ':';
            until tbl_hrJobApplications.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetIctHelpDeskIssueCategory() data: Text
    begin
        tbl_ictIssueCategory.Reset();
        repeat
            data += tbl_ictIssueCategory.Code + '*' + tbl_ictIssueCategory.Description + '::::';
        until tbl_ictIssueCategory.Next = 0;
        exit(data);
    end;

    procedure fnGetLocation() data: Text
    begin
        tbl_location.Reset();
        repeat
            data += tbl_location.Code + '*' + tbl_location.Name + '::::';
        until tbl_location.Next = 0;
        exit(data);
    end;

    procedure fnGetResource() data: Text
    begin
        tbl_resource.Reset();
        repeat
            data += tbl_resource."No." + '*' + tbl_resource.Name + '*' + Format(tbl_resource.Type) + '::::';
        until tbl_resource.Next = 0;
        Exit(data);
    end;

    procedure fnGetPayroll() data: Text
    begin
        tbl_payslip.Reset();
        tbl_payslip.SetRange("Close Pay", true);
        if tbl_payslip.FindSet(true) then begin
            repeat
                data += Format(tbl_payslip."Starting Date") + '*' + tbl_payslip.Name + '::::';
            until tbl_payslip.Next = 0;
        end
    end;

    procedure fnGetEmployees() data: Text
    begin
        tbl_employee.Reset();
        repeat
            data += tbl_employee."No." + '*' + Format(tbl_employee."Employee Posting Group") + '*' + Format(tbl_employee."First Name") + '*' + Format(tbl_employee."Last Name") + '*' + Format(tbl_employee."Job Title") + '*' + Format(tbl_employee."Department Code") + '::::';
        until tbl_employee.Next = 0;
        exit(data);
    end;

    procedure fnGetLeaveTypes() data: Text
    begin
        tbl_leaveTypes.Reset();
        repeat
            data += Format(tbl_leaveTypes.Gender) + '*' + Format(tbl_leaveTypes.Code) + '*' + Format(tbl_leaveTypes.Description) + '*' + Format(tbl_leaveTypes.Days) + '::::';
        until tbl_leaveTypes.Next = 0;
        exit(data);

    end;

    procedure fnGetJobs() data: Text
    begin
        tbl_job.Reset();
        //tbl_job.SetRange(exchequer, True);
        repeat
            data += tbl_job."No." + '*' + tbl_job.Description + '*' + Format(tbl_job.exchequer) + '::::';
        until tbl_job.Next = 0;
        Exit(data);
    end;

    procedure fnGetResponsibilityCenter() data: Text
    begin
        tbl_responsibilityCenter.Reset();

        repeat
            data += Format(tbl_responsibilityCenter.Code) + '*' + tbl_responsibilityCenter.Name + '*' + tbl_responsibilityCenter."Direct Reports To" + '*' + Format(tbl_responsibilityCenter."Operating Unit Type") + '::::';
        until tbl_responsibilityCenter.Next = 0;
        Exit(data);
    end;

    procedure fnGetPostedLeaveApplications(employeeNo: Code[20]) data: Text
    var
        LeaveApp: Record "HR Leave Applications";
    begin
        data := '';
        LeaveApp.Reset();
        LeaveApp.SetRange("Employee No", employeeNo);
        LeaveApp.SetRange(Status, LeaveApp.Status::Released);
        LeaveApp.SetRange(Posted, true);

        if LeaveApp.FindSet() then begin
            repeat
                data += LeaveApp."Application Code" + '*' +
                        LeaveApp."Leave Type" + '*' +
                        Format(LeaveApp."Days Applied") + '*' +
                        Format(LeaveApp."Start Date") + '*' +
                        Format(LeaveApp."End Date") + '*' +
                        Format(LeaveApp."Application Date") + '*' +
                        Format(LeaveApp."Approved days") + '::::';
            until LeaveApp.Next() = 0;
        end;

        exit(data);
    end;
    // var
    //     tbl_GeneralCorrespondence: Record "General Correspondence Header";
    // begin
    //     tbl_GeneralCorrespondence.Reset();
    //     if tbl_GeneralCorrespondence.FindSet() then
    //         repeat
    //             data += Format(tbl_GeneralCorrespondence."Document Type") + '*' +
    //         Format(tbl_GeneralCorrespondence."Letter Type") + '*' +
    //         Format(tbl_GeneralCorrespondence."Employee Document Type") + '*' +
    //         tbl_GeneralCorrespondence."Directorate Code" + '*' +
    //         tbl_GeneralCorrespondence."Department Code" + '*' +
    //         tbl_GeneralCorrespondence."Department SubType" + '*' +
    //         tbl_GeneralCorrespondence."Sub Category" + '*' +
    //         tbl_GeneralCorrespondence."Document No" + '*' +
    //         Format(tbl_GeneralCorrespondence."Type") + '*' +
    //         Format(tbl_GeneralCorrespondence."Document Date") + '*' +
    //         Format(tbl_GeneralCorrespondence."To all Staff") + '*' +
    //         tbl_GeneralCorrespondence."External Reference No" + '*' +
    //         tbl_GeneralCorrespondence."Communication Subject" + '*' +
    //         tbl_GeneralCorrespondence."Communication Content" + '*' +
    //         tbl_GeneralCorrespondence."Created By" + '*' +
    //         Format(tbl_GeneralCorrespondence."Created DateTime") + '*' +
    //         Format(tbl_GeneralCorrespondence.Status) + '*' +
    //         Format(tbl_GeneralCorrespondence.Sent) + '::::';
    //         until tbl_GeneralCorrespondence.Next = 0;
    //     Exit(data);
    // end;


    procedure fnGetResponsibilityCenterIndividual(empNo: code[50]) data: Text
    begin
        tbl_responsibilityCenter.Reset();
        tbl_responsibilityCenter.SetRange(tbl_responsibilityCenter.Code, empNo);
        if tbl_responsibilityCenter.FindSet() then begin
            repeat
                if (tbl_responsibilityCenter."Operating Unit Type" = tbl_responsibilityCenter."Operating Unit Type"::Directorate) or (tbl_responsibilityCenter."Operating Unit Type" = tbl_responsibilityCenter."Operating Unit Type"::"Department/Center") or (tbl_responsibilityCenter."Operating Unit Type" = tbl_responsibilityCenter."Operating Unit Type"::Region) then begin

                    data += Format(tbl_responsibilityCenter.Code) + '*' + tbl_responsibilityCenter.Name + '*' + tbl_responsibilityCenter."Direct Reports To" + '*' + Format(tbl_responsibilityCenter."Operating Unit Type") + '::::';
                end;

            until tbl_responsibilityCenter.Next = 0;

        end;

        Exit(data);
    end;

    procedure fnGetStandingImprestsForEmployee(empNo: code[50]) data: Text
    begin
        tbl_responsibilityCenter.Reset();
        tbl_responsibilityCenter.SetRange(tbl_responsibilityCenter.Code, empNo);
        if tbl_responsibilityCenter.FindSet() then begin
            repeat
                if (tbl_responsibilityCenter."Operating Unit Type" = tbl_responsibilityCenter."Operating Unit Type"::Directorate) or (tbl_responsibilityCenter."Operating Unit Type" = tbl_responsibilityCenter."Operating Unit Type"::"Department/Center") or (tbl_responsibilityCenter."Operating Unit Type" = tbl_responsibilityCenter."Operating Unit Type"::Region) then begin

                    data += Format(tbl_responsibilityCenter.Code) + '*' + tbl_responsibilityCenter.Name + '*' + tbl_responsibilityCenter."Direct Reports To" + '*' + Format(tbl_responsibilityCenter."Operating Unit Type") + '::::';
                end;

            until tbl_responsibilityCenter.Next = 0;

        end;

        Exit(data);
    end;

    procedure fnGetCorrespondenceContactIndividual(empNo: code[50]; type: Integer) data: Text
    begin
        CorrespondenceContact.Reset();
        CorrespondenceContact.SetRange(CorrespondenceContact.No, empNo);
        if type = 0 then
            CorrespondenceContact.SetRange(Type, CorrespondenceContact.Type::Individual);
        if type = 1 then
            CorrespondenceContact.SetRange(Type, CorrespondenceContact.Type::Company);
        if CorrespondenceContact.FindSet then begin
            repeat
                data += Format(CorrespondenceContact.No) + '*' + Format(CorrespondenceContact.No) + '::::';
            until CorrespondenceContact.Next = 0;
        end;
        Exit(data);
    end;

    procedure fnGetTransportRequisitions(requisitionNumber: Code[20]; employeeNumber: Code[20]) data: Text
    begin
        tbl_transportRequisition.Reset();
        tbl_transportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        tbl_transportRequisition.SetRange("Employee No", employeeNumber);
        if tbl_transportRequisition.FindSet(true) then begin
            repeat
                data += tbl_transportRequisition.Commencement + '*' + tbl_transportRequisition.Destination + '*' + Format(tbl_transportRequisition."Date of Trip") + '*' + Format(tbl_transportRequisition."Journey Route") + '*' + Format(tbl_transportRequisition."Purpose of Trip") + '*' + Format(tbl_transportRequisition.Comments) + '*' + Format(tbl_transportRequisition."No of Days Requested") + '*' + Format(tbl_transportRequisition."Time out") + '*' + Format(tbl_transportRequisition."Approved Imprest Memo") + '*' + Format(tbl_transportRequisition."Type of Trip") + '::::';
            until tbl_transportRequisition.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetFleetVehicles() data: Text
    begin
        tbl_fleetVehicles.Reset();
        repeat
            data += tbl_fleetVehicles."Registration No." + '*' + tbl_fleetVehicles.Description + '*' + tbl_fleetVehicles."No." + '*' + Format(tbl_fleetVehicles."Vehicle Limit") + '::::';
        until tbl_fleetVehicles.Next = 0;
        exit(data);

    end;

    procedure fnGetServiceItems() data: Text
    begin
        tbl_serviceItems.Reset();
        repeat
            data += tbl_serviceItems."Service Code" + '*' + tbl_serviceItems."Service Name" + '::::';
        until tbl_serviceItems.Next = 0;
        exit(data);
    end;

    procedure fnGetJobTasks(jobNumber: Code[20]) data: Text
    begin
        tbl_jobtask.Reset();
        tbl_jobtask.SetRange("Job No.", jobNumber);
        if tbl_jobtask.FindSet(true) then begin
            repeat
                data += tbl_jobtask."Job Task No." + '*' + tbl_jobtask.Description + '*' + Format(tbl_jobtask."Job Task Type") + '*' + tbl_jobtask."Global Dimension 1 Code" + '::::';
            until tbl_jobtask.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetFundCode() data: Text
    begin
        tbl_fundcode.Reset();
        repeat
            data += Format(tbl_fundcode.Code) + '*' + Format(tbl_fundcode.Description) + '*' + Format(tbl_fundcode."Shortcut Dimension 1 Code") + '*' + Format(tbl_fundcode."Shortcut Dimension 2 Code") + '::::';
        until tbl_fundcode.Next = 0;
        exit(data);
    end;

    procedure fnGetFundCode1() data: Text

    begin
        tbl_fndSource.Reset();
        repeat
            data += Format(tbl_fndSource.Code) + '*' + Format(tbl_fndSource.Description) + '::::';
        until tbl_fndSource.Next = 0;
        exit(data);
    end;

    procedure fnGetBusinessPosting() data: Text

    begin
        tbl_business_posting.Reset();
        repeat
            data += Format(tbl_business_posting.Code) + '*' + Format(tbl_business_posting.Description) + '::::';
        until tbl_business_posting.Next = 0;
        exit(data);
    end;


    procedure fnGetWorkTypes() data: Text
    begin
        tbl_workTypes.Reset();
        tbl_workTypes.SetRange(Blocked, false);
        repeat
            data += Format(tbl_workTypes.Code) + '*' + Format(tbl_workTypes.Description) + '*' + Format(tbl_workTypes.Category) + '*' + Format(tbl_workTypes."International Travel") + '*' + Format(tbl_workTypes."Local Travel") + '::::';
        until tbl_workTypes.Next = 0;

    end;

    procedure fnGetReceiptTypes() data: Text
    begin
        tbl_receiptsTypes.Reset();
        repeat
            data += tbl_receiptsTypes.Code + '*' + tbl_receiptsTypes.Description + '*' + Format(tbl_receiptsTypes.Type) + '::::';
        until tbl_receiptsTypes.Next = 0;
        exit(data);

    end;

    procedure fnGetReceiptTypesDetails(docNO: Code[20]) data: Text
    begin
        tbl_projectMembers.Reset();
        tbl_projectMembers.SetRange("No.", docNO);
        if tbl_projectMembers.FindFirst() then begin
            data += Format(tbl_projectMembers."Budgeted Amount") + '*' + Format(tbl_projectMembers."Available Amount") + '::::';
        end;
        exit(data);

    end;

    procedure fnGetProcurementSetup() data: Text
    begin
        tbl_procurementSetup.Reset();
        repeat
            data += Format(tbl_procurementSetup."Effective Procurement Plan") + '*' + Format(tbl_procurementSetup."Primary Key") + '::::';
        until tbl_procurementSetup.Next = 0;
        exit(data);
    end;

    procedure fnGetProcurementPlan(planNumber: Code[20]) data: Text
    begin
        tbl_procurementPlan.Reset();
        tbl_procurementPlan.SetRange(Code, planNumber);
        if tbl_procurementPlan.FindSet(true) then begin
            repeat
                data += tbl_procurementPlan.Description + '*' + Format(tbl_procurementPlan.Code) + '::::';
            until tbl_procurementPlan.Next = 0;
        end;
        exit(data);
    end;


    procedure getProcurementSetup() data: Text
    begin
        tbl_procurementSetup.Reset();
        if (tbl_procurementSetup.FindSet) then begin

            repeat

                data += Format(tbl_procurementSetup."Effective Procurement Plan") + '*' + Format(tbl_procurementSetup."Primary Key") + '::::';


            until (tbl_procurementSetup.Next = 0);

        end;

        exit(data);

    end;

    procedure fnGetUnitOfMeasure() data: Text
    begin
        tbl_unitOfMeasure.Reset();
        repeat
            data += tbl_unitOfMeasure.Code + '*' + tbl_unitOfMeasure.Description + '::::';
        until tbl_unitOfMeasure.Next = 0;
        exit(data);
    end;

    procedure fnGetProcurementPlanEntry(planningCategory: Code[20]; region: Code[20]; planNumber: Code[20]) data: Text
    begin
        tbl_procurementPlanEntry.Reset();
        tbl_procurementPlanEntry.SetRange("Procurement Plan ID", planNumber);
        tbl_procurementPlanEntry.SetRange("Planning Category", planningCategory);
        tbl_procurementPlanEntry.SetRange(Region, region);
        tbl_procurementPlanEntry.SetRange(tbl_procurementPlanEntry."Entry Used", false);
        if tbl_procurementPlanEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_procurementPlanEntry."Entry No.") + '*' + tbl_procurementPlanEntry.Description + '*' + Format(tbl_procurementPlanEntry."Planning Category") + '*' + Format(tbl_procurementPlanEntry.Department) + '*' + Format(tbl_procurementPlanEntry.Directorate) + '*' + Format(tbl_procurementPlanEntry."Item Description") + '*' + Format(tbl_procurementPlanEntry.Items) + '*' + Format(tbl_procurementPlanEntry."Line Budget Cost") + '*' + Format(tbl_procurementPlanEntry."Unit Cost") + '*' + Format(tbl_procurementPlanEntry."Unit of Measure") + '*' + Format(tbl_procurementPlanEntry."Requisition Product Group") + '::::';
            until tbl_procurementPlanEntry.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetProcurementPlanLines(procurementPlanID: Code[20]) data: Text
    begin

        tbl_procurementPlanLines.reset();
        // tbl_procurementPlanLines.setrange("Procurement Type", requisitionProductGroup);
        tbl_procurementPlanLines.setrange("Procurement Plan ID", procurementPlanID);
        if tbl_procurementPlanLines.findset(true) then begin
            repeat
                data += Format(tbl_procurementPlanLines."Planning Category") + '*' + Format(tbl_procurementPlanLines.Description) + '*' + Format(tbl_procurementPlanLines.Budget) + '::::';
            until tbl_procurementPlanLines.Next = 0;
        end;
        exit(data);


    end;

    procedure fnGeMeals(docNo: Code[20]) data: Text

    begin

    end;

    procedure fnGetTrainingVendor() data: Text
    begin
        tbl_trainingVendor.Reset();
        //commented by Aron to include all vendor types in the training vendor list as per request to see all vendors
        //tbl_trainingVendor.SetRange("Vendor Type", tbl_trainingVendor."Vendor Type"::Trade);
        if tbl_trainingVendor.FindSet(true) then begin
            repeat
                data += Format(tbl_trainingVendor."No.") + '*' + tbl_trainingVendor.Name + '::::';
            until tbl_trainingVendor.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPerformancePlanTask(performanceID: Code[20]) data: Text
    begin
        tbl_performancePlanTask.Reset();
        tbl_performancePlanTask.SetRange("Performance Mgt Plan ID", performanceID);
        tbl_performancePlanTask.SetRange("Task Category", tbl_performancePlanTask."Task Category"::"Performance Review");
        if tbl_performancePlanTask.FindSet(true) then begin
            repeat
                data += tbl_performancePlanTask."Performance Mgt Plan ID" + '*' + tbl_performancePlanTask.Description + '*' + Format(tbl_performancePlanTask."Task Code") + '::::';
            until tbl_performancePlanTask.Next = 0;
        end;

        exit(data);
    end;

    procedure fnGetItems() data: Text
    begin
        tbl_items.Reset();
        tbl_items.SetRange(Blocked, false);
        repeat
            tbl_items.CalcFields(Inventory);
            data += tbl_items."No." + '*' + tbl_items.Description + '*' + Format(tbl_items."Indirect Cost %") + '*' + Format(tbl_items."Base Unit of Measure") + '*' + Format(tbl_items."Procurement Category") + '*' + Format(tbl_items.Inventory) + '::::';
        until tbl_items.Next = 0;
        exit(data);
    end;

    procedure fnGetItemsDetails(itemNo: Code[20]) data: Text
    begin
        tbl_items.Reset();
        tbl_items.SetRange("No.", itemNo);
        if tbl_items.FindFirst then begin

            data += tbl_items."No." + '*' + tbl_items.Description + '*' + Format(tbl_items."Indirect Cost %") + '*' + Format(tbl_items."Base Unit of Measure") + '*' + Format(tbl_items."Procurement Category") + '*' + Format(tbl_items.Inventory) + '*' + Format(tbl_items."Gen. Prod. Posting Group") + '*' + Format(tbl_items."VAT Prod. Posting Group") + '::::';

            exit(data);
        end;
    end;

    procedure fnGetProjectMembers(imprestNumber: Code[20]) data: Text
    begin
        tbl_projectMembers.Reset();
        tbl_projectMembers.SetRange("Imprest Memo No.", imprestNumber);
        if tbl_projectMembers.FindSet(true) then begin
            repeat
                data += tbl_projectMembers."Work Type" + '*' + Format(tbl_projectMembers."Type of Expense") + '*' + Format(tbl_projectMembers.Name) + '*' + Format(tbl_projectMembers."Time Period") + '*' + Format(tbl_projectMembers."Direct Unit Cost") + '*' + Format(tbl_projectMembers."Total Entitlement") + '*' + Format(tbl_projectMembers."No.") + '*' + Format(tbl_projectMembers.Type) + '*' + Format(tbl_projectMembers."Transport Costs") + '*' + Format(tbl_projectMembers."Local Travel") + '*' + Format(tbl_projectMembers."International Travel") + '*' + Format(tbl_projectMembers."Budgeted Amount") + '*' + Format(tbl_projectMembers."Available Amount") + '::::';
            until tbl_projectMembers.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetCasuals(imprestNumber: Code[30]) data: Text
    begin
        tbl_casualMembers.Reset();
        tbl_casualMembers.SetRange("Imprest Memo No.", imprestNumber);
        if tbl_casualMembers.FindSet(true) then begin
            repeat
                data += Format(tbl_casualMembers.Type) + '*' + tbl_casualMembers."Resource No." + '*' + Format(tbl_casualMembers."Work Type") + '*' + Format(tbl_casualMembers."No. Required") + '*' + Format(tbl_casualMembers."No. of Days") + '*' + Format(tbl_casualMembers.Amount) + '*' + Format(tbl_casualMembers."Actual Amount") + '::::';
            until tbl_casualMembers.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetOtherCosts(imprestNumber: Code[20]) data: Text
    begin
        tbl_otherCosts.Reset();
        tbl_otherCosts.SetRange("Imprest Memo No.", imprestNumber);
        if tbl_otherCosts.FindSet(true) then begin
            repeat
                data += tbl_otherCosts."Employee Name To Surender" + '*' + tbl_otherCosts.Description + '*' + tbl_otherCosts."Required For" + '*' + Format(tbl_otherCosts."Quantity Required") + '*' + Format(tbl_otherCosts."No. of Days") + '*' + Format(tbl_otherCosts."Unit Cost") + '*' + Format(tbl_otherCosts."Line Amount") + '*' + Format(tbl_otherCosts."Line No.") + '*' + Format(tbl_otherCosts."Type of Expense") + '*' + Format(tbl_otherCosts."Employee Name To Surender") + '::::';
            until tbl_otherCosts.Next = 0;
        end;
        exit(data);

    end;



    procedure fnGetDimensions() data: Text
    begin
        tbl_dimensionsValue.Reset();
        repeat
            data += tbl_dimensionsValue."Dimension Code" + '*' + tbl_dimensionsValue.Code + '*' + tbl_dimensionsValue.Name + '*' + Format(tbl_dimensionsValue."Global Dimension No.") + '::::';
        until tbl_dimensionsValue.Next = 0;
        exit(data);
    end;

    procedure fnGetBankAccount() data: Text
    var
        bank: Record "Bank Account";
    begin
        bank.Reset();
        bank.SetFilter("Type", '%1|%2', bank.Type::Bank, bank.Type::"Petty Cash");
        if bank.FindSet(true) then begin
            repeat
                data := data + bank."No." + '*' + bank."Name" + '::::';
            until bank.Next = 0;
        end;
        exit(data);
    end;

    procedure getLeaveBalance(empNumber: Code[30]) data: Text
    var
        daysBF: Decimal;
        allocatedLeaveDays: Decimal;
        leaveTaken: Decimal;
    // HR leave ledger entry has 2 records for every staff no, depending on the leave entry type being positive or negative
    begin
        daysBF := 0;
        allocatedLeaveDays := 0;
        leaveTaken := 0;
        hrLeaveLedgerEntry.Reset();
        hrLeaveLedgerEntry.SetRange("Staff No.", empNumber);
        if hrLeaveLedgerEntry.FindSet(true) then begin
            repeat
                if ((hrLeaveLedgerEntry."Leave Entry Type" = (hrLeaveLedgerEntry."Leave Entry Type"::Negative)) AND (hrLeaveLedgerEntry."Leave Type" = 'ANNUAL')) then begin

                    leaveTaken += hrLeaveLedgerEntry."No. of days";

                end;
                if ((hrLeaveLedgerEntry."Leave Entry Type" = (hrLeaveLedgerEntry."Leave Entry Type"::Reimbursement)) AND (hrLeaveLedgerEntry."Leave Type" = 'ANNUAL')) then begin

                    daysBF += hrLeaveLedgerEntry."No. of days";
                end;
                if ((hrLeaveLedgerEntry."Leave Entry Type" = (hrLeaveLedgerEntry."Leave Entry Type"::Positive)) AND (hrLeaveLedgerEntry."Leave Type" = 'ANNUAL') AND (hrLeaveLedgerEntry."Leave Entry Type" <> (hrLeaveLedgerEntry."Leave Entry Type"::Reimbursement))) then begin
                    allocatedLeaveDays += hrLeaveLedgerEntry."No. of days";
                end;
            until hrLeaveLedgerEntry.Next = 0;
            data := Format(daysBF) + '*' + Format(allocatedLeaveDays) + '*' + Format(leaveTaken);


        end;
        Exit(data);
    end;

    procedure fnGetLeaveDetails(empNumber: Code[30]) data: Text
    begin
        tbl_employee.reset;
        tbl_employee.setrange("No.", empNumber);
        if tbl_employee.findset(true) then begin
            data := Format(tbl_employee."Reimbursed Leave Days") + '*' + Format(tbl_employee."Allocated Leave Days") + '*' + Format(tbl_employee."Total (Leave Days)") + '*' + Format(tbl_employee."Total Leave Taken") + '*' + Format(tbl_employee."Leave Balance");

        end;
        exit(data);


    end;

    procedure fnGetReceipts(employeeNo: Code[20]) data: Text
    begin
        tbl_receiptsHeader.Reset();
        tbl_receiptsHeader.SetRange("Employee No", employeeNo);
        if tbl_receiptsHeader.FindSet(true) then begin
            repeat
                data += Format(tbl_receiptsHeader.Posted) + '*' + Format(tbl_receiptsHeader."Fully Allocated") + '*' + Format(tbl_receiptsHeader."Fully Allocated Imprest") + '*' + Format(tbl_receiptsHeader."No.") + '*' + Format(tbl_receiptsHeader."Being Payment of") + '*' + Format(tbl_receiptsHeader."On Behalf Of") + '::::';
            until tbl_receiptsHeader.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetRequisitionDetails(reqNumber: Code[20]) data: Text
    begin
        tbl_payments.Reset;
        tbl_payments.SetRange("No.", reqNumber);

        if tbl_payments.FindSet(true) then begin
            repeat
                data += Format(tbl_payments."No.") + '*' + Format(tbl_payments."Account No.") + '*' + Format(tbl_payments."Account Type") + '*' + Format(tbl_payments."Account Name") + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments."Imprest Deadline") + '*' +
                Format(tbl_payments.Status) + '*' + Format(tbl_payments."Document Type") + '*' + Format(tbl_payments."Payment Type") + '::::';
            until tbl_payments.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetSurrenderedImprests(employeeNumber: Code[30]) data: Text
    begin
        tbl_payments.Reset;
        tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::Surrender);
        tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::Surrender);
        tbl_payments.SetRange("Account No.", employeeNumber);
        tbl_payments.SetRange(Reversed, False);
        if tbl_payments.FindSet(true) then begin
            repeat
                data += Format(tbl_payments."Imprest Issue Doc. No") + '*' + Format(tbl_payments."Payment Narration") + '::::';

            until tbl_payments.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetSurrenderedLoans(userId: Code[30]) data: Text
    begin
        tbl_purchaseheader.Reset;
        tbl_purchaseheader.SetRange("Requisition Type", tbl_purchaseHeader."Requisition Type"::"Loan Surrender");
        tbl_purchaseheader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::"Loan Issue Surrender");
        tbl_purchaseheader.SetRange("Requester ID", userId);
        if tbl_purchaseheader.FindSet(true) then begin
            repeat
                data += Format(tbl_purchaseheader."No.") + '*' + Format(tbl_purchaseheader."Description") + '::::';
            until tbl_purchaseheader.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetItemLedgerEntry(itemNo: Code[20]) data: Text
    begin
        tbl_itemLedgerEntry.Reset();
        tbl_itemLedgerEntry.SetRange("Item No.", itemNo);
        if tbl_itemLedgerEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_itemLedgerEntry.Quantity) + '*' + Format(tbl_itemLedgerEntry."Remaining Quantity") + '::::';
            until tbl_itemLedgerEntry.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetItemLedgerEntryBasedOnRegion(itemNo: Code[20]; region: Code[20]) data: Text
    begin
        tbl_itemLedgerEntry.Reset();
        tbl_itemLedgerEntry.SetRange("Item No.", itemNo);
        tbl_itemLedgerEntry.SetRange("Location Code", region);
        if tbl_itemLedgerEntry.FindFirst then begin

            data += Format(tbl_itemLedgerEntry.Quantity) + '*' + Format(tbl_itemLedgerEntry."Remaining Quantity") + '::::';
        end;
        exit(data);

    end;

    procedure fnOpenApprovalRecord(documentNo: Code[30]; tableId: Integer) data: Text
    begin
        // PRN Records
        if (tableId = 38) then begin
            data := fnGetPRNRecord(documentNo);
        end;
        // leave 
        if (tableId = 69205) then begin
            data := fnGetLeaveRecord(documentNo);
        end

    end;

    local procedure fnGetLeaveRecord(documentNo: Code[30]) data: Text
    begin
        tbl_hrLeaveApplications.reset();
        tbl_hrLeaveApplications.setrange("Application Code", documentNo);
        if tbl_hrLeaveApplications.findset(true) then begin
            data := Format(tbl_hrLeaveApplications."Application Code") + '*' + Format(tbl_hrLeaveApplications."Employee No") + '*' + Format(tbl_hrLeaveApplications."Employee Name") + '*' + Format(tbl_hrLeaveApplications."Leave Type") + '*' + Format(tbl_hrLeaveApplications."Annual Leave Type") + '*' + Format(tbl_hrLeaveApplications."Days Applied") + '*' + Format(tbl_hrLeaveApplications."Start Date") + '*' + Format(tbl_hrLeaveApplications."Return Date") + '*' + Format(tbl_hrLeaveApplications."Application Date") + '*' + Format(tbl_hrLeaveApplications.Reliever) + '*' + tbl_hrLeaveApplications."Reliever Name" + '*' + Format(tbl_hrLeaveApplications."Cell Phone Number") + '*' + Format(tbl_hrLeaveApplications."E-mail Address") + '*' + Format(tbl_hrLeaveApplications."Date of Exam") + '*' + Format(tbl_hrLeaveApplications."Details of Examination");
        end;

    end;

    local procedure fnGetPRNRecord(documentNo: Code[30]) data: Text
    begin
        tbl_purchaseHeader.reset();
        tbl_purchaseHeader.setrange("No.", documentNo);
        if tbl_purchaseHeader.findset(true) then begin
            data := Format(tbl_purchaseHeader."No.") + '*' + Format(tbl_purchaseHeader."PRN Type") + '*' + Format(tbl_purchaseHeader."Document Date") + '*' + Format(tbl_purchaseHeader."Responsibility Center") + '*' + Format(tbl_purchaseHeader."Location Code") + '*' + Format(tbl_purchaseHeader."Requisition Product Group") + '*' + Format(tbl_purchaseHeader."Requester ID") + '*' + Format(tbl_purchaseHeader."Request-By No.") + '*' + Format(tbl_purchaseHeader."Request-By Name") + '*' + Format(tbl_purchaseHeader."Directorate Code") + '*' + Format(tbl_purchaseHeader."Department Code") + '*' + Format(tbl_purchaseHeader."Procurement Plan ID") + '*' + Format(tbl_purchaseHeader."Procurement Plan Entry No") + '*' + Format(tbl_purchaseHeader.Job) + '*' + Format(tbl_purchaseHeader."Job Task No.") + '*' + Format(tbl_purchaseHeader."PP Planning Category") + '*' + Format(tbl_purchaseHeader."Funding Source") + '*' + Format(tbl_purchaseHeader."PP Total Budget") + '*' + Format(tbl_purchaseHeader."PP Total Available Budget") + '*' + Format(tbl_purchaseHeader."Total PRN Amount");
        end;
    end;

    procedure fnGetDocumentsAttached(documentNo: Code[30]) data: Text
    var
        tbl_documentAttachment: Record "Document Attachment";
    begin
        tbl_documentAttachment.Reset();
        tbl_documentAttachment.SetRange("No.", documentNo);
        if tbl_documentAttachment.findset(true) then begin
            repeat
                data += tbl_documentAttachment."File Name" + '*' + Format(tbl_documentAttachment."Table ID") + '::::';
            until tbl_documentAttachment.Next = 0;
        end
    end;

    procedure fnGetfleetDrivers() Data: Text
    var
        driver: Record "Vehicle Drivers";
    begin
        if driver.findset(true) then begin
            Repeat
                Data += driver.Driver + '*' + driver."Driver Name" + '::::';
            Until driver.NEXT = 0;
        end;
    end;

    procedure fnGetDriverDetails(driverNo: Code[20]) data: Text
    var
        driverDetails: Record "Vehicle Drivers";
    begin
        driverDetails.setRange(Driver, driverNo);
        if driverDetails.FindFirst then begin
            data += driverDetails."Driver License Number" + '*' + driverDetails."Driver Name" + '::::';
        end
    end;

    procedure fnGetVehicleDetails(regNo: Code[20]) data: Text
    var
        vehicleDetails: Record "Fleet Vehicles.";
    begin
        vehicleDetails.setRange("Registration No.", regNo);
        if vehicleDetails.FindFirst then begin
            data += vehicleDetails."Make" + '*' + vehicleDetails."Description" + '*' + vehicleDetails."No." + '::::';
        end
    end;

    procedure fnGetFuelCardNo() data: Text
    var
        fuelCard: Record "Fuel Card";
    begin
        if fuelCard.FindSet(true) then begin
            repeat
                data += fuelCard.No + '*' + fuelCard."Registration No." + '*' + fuelCard.Make + '*' + Format(fuelCard."Total Amount Spend") + '*' + Format(fuelCard."Total Balance") + '::::';
            until fuelCard.Next = 0;
        end

    end;

    procedure fnGetCardDetails(CardNo: Code[20]) data: Text
    var
        fuelCard: Record "Fuel Card";
    begin
        fuelCard.RESET();
        fuelCard.SetRange("No", CardNo);
        if fuelCard.FindFirst then begin
            data += fuelCard.No + '*' + fuelCard."Registration No." + '*' + fuelCard.Make + '*' + Format(fuelCard."Total Amount Spend") + '*' + Format(fuelCard."Total Balance") + '::::';

        end

    end;

    procedure fnGetVehicleFuelCardLines(cardNo: Code[10]) data: Text
    var
        VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
    begin
        VehicleFuelCardLines.RESET();
        VehicleFuelCardLines.SetRange("No.", cardNo);
        if VehicleFuelCardLines.FindSet(true) then begin
            repeat
                data += Format(VehicleFuelCardLines."Reciept No") + '*' + Format(VehicleFuelCardLines."Amount in Shillings") + Format(VehicleFuelCardLines."Amount in Litres") + '*' + Format(VehicleFuelCardLines."Other Expenses") + '*' + Format(VehicleFuelCardLines."Date of Fueling") + '*' + VehicleFuelCardLines."Vehicle RegNo" + '*' + VehicleFuelCardLines."vehicle Make" + '*' + VehicleFuelCardLines.Driver + '*' + Format(VehicleFuelCardLines."Approval Status") + '*' + Format(VehicleFuelCardLines.Posted) + '::::';
            until VehicleFuelCardLines.Next = 0;
        end
    end;

    procedure fnGetVehicleFuelCardLine(cardNo: Code[10]; receiptNo: Code[20]) data: Text
    var
        VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
    begin
        VehicleFuelCardLines.RESET();
        VehicleFuelCardLines.SetRange("No.", cardNo);
        VehicleFuelCardLines.SetRange("Reciept No", receiptNo);
        if VehicleFuelCardLines.FindFirst then begin
            repeat
                data += Format(VehicleFuelCardLines."Reciept No") + '*' + Format(VehicleFuelCardLines."Amount in Shillings") + Format(VehicleFuelCardLines."Amount in Litres") + '*' + Format(VehicleFuelCardLines."Other Expenses") + '*' + Format(VehicleFuelCardLines."Date of Fueling") + '*' + VehicleFuelCardLines."Vehicle RegNo" + '*' + VehicleFuelCardLines."vehicle Make" + '*' + VehicleFuelCardLines.Driver + '*' + Format(VehicleFuelCardLines."Approval Status") + '*' + Format(VehicleFuelCardLines.Posted) + '::::';
            until VehicleFuelCardLines.Next = 0;
        end
    end;

    procedure fnGetTrainingSetups() data: Text
    var
        TrainingCoursesSetup: Record "Training Courses Setup";
    begin
        TrainingCoursesSetup.Reset;
        if TrainingCoursesSetup.FindSet(True) then begin
            repeat
                data += TrainingCoursesSetup.Code + '*' + TrainingCoursesSetup.Descritpion + '::::';
            until TrainingCoursesSetup.next = 0;
        end
    end;

    procedure fnGetTrainingNeedsRequests(DocNo: Code[20]) data: Text
    var
        training: Record "Training Needs Requests";
    begin
        training.Reset();
        training.SetRange("Training Header No.", DocNo);
        if training.FindFirst() then begin
            repeat
                data += training."Course ID" + '*' + training.Description + '*' + Format(training.Source) + '*' + training.Comments + '*' + Format(training."Entry No.") + '::::';
            until training.next = 0;
        end;
    end;

    procedure fnGetTrainingRequestLines(empNo: Code[20]) data: Text
    var
        TrainingNeedsLine: Record "Training Needs Requests";
        TrainingNeedsRequest: Record "Training Needs Header";
    begin
        TrainingNeedsLine.Reset;
        TrainingNeedsRequest.SetRange(Code, empNo);
        if TrainingNeedsLine.FindSet(true) then begin
            repeat
                data += Format(TrainingNeedsLine."Course ID") + '*' + TrainingNeedsLine.Description + '*' +
                Format(TrainingNeedsLine.Source) + '*' + TrainingNeedsLine.Comments + '*' + Format(TrainingNeedsLine."Entry No.") + '*' + Format(TrainingNeedsRequest.Status) + '::::';
            until TrainingNeedsLine.next = 0;
        end;
        exit(data);
    end;

    procedure fnGetTrainingCourseDetails(CourseID: Code[20]) data: Text
    var
        TrainingCoursesSetup: Record "Training Courses Setup";
    begin
        TrainingCoursesSetup.Reset;
        TrainingCoursesSetup.SetRange(Code, CourseID);

        if TrainingCoursesSetup.FindFirst() then begin
            repeat
                data += TrainingCoursesSetup.Code + '*' + TrainingCoursesSetup.Descritpion + '::::';
            until TrainingCoursesSetup.next = 0;
        end
    end;

    procedure fnGetPettyCashVouchers(empNo: Code[20]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("Account No.", empNo);
        tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Petty Cash");
        tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Petty Cash");
        tbl_payments.SetRange(Status, tbl_payments.Status::Released);
        tbl_payments.SetRange(Posted, true);
        tbl_payments.SetRange(Surrendered, false);
        //tbl_payments.SetRange(Reversed, False);
        if tbl_payments.FindSet(true) then begin
            repeat
                data := data + tbl_payments."No." + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments."Surrender Created") + '::::';
            until tbl_payments.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetPettyCashSurrender(empNo: Code[20]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("Account No.", empNo);
        tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Petty Cash Surrender");
        tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Payment Voucher");
        //tbl_payments.SetRange(Reversed, False);
        if tbl_payments.FindSet(true) then begin
            repeat
                data := data + tbl_payments."No." + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments.Date) + '*' + Format(tbl_payments."Total Amount") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Account Name") + '::::';
            until tbl_payments.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPettyCashSurrenders(empNo: Code[20]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("Account No.", empNo);
        tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Petty Cash Surrender");
        tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Payment Voucher");
        tbl_payments.SetRange(Posted, true);
        //tbl_payments.SetRange(Reversed, False);
        if tbl_payments.FindSet(true) then begin
            repeat
                data := data + tbl_payments."No." + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments.Date) + '*' + Format(tbl_payments."Total Amount") + '*' + Format(tbl_payments.Status) + '::::';
            until tbl_payments.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetImprestSurrender(surrenderNo: Code[20]) data: Text
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("No.", surrenderNo);
        tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Imprest Surrender");
        tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Payment Voucher");
        tbl_payments.SetRange(Posted, true);
        //tbl_payments.SetRange(Reversed, False);
        if tbl_payments.FindSet(true) then begin
            repeat
                data := data + tbl_payments."No." + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments.Date) + '*' + Format(tbl_payments."Total Amount") + '*' + Format(tbl_payments.Status) + '::::';
            until tbl_payments.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetImprestMemo2(imprestNo: Code[20]) data: Text
    begin
        tbl_imprestMemo.Reset();
        tbl_imprestMemo.SetRange("No.", imprestNo);
        tbl_imprestMemo.SetRange("Document Type", tbl_imprestMemo."Document Type"::"Imprest Memo");
        tbl_imprestMemo.SetRange(Posted, true);
        //tbl_payments.SetRange(Reversed, False);
        if tbl_imprestMemo.FindSet(true) then begin
            repeat
                data := data + tbl_imprestMemo."No." + '*' + Format(tbl_imprestMemo."Payment Narration") + '*' + Format(tbl_imprestMemo.Subject) + '*' + Format(tbl_imprestMemo."Imprest Naration") + '*' + Format(tbl_imprestMemo."Start Date") + '*' + Format(tbl_imprestMemo."No. of days") + '*' + Format(tbl_imprestMemo.objective) + '*' + Format(tbl_imprestMemo."Job Task Budget") + ':::';
                ;

            until tbl_imprestMemo.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPerformanceRecommendations(DocNo: Code[20]) data: Text

    begin
        tbl_performanceEvalutionDetails.Reset();
        tbl_performanceEvalutionDetails.SetRange("No", DocNo);
        if tbl_performanceEvalutionDetails.FindFirst() then begin
            data += Format(tbl_performanceEvalutionDetails."Evaluation Type") + '*' + Format(tbl_performanceEvalutionDetails."Appraisee's Comments") + '::::';
        end
    end;

    procedure fnGetPerformancePIPComments(DocNo: Code[20]) data: Text

    begin
        tbl_performanceEvalutionDetails.Reset();
        tbl_performanceEvalutionDetails.SetRange("No", DocNo);
        if tbl_performanceEvalutionDetails.FindFirst() then begin
            data += Format(tbl_performanceEvalutionDetails."Appraisee's Comments") + '*' + Format(tbl_performanceEvalutionDetails."Appraisee's Comments") + '*' + '::::';
        end
    end;



    // procedure fnGetPerformancePIPComments(DocNo: Code[20]) data: Text
    // begin
    //     tbl_performanceEvalutionDetails.Reset();
    //     tbl_performanceEvalutionDetails.SetRange("No", DocNo);
    //     if tbl_performanceEvalutionDetails.FindFirst() then begin
    //         data += Format(tbl_performanceEvalutionDetails.GetPIPSupervisorComments()) + '*' + Format(tbl_performanceEvalutionDetails.GetPIPEmployeeComments()) + '*' + Format(tbl_performanceEvalutionDetails.GetPIPFinalReview()) + '::::';
    //     end
    // end;
    //  procedure fnGetDepartmentObjectives(DocNo: Code[20]; Dep: Code[20]; EmpNo: Code[20]) data: Text
    // var
    //     objectives: Record "Departmental Objectives L";
    // begin
    //     objectives.Reset();
    //     //objectives.SetRange("Primary Department", Dep);
    //     if objectives.FindSet(True) then begin
    //         repeat
    //             data += Format(objectives."Document No.") + '*' + Format(objectives.Description) + '*' + Format(objectives."Primary Department") + '*' + Format(objectives."Primary Directorate") + '*' + Format(objectives."Unit of Measure") + '*' + Format(objectives.Target) + '::::';
    //         until objectives.next = 0;
    //     end;
    // end;
    procedure fnGetPurchaseHeaderForADocument(docno: Code[30]) data: Text
    begin
        tbl_purchaseHeader.Reset();
        tbl_purchaseHeader.SetRange("No.", docno);
        if tbl_purchaseHeader.Findfirst then begin
            data += tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader.Description + '*' + Format(tbl_purchaseHeader."Requisition Product Group") + '*' + Format(tbl_purchaseHeader."Priority Level") + '*' + Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."PP Planning Category" + '*' + tbl_purchaseHeader."Directorate Code" + '*' + tbl_purchaseHeader."Department Code" + '*' + tbl_purchaseHeader.job + '*' + tbl_purchaseHeader."Job Task No." + '*' + Format(tbl_purchaseHeader."Item Category Description") + '*' + Format(tbl_purchaseHeader."Cancelled?") + '*' + tbl_purchaseHeader."Gen. Bus. Posting Group" + '*' + Format(tbl_purchaseHeader."Document Date") + '*' + Format(tbl_purchaseHeader."Procurement Plan ID") + '*' + Format(tbl_purchaseHeader.Region) + '*' + Format(tbl_purchaseHeader."Request-By No.") + '*' + Format(tbl_purchaseHeader."Request-By Name") + '::::';
        end;
        Exit(data);
    end;

    procedure fnGetTransportRequisitionsForDocument(requisitionNumber: Code[20]) data: Text
    begin
        tbl_transportRequisition.Reset();
        tbl_transportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        if tbl_transportRequisition.FindFirst then begin
            repeat
                data += tbl_transportRequisition."Commencement" + '*' + tbl_transportRequisition."Destination" + '*' +
                 Format(tbl_transportRequisition."Date of Trip") + '*' + Format(tbl_transportRequisition."Journey Route") + '*' +
                 Format(tbl_transportRequisition."Purpose of Trip") + '*' + Format(tbl_transportRequisition.Comments) + '*' +
                 Format(tbl_transportRequisition."No of Days Requested") + '*' + Format(tbl_transportRequisition."Time out") + '*' +
                 Format(tbl_transportRequisition."Approved Imprest Memo") + '*' + Format(tbl_transportRequisition."Type of Trip") + '*' +
                 Format(tbl_transportRequisition."Vehicle Allocated By") + '*' + Format(tbl_transportRequisition."Vehicle Allocated") + '*' +
                  Format(tbl_transportRequisition."Driver Allocated") + '*' + Format(tbl_transportRequisition."Driver Allocated") + '*' +
                   Format(tbl_transportRequisition."Trip End Date") + '*' +
                 Format(tbl_transportRequisition."Directorate Code") + '*' + Format(tbl_transportRequisition."Department Code") + '*' +
                  Format(tbl_transportRequisition."Employee No") + '*' + Format(tbl_transportRequisition."Employee Name") + '*' +
                 Format(tbl_transportRequisition."Position") + '::::';
            until tbl_transportRequisition.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetVehicleMaintainanceForDocument(docNo: Code[30]) data: Text
    begin
        tbl_fuelAndMaintainanceRequisition.Reset();
        tbl_fuelAndMaintainanceRequisition.SetRange("Requisition No", docNo);
        if tbl_fuelAndMaintainanceRequisition.FindFirst then begin
            data := data + tbl_fuelAndMaintainanceRequisition."Requisition No" + '*' + tbl_fuelAndMaintainanceRequisition."Vehicle Reg No" + '*' +
            Format(tbl_fuelAndMaintainanceRequisition."Odometer Reading") + '*' + tbl_fuelAndMaintainanceRequisition."Vendor(Dealer)" + '*' +
            Format(tbl_fuelAndMaintainanceRequisition.Description) + '*' + Format(tbl_fuelAndMaintainanceRequisition."Service Code") + '*' +
             Format(tbl_fuelAndMaintainanceRequisition."Total Price of Fuel") + '*' + Format(tbl_fuelAndMaintainanceRequisition."Service Type") + '*'
              + Format(tbl_fuelAndMaintainanceRequisition."Request Date") + '*' + Format(tbl_fuelAndMaintainanceRequisition."Date Taken for Fueling") + '::::';

        end;
        exit(data);
    end;

    procedure fnGetTrainingEducationAndProfessional(docNo: Code[20]) data: Text
    var
        TrainingEducation: Record "CoursesCurrentlyPursuing";
    begin
        TrainingEducation.Reset;
        TrainingEducation.SetRange("Document No.", docNo);

        if TrainingEducation.FindSet() then begin
            repeat
                data += TrainingEducation.Name + '*' + Format(TrainingEducation.Type) + '*' + TrainingEducation.Description + '*' + Format(TrainingEducation."Line No.") + '*' + '::::';
            until TrainingEducation.next = 0;
        end;
        exit(data);
    end;

    procedure fnGetTrainingJobRequirements(docNo: Code[20]) data: Text
    var
        TrainingEducation: Record "DutyPerformanceChallenges";
    begin
        TrainingEducation.Reset;
        TrainingEducation.SetRange("Document No.", docNo);

        if TrainingEducation.FindSet() then begin
            repeat
                data += TrainingEducation.Challenge + '*' + Format(TrainingEducation."Training Suggested") + '*' + Format(TrainingEducation."Line No.") + '::::';
            until TrainingEducation.next = 0;
        end;
        exit(data);
    end;
    //  procedure fnGetTrainingNeedsAspirations(DocNo: Code[20]) data: Text
    // var
    //     training: Record "Training Needs Header";
    // begin
    //     training.Reset();
    //     training.SetRange(Code, DocNo);
    //     if training.FindFirst() then begin
    //         data += Format(training.GetCareerAspirations()) + '*' + Format(training.GetTrainingProgrammeRequired()) + '::::';
    //     end;
    //     Exit(data);
    // end;

    procedure fnGetDepartmentDirectorate(DepNo: Code[20]) data: Text
    var
        department: Record "Responsibility Center";
    begin
        department.Reset;
        department.SetRange(Code, DepNo);
        if department.Findfirst() then begin
            data += department.Name;
        end;
    end;
    //   procedure fnGetStaffClaimForDocument(docno: Code[20]) data: Text
    // begin
    //     tbl_payments.Reset;
    //     tbl_payments.SetRange("No.", docno);
    //     if tbl_payments.FindFirst() then begin
    //         data += tbl_payments."Directorate Code" + '*' + tbl_payments."Department Code" + '*' + tbl_payments.Payee + '*' + tbl_payments."Payment Narration" + '*' + tbl_payments."Funding Source" + '*' + tbl_payments."Account No." + '*' + tbl_payments."Account Name";
    //     end;

    // end;
    procedure fngetScorecardCoreInitives(DocNo: Code[20]) data: Text
    var
        scores: Record "PC Objective";
    begin
        scores.Reset();
        scores.SetRange("Workplan No.", DocNo);
        if scores.FindSet(True) then begin
            repeat
                data += Format(scores."Initiative Type") + '*' + Format(scores."Objective/Initiative") + '*' +
                Format(scores."Strategy Plan ID") + '*' + Format(scores."Assigned Weight (%)") + '*' +
                Format(scores."Department Achieved Target") + '*' + Format(scores."EntryNo") + '*' +
                Format(scores."Start Date") + '*' + Format(scores."Key Performance Indicator") + '*' +
                Format(scores."Imported Annual Target Qty") + '::::';
            until scores.Next = 0;
        end
    end;

    procedure fngetstandingimprestlinesforemployee(docNo: Code[30]) data: Text
    var
        standinglines: Record "PV Lines";
    begin

        standinglines.Reset();
        standinglines.SetRange(No, docNo);
        if standinglines.FindSet(true) then begin
            repeat
                data += Format(standinglines.No) + '*' + Format(standinglines."Account No") + '*' +
                Format(standinglines.Description) + '*' + Format(standinglines.Amount) + '*' +
                 Format(standinglines."Line No") + '::::';
            until standinglines.Next = 0;
        end;

    end;

    procedure fngetstandingimprests(paymentType: Text; empNo: Code[30]) data: Text
    var
        standingImprest: Record payments;
    begin
        if paymenttype = 'Standing Imprest' then begin
            standingImprest.Reset();
            standingImprest.SetRange("Account No.", empNo);
            standingImprest.SetRange("Payment Type", standingImprest."Payment Type"::"Standing Imprest");
            //standingImprest.SetFilter(Status, '%1|%2', standingImprest.Status::Open, standingImprest.Status::"Pending Approval");
            if standingImprest.FindSet(true) then begin
                repeat
                    standingImprest.CalcFields("Total Amount");
                    data += Format(standingImprest."No.") + '*' + Format(standingImprest."Account Name") + '*' +
                        Format(standingImprest."Payment Narration") + '*' + Format(standingImprest.Date) + '*' +
                         Format(standingImprest.Status) + '*' + Format(standingImprest."Total Amount") + '::::';
                until standingImprest.Next = 0;
            end;
        end;
    end;

    procedure fngetScorecardAdditionalInitives(DocNo: Code[20]) data: Text
    var
        scores: Record "Secondary PC Objective";
    begin
        scores.Reset();
        scores.SetRange("Workplan No.", DocNo);
        if scores.FindSet(True) then begin
            repeat
                data += Format(scores."Initiative Type") + '*' + Format(scores."Objective/Initiative") + '*' + Format(scores."Strategy Plan ID") + '*' + Format(scores."Assigned Weight (%)") + '*' + Format(scores."Start Date") + '*' + Format(scores."Due Date") + '*' + Format(scores."EntryNo") + '::::';
            until scores.Next = 0;
        end
    end;
    // procedure fngetTraingNeedsScoreCard(docNo: Code[20]) data: Text
    //  var
    //      train: Record "PC Training Needs";
    //  begin
    //     train.Reset();
    //     train.SetRange("Document No.", docNo);
    //      if train.FindSet(True) then begin
    //         repeat
    //             data += train.Course + '*' + train.Description + '*' + Format(train."Line No.") + '::::';
    //         until train.next = 0;
    //      end;
    //  end;
    procedure fnGetScoreCardHeader(DocNO: Code[20]) data: Text
    begin
        tbl_performanceContractHeader.Reset;
        tbl_performanceContractHeader.SetRange(No, DocNo);
        if tbl_performanceContractHeader.FindFirst() then begin
            data += Format(tbl_performanceContractHeader.No) + '*' + Format(tbl_performanceContractHeader."Document Type") + '*' +
             Format(tbl_performanceContractHeader."Annual Reporting Code") + '*' + Format(tbl_performanceContractHeader."Strategy Plan ID")
             + '*' + Format(tbl_performanceContractHeader."Evaluation Type") + '*' + Format(tbl_performanceContractHeader.Description) + '*'
              + Format(tbl_performanceContractHeader."Objective Setting Due Date") + '*' + Format(tbl_performanceContractHeader."Start Date")
               + '*' + Format(tbl_performanceContractHeader."End Date") + '*' + Format(tbl_performanceContractHeader."Last Evaluation Date")
               + '*' + Format(tbl_performanceContractHeader.Directorate) + '*' + Format(tbl_performanceContractHeader.Designation)
               + '::::';
        end;
    end;

    procedure fnGetStaffClaimForDocument(docno: Code[20]) data: Text
    begin
        tbl_payments.Reset;
        tbl_payments.SetRange("No.", docno);
        if tbl_payments.FindFirst() then begin
            data += tbl_payments."Directorate Code" + '*' + tbl_payments."Department Code" + '*' + tbl_payments.Payee + '*' + tbl_payments."Payment Narration" + '*' + tbl_payments."Funding Source" + '*' + tbl_payments."Account No." + '*' + tbl_payments."Account Name";
        end;

    end;

    procedure findBudgetAndRemainingAmount(voteItem: Code[50]; memo: Code[20]; empNo: Code[20]) data: Text
    begin
        tbl_projectMembers.reset();
        tbl_projectMembers.SetRange("Imprest Memo No.", memo);
        tbl_projectMembers.SetRange("No.", empNo);
        if tbl_projectMembers.FindFirst() then begin
            tbl_projectMembers."Advance Type" := voteItem;
            tbl_projectMembers.Validate("Advance Type");
            if tbl_projectMembers.Modify(true) then begin
                data += Format(tbl_projectMembers."Budgeted Amount") + '*' + Format(tbl_projectMembers."Available Amount") + '::::';
            end;
        end;
        exit(data);
    end;

    procedure fnGetFixedAssets() data: Text
    begin
        fixedAsset.Reset();
        if fixedAsset.findset() then begin
            repeat
                data += Format(fixedAsset."No.") + '*' + fixedAsset.Description + '::::';
            until fixedAsset.Next() = 0;
        end;
        exit(data);
    end;

    procedure fnGetFixedAssetsForSpecicAsset(asset: Code[20]) data: Text
    begin
        fixedAsset.Reset();
        fixedAsset.SetRange("No.", asset);
        if fixedAsset.findfirst() then begin
            data += Format(fixedAsset."No.") + '*' + fixedAsset.Description + '::::';
        end;
        exit(data);
    end;

    procedure getLookUpBufferICT() data: Text
    var
        lookUpBuffer: Record "ICT Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."ICT Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferAdministration() data: Text
    var
        lookUpBuffer: Record "Administration Dept Lookup Buf";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Admin Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferAudit() data: Text
    var
        lookUpBuffer: Record "Audit Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Audit Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferCorporate() data: Text
    var
        lookUpBuffer: Record "Corporate Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Corporate Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferEAPPersonnel() data: Text
    var
        lookUpBuffer: Record "EAP Personnel Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."EAP Personnel Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferEducation() data: Text
    var
        lookUpBuffer: Record "Education Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Education Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferFinance() data: Text
    var
        lookUpBuffer: Record "Finance Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Finance Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferHuman() data: Text
    var
        lookUpBuffer: Record "Human Cap Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Human Capital Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferLegal() data: Text
    var
        lookUpBuffer: Record "Legal Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Legal Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferPersonnel() data: Text
    var
        lookUpBuffer: Record "Personnel Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Personnel Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferProject() data: Text
    var
        lookUpBuffer: Record "Project Files Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Project Files Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferSCM() data: Text
    var
        lookUpBuffer: Record "SCM Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."SCM Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferStandards() data: Text
    var
        lookUpBuffer: Record "Standards Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Standards Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;


    procedure getLookUpBufferTransport() data: Text
    var
        lookUpBuffer: Record "Transport Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Transport Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferEAPLetter() data: Text
    var
        lookUpBuffer: Record "EAP Personnel Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."EAP Personnel Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure getLookUpBufferEAPStaff() data: Text
    var
        lookUpBuffer: Record "Personnel Dept Lookup Buffer";
    begin
        lookUpBuffer.Reset();
        if (lookUpBuffer.FindSet) then begin
            repeat
                data += Format(lookUpBuffer.Code) + '*' + Format(lookUpBuffer."Personnel Buffer") + '::::';
            until (lookUpBuffer.Next = 0);
        end;
        exit(data);

    end;

    procedure fngetdepartmentcode(directorate: Code[30]) data: Text
    var
        Memos: Record "Memo Departments";
    begin
        Memos.SetRange(Directorate, directorate);
        if Memos.FindFirst() then begin
            repeat
                data += Memos.Code + '*' + Memos.Description + '::::';
            until (Memos.Next = 0);
        end
    end;

    procedure fngetsubcategories(departmentCode: Code[30]) data: Text
    var
        Subcategory:
     Record "Subtype Categories";
    begin
        Subcategory.Reset();
        Subcategory.Setrange("File Category Code", departmentCode);
        if Subcategory.FindFirst() then begin
            repeat
                data += Subcategory.Code + '*' + Subcategory.Decsription + '::::';
            until (Subcategory.Next = 0);
        end
    end;

    procedure fngetcategories(departmentsubtype: Code[30]) data: Text
    var
        Category: Record "Memo subtypeII";
    begin
        Category.Reset();
        Category.Setrange(Code, departmentsubtype);
        if Category.FindFirst() then begin
            repeat
                data += Category.Subtype + '::::';
            until (Category.Next = 0);
        end
    end;

    procedure fnGetMealHeaderForADocument(docno: Code[30]) data: Text
    var
        tbl_mealHeader: Record "Purchase Header";
    begin
        tbl_mealHeader.Reset();
        tbl_mealHeader.SetRange("No.", docno);
        if tbl_mealHeader.FindFirst() then begin
            data += tbl_mealHeader."No." + '*' +
                    tbl_mealHeader.Description + '*' +
                    Format(tbl_mealHeader."Requester ID") + '*' +
                    Format(tbl_mealHeader."Date") + '*' +
                    Format(tbl_mealHeader.Status) + '*' +
                    Format(tbl_mealHeader."Start Date") + '*' +
                    Format(tbl_mealHeader."End Date") + '*' +
                    Format(tbl_mealHeader."Location Code") + '*' +
                    Format(tbl_mealHeader."Vote Item") + '*' +
                    Format(tbl_mealHeader."Department Name") + '*' +
                    Format(tbl_mealHeader."Request-By Name") + '*' +
                    Format(tbl_mealHeader."Total Cost") + '*' +
                    Format(tbl_mealHeader."No_of_Days") + '*' +
                    Format(tbl_mealHeader."Expected No. of People") + '*' +
                    Format(tbl_mealHeader."Actual No. of People") + '*' +
                    Format(tbl_mealHeader."Request-By No.") + '::::';
        end;
        exit(data);
    end;

    procedure fnGetMealLine(docno: Code[30]) data: Text
    var
        tbl_mealLine: Record "Meals Subform";
    begin
        tbl_mealLine.Reset();
        tbl_mealLine.SetRange("Document No.", docno);
        if tbl_mealLine.FindSet() then begin
            repeat
                data += Format(tbl_mealLine."Meal Type Code") + '*' +
                        tbl_mealLine.Description + '*' +
                        Format(tbl_mealLine.Quantity) + '*' +
                        Format(tbl_mealLine.Cost) + '*' +
                        Format(tbl_mealLine.Amount) + '::::';
            until tbl_mealLine.Next() = 0;
        end;
        exit(data);
    end;

    procedure fnGetLeaveApprovers() data: Text
    var
        tblWorkflowUserGroup: Record "Workflow User Group";
        tblWorkflowUserGroupMember: Record "Workflow User Group Member";
        tblWorkflowStep: Record "Workflow Step";
        tblWorkflowStepArgument: Record "Workflow Step Argument";
        tblWorkflow: Record Workflow;
        ApproverUserName: Code[50];
    begin
        data := '';
        tblWorkflowUserGroup.Reset();
        tblWorkflowUserGroup.SetFilter(Code, 'LEAVE*');
        if tblWorkflowUserGroup.FindSet() then begin
            repeat
                tblWorkflowUserGroupMember.Reset();
                tblWorkflowUserGroupMember.SetRange("Workflow User Group Code", tblWorkflowUserGroup.Code);
                if tblWorkflowUserGroupMember.FindSet() then begin
                    repeat
                        if StrPos(data, tblWorkflowUserGroupMember."User Name" + '::::') = 0 then
                            data += tblWorkflowUserGroupMember."User Name" + '::::';
                    until tblWorkflowUserGroupMember.Next() = 0;
                end;
            until tblWorkflowUserGroup.Next() = 0;
        end;
        tblWorkflow.Reset();
        tblWorkflow.SetFilter(Code, '*LEAVE*');
        tblWorkflow.SetRange(Enabled, true);
        if tblWorkflow.FindSet() then begin
            repeat
                tblWorkflowStep.Reset();
                tblWorkflowStep.SetRange("Workflow Code", tblWorkflow.Code);
                tblWorkflowStep.SetFilter("Function Name", 'CreateApprovalRequests');
                if tblWorkflowStep.FindSet() then begin
                    repeat
                        if tblWorkflowStepArgument.Get(tblWorkflowStep.Argument) then begin
                            // Check if it's a Specific Approver setup
                            if (tblWorkflowStepArgument."Approver Type" = tblWorkflowStepArgument."Approver Type"::Approver) and
                               (tblWorkflowStepArgument."Approver Limit Type" = tblWorkflowStepArgument."Approver Limit Type"::"Specific Approver") then begin
                                ApproverUserName := tblWorkflowStepArgument."Approver User ID";
                                if (ApproverUserName <> '') and (StrPos(data, ApproverUserName + '::::') = 0) then
                                    data += ApproverUserName + '::::';
                            end;
                        end;
                    until tblWorkflowStep.Next() = 0;
                end;
            until tblWorkflow.Next() = 0;
        end;

        Exit(data);
    end;

    procedure fnGetStaffPerformanceContractHeader(IndividualPCNo: Code[30]) data: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset();
        PerfomanceContractHeader.SetRange(No, IndividualPCNo);
        PerfomanceContractHeader.SetRange("Score Card Type", PerfomanceContractHeader."score card type"::Staff);
        PerfomanceContractHeader.SetRange("Document Type", PerfomanceContractHeader."document type"::"Individual Scorecard");

        if PerfomanceContractHeader.FindFirst() then begin
            data := PerfomanceContractHeader.No + '*' +
                    PerfomanceContractHeader.Description + '*' +
                    PerfomanceContractHeader."Department Plan ID" + '*' +
                    PerfomanceContractHeader."Strategy Plan ID" + '*' +
                    PerfomanceContractHeader."Annual Reporting Code" + '*' +
                    Format(PerfomanceContractHeader."Start Date") + '*' +
                    Format(PerfomanceContractHeader."End Date") + '*' +
                    Format(PerfomanceContractHeader."Approval Status") + '*' +
                    PerfomanceContractHeader."Responsible Employee No." + '*' +
                    PerfomanceContractHeader.Department + '*' +
                    PerfomanceContractHeader."Department Name";
        end else begin
            data := 'error*Performance Contract not found';
        end;
    end;

    procedure fnGetObjectiveEvaluationLines(DocNo: Code[100]): Text
    var
        ObjectiveOutcome: Record "Objective Evaluation Result";
        PCObjective: Record "PC Objective";
        Result: Text;
        StartDate: Date;
        DueDate: Date;
    begin
        Result := '';

        ObjectiveOutcome.Reset;
        ObjectiveOutcome.SetRange("Performance Evaluation ID", DocNo);

        if ObjectiveOutcome.FindSet then begin
            repeat
                StartDate := 0D;
                DueDate := 0D;

                if PCObjective.Get(
                    ObjectiveOutcome."Scorecard ID",
                    ObjectiveOutcome."Intiative No"
                ) then begin
                    StartDate := PCObjective."Start Date";
                    DueDate := PCObjective."Due Date";
                end;

                Result += Format(ObjectiveOutcome."Line No") + '*';
                Result += ObjectiveOutcome."Intiative No" + '*';
                Result += ObjectiveOutcome."Objective/Initiative" + '*';
                Result += ObjectiveOutcome."Key Performance Indicator" + '*';
                Result += Format(ObjectiveOutcome."Target Qty", 0, '<Precision,2:2><Standard Format,0>') + '*';
                Result += Format(ObjectiveOutcome."Self-Review Qty", 0, '<Precision,2:2><Standard Format,0>') + '*';
                Result += ObjectiveOutcome."Achieved Result" + '*';
                Result += ObjectiveOutcome."Reasons" + '*';

                if StartDate <> 0D then
                    Result += Format(StartDate, 0, '<Month,2>/<Day,2>/<Year4>')
                else
                    Result += '';
                Result += '*';

                if DueDate <> 0D then
                    Result += Format(DueDate, 0, '<Month,2>/<Day,2>/<Year4>')
                else
                    Result += '';

                Result += '::::';
            until ObjectiveOutcome.Next = 0;
        end;

        exit(Result);
    end;

    procedure fnGetSupervisorPendingAppraisals(supervisorNo: Code[50]) data: Text
    var
        PerfEval: Record "Perfomance Evaluation";
    begin
        data := '';
        PerfEval.Reset();
        PerfEval.SetRange("Supervisor Staff No.", supervisorNo);
        PerfEval.SetRange("Document Status", PerfEval."Document Status"::Evaluation);
        PerfEval.SetRange("Approval Status", PerfEval."Approval Status"::Released);

        if PerfEval.FindSet() then begin
            repeat
                data := data +
                        PerfEval."No" + '*' +
                        PerfEval."Employee No." + '*' +
                        PerfEval."Employee Name" + '*' +
                        PerfEval.Description + '*' +
                        Format(PerfEval."Document Date") + '*' +
                        Format(PerfEval."Document Status") + '*' +
                        PerfEval."Performance Mgt Plan ID" + '*' +
                        PerfEval."Personal Scorecard ID" + '*' +
                        Format(PerfEval."Evaluation Type") + '*' +
                        PerfEval.Department + '::::';
            until PerfEval.Next() = 0;
        end;

        exit(data);
    end;

    procedure fnGetPerformanceEvaluationHeader(docNo: Code[100]) data: Text
    var
        PerfEval: Record "Perfomance Evaluation";
    begin
        data := '';

        PerfEval.Reset();
        PerfEval.SetRange(No, docNo);
        if PerfEval.FindFirst() then begin
            data := PerfEval."No" + '*' +
                    PerfEval."Performance Mgt Plan ID" + '*' +
                    PerfEval."Performance Task ID" + '*' +
                    PerfEval."Employee No." + '*' +
                    PerfEval."Employee Name" + '*' +
                    PerfEval."Current Designation" + '*' +
                    PerfEval."Current Grade" + '*' +
                    PerfEval."Supervisor Staff No." + '*' +
                    PerfEval."Supervisor Name" + '*' +
                    PerfEval."Strategy Plan ID" + '*' +
                    PerfEval.Description + '*' +
                    Format(PerfEval."Document Date") + '*' +
                    Format(PerfEval."Evaluation Start Date") + '*' +
                    Format(PerfEval."Evaluation End Date") + '*' +
                    PerfEval."Appraisal Template ID" + '*' +
                    Format(PerfEval."Evaluation Type") + '*' +
                    PerfEval."Personal Scorecard ID" + '*' +
                    PerfEval."Competency Template ID" + '*' +
                    PerfEval."General Assessment Template ID" + '*' +
                    PerfEval."360-Degree Assessment Temp ID" + '*' +
                    Format(PerfEval."Objective & Outcome Weight %") + '*' +
                    Format(PerfEval."Competency Weight %") + '*' +
                    Format(PerfEval."Total Weight %") + '*' +
                    PerfEval."Performance Rating Scale" + '*' +
                    PerfEval."Proficiency Rating Scale" + '*' +
                    PerfEval.Directorate + '*' +
                    PerfEval.Department + '*' +
                    PerfEval."Annual Reporting Code" + '*' +
                    Format(PerfEval."Approval Status") + '*' +
                    Format(PerfEval."Document Status") + '*' +
                    Format(PerfEval."Blocked?") + '*' +
                    PerfEval."Created By" + '*' +
                    Format(PerfEval."Created On") + '*' +
                    Format(PerfEval."Last Evaluation Date") + '*' +
                    Format(PerfEval."Document Type") + '*' +
                    PerfEval."Appealed Performance Eval id" + '*' +
                    PerfEval."No. Series" + '*' +
                    Format(PerfEval.Closed) + '*' +
                    PerfEval."Closed By" + '*' +
                    PerfEval."Closed On" + '*' +
                    PerfEval."Review Period" + '*' +
                    Format(PerfEval."Total Final Weighted Score") + '*' +
                    Format(PerfEval."Total Proficiency Score") + '*' +
                    Format(PerfEval."Total Raw Score") + '*' +
                    Format(PerfEval."Employee Confirm") + '*' +
                    Format(PerfEval."Supervisor Confirm") + '*' +
                    PerfEval."Work Station" + '*' +
                    Format(PerfEval."Employement Terms") + '*' +
                    PerfEval."Job Group" + '*' +
                    PerfEval."Salary Scale" + '*' +
                    PerfEval."Second Supervisor Staff No." + '*' +
                    PerfEval."Second Supervisor Name" + '*' +
                    PerfEval."Second Supervisor Comments" + '*' +
                    PerfEval.Comments + '*' +
                    PerfEval."Appraisee's Comments" + '*' +
                    PerfEval."Managerial Template ID" + '*' +
                    PerfEval."Core Values Template ID" + '*' +
                    PerfEval."First Supervisor Comment" + '*' +
                    PerfEval."Second Supervisor Comment";
        end;

        exit(data);
    end;

    procedure fnGetObjectiveEvaluationLines1(docNo: Code[100]) data: Text
    var
        ObjEvalLine: Record "Objective Evaluation Result";
    begin
        data := '';

        ObjEvalLine.Reset();
        ObjEvalLine.SetRange("Performance Evaluation ID", docNo);

        if ObjEvalLine.FindSet() then begin
            repeat
                data := data +
                        Format(ObjEvalLine."Line No") + '*' +
                        ObjEvalLine."Intiative No" + '*' +
                        ObjEvalLine."Objective/Initiative" + '*' +
                        ObjEvalLine."Key Performance Indicator" + '*' +
                        Format(ObjEvalLine."Target Qty") + '*' +
                        Format(ObjEvalLine."Self-Review Qty") + '*' +
                        Format(ObjEvalLine."AppraiserReview Qty") + '*' +
                        Format(ObjEvalLine."Final/Actual Qty") + '*' +
                        Format(ObjEvalLine."Raw Performance Score") + '*' +
                        Format(ObjEvalLine."Weight %") + '*' +
                        Format(ObjEvalLine."Final Weighted Line Score") + '*' +
                        ObjEvalLine."Unit of Measure" + '*' +
                        Format(ObjEvalLine."Desired Perfomance Direction") + '*' +
                        ObjEvalLine."Performance Rating Scale" + '*' +
                        Format(ObjEvalLine."Scale Type") + '*' +
                        ObjEvalLine."Scorecard ID" + '*' +
                        Format(ObjEvalLine."Scorecard Line No") + '*' +
                        ObjEvalLine."Outcome Perfomance Indicator" + '*' +
                        ObjEvalLine."Primary Directorate" + '*' +
                        ObjEvalLine."Primary Department" + '*' +
                        ObjEvalLine."Raw Performance Grade" + '*' +
                        ObjEvalLine."Key Performance Indicator" + '*' +
                        ObjEvalLine.Comments + '*' +
                        Format(ObjEvalLine."Average Quantity") + '*' +
                        ObjEvalLine."Departmental Objective" + '*' +
                        ObjEvalLine."Appraisal Period" + '*' +
                        ObjEvalLine."Achieved Result" + '*' +
                        Format(ObjEvalLine."Rating Scale") + '*' +
                        Format(ObjEvalLine."Performance Appraisal") + '*' +
                        ObjEvalLine.Reasons + '*' +
                        ObjEvalLine.Outcome + '::::';
            until ObjEvalLine.Next() = 0;
        end;

        exit(data);
    end;

    procedure fnGetEmployeeEvaluationStatus(employeeNumber: Code[30]) data: Text
    begin
        tbl_performanceEvalutionDetails.Reset();
        tbl_performanceEvalutionDetails.SetRange("Employee No.", employeeNumber);
        tbl_performanceEvalutionDetails.SetRange(Closed, false);
        tbl_performanceEvalutionDetails.SetRange("Document Status", tbl_performanceEvalutionDetails."Document Status"::Evaluation);
        tbl_performanceEvalutionDetails.SetRange("Evaluation Type", tbl_performanceEvalutionDetails."Evaluation Type"::"Standard Appraisal/Supervisor Score Only");
        tbl_performanceEvalutionDetails.SetRange("Document Type", tbl_performanceEvalutionDetails."Document Type"::"Performance Appraisal");
        if tbl_performanceEvalutionDetails.FindSet(true) then begin
            repeat
                data := data + tbl_performanceEvalutionDetails.No + '*' +
                        tbl_performanceEvalutionDetails.Description + '*' +
                        Format(tbl_performanceEvalutionDetails."Evaluation Start Date") + '*' +
                        Format(tbl_performanceEvalutionDetails."Evaluation End Date") + '*' +
                        tbl_performanceEvalutionDetails."Performance Mgt Plan ID" + '*' +
                        tbl_performanceEvalutionDetails."Strategy Plan ID" + '*' +
                        Format(tbl_performanceEvalutionDetails."Approval Status") + '*' +
                        Format(tbl_performanceEvalutionDetails."Document Status") + '::::';
            until tbl_performanceEvalutionDetails.Next = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetLpoHeader(lpoNo: Code[20]) data: Text
    var
        tbl_purchaseHeader: Record "Purchase Header";
    begin
        tbl_purchaseHeader.Reset();
        tbl_purchaseHeader.SetRange("No.", lpoNo);
        tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::Order);
        if tbl_purchaseHeader.FindSet(true) then begin
            repeat
                data += Format(tbl_purchaseHeader."No.") + '*'
                      + Format(tbl_purchaseHeader."Buy-from Vendor Name") + '*'
                      + Format(tbl_purchaseHeader."Your Reference") + '*'
                      + Format(tbl_purchaseHeader."Quotation Description") + '*'
                      + Format(tbl_purchaseHeader."PP Preference/Reservation Code") + '*'
                      + Format(tbl_purchaseHeader."Document Date") + '*'
                      + Format(tbl_purchaseHeader."Requester ID") + '*'
                      + Format(tbl_purchaseHeader."Request-By Name") + '*'
                      + Format(tbl_purchaseHeader.Status) + '*'
                      + Format(tbl_purchaseHeader.Amount) + '*'
                      + Format(tbl_purchaseHeader."Amount Including VAT" - tbl_purchaseHeader.Amount) + '*'
                      + Format(tbl_purchaseHeader."Amount Including VAT") + '::::';
            until tbl_purchaseHeader.Next() = 0;
        end;
        EXIT(data);
    end;

    procedure fnGetLpoLines(lpoNo: Code[20]) data: Text
    var
        tbl_purchaseLine: Record "Purchase Line";
    begin
        tbl_purchaseLine.Reset();
        tbl_purchaseLine.SetRange("Document Type", tbl_purchaseLine."Document Type"::Order);
        tbl_purchaseLine.SetRange("Document No.", lpoNo);
        if tbl_purchaseLine.FindSet(true) then begin
            repeat
                data += Format(tbl_purchaseLine.Type) + '*'
                      + Format(tbl_purchaseLine."No.") + '*'
                      + Format(tbl_purchaseLine.Description) + '*'
                      + Format(tbl_purchaseLine."Item Category Code") + '*'
                      + Format(tbl_purchaseLine."Location Code") + '*'
                      + Format(tbl_purchaseLine.Quantity) + '*'
                      + Format(tbl_purchaseLine."Unit of Measure Code") + '*'
                      + Format(tbl_purchaseLine."VAT Prod. Posting Group") + '*'
                      + Format(tbl_purchaseLine."Direct Unit Cost") + '*'
                      + Format(tbl_purchaseLine."Line Amount") + '::::';
            until tbl_purchaseLine.Next() = 0;
        end;
        EXIT(data);
    end;



}
