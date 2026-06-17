#pragma warning disable AA0005,AL0603, AA0008, AA0018,AL0432, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

codeunit 50021 "Leave Plan Management"
{
    trigger OnRun()
    begin
    end;

    var
        Text001: Label 'Mon,Tue,Wed,Thu,Fri,Sat,Sun';
        Text002: Label '%1 is already defined as Leave Plan Owner User ID for Employee No. %2 with type %3.', Comment = 'User1 is already defined as Employees for Employee No.';
        Text003: Label 'Leave Plan Header %1 is not found.', Comment = 'Leave Plan Header Archive 10 is not found.';
        Text004: Label 'cannot be greater than %1 %2.', Comment = '%1 - Quantity, %2 - Unit of measure. Example: Quantity cannot be greater than 8 HOUR.';
        Text005: Label 'Leave Plan Header Archive %1 is not found.', Comment = 'Leave Plan Header Archive 10 is not found.';
        NoLinesToCopyErr: Label 'There are no Leave Plan lines to copy.';
        CopyLinesQst: Label 'Do you want to copy lines from the previous Leave Plan (%1)?', Comment = '%1 - number';
        JobPlanningLinesNotFoundErr: Label 'Could not find job planning lines.';
        CreateLinesQst: Label 'Do you want to create lines from job planning (%1)?', Comment = '%1 - number';
        PageDataCaptionTxt: Label '%1 (%2)', Comment = '%1 - start date, %2 - Description,';

#if not CLEAN22
    [Obsolete('Remove old Leave Plan experience.', '22.0')]
    procedure LeavePlanV2Enabled() Result: Boolean
    var
        HumanResourcesSetup: Record "Human Resources Setup";
    begin
        if HumanResourcesSetup.Get() then
            Result := HumanResourcesSetup."Use New Leave Plan Experience";

        Result := true;

        OnAfterLeavePlanV2Enabled(Result);
    end;

    internal procedure GetLeavePlanV2FeatureKey(): Text[50]
    begin
        exit('NewLeavePlanExperience');
    end;
#endif

    procedure FilterLeavePlans(var LeavePlanHeader: Record "Leave Plan Header"; FieldNo: Integer)
    var
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeFilterLeavePlans(LeavePlanHeader, FieldNo, IsHandled);
        If IsHandled then
            exit;

        if UserSetup.Get(UserId) then;
        if not UserSetup."System Admin" then begin
            LeavePlanHeader.FilterGroup(2);
            case FieldNo of
                LeavePlanHeader.FieldNo("Owner User ID"):
                    LeavePlanHeader.SetRange("Owner User ID", UserId);
                LeavePlanHeader.FieldNo("Approver User ID"):
                    LeavePlanHeader.SetRange("Approver User ID", UserId);
            end;
            LeavePlanHeader.FilterGroup(0);
        end;
    end;

    procedure FilterAllLeavePlanLines(var LeavePlanLines: Record "Leave Plan Lines"; ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject)
    begin
        LeavePlanLines.FilterGroup(2);
        // LeavePlanLines.SetFilter(Type, '<>%1', LeavePlanLines.Type::" ");
        LeavePlanLines.FilterGroup(0);
        case ActionType of
            ActionType::Submit:
                LeavePlanLines.SetRange(Status, LeavePlanLines.Status::Open);
            ActionType::ReopenSubmitted:
                LeavePlanLines.SetFilter(Status, '%1|%2', LeavePlanLines.Status::Submitted, LeavePlanLines.Status::Rejected);
            ActionType::Reject,
            ActionType::Approve:
                LeavePlanLines.SetRange(Status, LeavePlanLines.Status::Submitted);
            ActionType::ReopenApproved:
                LeavePlanLines.SetFilter(Status, '%1|%2', LeavePlanLines.Status::Approved, LeavePlanLines.Status::Rejected);
        end;

        OnAfterFilterAllLines(LeavePlanLines, ActionType);
    end;

    procedure CheckLeavePlanNo(var LeavePlanHeader: Record "Leave Plan Header"; LeavePlanNo: Code[20])
    begin
        LeavePlanHeader.SetRange("No.", LeavePlanNo);
        if LeavePlanHeader.IsEmpty() then
            Error(Text003, LeavePlanNo);
    end;

    procedure SetLeavePlanNo(LeavePlanNo: Code[20]; var LeavePlanLines: Record "Leave Plan Lines")
    begin
        LeavePlanLines.FilterGroup(2);
        LeavePlanLines.SetRange("Leave Plan No.", LeavePlanNo);
        LeavePlanLines.FilterGroup(0);
        LeavePlanLines."Leave Plan No." := LeavePlanNo;
    end;

    procedure LookupOwnerLeavePlan(var LeavePlanNo: Code[20]; var LeavePlanLines: Record "Leave Plan Lines"; var LeavePlanHeader: Record "Leave Plan Header")
    var
        LeavePlanList: Page "Leave Plan List";
    begin
        Commit();
        if LeavePlanNo <> '' then begin
            LeavePlanHeader.Get(LeavePlanNo);
            LeavePlanList.SetRecord(LeavePlanHeader);
        end;

        LeavePlanList.LookupMode := true;
        if LeavePlanList.RunModal() = ACTION::LookupOK then begin
            LeavePlanList.GetRecord(LeavePlanHeader);
            LeavePlanNo := LeavePlanHeader."No.";
            SetLeavePlanNo(LeavePlanNo, LeavePlanLines);
        end;
    end;

    // procedure LookupApproverLeavePlan(var LeavePlanNo: Code[20]; var LeavePlanLines: Record "Leave Plan Lines"; var LeavePlanHeader: Record "Leave Plan Header")
    // var
    //     ManagerLeavePlanList: Page "Manager Leave Plan List";
    // begin
    //     Commit();
    //     if LeavePlanNo <> '' then begin
    //         LeavePlanHeader.Get(LeavePlanNo);
    //         ManagerLeavePlanList.SetRecord(LeavePlanHeader);
    //     end;

    //     ManagerLeavePlanList.LookupMode := true;
    //     if ManagerLeavePlanList.RunModal() = ACTION::LookupOK then begin
    //         ManagerLeavePlanList.GetRecord(LeavePlanHeader);
    //         LeavePlanNo := LeavePlanHeader."No.";
    //         SetLeavePlanNo(LeavePlanNo, LeavePlanLines);
    //     end;
    // end;

    procedure FormatDate(Date: Date; DOWFormatType: Option Full,Short): Text[30]
    begin
        case DOWFormatType of
            DOWFormatType::Full:
                exit(StrSubstNo('%1 %2', Date2DMY(Date, 1), Format(Date, 0, '<Weekday Text>')));
            DOWFormatType::Short:
                exit(StrSubstNo('%1 %2', Date2DMY(Date, 1), SelectStr(Date2DWY(Date, 1), Text001)));
        end;
    end;

    procedure CheckAccPeriod(Date: Date)
    var
        AccountingPeriod: Record "Accounting Period";
    begin
        if AccountingPeriod.IsEmpty() then
            exit;
        AccountingPeriod.SetFilter("Starting Date", '..%1', Date);
        AccountingPeriod.FindLast();
        AccountingPeriod.TestField(Closed, false);
    end;

    procedure CheckEmployeeLeavePlanOwner(LeavePlanOwnerUserID: Code[50]; CurrEmployeeNo: Code[20])
    var
        Employee: Record Employee;
    begin
        Employee.Reset();
        Employee.SetFilter("No.", '<>%1', CurrEmployeeNo);
        Employee.SetRange("User ID", LeavePlanOwnerUserID);
        if Employee.FindFirst() then
            Error(
              Text002,
              LeavePlanOwnerUserID,
              Employee."No.");
    end;

    // procedure CalcStatusFactBoxData(var LeavePlanHeader: Record "Leave Plan Header"; var OpenQty: Decimal; var SubmittedQty: Decimal; var RejectedQty: Decimal; var ApprovedQty: Decimal; var PostedQty: Decimal; var TotalQuantity: Decimal)
    // var
    //     Status: Enum "Leave Plan Status";
    // begin
    //     TotalQuantity := 0;
    //     LeavePlanHeader.SetRange("Date Filter", LeavePlanHeader."Starting Date", LeavePlanHeader."Ending Date");
    //     OnCalcStatusFactBoxDataOnAfterLeavePlanHeaderSetFilters(LeavePlanHeader);
    //     OpenQty := LeavePlanHeader.CalcQtyWithStatus(Status::Open);

    //     SubmittedQty := LeavePlanHeader.CalcQtyWithStatus(Status::Submitted);

    //     RejectedQty := LeavePlanHeader.CalcQtyWithStatus(Status::Rejected);

    //     ApprovedQty := LeavePlanHeader.CalcQtyWithStatus(Status::Approved);

    //     LeavePlanHeader.SetRange("Status Filter");
    //     LeavePlanHeader.CalcFields(Quantity);
    //     LeavePlanHeader.CalcFields("Posted Quantity");
    //     TotalQuantity := LeavePlanHeader.Quantity;
    //     PostedQty := LeavePlanHeader."Posted Quantity";
    // end;

    // procedure CalcActSchedFactBoxData(LeavePlanHeader: Record "Leave Plan Header"; var DateDescription: array[7] of Text[30]; var DateQuantity: array[7] of Text[30]; var TotalQtyText: Text[30]; var TotalPresenceQty: Decimal; var AbsenceQty: Decimal)
    // var
    //     Employee: Record Employee;
    //     Calendar: Record Date;
    //     TotalSchedQty: Decimal;
    //     i: Integer;
    // begin
    //     TotalPresenceQty := 0;
    //     if Employee.Get(LeavePlanHeader."Employee No.") then begin
    //         Calendar.SetRange("Period Type", Calendar."Period Type"::Date);
    //         Calendar.SetRange("Period Start", LeavePlanHeader."Starting Date", LeavePlanHeader."Ending Date");
    //         if Calendar.FindSet() then
    //             repeat
    //                 i += 1;
    //                 DateDescription[i] := FormatDate(Calendar."Period Start", 0);
    //                 OnCalcActSchedFactBoxDataOnAfterSetDateDescription(LeavePlanHeader, Calendar, DateDescription[i]);
    //                 LeavePlanHeader.SetRange("Date Filter", Calendar."Period Start");
    //                 OnCalcActSchedFactBoxDataOnAfterLeavePlanHeaderSetFilters(LeavePlanHeader, Calendar);
    //                 LeavePlanHeader.CalcFields(Quantity);
    //                 Employee.SetRange("Date Filter", Calendar."Period Start");
    //                 OnCalcActSchedFactBoxDataOnBeforeResouceCalcFields(Employee, Calendar);
    //                 Employee.CalcFields(Capacity);
    //                 DateQuantity[i] := FormatActualSched(LeavePlanHeader.Quantity, Employee.Capacity);
    //                 TotalPresenceQty += LeavePlanHeader.Quantity;
    //                 TotalSchedQty += Employee.Capacity;
    //             until Calendar.Next() = 0;
    //         TotalQtyText := FormatActualSched(TotalPresenceQty, TotalSchedQty);
    //         LeavePlanHeader.SetRange("Type Filter", LeavePlanHeader."Type Filter"::Absence);
    //         LeavePlanHeader.SetRange("Date Filter", LeavePlanHeader."Starting Date", LeavePlanHeader."Ending Date");
    //         LeavePlanHeader.CalcFields(Quantity);
    //         AbsenceQty := LeavePlanHeader.Quantity;
    //     end;

    //     OnAfterCalcActSchedFactBoxData(LeavePlanHeader, TotalQtyText, TotalPresenceQty, AbsenceQty);
    // end;

    // procedure FormatActualSched(ActualQty: Decimal; ScheduledQty: Decimal): Text[30]
    // begin
    //     exit(
    //       Format(ActualQty, 0, '<Precision,2:2><Standard Format,0>') + '/' + Format(ScheduledQty, 0, '<Precision,2:2><Standard Format,0>'));
    // end;

    procedure FilterLeavePlansArchive(var LeavePlanHeaderArchive: Record "Leave Plan Header Archive"; FieldNo: Integer)
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId) then;
        if not UserSetup."Leave Plan Admin." then begin
            LeavePlanHeaderArchive.FilterGroup(2);
            case FieldNo of
                LeavePlanHeaderArchive.FieldNo("Owner User ID"):
                    LeavePlanHeaderArchive.SetRange("Owner User ID", UserId);
                LeavePlanHeaderArchive.FieldNo("Approver User ID"):
                    LeavePlanHeaderArchive.SetRange("Approver User ID", UserId);
            end;
            LeavePlanHeaderArchive.FilterGroup(0);
        end;
    end;

    // procedure CheckLeavePlanArchiveNo(var LeavePlanHeaderArchive: Record "Leave Plan Header Archive"; LeavePlanNo: Code[20])
    // begin
    //     LeavePlanHeaderArchive.SetRange("No.", LeavePlanNo);
    //     if LeavePlanHeaderArchive.IsEmpty() then
    //         Error(Text005, LeavePlanNo);
    // end;

    procedure GetLeavePlanDataCaption(LeavePlanHeader: Record "Leave Plan Header"): Text
    begin
        if LeavePlanHeader.Description = '' then
            exit(Format(LeavePlanHeader."Starting Date", 0, 4));

        exit(StrSubstNo(PageDataCaptionTxt, Format(LeavePlanHeader."Starting Date", 0, 4), LeavePlanHeader.Description));
    end;

    // procedure SetLeavePlanArchiveNo(LeavePlanNo: Code[20]; var LeavePlanLineArchive: Record "Leave Plan Lines Archive")
    // begin
    //     LeavePlanLineArchive.FilterGroup(2);
    //     LeavePlanLineArchive.SetRange("Leave Plan No.", LeavePlanNo);
    //     LeavePlanLineArchive.FilterGroup(0);
    //     LeavePlanLineArchive."Leave Plan No." := LeavePlanNo;
    // end;

    // procedure LookupOwnerLeavePlanArchive(var LeavePlanNo: Code[20]; var LeavePlanLineArchive: Record "Leave Plan Lines Archive"; var LeavePlanHeaderArchive: Record "Leave Plan Header Archive")
    // var
    //     LeavePlanArchiveList: Page "Leave Plan Archive List";
    // begin
    //     Commit();
    //     if LeavePlanNo <> '' then begin
    //         LeavePlanHeaderArchive.Get(LeavePlanNo);
    //         LeavePlanArchiveList.SetRecord(LeavePlanHeaderArchive);
    //     end;

    //     LeavePlanArchiveList.LookupMode := true;
    //     if LeavePlanArchiveList.RunModal() = ACTION::LookupOK then begin
    //         LeavePlanArchiveList.GetRecord(LeavePlanHeaderArchive);
    //         LeavePlanNo := LeavePlanHeaderArchive."No.";
    //         SetLeavePlanArchiveNo(LeavePlanNo, LeavePlanLineArchive);
    //     end;
    // end;

    // procedure LookupApproverLeavePlanArchive(var LeavePlanNo: Code[20]; var LeavePlanLineArchive: Record "Leave Plan Lines Archive"; var LeavePlanHeaderArchive: Record "Leave Plan Header Archive")
    // var
    //     ManagerLeavePlanArcList: Page "Manager Leave Plan Arc. List";
    // begin
    //     Commit();
    //     if LeavePlanNo <> '' then begin
    //         LeavePlanHeaderArchive.Get(LeavePlanNo);
    //         ManagerLeavePlanArcList.SetRecord(LeavePlanHeaderArchive);
    //     end;

    //     ManagerLeavePlanArcList.LookupMode := true;
    //     if ManagerLeavePlanArcList.RunModal() = ACTION::LookupOK then begin
    //         ManagerLeavePlanArcList.GetRecord(LeavePlanHeaderArchive);
    //         LeavePlanNo := LeavePlanHeaderArchive."No.";
    //         SetLeavePlanArchiveNo(LeavePlanNo, LeavePlanLineArchive);
    //     end;
    // end;

    // procedure CalcSummaryArcFactBoxData(LeavePlanHeaderArchive: Record "Leave Plan Header Archive"; var DateDescription: array[7] of Text[30]; var DateQuantity: array[7] of Decimal; var TotalQuantity: Decimal; var AbsenceQuantity: Decimal)
    // var
    //     Calendar: Record Date;
    //     i: Integer;
    // begin
    //     TotalQuantity := 0;
    //     Calendar.SetRange("Period Type", Calendar."Period Type"::Date);
    //     Calendar.SetRange("Period Start", LeavePlanHeaderArchive."Starting Date", LeavePlanHeaderArchive."Ending Date");
    //     if Calendar.FindSet() then
    //         repeat
    //             i += 1;
    //             DateDescription[i] := FormatDate(Calendar."Period Start", 0);
    //             LeavePlanHeaderArchive.SetRange("Date Filter", Calendar."Period Start");
    //             LeavePlanHeaderArchive.CalcFields(Quantity);
    //             DateQuantity[i] := LeavePlanHeaderArchive.Quantity;
    //             TotalQuantity += LeavePlanHeaderArchive.Quantity;
    //         until Calendar.Next() = 0;

    //     LeavePlanHeaderArchive.SetRange("Type Filter", LeavePlanHeaderArchive."Type Filter"::Absence);
    //     LeavePlanHeaderArchive.SetRange("Date Filter", LeavePlanHeaderArchive."Starting Date", LeavePlanHeaderArchive."Ending Date");
    //     LeavePlanHeaderArchive.CalcFields(Quantity);
    //     AbsenceQuantity := LeavePlanHeaderArchive.Quantity;
    // end;

    procedure MoveLeavePlanToArchive(LeavePlanHeader: Record "Leave Plan Header")
    var
        LeavePlanLines: Record "Leave Plan Lines";
        LeavePlanDetail: Record "Leave Plan Detail";
        LeavePlanCommentLine: Record "Leave Plan Comment Line";
        LeavePlanHeaderArchive: Record "Leave Plan Header Archive";
        LeavePlanLineArchive: Record "Leave Plan Line Archive";
        LeavePlanDetailArchive: Record "Leave Plan Detail Archive";
        LeavePlanCmtLineArchive: Record "Leave Plan Cmt. Line Archive";
    begin
        LeavePlanHeader.Check();

        LeavePlanHeaderArchive.TransferFields(LeavePlanHeader);
        OnBeforeLeavePlanHeaderArchiveInsert(LeavePlanHeaderArchive, LeavePlanHeader);
        LeavePlanHeaderArchive.Insert();

        LeavePlanLines.SetRange("Leave Plan No.", LeavePlanHeader."No.");
        if LeavePlanLines.FindSet() then begin
            repeat
                LeavePlanLineArchive.TransferFields(LeavePlanLines);
                OnBeforeLeavePlanLineArchiveInsert(LeavePlanLineArchive, LeavePlanLines);
                LeavePlanLineArchive.Insert();
            until LeavePlanLines.Next() = 0;
            LeavePlanLines.DeleteAll();
        end;

        LeavePlanDetail.SetRange("Leave Plan No.", LeavePlanHeader."No.");
        if LeavePlanDetail.FindSet() then begin
            repeat
                LeavePlanDetailArchive.TransferFields(LeavePlanDetail);
                OnBeforeLeavePlanDetailArchiveInsert(LeavePlanDetailArchive, LeavePlanDetail);
                LeavePlanDetailArchive.Insert();
            until LeavePlanDetail.Next() = 0;
            LeavePlanDetail.DeleteAll();
        end;

        LeavePlanCommentLine.SetRange("No.", LeavePlanHeader."No.");
        if LeavePlanCommentLine.FindSet() then begin
            repeat
                LeavePlanCmtLineArchive.TransferFields(LeavePlanCommentLine);
                OnBeforeLeavePlanCmtLineArchiveInsert(LeavePlanCmtLineArchive, LeavePlanCommentLine);
                LeavePlanCmtLineArchive.Insert();
            until LeavePlanCommentLine.Next() = 0;
            LeavePlanCommentLine.DeleteAll();
        end;

        LeavePlanHeader.Delete();
    end;

    procedure CheckCopyPrevLeavePlanLines(LeavePlanHeader: Record "Leave Plan Header")
    var
        QtyToBeCopied: Integer;
    begin
        QtyToBeCopied := CalcPrevLeavePlanLines(LeavePlanHeader);
        if QtyToBeCopied = 0 then
            Message(NoLinesToCopyErr)
        else
            if Confirm(CopyLinesQst, true, QtyToBeCopied) then
                CopyPrevLeavePlanLines(LeavePlanHeader);
    end;

    procedure CopyPrevLeavePlanLines(ToLeavePlanHeader: Record "Leave Plan Header")
    var
        FromLeavePlanHeader: Record "Leave Plan Header";
        FromLeavePlanLine: Record "Leave Plan Lines";
        ToLeavePlanLine: Record "Leave Plan Lines";
        LineNo: Integer;
        IsHandled: Boolean;
    begin
        LineNo := ToLeavePlanHeader.GetLastLineNo();

        FromLeavePlanHeader.Get(ToLeavePlanHeader."No.");
        FromLeavePlanHeader.SetCurrentKey("Employee No.", "Starting Date");
        FromLeavePlanHeader.SetRange("Employee No.", ToLeavePlanHeader."Employee No.");
        if FromLeavePlanHeader.Next(-1) <> 0 then begin
            FromLeavePlanLine.SetRange("Leave Plan No.", FromLeavePlanHeader."No.");
            // FromLeavePlanLine.SetFilter(Type, '<>%1&<>%2', FromLeavePlanLine.Type::Service, FromLeavePlanLine.Type::"Assembly Order");
            if FromLeavePlanLine.FindSet() then
                repeat
                    IsHandled := false;
                    OnCopyPrevLeavePlanLinesOnBeforeCopyLine(FromLeavePlanLine, IsHandled);
                    if not IsHandled then begin
                        LineNo := LineNo + 10000;
                        ToLeavePlanLine.Init();
                        ToLeavePlanLine."Leave Plan No." := ToLeavePlanHeader."No.";
                        ToLeavePlanLine."Line No." := LineNo;
                        ToLeavePlanLine."Leave Plan Starting Date" := ToLeavePlanHeader."Starting Date";
                        // ToLeavePlanLine.Type := FromLeavePlanLine.Type;
                        // case ToLeavePlanLine.Type of
                        //     ToLeavePlanLine.Type::Job:
                        //         begin
                        //             ToLeavePlanLine.Validate("Job No.", FromLeavePlanLine."Job No.");
                        //             ToLeavePlanLine.Validate("Job Task No.", FromLeavePlanLine."Job Task No.");
                        //         end;
                        //     ToLeavePlanLine.Type::Absence:
                        //         ToLeavePlanLine.Validate("Cause of Absence Code", FromLeavePlanLine."Cause of Absence Code");
                        // end;
                        ToLeavePlanLine.Description := FromLeavePlanLine.Description;
                        ToLeavePlanLine.Chargeable := FromLeavePlanLine.Chargeable;
                        // ToLeavePlanLine."Work Type Code" := FromLeavePlanLine."Work Type Code";
                        OnBeforeToLeavePlanLineInsert(ToLeavePlanLine, FromLeavePlanLine);
                        ToLeavePlanLine.Insert();

