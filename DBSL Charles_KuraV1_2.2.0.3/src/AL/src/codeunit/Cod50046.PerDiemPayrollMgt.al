codeunit 50650 "Per Diem Payroll Mgt."
{
    Permissions = tabledata payments = rimd,
                  tabledata "Imprest Lines" = rimd,
                  tabledata "Assignment Matrix-X" = rimd,
                  tabledata "Director Ledger Entry" = rimd,
                  tabledata "Project Members" = rm;

    var
        PerDiemSetup: Record "Per Diem Setup";
        SetupRead: Boolean;
        InPayrollErr: Label 'Imprest %1 has already been paid through payroll period %2 and cannot be posted.', Comment = '%1 = imprest no., %2 = period';
        TravelAfterPayDateErr: Label 'The travel date %1 of imprest %2 is on or after the pay date %3. It will be paid through payroll and cannot be posted.', Comment = '%1 = travel date, %2 = imprest no., %3 = pay date';
        NoOpenPeriodErr: Label 'There is no open payroll period.';
        PayDateMissingErr: Label 'Pay Date must be filled in on payroll period %1.', Comment = '%1 = period';
        PostConfirmQst: Label 'Post per diem imprest %1 as an early payment?', Comment = '%1 = imprest no.';
        PerDiemSurrenderErr: Label 'Imprest %1 is paid through payroll and cannot be surrendered.', Comment = '%1 = imprest no.';
        NoRateErr: Label 'No resource cost is set up for work type %1.', Comment = '%1 = work type';
        NotDirectorAppErr: Label 'Per diem application %1 does not belong to board member %2.', Comment = '%1 = application no., %2 = director no.';

    procedure GetSetup()
    begin
        if SetupRead then
            exit;
        if not PerDiemSetup.Get() then begin
            PerDiemSetup.Init();
            PerDiemSetup.Insert();
        end;
        SetupRead := true;
    end;

    procedure RestoreFullEntitlement(var ProjectMember: Record "Project Members")
    begin
        if ProjectMember.Type <> ProjectMember.Type::Person then
            exit;
        if ProjectMember."Full Entitlement" <> 0 then
            ProjectMember.Entitlement := ProjectMember."Full Entitlement";
    end;

    procedure ApplyAccommodation(var ProjectMember: Record "Project Members")
    begin
        if ProjectMember.Type <> ProjectMember.Type::Person then
            exit;
        GetSetup();
        ProjectMember."Full Entitlement" := ProjectMember.Entitlement;
        if ProjectMember."Accommodation Provided" then
            ProjectMember.Entitlement := Round(ProjectMember."Full Entitlement" * PerDiemSetup."Accommodation %" / 100, 1);
    end;

    procedure RecalculateMemoMembers(ImprestMemo: Record "Imprest Memo")
    var
        ProjectMember: Record "Project Members";
    begin
        ProjectMember.Reset();
        ProjectMember.SetRange("Imprest Memo No.", ImprestMemo."No.");
        ProjectMember.SetRange(Type, ProjectMember.Type::Person);
        if ProjectMember.FindSet(true) then
            repeat
                ProjectMember."Accommodation Provided" := ImprestMemo."Accommodation Provided";
                if ProjectMember."Time Period" <> 0 then
                    ProjectMember.Validate("Time Period");
                ProjectMember.Modify(true);
            until ProjectMember.Next() = 0;
    end;

    procedure CreateCompanionImprest(PerDiemImprest: Record payments; NoSeriesCode: Code[20]; var CompanionImprest: Record payments)
    var
        NoSeries: Codeunit "No. Series";
    begin
        CompanionImprest := PerDiemImprest;
        CompanionImprest."No." := NoSeries.GetNextNo(NoSeriesCode, Today, true);
        CompanionImprest."Per Diem through Payroll" := false;
        CompanionImprest."Accommodation Provided" := false;
        CompanionImprest."PD No. of Days" := 0;
        CompanionImprest.Insert(true);
    end;

    procedure RemoveEmptyCompanionImprest(CompanionImprest: Record payments)
    var
        ImprestLine: Record "Imprest Lines";
        Companion: Record payments;
    begin
        ImprestLine.Reset();
        ImprestLine.SetRange(No, CompanionImprest."No.");
        if not ImprestLine.IsEmpty() then
            exit;
        if Companion.Get(CompanionImprest."No.") then
            Companion.Delete();
    end;

    procedure CheckNotPerDiemForSurrender(ImprestNo: Code[20])
    var
        Imprest: Record payments;
    begin
        if ImprestNo = '' then
            exit;
        if Imprest.Get(ImprestNo) then
            if Imprest."Per Diem through Payroll" then
                Error(PerDiemSurrenderErr, ImprestNo);
    end;

    local procedure GetOpenPeriod(IsDirector: Boolean; var PeriodStart: Date; var PayDate: Date)
    var
        PayrollPeriod: Record "Payroll PeriodX";
        DirectorPayrollPeriod: Record "Director Payroll Period";
    begin
        if IsDirector then begin
            DirectorPayrollPeriod.Reset();
            DirectorPayrollPeriod.SetRange(Closed, false);
            if not DirectorPayrollPeriod.FindFirst() then
                Error(NoOpenPeriodErr);
            if DirectorPayrollPeriod."Pay Date" = 0D then
                Error(PayDateMissingErr, DirectorPayrollPeriod."Starting Date");
            PeriodStart := DirectorPayrollPeriod."Starting Date";
            PayDate := DirectorPayrollPeriod."Pay Date";
            exit;
        end;
        PayrollPeriod.Reset();
        PayrollPeriod.SetRange(Closed, false);
        if not PayrollPeriod.FindFirst() then
            Error(NoOpenPeriodErr);
        if PayrollPeriod."Pay Date" = 0D then
            Error(PayDateMissingErr, PayrollPeriod."Starting Date");
        PeriodStart := PayrollPeriod."Starting Date";
        PayDate := PayrollPeriod."Pay Date";
    end;

    procedure PostEarlyPerDiem(var Imprest: Record payments)
    var
        CMSetup: Record "Cash Management Setup";
        GenJnLine: Record "Gen. Journal Line";
        PeriodStart: Date;
        PayDate: Date;
    begin
        if not Confirm(PostConfirmQst, false, Imprest."No.") then
            exit;
        Imprest.TestField(Status, Imprest.Status::Released);
        Imprest.TestField(Posted, false);
        if Imprest."PD Payroll Period" <> 0D then
            Error(InPayrollErr, Imprest."No.", Imprest."PD Payroll Period");
        GetOpenPeriod(Imprest."Account Type" = Imprest."Account Type"::Vendor, PeriodStart, PayDate);
        if Imprest."Travel Date" >= PayDate then
            Error(TravelAfterPayDateErr, Imprest."Travel Date", Imprest."No.", PayDate);

        GetSetup();
        PerDiemSetup.TestField("Per Diem Clearing Account");
        Imprest.TestField("Account No.");
        Imprest.TestField("Paying Bank Account");
        Imprest.TestField(Payee);
        Imprest.TestField("Pay Mode");
        Imprest.TestField("Posting Date");
        if Imprest."Pay Mode" = 'CHEQUE' then begin
            Imprest.TestField("Cheque No");
            Imprest.TestField("Cheque Date");
        end;
        Imprest.CalcFields("Imprest Amount", ConvertedAmount);
        Imprest.TestField("Imprest Amount");

        CMSetup.Get();
        CMSetup.TestField("IMPREST Journal Batch Name");
        CMSetup.TestField("Imprest Journal Template");
        GenJnLine.Reset();
        GenJnLine.SetRange("Journal Template Name", CMSetup."Imprest Journal Template");
        GenJnLine.SetRange("Journal Batch Name", CMSetup."IMPREST Journal Batch Name");
        GenJnLine.DeleteAll();

        GenJnLine.Init();
        GenJnLine."Journal Template Name" := CMSetup."Imprest Journal Template";
        GenJnLine."Journal Batch Name" := CMSetup."IMPREST Journal Batch Name";
        GenJnLine."Line No." := 1000;
        GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
        GenJnLine."Account No." := Imprest."Paying Bank Account";
        GenJnLine."Posting Date" := Imprest."Posting Date";
        GenJnLine."Document No." := Imprest."No.";
        GenJnLine."External Document No." := Imprest."Cheque No";
        GenJnLine.Description := CopyStr('Per diem ' + Imprest."No." + ' ' + Imprest.Payee, 1, MaxStrLen(GenJnLine.Description));
        GenJnLine."Currency Code" := '';
        GenJnLine.Amount := -Imprest.ConvertedAmount;
        GenJnLine.Validate(Amount);
        GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"G/L Account";
        GenJnLine."Bal. Account No." := PerDiemSetup."Per Diem Clearing Account";
        GenJnLine.Validate("Bal. Account No.");
        GenJnLine."Shortcut Dimension 1 Code" := Imprest."Shortcut Dimension 1 Code";
        GenJnLine.Validate("Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := Imprest."Shortcut Dimension 2 Code";
        GenJnLine.Validate("Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
        GenJnLine.Validate("Dimension Set ID");
        GenJnLine.Insert();
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

        Imprest.Posted := true;
        Imprest."Posted By" := CopyStr(UserId(), 1, MaxStrLen(Imprest."Posted By"));
        Imprest."Posted Date" := Today;
        Imprest."Time Posted" := Time;
        Imprest.Surrendered := true;
        Imprest."PD Paid Early" := true;
        ReverseCommitment(Imprest);
        Imprest.Modify();
    end;

    procedure ProcessEmployeePerDiems(EmployeeNo: Code[20]; PeriodStart: Date)
    var
        Employee: Record Employee;
        Imprest: Record payments;
        TempImprest: Record payments temporary;
        AssignmentMatrix: Record "Assignment Matrix-X";
        NonTaxableAmount: Decimal;
        TaxableAmount: Decimal;
    begin
        GetSetup();
        if (PerDiemSetup."PD Non-Taxable Earning" = '') or (PerDiemSetup."PD Taxable Earning" = '') or (PerDiemSetup."PD Advance Deduction" = '') then
            exit;
        if not Employee.Get(EmployeeNo) then
            exit;

        AssignmentMatrix.Reset();
        AssignmentMatrix.SetRange("Employee No", EmployeeNo);
        AssignmentMatrix.SetRange("Payroll Period", PeriodStart);
        AssignmentMatrix.SetFilter(Code, '%1|%2|%3', PerDiemSetup."PD Non-Taxable Earning", PerDiemSetup."PD Taxable Earning", PerDiemSetup."PD Advance Deduction");
        AssignmentMatrix.SetFilter("Reference No", '<>%1', '');
        AssignmentMatrix.DeleteAll();

        Imprest.Reset();
        Imprest.SetRange("Payment Type", Imprest."Payment Type"::Imprest);
        Imprest.SetRange("Per Diem through Payroll", true);
        Imprest.SetRange("Account Type", Imprest."Account Type"::Employee);
        Imprest.SetRange("Account No.", EmployeeNo);
        Imprest.SetRange(Status, Imprest.Status::Released);
        Imprest.SetRange("Archive Document", false);
        Imprest.SetFilter("PD Payroll Period", '%1|%2', 0D, PeriodStart);
        if Imprest.FindSet() then
            repeat
                TempImprest := Imprest;
                TempImprest.Insert();
            until Imprest.Next() = 0;

        if TempImprest.FindSet() then
            repeat
                Imprest.Get(TempImprest."No.");
                Imprest.CalcFields("Imprest Amount");
                if Imprest."Imprest Amount" > 0 then begin
                    SplitAmount(Imprest."Imprest Amount", Imprest."PD No. of Days", NonTaxableAmount, TaxableAmount);
                    InsertAssignmentLine(Employee, AssignmentMatrix.Type::Payment, PerDiemSetup."PD Non-Taxable Earning", PeriodStart, Imprest."No.", NonTaxableAmount);
                    InsertAssignmentLine(Employee, AssignmentMatrix.Type::Payment, PerDiemSetup."PD Taxable Earning", PeriodStart, Imprest."No.", TaxableAmount);
                    if Imprest."PD Paid Early" then
                        InsertAssignmentLine(Employee, AssignmentMatrix.Type::Deduction, PerDiemSetup."PD Advance Deduction", PeriodStart, Imprest."No.", Imprest."Imprest Amount");
                    Imprest."PD Payroll Period" := PeriodStart;
                    ReverseCommitment(Imprest);
                    Imprest.Modify();
                end;
            until TempImprest.Next() = 0;
    end;

    local procedure SplitAmount(TotalAmount: Decimal; NoOfDays: Decimal; var NonTaxableAmount: Decimal; var TaxableAmount: Decimal)
    begin
        NonTaxableAmount := TotalAmount;
        if NoOfDays > 0 then
            if TotalAmount > Round(PerDiemSetup."Daily Tax-Free Limit" * NoOfDays, 1) then
                NonTaxableAmount := Round(PerDiemSetup."Daily Tax-Free Limit" * NoOfDays, 1);
        TaxableAmount := TotalAmount - NonTaxableAmount;
    end;

    local procedure InsertAssignmentLine(Employee: Record Employee; LineType: Integer; EDCode: Code[20]; PeriodStart: Date; ImprestNo: Code[20]; LineAmount: Decimal)
    var
        AssignmentMatrix: Record "Assignment Matrix-X";
    begin
        if LineAmount = 0 then
            exit;
        AssignmentMatrix.Init();
        AssignmentMatrix."Employee No" := Employee."No.";
        AssignmentMatrix.Type := LineType;
        AssignmentMatrix.Code := EDCode;
        AssignmentMatrix.Validate(Code);
        AssignmentMatrix."Payroll Period" := PeriodStart;
        AssignmentMatrix.Validate("Payroll Period");
        AssignmentMatrix."Reference No" := ImprestNo;
        AssignmentMatrix.Description := CopyStr(AssignmentMatrix.Description + ' ' + ImprestNo, 1, MaxStrLen(AssignmentMatrix.Description));
        AssignmentMatrix."Department Code" := Employee."Global Dimension 1 Code";
        AssignmentMatrix."Profit Centre" := Employee."Global Dimension 2 Code";
        AssignmentMatrix."Posting Group Filter" := Employee."Posting Group";
        AssignmentMatrix."Salary Pointer" := Employee."Salary Scale";
        AssignmentMatrix."Pay Mode" := Employee."Payroll Pay Mode";
        AssignmentMatrix.Validate(Amount, LineAmount);
        AssignmentMatrix.Insert();
    end;

    procedure ProcessDirectorPerDiemEarnings(DirectorNo: Code[20]; PeriodStart: Date)
    var
        Imprest: Record payments;
        TempImprest: Record payments temporary;
        DirectorLedgerEntry: Record "Director Ledger Entry";
        NonTaxableAmount: Decimal;
        TaxableAmount: Decimal;
        NonTaxableTotal: Decimal;
        TaxableTotal: Decimal;
    begin
        GetSetup();
        if (PerDiemSetup."Dir. PD Non-Taxable Earning" = '') or (PerDiemSetup."Dir. PD Taxable Earning" = '') then
            exit;

        Imprest.Reset();
        Imprest.SetRange("Payment Type", Imprest."Payment Type"::Imprest);
        Imprest.SetRange("Per Diem through Payroll", true);
        Imprest.SetRange("Account Type", Imprest."Account Type"::Vendor);
        Imprest.SetRange("Account No.", DirectorNo);
        Imprest.SetRange(Status, Imprest.Status::Released);
        Imprest.SetRange("Archive Document", false);
        Imprest.SetFilter("PD Payroll Period", '%1|%2', 0D, PeriodStart);
        if Imprest.FindSet() then
            repeat
                TempImprest := Imprest;
                TempImprest.Insert();
            until Imprest.Next() = 0;

        if TempImprest.FindSet() then
            repeat
                Imprest.Get(TempImprest."No.");
                Imprest.CalcFields("Imprest Amount");
                if Imprest."Imprest Amount" > 0 then begin
                    SplitAmount(Imprest."Imprest Amount", Imprest."PD No. of Days", NonTaxableAmount, TaxableAmount);
                    NonTaxableTotal += NonTaxableAmount;
                    TaxableTotal += TaxableAmount;
                    Imprest."PD Payroll Period" := PeriodStart;
                    ReverseCommitment(Imprest);
                    Imprest.Modify();
                end;
            until TempImprest.Next() = 0;

        SetDirectorLine(DirectorNo, DirectorLedgerEntry.Type::Payment, PerDiemSetup."Dir. PD Non-Taxable Earning", PeriodStart, NonTaxableTotal);
        SetDirectorLine(DirectorNo, DirectorLedgerEntry.Type::Payment, PerDiemSetup."Dir. PD Taxable Earning", PeriodStart, TaxableTotal);
    end;

    procedure ProcessDirectorPerDiemDeductions(DirectorNo: Code[20]; PeriodStart: Date)
    var
        Imprest: Record payments;
        DirectorLedgerEntry: Record "Director Ledger Entry";
        AdvanceTotal: Decimal;
    begin
        GetSetup();
        if PerDiemSetup."Dir. PD Advance Deduction" = '' then
            exit;
        Imprest.Reset();
        Imprest.SetRange("Payment Type", Imprest."Payment Type"::Imprest);
        Imprest.SetRange("Per Diem through Payroll", true);
        Imprest.SetRange("Account Type", Imprest."Account Type"::Vendor);
        Imprest.SetRange("Account No.", DirectorNo);
        Imprest.SetRange(Status, Imprest.Status::Released);
        Imprest.SetRange("PD Paid Early", true);
        Imprest.SetRange("PD Payroll Period", PeriodStart);
        if Imprest.FindSet() then
            repeat
                Imprest.CalcFields("Imprest Amount");
                AdvanceTotal += Imprest."Imprest Amount";
            until Imprest.Next() = 0;
        SetDirectorLine(DirectorNo, DirectorLedgerEntry.Type::Deduction, PerDiemSetup."Dir. PD Advance Deduction", PeriodStart, AdvanceTotal);
    end;

    local procedure SetDirectorLine(DirectorNo: Code[20]; LineType: Integer; EDCode: Code[20]; PeriodStart: Date; LineAmount: Decimal)
    var
        DirectorLedgerEntry: Record "Director Ledger Entry";
    begin
        DirectorLedgerEntry.Reset();
        DirectorLedgerEntry.SetRange("Director No", DirectorNo);
        DirectorLedgerEntry.SetRange(Type, LineType);
        DirectorLedgerEntry.SetRange(Code, EDCode);
        DirectorLedgerEntry.SetRange("Payroll Period", PeriodStart);
        DirectorLedgerEntry.DeleteAll();
        if LineAmount = 0 then
            exit;
        DirectorLedgerEntry.Init();
        DirectorLedgerEntry."Director No" := DirectorNo;
        DirectorLedgerEntry."Payroll Period" := PeriodStart;
        DirectorLedgerEntry.Validate("Director No");
        DirectorLedgerEntry.Type := LineType;
        DirectorLedgerEntry.Code := EDCode;
        DirectorLedgerEntry.Validate(Code);
        DirectorLedgerEntry."Payroll Period" := PeriodStart;
        DirectorLedgerEntry.Validate("Payroll Period");
        if DirectorLedgerEntry.Type = DirectorLedgerEntry.Type::Deduction then
            DirectorLedgerEntry.Amount := -Abs(LineAmount)
        else
            DirectorLedgerEntry.Amount := Abs(LineAmount);
        DirectorLedgerEntry.Validate(Amount);
        DirectorLedgerEntry.Insert();
    end;

    procedure ReverseCommitment(var Imprest: Record payments)
    var
        ImprestLine: Record "Imprest Lines";
        CustomFunction: Codeunit "Custom Function";
        CommitmentType: Enum "Commitment Type";
        CommitmentDocType: Enum "Commitment Document Type";
    begin
        if Imprest."PD Commitment Reversed" then
            exit;
        ImprestLine.Reset();
        ImprestLine.SetRange(No, Imprest."No.");
        if ImprestLine.FindSet() then
            repeat
                CustomFunction.FnCommitAmount(-ImprestLine.Amount, "Gen. Journal Account Type"::"G/L Account", ImprestLine."Account No.", CustomFunction.GetBudgetYear(Imprest.Date), Imprest."No.", CommitmentDocType::Payment, Imprest."Shortcut Dimension 1 Code", Imprest."Shortcut Dimension 2 Code", Imprest."Shortcut Dimension 3 Code", Imprest.Date, CommitmentType::Reversal, CopyStr('Per diem paid ' + ImprestLine.Purpose, 1, 250));
            until ImprestLine.Next() = 0;
        Imprest."PD Commitment Reversed" := true;
    end;

    local procedure CommitImprest(var Imprest: Record payments)
    var
        ImprestLine: Record "Imprest Lines";
        CustomFunction: Codeunit "Custom Function";
        CommitmentType: Enum "Commitment Type";
        CommitmentDocType: Enum "Commitment Document Type";
    begin
        ImprestLine.Reset();
        ImprestLine.SetRange(No, Imprest."No.");
        if ImprestLine.FindSet() then
            repeat
                CustomFunction.FnCommitAmount(ImprestLine.Amount, "Gen. Journal Account Type"::"G/L Account", ImprestLine."Account No.", CustomFunction.GetBudgetYear(Imprest.Date), Imprest."No.", CommitmentDocType::Payment, Imprest."Shortcut Dimension 1 Code", Imprest."Shortcut Dimension 2 Code", Imprest."Shortcut Dimension 3 Code", Imprest.Date, CommitmentType::Committed, CopyStr('Per diem ' + ImprestLine.Purpose, 1, 250));
            until ImprestLine.Next() = 0;
        Imprest."PD Commitment Reversed" := false;
    end;

    procedure SaveDirectorApplication(DirectorNo: Code[20]; ApplicationNo: Code[20]; Purpose: Text; Destination: Text; TravelDate: Date; NoOfDays: Decimal; Accommodation: Boolean): Code[20]
    var
        Vendor: Record Vendor;
        Imprest: Record payments;
        ImprestLine: Record "Imprest Lines";
        ResourceCost: Record "Resource Cost";
        FullAmount: Decimal;
        LineAmount: Decimal;
    begin
        GetSetup();
        PerDiemSetup.TestField("Director Per Diem Work Type");
        PerDiemSetup.TestField("Director Per Diem G/L Account");
        Vendor.Get(DirectorNo);
        if not ResourceCost.Get(ResourceCost.Type::All, '', PerDiemSetup."Director Per Diem Work Type") then
            Error(NoRateErr, PerDiemSetup."Director Per Diem Work Type");

        if ApplicationNo = '' then begin
            Imprest.Init();
            Imprest."No." := '';
            Imprest."Payment Type" := Imprest."Payment Type"::Imprest;
            Imprest."Document Type" := Imprest."Document Type"::Imprest;
            Imprest.Date := Today;
            Imprest.Insert(true);
        end else begin
            Imprest.Get(ApplicationNo);
            if (Imprest."Account No." <> DirectorNo) or (not Imprest."Per Diem through Payroll") then
                Error(NotDirectorAppErr, ApplicationNo, DirectorNo);
            Imprest.TestField(Status, Imprest.Status::Open);
        end;

        FullAmount := Round(ResourceCost."Direct Unit Cost" * NoOfDays, 1);
        LineAmount := FullAmount;
        if Accommodation then
            LineAmount := Round(FullAmount * PerDiemSetup."Accommodation %" / 100, 1);

        Imprest."Account Type" := Imprest."Account Type"::Vendor;
        Imprest."Account No." := DirectorNo;
        Imprest."Account Name" := CopyStr(Vendor.Name, 1, MaxStrLen(Imprest."Account Name"));
        Imprest.Payee := CopyStr(Vendor.Name, 1, MaxStrLen(Imprest.Payee));
        Imprest."Travel Date" := TravelDate;
        Imprest."Payment Narration" := CopyStr(Purpose, 1, MaxStrLen(Imprest."Payment Narration"));
        Imprest.Purpose := CopyStr(Purpose, 1, MaxStrLen(Imprest.Purpose));
        Imprest.Description := CopyStr(Purpose, 1, MaxStrLen(Imprest.Description));
        Imprest."Destination Narration" := CopyStr(Destination, 1, MaxStrLen(Imprest."Destination Narration"));
        Imprest."Shortcut Dimension 1 Code" := Vendor."Global Dimension 1 Code";
        Imprest."Shortcut Dimension 2 Code" := Vendor."Global Dimension 2 Code";
        Imprest."Created By" := CopyStr(DirectorNo, 1, MaxStrLen(Imprest."Created By"));
        Imprest."Per Diem through Payroll" := true;
        Imprest."Accommodation Provided" := Accommodation;
        Imprest."PD No. of Days" := NoOfDays;
        Imprest.Modify();

        ImprestLine.Reset();
        ImprestLine.SetRange(No, Imprest."No.");
        ImprestLine.DeleteAll();

        ImprestLine.Init();
        ImprestLine.No := Imprest."No.";
        ImprestLine."Line No" := 1000;
        ImprestLine."Account Type" := ImprestLine."Account Type"::"G/L Account";
        ImprestLine."Account No." := PerDiemSetup."Director Per Diem G/L Account";
        ImprestLine.Validate("Account No.");
        ImprestLine.Purpose := CopyStr(Purpose, 1, MaxStrLen(ImprestLine.Purpose));
        ImprestLine."Daily Rate" := ResourceCost."Direct Unit Cost";
        ImprestLine."No. of Days" := NoOfDays;
        ImprestLine.Amount := LineAmount;
        ImprestLine.Validate(Amount);
        ImprestLine."Employee No" := DirectorNo;
        ImprestLine.Insert();

        exit(Imprest."No.");
    end;

    procedure SubmitDirectorApplication(DirectorNo: Code[20]; ApplicationNo: Code[20]): Boolean
    var
        Imprest: Record payments;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        Imprest.Get(ApplicationNo);
        if (Imprest."Account No." <> DirectorNo) or (not Imprest."Per Diem through Payroll") then
            Error(NotDirectorAppErr, ApplicationNo, DirectorNo);
        Imprest.TestField(Status, Imprest.Status::Open);
        VarVariant := Imprest;
        if not CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
            exit(false);
        CommitImprest(Imprest);
        Imprest.Modify();
        VarVariant := Imprest;
        CustomApprovals.OnSendDocForApproval(VarVariant);
        exit(true);
    end;

    procedure CancelDirectorApplication(DirectorNo: Code[20]; ApplicationNo: Code[20])
    var
        Imprest: Record payments;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        Imprest.Get(ApplicationNo);
        if (Imprest."Account No." <> DirectorNo) or (not Imprest."Per Diem through Payroll") then
            Error(NotDirectorAppErr, ApplicationNo, DirectorNo);
        Imprest.TestField(Status, Imprest.Status::"Pending Approval");
        VarVariant := Imprest;
        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
        Imprest.Get(ApplicationNo);
        ReverseCommitment(Imprest);
        Imprest.Modify();
    end;

    procedure GetDirectorApplications(DirectorNo: Code[20]): Text
    var
        Imprest: Record payments;
        JArray: JsonArray;
        JObject: JsonObject;
        Result: Text;
    begin
        Imprest.Reset();
        Imprest.SetRange("Payment Type", Imprest."Payment Type"::Imprest);
        Imprest.SetRange("Per Diem through Payroll", true);
        Imprest.SetRange("Account Type", Imprest."Account Type"::Vendor);
        Imprest.SetRange("Account No.", DirectorNo);
        if Imprest.FindSet() then
            repeat
                Imprest.CalcFields("Imprest Amount");
                Clear(JObject);
                JObject.Add('no', Imprest."No.");
                JObject.Add('date', Format(Imprest.Date, 0, 9));
                JObject.Add('travelDate', Format(Imprest."Travel Date", 0, 9));
                JObject.Add('purpose', Imprest."Payment Narration");
                JObject.Add('destination', Imprest."Destination Narration");
                JObject.Add('noOfDays', Imprest."PD No. of Days");
                JObject.Add('accommodation', Imprest."Accommodation Provided");
                JObject.Add('amount', Imprest."Imprest Amount");
                JObject.Add('status', Format(Imprest.Status));
                JObject.Add('paidEarly', Imprest."PD Paid Early");
                JObject.Add('payrollPeriod', Format(Imprest."PD Payroll Period", 0, 9));
                JArray.Add(JObject);
            until Imprest.Next() = 0;
        JArray.WriteTo(Result);
        exit(Result);
    end;
}
