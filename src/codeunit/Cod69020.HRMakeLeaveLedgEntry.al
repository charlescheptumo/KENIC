#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 69020 "HR Make Leave Ledg. Entry"
{

    trigger OnRun()
    begin
    end;


    procedure CopyFromJnlLine(var InsCoverageLedgEntry: Record "HR Leave Ledger Entries"; var InsuranceJnlLine: Record "HR Journal Line")
    begin
        InsCoverageLedgEntry."User ID" := UserId;
        InsCoverageLedgEntry."Leave Period" := InsuranceJnlLine."Leave Period";
        InsCoverageLedgEntry."Staff No." := InsuranceJnlLine."Staff No.";
        InsCoverageLedgEntry."Staff Name" := InsuranceJnlLine."Staff Name";
        InsCoverageLedgEntry."Posting Date" := InsuranceJnlLine."Posting Date";
        InsCoverageLedgEntry."Leave Recalled No." := InsuranceJnlLine."Leave Recalled No.";
        InsCoverageLedgEntry."Leave Entry Type" := InsuranceJnlLine."Leave Entry Type";
        InsCoverageLedgEntry."Leave Type" := InsuranceJnlLine."Leave Type";
        InsCoverageLedgEntry."Leave Approval Date" := InsuranceJnlLine."Leave Approval Date";
        InsCoverageLedgEntry."Leave Type" := InsuranceJnlLine."Leave Type";
        if InsCoverageLedgEntry."Leave Approval Date" = 0D then
            InsCoverageLedgEntry."Leave Approval Date" := InsCoverageLedgEntry."Posting Date";
        InsCoverageLedgEntry."Document No." := InsuranceJnlLine."Document No.";
        InsCoverageLedgEntry."External Document No." := InsuranceJnlLine."External Document No.";
        if InsuranceJnlLine."Leave Entry Type" = InsuranceJnlLine."Leave Entry Type"::Negative then begin
            InsCoverageLedgEntry."No. of days" := -InsuranceJnlLine."No. of Days";
        end else begin
            InsCoverageLedgEntry."No. of days" := InsuranceJnlLine."No. of Days";
        end;
        InsCoverageLedgEntry."Leave Posting Description" := InsuranceJnlLine.Description;
        InsCoverageLedgEntry."Global Dimension 1 Code" := InsuranceJnlLine."Shortcut Dimension 1 Code";
        InsCoverageLedgEntry."Global Dimension 2 Code" := InsuranceJnlLine."Shortcut Dimension 2 Code";
        InsCoverageLedgEntry."Source Code" := InsuranceJnlLine."Source Code";
        InsCoverageLedgEntry."Journal Batch Name" := InsuranceJnlLine."Journal Batch Name";
        InsCoverageLedgEntry."Reason Code" := InsuranceJnlLine."Reason Code";
        InsCoverageLedgEntry.Closed := SetDisposedFA(InsCoverageLedgEntry."Staff No.");
        InsCoverageLedgEntry."No. Series" := InsuranceJnlLine."Posting No. Series";
        InsCoverageLedgEntry."Leave Start Date" := InsuranceJnlLine."Leave Start Date"
    end;


    procedure CopyFromInsuranceCard(var InsCoverageLedgEntry: Record "HR Leave Ledger Entries"; var Insurance: Record "HR Leave Applications")
    begin
        /*WITH InsCoverageLedgEntry DO BEGIN
          "FA Class Code" := Insurance."FA Class Code";
          "FA Subclass Code" := Insurance."FA Subclass Code";
          "FA Location Code" := Insurance."FA Location Code";
          "Location Code" := Insurance."Location Code";
        END;*/

    end;


    procedure SetDisposedFA(FANo: Code[20]): Boolean
    var
        FASetup: Record "Human Resources Setup";
    begin
        /*FASetup.GET;
        FASetup.TESTFIELD("Insurance Depr. Book");
        IF FADeprBook.GET(FANo,FASetup."Insurance Depr. Book") THEN
          EXIT(FADeprBook."Disposal Date" > 0D)
        ELSE
          EXIT(FALSE);
         */

    end;


    procedure UpdateLeaveApp(LeaveCode: Code[20]; Status: Option)
    var
        LeaveApplication: Record "HR Leave Applications";
    begin
    end;

    procedure LeaveDaysonExit(Employee: Record Employee)
    var
        HRLeaveApp: Record "HR Leave Applications";
    begin
        if Employee."Use Leave Days" = true then begin
            Employee.Testfield("No of Leave Days to Use");
            if Employee."Leave Balance" = 0 then begin
                Error('The employee %1 does not have any leave days.', Employee."No.");
            end else if Employee."Leave Balance" < Employee."No of Leave Days to Use" then begin
                Error('The employee %1 does not have enough leave days to utilize.', Employee."No.")
            end else begin
                HRLeaveApp.CreateLeaveLedgerEntries;
            end

        end;
    end;

    procedure CloseStaffExit(Record: Record "Staff Exit")
    var
        Employee: Record Employee;
        ClearanceForm: Record "Staff Clearance";
        TerminationForm: Record "Exit Termination Grounds";
        GLSetup: Record "General Ledger Setup";
        LineCount: Integer;
        ContinueClosingQn: Label 'Are you sure you want to close the staff exit document for Employee No. %1?';
        NoTerminationGroundsErr: Label 'No termination grounds are stated for Employee No. %1.';
        NoClearanceLinesErr: Label 'There are no clearance lines for Employee No. %1.';
        NoInterviewLinesErr: Label 'There are no interview lines for Employee No. %1.';
        OutstandingBalErr: Label 'Employee No. %1 has an outstanding balance of %2 %3';
    begin
        if NOT Confirm(ContinueClosingQn, FALSE, Record."No.") then
            exit;
        ClearAll();
        // Employee := Record;

        Record.TestField("Staff Exit Code");
        Record.TestField("Date Of Leaving");

        Employee.Reset();
        Employee.SetRange("No.", Record."Employee No.");
        Employee.FindFirst();

        LeaveDaysonExit(Employee);

        if Record."Requires Exit Interview" then begin
            Record.TestField("Exit Interview Conducted", Record."Exit Interview Conducted"::Yes);
        end;

        if Record."Requires Clearance" then begin
            if Employee.Balance <> 0 then Error(OutstandingBalErr, Employee."No.", GLSetup."LCY Code", Employee.Balance);
            ClearanceForm.Reset();
            ClearanceForm.SetRange("Document No.", Record."No.");
            LineCount := 0;
            // IF not ClearanceForm.FindFirst() THEN
            //     ERROR(NoClearanceLinesErr, Employee."No.") else begin
            //     LineCount := LineCount + 1;
            //     repeat
            //         ClearanceForm.TestField(Status, ClearanceForm.Status::Cleared);
            //     until ClearanceForm.NEXT = 0;
            // end;
            IF ClearanceForm.FindSet() THEN
                repeat
                    //ClearanceForm.TestField(Status, ClearanceForm.Status::Cleared);
                    ClearanceForm.TestField(Cleared,true);
                until ClearanceForm.NEXT = 0;
        end;

        if Record."Has Termination Grounds" then begin
            TerminationForm.Reset();
            TerminationForm.SetRange("Document No.", Employee."No.");
            IF not TerminationForm.FindFirst() THEN
                ERROR(NoTerminationGroundsErr, Employee."No.");
        end;

        if Record."Has Termination Grounds" then begin
            Employee.Status := Employee.Status::Terminated;
            Employee."Termination Date" := Employee."Date Of Leaving";
        end else begin
            Employee.Status := Employee.Status::Inactive;
        end;

        Employee.Closed := true;
        Employee."Closed By" := UserId;

        // Record.Closed := true;
        // Record."Closed By" := UserId;
        Record.Modify();
        Employee.Modify();
        Commit();
        Message('Successfully closed exit process for employee %1.', Employee."No.");

    end;

    procedure CloseStaffExitCust(Record: Record "Employee Exit header")
    var
        Employee: Record Employee;
        ClearanceForm: Record "Staff Clearance";
        TerminationForm: Record "Exit Termination Grounds";
        GLSetup: Record "General Ledger Setup";
        LineCount: Integer;
        ContinueClosingQn: Label 'Are you sure you want to close the staff exit document for Employee No. %1?';
        NoTerminationGroundsErr: Label 'No termination grounds are stated for Employee No. %1.';
        NoClearanceLinesErr: Label 'There are no clearance lines for Employee No. %1.';
        NoInterviewLinesErr: Label 'There are no interview lines for Employee No. %1.';
        OutstandingBalErr: Label 'Employee No. %1 has an outstanding balance of %2 %3';
    begin
        if NOT Confirm(ContinueClosingQn, FALSE, Record."Document No.") then
            exit;
        ClearAll();
        // Employee := Record;
        Employee.Get(Record."Employee No");

        Employee.TestField("Staff Exit Code");
        Record.TestField("Employee Exit Date");
        LeaveDaysonExit(Employee);

        if Employee."Requires Exit Interview" then begin
            Employee.TestField("Exit Interview Conducted", Employee."Exit Interview Conducted"::Yes);
        end;

        if Employee."Requires Clearance" then begin
            if Employee.Balance <> 0 then Error(OutstandingBalErr, Employee."No.", GLSetup."LCY Code", Employee.Balance);
            ClearanceForm.Reset();
            ClearanceForm.SetRange("Document No.", Employee."No.");
            LineCount := 0;
            IF not ClearanceForm.FindFirst() THEN
                ERROR(NoClearanceLinesErr, Employee."No.") else begin
                LineCount := LineCount + 1;
                repeat
                    //ClearanceForm.TestField(Status, ClearanceForm.Status::Cleared);
                until ClearanceForm.NEXT = 0;
            end;
        end;

        if Employee."Has Termination Grounds" then begin
            TerminationForm.Reset();
            TerminationForm.SetRange("Document No.", Employee."No.");
            IF not TerminationForm.FindFirst() THEN
                ERROR(NoTerminationGroundsErr, Employee."No.");
        end;

        if Employee."Has Termination Grounds" then begin
            Employee.Status := Employee.Status::Terminated;
            Employee."Termination Date" := Employee."Date Of Leaving";
        end else begin
            Employee.Status := Employee.Status::Inactive;
        end;
        Employee.Closed := true;
        Employee."Closed By" := UserId;
        Employee.Modify();
        Record.Posted := true;
        Record.Modify();
        Commit();
    end;

    procedure ReinstateEmployee(EmployeeNo: Code[200])
    var
        Emp: Record Employee;
    begin
        if not confirm('Do you want to reinstate the Employee %1', false, Emp."No.") then
            exit;
        Emp.TestField("Date of Reinstatement");
        Emp.TestField("Reinstatement Reason");

        Emp."Reinstatement Reason" := Emp."Reinstatement Reason";
        Emp.Status := Emp.Status::Active;
        Emp."Date of Reinstatement" := Today;
        Emp."Reinstatement By" := UserId;
        Emp.Modify();
        Commit();
        Message('The Employee %1 has been reinstated', Emp."No.");
    end;
}