#if not CLEAN22
                        if LeavePlanV2Enabled() then
#endif
                        CopyLeavePlanLineDetails(ToLeavePlanLine, FromLeavePlanLine);
                    end;
                until FromLeavePlanLine.Next() = 0;
        end;

        OnAfterCopyPrevLeavePlanLines();
    end;

    local procedure CopyLeavePlanLineDetails(ToLeavePlanLine: Record "Leave Plan Lines"; FromLeavePlanLine: Record "Leave Plan Lines")
    var
        ToLeavePlanDetail: Record "Leave Plan Detail";
        FromLeavePlanDetail: Record "Leave Plan Detail";
    begin
        FromLeavePlanDetail.SetRange("Leave Plan No.", FromLeavePlanLine."Leave Plan No.");
        FromLeavePlanDetail.SetRange("Leave Plan Lines No.", FromLeavePlanLine."Line No.");
        if FromLeavePlanDetail.FindSet() then
            repeat
                ToLeavePlanDetail.Init();
                ToLeavePlanDetail.TransferFields(FromLeavePlanDetail);
                ToLeavePlanDetail."Leave Plan No." := ToLeavePlanLine."Leave Plan No.";
                ToLeavePlanDetail."Leave Plan Lines No." := ToLeavePlanLine."Line No.";
                ToLeavePlanDetail.Date := ToLeavePlanLine."Leave Plan Starting Date" + (FromLeavePlanDetail."Date" - FromLeavePlanLine."Leave Plan Starting Date");
                ToLeavePlanDetail.Status := "Leave Plan Status"::Open;
                ToLeavePlanDetail.Posted := false;
                // ToLeavePlanDetail."Posted Quantity" := 0;
                ToLeavePlanDetail.Insert();
            until FromLeavePlanDetail.Next() = 0;
    end;

    procedure CalcPrevLeavePlanLines(ToLeavePlanHeader: Record "Leave Plan Header") LinesQty: Integer
    var
        LeavePlanHeader: Record "Leave Plan Header";
        LeavePlanLines: Record "Leave Plan Lines";
    begin
        LeavePlanHeader.Get(ToLeavePlanHeader."No.");
        LeavePlanHeader.SetCurrentKey("Employee No.", "Starting Date");
        LeavePlanHeader.SetRange("Employee No.", ToLeavePlanHeader."Employee No.");
        if LeavePlanHeader.Next(-1) <> 0 then begin
            LeavePlanLines.SetRange("Leave Plan No.", LeavePlanHeader."No.");
            // LeavePlanLines.SetFilter(Type, '<>%1&<>%2', LeavePlanLines.Type::Service, LeavePlanLines.Type::"Assembly Order");
            LinesQty := LeavePlanLines.Count();
        end;
    end;

    procedure CheckCreateLinesFromJobPlanning(LeavePlanHeader: Record "Leave Plan Header"): Integer
    var
        QtyToBeCreated: Integer;
    begin
        QtyToBeCreated := CalcLinesFromJobPlanning(LeavePlanHeader);
        if QtyToBeCreated = 0 then
            Message(JobPlanningLinesNotFoundErr)
        else
            if Confirm(CreateLinesQst, true, QtyToBeCreated) then
                exit(CreateLinesFromJobPlanning(LeavePlanHeader));
    end;

    procedure CreateLinesFromJobPlanning(LeavePlanHeader: Record "Leave Plan Header") CreatedLinesQty: Integer
    var
        LeavePlanLines: Record "Leave Plan Lines";
        TempJobPlanningLine: Record "Job Planning Line" temporary;
        LineNo: Integer;
    begin
        LineNo := LeavePlanHeader.GetLastLineNo();

        FillJobPlanningBuffer(LeavePlanHeader, TempJobPlanningLine);

        TempJobPlanningLine.Reset();
        if TempJobPlanningLine.FindSet() then
            repeat
                LineNo := LineNo + 10000;
                CreatedLinesQty := CreatedLinesQty + 1;
                LeavePlanLines.Init();
                LeavePlanLines."Leave Plan No." := LeavePlanHeader."No.";
                LeavePlanLines."Line No." := LineNo;
                LeavePlanLines."Leave Plan Starting Date" := LeavePlanHeader."Starting Date";
                // LeavePlanLines.Validate(Type, LeavePlanLines.Type::Job);
                // LeavePlanLines.Validate("Job No.", TempJobPlanningLine."Job No.");
                // LeavePlanLines.Validate("Job Task No.", TempJobPlanningLine."Job Task No.");
                OnCreateLinesFromJobPlanningOnBeforeLeavePlanLineInsert(LeavePlanLines, TempJobPlanningLine);
                LeavePlanLines.Insert();
            until TempJobPlanningLine.Next() = 0;
    end;

    procedure CalcLinesFromJobPlanning(LeavePlanHeader: Record "Leave Plan Header"): Integer
    var
        TempJobPlanningLine: Record "Job Planning Line" temporary;
    begin
        FillJobPlanningBuffer(LeavePlanHeader, TempJobPlanningLine);
        exit(TempJobPlanningLine.Count);
    end;

    local procedure FillJobPlanningBuffer(LeavePlanHeader: Record "Leave Plan Header"; var JobPlanningLineBuffer: Record "Job Planning Line")
    var
        JobPlanningLine: Record "Job Planning Line";
        SkipLine: Boolean;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeFillJobPlanningBuffer(JobPlanningLine, JobPlanningLineBuffer, LeavePlanHeader, IsHandled);
        if IsHandled then
            exit;

        // JobPlanningLine.SetRange(Type, JobPlanningLine.Type::Employee);
        JobPlanningLine.SetRange("No.", LeavePlanHeader."Employee No.");
        JobPlanningLine.SetRange("Planning Date", LeavePlanHeader."Starting Date", LeavePlanHeader."Ending Date");
        if JobPlanningLine.FindSet() then
            repeat
                SkipLine := LeavePlanLineWithJobPlanningLineExists(LeavePlanHeader, JobPlanningLine);
                if not SkipLine then
                    SkipLine := JobPlanningLineIsNotValidForLeavePlanLine(JobPlanningLine);
                OnCheckInsertJobPlanningLine(JobPlanningLine, JobPlanningLineBuffer, SkipLine);
                if not SkipLine then begin
                    JobPlanningLineBuffer.SetRange("Job No.", JobPlanningLine."Job No.");
                    JobPlanningLineBuffer.SetRange("Job Task No.", JobPlanningLine."Job Task No.");
                    if JobPlanningLineBuffer.IsEmpty() then begin
                        JobPlanningLineBuffer."Job No." := JobPlanningLine."Job No.";
                        JobPlanningLineBuffer."Job Task No." := JobPlanningLine."Job Task No.";
                        OnFillJobPlanningBufferOnBeforeJobPlanningLineBufferInsert(JobPlanningLine, JobPlanningLineBuffer);
                        JobPlanningLineBuffer.Insert();
                    end;
                end;
            until JobPlanningLine.Next() = 0;
        JobPlanningLineBuffer.Reset();
    end;

    local procedure LeavePlanLineWithJobPlanningLineExists(LeavePlanHeader: Record "Leave Plan Header"; JobPlanningLine: Record "Job Planning Line"): Boolean
    var
        LeavePlanLines: Record "Leave Plan Lines";
    begin
        LeavePlanLines.SetRange("Leave Plan No.", LeavePlanHeader."No.");
        // LeavePlanLines.SetRange(Type, LeavePlanLines.Type::Job);
        // LeavePlanLines.SetRange("Job No.", JobPlanningLine."Job No.");
        // LeavePlanLines.SetRange("Job Task No.", JobPlanningLine."Job Task No.");
        exit(not LeavePlanLines.IsEmpty());
    end;

    local procedure JobPlanningLineIsNotValidForLeavePlanLine(JobPlanningLine: Record "Job Planning Line"): Boolean
    var
        Job: Record Job;
    begin
        if JobPlanningLine."Job No." = '' then
            exit(true);

        if not Job.Get(JobPlanningLine."Job No.") then
            exit(true);

        if (Job.Blocked = Job.Blocked::All) or (Job.Status = Job.Status::Completed) then
            exit(true);

        exit(false);
    end;

    procedure FindLeavePlan(var LeavePlanHeader: Record "Leave Plan Header"; Which: Option Prev,Next): Code[20]
    begin
        LeavePlanHeader.Reset();
        LeavePlanHeader.SetCurrentKey("Employee No.", "Starting Date");
        LeavePlanHeader.SetRange("Employee No.", LeavePlanHeader."Employee No.");
        case Which of
            Which::Prev:
                LeavePlanHeader.Next(-1);
            Which::Next:
                LeavePlanHeader.Next(1);
        end;
        exit(LeavePlanHeader."No.");
    end;

    procedure FindLeavePlanArchive(var LeavePlanHeaderArchive: Record "Leave Plan Header Archive"; Which: Option Prev,Next): Code[20]
    begin
        LeavePlanHeaderArchive.Reset();
        LeavePlanHeaderArchive.SetCurrentKey("Employee No.", "Starting Date");
        LeavePlanHeaderArchive.SetRange("Employee No.", LeavePlanHeaderArchive."Employee No.");
        OnFindLeavePlanArchiveOnAfterSetFilters(LeavePlanHeaderArchive);
        case Which of
            Which::Prev:
                LeavePlanHeaderArchive.Next(-1);
            Which::Next:
                LeavePlanHeaderArchive.Next(1);
        end;
        exit(LeavePlanHeaderArchive."No.");
    end;

    procedure GetDateFilter(StartingDate: Date; EndingDate: Date) DateFilter: Text[30]
    var
        Date: Record Date;
    begin
        if StartingDate = 0D then begin
            Date.FindFirst();
            StartingDate := Date."Period Start";
        end;
        if EndingDate = 0D then begin
            Date.FindLast();
            EndingDate := Date."Period Start";
        end;
        DateFilter := StrSubstNo('%1..%2', StartingDate, EndingDate);
    end;

    // procedure CreateServDocLinesFromTS(ServiceHeader: Record "Service Header")
    // var
    //     LeavePlanLines: Record "Leave Plan Lines";
    // begin
    //     CreateServLinesFromTS(ServiceHeader, LeavePlanLines, false);
    // end;

    // procedure CreateServDocLinesFromTSLine(ServiceHeader: Record "Service Header"; var LeavePlanLines: Record "Leave Plan Lines")
    // begin
    //     CreateServLinesFromTS(ServiceHeader, LeavePlanLines, true);
    // end;

    local procedure GetFirstServiceItemNo(ServiceHeader: Record "Service Header"): Code[20]
    var
        ServiceItemLine: Record "Service Item Line";
    begin
        ServiceItemLine.SetRange("Document Type", ServiceHeader."Document Type");
        ServiceItemLine.SetRange("Document No.", ServiceHeader."No.");
        ServiceItemLine.FindFirst();
        exit(ServiceItemLine."Service Item No.");
    end;

    // procedure CreateTSLineFromServiceLine(ServiceLine: Record "Service Line"; DocumentNo: Code[20]; Chargeable: Boolean)
    // var
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeCreateTSLineFromServiceLine(ServiceLine, IsHandled);
    //     if IsHandled then
    //         exit;

    //     with ServiceLine do
    //         if "Leave Plan No." = '' then
    //             CreateTSLineFromDocLine(
    //               DATABASE::"Service Line", "No.", "Posting Date", DocumentNo, "Document No.", "Line No.",
    //               "Work Type Code", Chargeable, Description, -"Qty. to Ship");
    // end;

    // procedure CreateTSLineFromServiceShptLine(ServiceShipmentLine: Record "Service Shipment Line")
    // var
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeCreateTSLineFromServiceShptLine(ServiceShipmentLine, IsHandled);
    //     if IsHandled then
    //         exit;

    //     with ServiceShipmentLine do
    //         if "Leave Plan No." = '' then
    //             CreateTSLineFromDocLine(
    //               DATABASE::"Service Shipment Line", "No.", "Posting Date", "Document No.", "Order No.", "Order Line No.",
    //               "Work Type Code", true, Description, -"Qty. Shipped Not Invoiced");
    // end;

    // local procedure CreateTSLineFromDocLine(TableID: Integer; EmployeeNo: Code[20]; PostingDate: Date; DocumentNo: Code[20]; OrderNo: Code[20]; OrderLineNo: Integer; WorkTypeCode: Code[10]; Chargbl: Boolean; Desc: Text[100]; Quantity: Decimal)
    // var
    //     Employee: Record Employee;
    //     LeavePlanHeader: Record "Leave Plan Header";
    //     LeavePlanLines: Record "Leave Plan Lines";
    //     LeavePlanDetail: Record "Leave Plan Detail";
    //     LineNo: Integer;
    // begin
    //     Employee.Get(EmployeeNo);
    //     if not Employee."Use Leave Plan" then
    //         exit;

    //     LeavePlanHeader.SetRange("Employee No.", Employee."No.");
    //     LeavePlanHeader.SetFilter("Starting Date", '..%1', PostingDate);
    //     LeavePlanHeader.SetFilter("Ending Date", '%1..', PostingDate);
    //     LeavePlanHeader.FindFirst();

    //     with LeavePlanLines do begin
    //         SetRange("Leave Plan No.", LeavePlanHeader."No.");
    //         if FindLast() then;
    //         LineNo := "Line No." + 10000;

    //         Init();
    //         "Leave Plan No." := LeavePlanHeader."No.";
    //         "Line No." := LineNo;
    //         "Leave Plan Starting Date" := LeavePlanHeader."Starting Date";
    //         case TableID of
    //             DATABASE::"Service Line",
    //             DATABASE::"Service Shipment Line":
    //                 begin
    //                     Type := Type::Service;
    //                     "Service Order No." := OrderNo;
    //                     "Service Order Line No." := OrderLineNo;
    //                 end;
    //             DATABASE::"Assembly Line":
    //                 begin
    //                     Type := Type::"Assembly Order";
    //                     "Assembly Order No." := OrderNo;
    //                     "Assembly Order Line No." := OrderLineNo;
    //                 end;
    //         end;
    //         Description := Desc;
    //         "Work Type Code" := WorkTypeCode;
    //         Chargeable := Chargbl;
    //         "Approver ID" := LeavePlanHeader."Approver User ID";
    //         "Approved By" := UserId;
    //         "Approval Date" := Today;
    //         Status := Status::Approved;
    //         Posted := true;
    //         Insert();

    //         LeavePlanDetail.Init();
    //         LeavePlanDetail.CopyFromLeavePlanLine(LeavePlanLines);
    //         LeavePlanDetail.Date := PostingDate;
    //         LeavePlanDetail.Quantity := Quantity;
    //         LeavePlanDetail."Posted Quantity" := Quantity;
    //         LeavePlanDetail.Posted := true;
    //         LeavePlanDetail.Insert();

    //         CreateTSPostingEntry(LeavePlanDetail, Quantity, PostingDate, DocumentNo, Description);
    //     end;
    // end;

    // procedure CreateTSLineFromAssemblyLine(AssemblyHeader: Record "Assembly Header"; AssemblyLine: Record "Assembly Line"; Qty: Decimal)
    // begin
    //     AssemblyLine.TestField(Type, AssemblyLine.Type::Employee);

    //     with AssemblyLine do
    //         CreateTSLineFromDocLine(
    //           DATABASE::"Assembly Line",
    //           "No.",
    //           AssemblyHeader."Posting Date",
    //           AssemblyHeader."Posting No.",
    //           "Document No.",
    //           "Line No.",
    //           '',
    //           true,
    //           Description,
    //           Qty);
    // end;

    // procedure CreateTSPostingEntry(LeavePlanDetail: Record "Leave Plan Detail"; Qty: Decimal; PostingDate: Date; DocumentNo: Code[20]; Desc: Text[100])
    // var
    //     LeavePlanPostingEntry: Record "Leave Plan Posting Entry";
    // begin
    //     with LeavePlanPostingEntry do begin
    //         Init();
    //         "Leave Plan No." := LeavePlanDetail."Leave Plan No.";
    //         "Leave Plan Lines No." := LeavePlanDetail."Leave Plan Lines No.";
    //         "Leave Plan Date" := LeavePlanDetail.Date;
    //         Quantity := Qty;
    //         "Document No." := DocumentNo;
    //         "Posting Date" := PostingDate;
    //         Description := Desc;
    //         Insert();
    //     end;

    //     OnAfterCreateTSPostingEntry(LeavePlanDetail, LeavePlanPostingEntry);
    // end;

    // local procedure CheckTSLineDetailPosting(LeavePlanNo: Code[20]; LeavePlanLineNo: Integer; LeavePlanDate: Date; QtyToPost: Decimal; QtyPerUnitOfMeasure: Decimal; var MaxAvailableQty: Decimal): Boolean
    // var
    //     LeavePlanDetail: Record "Leave Plan Detail";
    //     MaxAvailableQtyBase: Decimal;
    // begin
    //     LeavePlanDetail.Get(LeavePlanNo, LeavePlanLineNo, LeavePlanDate);
    //     LeavePlanDetail.TestField(Status, LeavePlanDetail.Status::Approved);
    //     LeavePlanDetail.TestField(Posted, false);

    //     MaxAvailableQtyBase := LeavePlanDetail.GetMaxQtyToPost();
    //     MaxAvailableQty := MaxAvailableQtyBase * QtyPerUnitOfMeasure;
    //     exit(QtyToPost <= MaxAvailableQty);
    // end;

    // procedure CheckResJnlLine(ResJnlLine: Record "Res. Journal Line")
    // var
    //     MaxAvailableQty: Decimal;
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeCheckResJnlLine(ResJnlLine, IsHandled);
    //     if IsHandled then
    //         exit;

    //     with ResJnlLine do begin
    //         TestField("Qty. per Unit of Measure");
    //         if not CheckTSLineDetailPosting(
    //              "Leave Plan No.",
    //              "Leave Plan Lines No.",
    //              "Leave Plan Date",
    //              Quantity,
    //              "Qty. per Unit of Measure",
    //              MaxAvailableQty)
    //         then
    //             FieldError(Quantity, StrSubstNo(Text004, MaxAvailableQty, "Unit of Measure Code"));
    //     end;
    // end;

    // procedure CheckJobJnlLine(JobJnlLine: Record "Job Journal Line")
    // var
    //     MaxAvailableQty: Decimal;
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeCheckJobJnlLine(JobJnlLine, IsHandled);
    //     if IsHandled then
    //         exit;

    //     with JobJnlLine do begin
    //         TestField("Qty. per Unit of Measure");
    //         if not CheckTSLineDetailPosting(
    //              "Leave Plan No.",
    //              "Leave Plan Lines No.",
    //              "Leave Plan Date",
    //              Quantity,
    //              "Qty. per Unit of Measure",
    //              MaxAvailableQty)
    //         then
    //             FieldError(Quantity, StrSubstNo(Text004, MaxAvailableQty, "Unit of Measure Code"));
    //     end;
    // end;

    // procedure CheckServiceLine(ServiceLine: Record "Service Line")
    // var
    //     MaxAvailableQty: Decimal;
    // begin
    //     with ServiceLine do begin
    //         TestField("Qty. per Unit of Measure");
    //         if not CheckTSLineDetailPosting(
    //              "Leave Plan No.",
    //              "Leave Plan Lines No.",
    //              "Leave Plan Date",
    //              "Qty. to Ship",
    //              "Qty. per Unit of Measure",
    //              MaxAvailableQty)
    //         then
    //             FieldError(Quantity, StrSubstNo(Text004, MaxAvailableQty, "Unit of Measure Code"));
    //     end;
    // end;

    procedure CopyFilteredLeavePlanLinesToBuffer(var LeavePlanLineFrom: Record "Leave Plan Lines"; var LeavePlanLineTo: Record "Leave Plan Lines")
    begin
        if LeavePlanLineFrom.FindSet() then
            repeat
                LeavePlanLineTo := LeavePlanLineFrom;
                LeavePlanLineTo.Insert();
            until LeavePlanLineFrom.Next() = 0;
    end;

    procedure UpdateTimeAllocation(LeavePlanLines: Record "Leave Plan Lines"; AllocatedQty: array[7] of Decimal)
    var
        LeavePlanHeader: Record "Leave Plan Header";
        LeavePlanDetail: Record "Leave Plan Detail";
        LeavePlanDate: Date;
        i: Integer;
    begin
        LeavePlanHeader.Get(LeavePlanLines."Leave Plan No.");
        for i := 1 to 7 do begin
            LeavePlanDate := LeavePlanHeader."Starting Date" + i - 1;
            if AllocatedQty[i] <> 0 then begin
                if LeavePlanDetail.Get(LeavePlanLines."Leave Plan No.", LeavePlanLines."Line No.", LeavePlanDate) then begin
                    LeavePlanDetail.Quantity := AllocatedQty[i];
                    // LeavePlanDetail."Posted Quantity" := LeavePlanDetail.Quantity;
                    LeavePlanDetail.Modify();
                end else begin
                    LeavePlanDetail.Init();
                    // LeavePlanDetail.CopyFromLeavePlanLine(LeavePlanLines);
                    LeavePlanDetail.Posted := true;
                    LeavePlanDetail.Date := LeavePlanDate;
                    LeavePlanDetail.Quantity := AllocatedQty[i];
                    // LeavePlanDetail."Posted Quantity" := LeavePlanDetail.Quantity;
                    LeavePlanDetail.Insert();
                end;
            end else
                if LeavePlanDetail.Get(LeavePlanLines."Leave Plan No.", LeavePlanLines."Line No.", LeavePlanDate) then
                    LeavePlanDetail.Delete();
        end;
    end;

    // procedure GetActivityInfo(LeavePlanLines: Record "Leave Plan Lines"; var ActivityCaption: Text[30]; var ActivityID: Code[20]; var ActivitySubCaption: Text[30]; var ActivitySubID: Code[20])
    // begin
    //     ActivitySubCaption := '';
    //     ActivitySubID := '';
    //     ActivityCaption := '';
    //     ActivityID := '';
    //     with LeavePlanLines do
    //         case Type of
    //             Type::Job:
    //                 begin
    //                     ActivityCaption := FieldCaption("Job No.");
    //                     ActivityID := "Job No.";
    //                     ActivitySubCaption := FieldCaption("Job Task No.");
    //                     ActivitySubID := "Job Task No.";
    //                 end;
    //             Type::Absence:
    //                 begin
    //                     ActivityCaption := FieldCaption("Cause of Absence Code");
    //                     ActivityID := "Cause of Absence Code";
    //                 end;
    //             Type::"Assembly Order":
    //                 begin
    //                     ActivityCaption := FieldCaption("Assembly Order No.");
    //                     ActivityID := "Assembly Order No.";
    //                 end;
    //             Type::Service:
    //                 begin
    //                     ActivityCaption := FieldCaption("Service Order No.");
    //                     ActivityID := "Service Order No.";
    //                 end;
    //             else
    //                 OnGetActivityInfoCaseTypeElse(LeavePlanLines, ActivitySubCaption, ActivitySubID, ActivityCaption, ActivityID);
    //         end;

    //     OnAfterGetActivityInfo(LeavePlanLines, ActivitySubCaption, ActivitySubID, ActivityCaption, ActivityID);
    // end;

    procedure ShowPostingEntries(LeavePlanNo: Code[20]; LeavePlanLineNo: Integer)
    var
        LeavePlanPostingEntry: Record "Leave Plan Posting Entry";
        LeavePlanPostingEntries: Page "Leave Plan Posting Entries";
    begin
        LeavePlanPostingEntry.FilterGroup(2);
        LeavePlanPostingEntry.SetRange("Leave Plan No.", LeavePlanNo);
        LeavePlanPostingEntry.SetRange("Leave Plan Line No.", LeavePlanLineNo);
        LeavePlanPostingEntry.FilterGroup(0);
        Clear(LeavePlanPostingEntries);
        LeavePlanPostingEntries.SetTableView(LeavePlanPostingEntry);
        LeavePlanPostingEntries.RunModal();
    end;

    procedure FindNearestLeavePlanStartDate(Date: Date): Date
    var
        HumanResourcessSetup: Record "Human Resources Setup";
    begin
        HumanResourcessSetup.Get();
        if Date2DWY(Date, 1) = HumanResourcessSetup."Leave Plan First Weekday" + 1 then
            exit(Date);

        exit(CalcDate(StrSubstNo('<WD%1>', HumanResourcessSetup."Leave Plan First Weekday" + 1), Date));
    end;

    // local procedure CreateServLinesFromTS(ServiceHeader: Record "Service Header"; var LeavePlanLines: Record "Leave Plan Lines"; AddBySelectedLeavePlanLine: Boolean)
    // var
    //     LeavePlanDetail: Record "Leave Plan Detail";
    //     TempLeavePlanDetail: Record "Leave Plan Detail" temporary;
    //     ServiceLine: Record "Service Line";
    //     LineNo: Integer;
    // begin
    //     ServiceLine.SetRange("Document Type", ServiceHeader."Document Type");
    //     ServiceLine.SetRange("Document No.", ServiceHeader."No.");
    //     if ServiceLine.FindLast() then;
    //     LineNo := ServiceLine."Line No." + 10000;

    //     ServiceLine.SetFilter("Leave Plan No.", '<>%1', '');
    //     if ServiceLine.FindSet() then
    //         repeat
    //             if not TempLeavePlanDetail.Get(
    //                  ServiceLine."Leave Plan No.",
    //                  ServiceLine."Leave Plan Lines No.",
    //                  ServiceLine."Leave Plan Date")
    //             then
    //                 if LeavePlanDetail.Get(
    //                      ServiceLine."Leave Plan No.",
    //                      ServiceLine."Leave Plan Lines No.",
    //                      ServiceLine."Leave Plan Date")
    //                 then begin
    //                     TempLeavePlanDetail := LeavePlanDetail;
    //                     TempLeavePlanDetail.Insert();
    //                 end;
    //         until ServiceLine.Next() = 0;

    //     LeavePlanDetail.SetRange("Service Order No.", ServiceHeader."No.");
    //     LeavePlanDetail.SetRange(Status, LeavePlanDetail.Status::Approved);
    //     if AddBySelectedLeavePlanLine = true then begin
    //         LeavePlanDetail.SetRange("Leave Plan No.", LeavePlanLines."Leave Plan No.");
    //         LeavePlanDetail.SetRange("Leave Plan Lines No.", LeavePlanLines."Line No.");
    //     end;
    //     LeavePlanDetail.SetRange(Posted, false);
    //     if LeavePlanDetail.FindSet() then
    //         repeat
    //             if not TempLeavePlanDetail.Get(
    //                  LeavePlanDetail."Leave Plan No.",
    //                  LeavePlanDetail."Leave Plan Lines No.",
    //                  LeavePlanDetail.Date)
    //             then begin
    //                 AddServLinesFromTSDetail(ServiceHeader, LeavePlanDetail, LineNo);
    //                 LineNo := LineNo + 10000;
    //             end;
    //         until LeavePlanDetail.Next() = 0;
    // end;

    // local procedure AddServLinesFromTSDetail(ServiceHeader: Record "Service Header"; var LeavePlanDetail: Record "Leave Plan Detail"; LineNo: Integer)
    // var
    //     LeavePlanHeader: Record "Leave Plan Header";
    //     LeavePlanLines: Record "Leave Plan Lines";
    //     ServiceLine: Record "Service Line";
    //     QtyToPost: Decimal;
    //     IsHandled: Boolean;
    // begin
    //     OnBeforeAddServLinesFromTSDetail(ServiceHeader, LeavePlanDetail, LineNo, IsHandled);
    //     if IsHandled then
    //         exit;

    //     QtyToPost := LeavePlanDetail.GetMaxQtyToPost();
    //     if QtyToPost <> 0 then begin
    //         ServiceLine.Init();
    //         ServiceLine."Document Type" := ServiceHeader."Document Type";
    //         ServiceLine."Document No." := ServiceHeader."No.";
    //         ServiceLine."Line No." := LineNo;
    //         ServiceLine.Validate("Service Item No.", GetFirstServiceItemNo(ServiceHeader));
    //         ServiceLine."Leave Plan No." := LeavePlanDetail."Leave Plan No.";
    //         ServiceLine."Leave Plan Lines No." := LeavePlanDetail."Leave Plan Lines No.";
    //         ServiceLine."Leave Plan Date" := LeavePlanDetail.Date;
    //         ServiceLine.Type := ServiceLine.Type::Employee;
    //         LeavePlanHeader.Get(LeavePlanDetail."Leave Plan No.");
    //         ServiceLine.Validate("No.", LeavePlanHeader."Employee No.");
    //         ServiceLine.Validate(Quantity, LeavePlanDetail.Quantity);
    //         LeavePlanLines.Get(LeavePlanDetail."Leave Plan No.", LeavePlanDetail."Leave Plan Lines No.");
    //         if not LeavePlanLines.Chargeable then
    //             ServiceLine.Validate("Qty. to Consume", QtyToPost);
    //         ServiceLine."Planned Delivery Date" := LeavePlanDetail.Date;
    //         ServiceLine.Validate("Work Type Code", LeavePlanLines."Work Type Code");
    //         ServiceLine.Insert();
    //     end;
    // end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalcActSchedFactBoxData(var LeavePlanHeader: Record "Leave Plan Header"; var TotalQtyText: Text; var TotalPresenceQty: Decimal; var AbsenceQty: Decimal);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateTSPostingEntry(LeavePlanDetail: Record "Leave Plan Detail"; var LeavePlanPostingEntry: Record "Leave Plan Posting Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyPrevLeavePlanLines()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFilterAllLines(var LeavePlanLines: Record "Leave Plan Lines"; ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject)
    begin
    end;

#if not CLEAN22
    [Obsolete('Remove old Leave Plan experience.', '22.0')]
    [IntegrationEvent(false, false)]
    local procedure OnAfterLeavePlanV2Enabled(var Result: Boolean)
    begin
    end;
#endif

    [IntegrationEvent(false, false)]
    local procedure OnCalcStatusFactBoxDataOnAfterLeavePlanHeaderSetFilters(var LeavePlanHeader: Record "Leave Plan Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCalcActSchedFactBoxDataOnAfterLeavePlanHeaderSetFilters(var LeavePlanHeader: Record "Leave Plan Header"; Calendar: Record Date)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCalcActSchedFactBoxDataOnBeforeResouceCalcFields(var Employee: Record Employee; Calendar: Record Date)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCheckInsertJobPlanningLine(JobPlanningLine: Record "Job Planning Line"; var JobPlanningLineBuffer: Record "Job Planning Line"; var SkipLine: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCopyPrevLeavePlanLinesOnBeforeCopyLine(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckJobJnlLine(var JobJnlLine: Record "Job Journal Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckResJnlLine(ResJournalLine: Record "Res. Journal Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateTSLineFromServiceLine(var ServiceLine: Record "Service Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateTSLineFromServiceShptLine(var ServiceShipmentLine: Record "Service Shipment Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFillJobPlanningBuffer(var JobPlanningLine: Record "Job Planning Line"; var JobPlanningLineBuffer: Record "Job Planning Line"; LeavePlanHeader: Record "Leave Plan Header"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFilterLeavePlans(var LeavePlanHeader: Record "Leave Plan Header"; FieldNo: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeToLeavePlanLineInsert(var ToLeavePlanLine: Record "Leave Plan Lines"; FromLeavePlanLine: Record "Leave Plan Lines")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCreateLinesFromJobPlanningOnBeforeLeavePlanLineInsert(var LeavePlanLines: Record "Leave Plan Lines"; var JobPlanningLine: Record "Job Planning Line");
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetActivityInfo(var LeavePlanLines: Record "Leave Plan Lines"; var ActivityCaption: Text[30]; var ActivityID: Code[20]; var ActivitySubCaption: Text[30]; var ActivitySubID: Code[20]);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnFillJobPlanningBufferOnBeforeJobPlanningLineBufferInsert(JobPlanningLine: Record "Job Planning Line"; var JobPlanningLineBuffer: Record "Job Planning Line" temporary);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnFindLeavePlanArchiveOnAfterSetFilters(var LeavePlanHeaderArchive: Record "Leave Plan Header Archive")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetActivityInfoCaseTypeElse(var LeavePlanLines: Record "Leave Plan Lines"; var ActivityCaption: Text[30]; var ActivityID: Code[20]; var ActivitySubCaption: Text[30]; var ActivitySubID: Code[20]);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAddServLinesFromTSDetail(ServiceHeader: Record "Service Header"; var LeavePlanDetail: Record "Leave Plan Detail"; LineNo: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCalcActSchedFactBoxDataOnAfterSetDateDescription(LeavePlanHeader: Record "Leave Plan Header"; Calendar: Record Date; var DateDescriptionForSpecificDate: Text[30]);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLeavePlanHeaderArchiveInsert(var LeavePlanHeaderArchive: Record "Leave Plan Header Archive"; LeavePlanHeader: Record "Leave Plan Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLeavePlanLineArchiveInsert(var LeavePlanLineArchive: Record "Leave Plan Line Archive"; LeavePlanLines: Record "Leave Plan Lines")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLeavePlanDetailArchiveInsert(var LeavePlanDetailArchive: Record "Leave Plan Detail Archive"; LeavePlanDetail: Record "Leave Plan Detail")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLeavePlanCmtLineArchiveInsert(var LeavePlanCmtLineArchive: Record "Leave Plan Cmt. Line Archive"; LeavePlanCommentLine: Record "Leave Plan Comment Line")
    begin
    end;
}
