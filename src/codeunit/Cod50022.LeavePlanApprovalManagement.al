codeunit 50022 "Leave Plan Approval Management"
{
    trigger OnRun()
    begin
    end;

    var
        Text001: Label 'There is nothing to submit for line with %1=%2, %3=%4.', Comment = 'There is nothing to submit for line with Leave Plan No.=10, Line No.=10000.';
        Text002: Label 'You are not authorized to approve Leave Plan lines. Contact your Leave Plan administrator.';
        Text003: Label 'Leave Plan line cannot be reopened because there are linked service lines.';
        Text004: Label '&All open lines [%1 line(s)],&Selected line(s) only';
        Text005: Label '&All submitted lines [%1 line(s)],&Selected line(s) only';
        Text006: Label '&All approved lines [%1 line(s)],&Selected line(s) only';
        Text007: Label 'Submit for approval';
        Text008: Label 'Reopen for editing';
        Text009: Label 'Approve for posting';
        Text010: Label 'Reject for correction';
        SubmitConfirmQst: Label 'Do you want to submit open lines?';
        ReopenConfirmQst: Label 'Do you want to reopen submitted lines?';
        ApproveConfirmQst: Label 'Do you want to approve submitted lines?';
        RejectConfirmQst: Label 'Do you want to reject submitted lines?';
        ReopenApprovedConfirmQst: Label 'Do you want to reopen approved lines?';
        SubmitLineQst: Label 'Do you want to submit line?';
        ReopenLineQst: Label 'Do you want to reopen line?';
        ApproveLineQst: Label 'Do you want to approve line?';
        RejectLineQst: Label 'Do you want to reject line?';

    procedure ProcessAction(var LeavePlanLine: Record "Leave Plan Lines"; ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject)
    var
        FeatureTelemetry: Codeunit "Feature Telemetry";
#if not CLEAN22
        LeavePlanManagement: Codeunit "Leave Plan Management";
#endif
    begin
#if not CLEAN22
        FeatureTelemetry.LogUptake('0000JQU', LeavePlanManagement.GetLeavePlanV2FeatureKey(), Enum::"Feature Uptake Status"::Used);
#endif
        case ActionType of
            ActionType::Submit:
                Message('Submit(LeavePlanLine)');
            ActionType::ReopenSubmitted:
                Message('ReopenSubmitted(LeavePlanLine)');
            ActionType::Approve:
                Message('Approve(LeavePlanLine)');
            ActionType::ReopenApproved:
                Message(' ReopenApproved(LeavePlanLine)');
            ActionType::Reject:
                Message('Reject(LeavePlanLine)');
        end;
        FeatureTelemetry.LogUsage('0000JQU', 'NewLeavePlanExperience', 'Leave Plan action processed');
    end;

    //     procedure Submit(var LeavePlanLine: Record "Leave Plan Lines")
    //     var
    //         IsHandled: Boolean;
    //     begin
    //         IsHandled := false;
    //         OnBeforeSubmit(LeavePlanLine, IsHandled);
    //         if isHandled then
    //             exit;

    //         with LeavePlanLine do begin
    //             if Status = Status::Submitted then
    //                 exit;
    //             if Type = Type::" " then
    //                 FieldError(Type);
    //             TestStatus();
    //             CalcFields("Total Quantity");
    //             if "Total Quantity" = 0 then
    //                 Error(
    //                   Text001, FieldCaption("Leave Plan No."), "Leave Plan No.", FieldCaption("Line No."), "Line No.");
    //             case Type of
    //                 Type::Job:
    //                     begin
    //                         TestField("Job No.");
    //                         TestField("Job Task No.");
    //                     end;
    //                 Type::Absence:
    //                     TestField("Cause of Absence Code");
    //                 Type::Service:
    //                     TestField("Service Order No.");
    //             end;
    //             UpdateApproverID();
    //             Status := Status::Submitted;
    //             OnSubmitOnBeforeLeavePlanLineModify(LeavePlanLine);
    //             Modify(true);
    //             OnAfterSubmit(LeavePlanLine);
    //         end;
    //     end;

    //     procedure SubmitIfConfirmed(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //         if Confirm(SubmitLineQst) then
    //             Submit(LeavePlanLine);
    //     end;

    //     procedure ReopenSubmitted(var LeavePlanLine: Record "Leave Plan Lines")
    // #if not CLEAN22
    //     var
    //         LeavePlanMgt: Codeunit "Leave Plan Management";
    // #endif
    //     begin
    //         with LeavePlanLine do begin
    //             if Status = Status::Open then
    //                 exit;

    // #if not CLEAN22
    //             if not LeavePlanMgt.LeavePlanV2Enabled() then
    //                 TestField(Status, Status::Submitted);
    // #endif
    //             Status := Status::Open;
    //             OnReopenSubmittedOnBeforeModify(LeavePlanLine);
    //             Modify(true);
    //             OnReopenSubmittedOnAfterModify(LeavePlanLine);

    //             OnAfterReopenSubmitted(LeavePlanLine);
    //         end;
    //     end;

    //     procedure ReopenSubmittedIfConfirmed(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //         if Confirm(ReopenLineQst) then
    //             ReopenSubmitted(LeavePlanLine);
    //     end;

    //     procedure ReopenApproved(var LeavePlanLine: Record "Leave Plan Lines")
    // #if not CLEAN22
    //     var
    //         LeavePlanMgt: Codeunit "Leave Plan Management";
    // #endif
    //     begin
    //         with LeavePlanLine do begin
    //             if Status = Status::Submitted then
    //                 exit;
    // #if not CLEAN22
    //             if not LeavePlanMgt.LeavePlanV2Enabled() then
    //                 TestField(Status, Status::Approved);
    // #endif
    //             TestField(Posted, false);
    //             CheckApproverPermissions(LeavePlanLine);
    //             CheckLinkedServiceDoc(LeavePlanLine);
    //             UpdateApproverID();
    //             Status := Status::Submitted;
    //             OnReopenApprovedOnBeforeLeavePlanLineModify(LeavePlanLine);
    //             Modify(true);

    //             OnAfterReopenApproved(LeavePlanLine);
    //         end;
    //     end;

    //     procedure ReopenApprovedIfConfirmed(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //         if Confirm(ReopenLineQst) then
    //             ReopenApproved(LeavePlanLine);
    //     end;

    //     procedure Reject(var LeavePlanLine: Record "Leave Plan Lines")
    //     var
    //         IsHandled: Boolean;
    //     begin
    //         IsHandled := false;
    //         OnBeforeReject(LeavePlanLine, IsHandled);
    //         if not IsHandled then
    //             with LeavePlanLine do begin
    //                 if Status = Status::Rejected then
    //                     exit;
    //                 TestField(Status, Status::Submitted);
    //                 CheckApproverPermissions(LeavePlanLine);
    //                 Status := Status::Rejected;
    //                 OnRejectOnBeforeLeavePlanLineModify(LeavePlanLine);
    //                 Modify(true);
    //             end;

    //         OnAfterReject(LeavePlanLine);
    //     end;

    //     procedure RejectIfConfirmed(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //         if Confirm(RejectLineQst) then
    //             Reject(LeavePlanLine);
    //     end;

    //     procedure Approve(var LeavePlanLine: Record "Leave Plan Lines")
    //     var
    //         IsHandled: Boolean;
    //     begin
    //         IsHandled := false;
    //         OnBeforeApprove(LeavePlanLine, IsHandled);
    //         if IsHandled then
    //             exit;

    //         with LeavePlanLine do begin
    //             if Status = Status::Approved then
    //                 exit;
    //             TestField(Status, Status::Submitted);
    //             CheckApproverPermissions(LeavePlanLine);
    //             Status := Status::Approved;
    //             "Approved By" := UserId;
    //             "Approval Date" := Today;
    //             OnApproveOnBeforeLeavePlanLineModify(LeavePlanLine);
    //             Modify(true);
    //             case Type of
    //                 Type::Absence:
    //                     PostAbsence(LeavePlanLine);
    //                 Type::Service:
    //                     AfterApproveServiceOrderTmeSheetEntries(LeavePlanLine);
    //             end;
    //         end;

    //         OnAfterApprove(LeavePlanLine);
    //     end;

    //     procedure ApproveIfConfirmed(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //         if Confirm(ApproveLineQst) then
    //             Approve(LeavePlanLine);
    //     end;

    //     procedure PostAbsence(var LeavePlanLine: Record "Leave Plan Lines")
    //     var
    //         Resource: Record Resource;
    //         LeavePlanHeader: Record "Leave Plan Header";
    //         LeavePlanDetail: Record "Leave Plan Detail";
    //         Employee: Record Employee;
    //         EmployeeAbsence: Record "Employee Absence";
    //         LeavePlanMgt: Codeunit "Leave Plan Management";
    //         IsHandled: Boolean;
    //     begin
    //         IsHandled := false;
    //         OnBeforePostAbsence(LeavePlanLine, IsHandled);
    //         if IsHandled then
    //             exit;

    //         LeavePlanHeader.Get(LeavePlanLine."Leave Plan No.");
    //         Resource.Get(LeavePlanHeader."Resource No.");
    //         Employee.SetRange("Resource No.", LeavePlanHeader."Resource No.");
    //         Employee.FindFirst();
    //         LeavePlanDetail.SetRange("Leave Plan No.", LeavePlanLine."Leave Plan No.");
    //         LeavePlanDetail.SetRange("Leave Plan Lines No.", LeavePlanLine."Line No.");
    //         if LeavePlanDetail.FindSet(true) then
    //             repeat
    //                 EmployeeAbsence.Init();
    //                 EmployeeAbsence.Validate("Employee No.", Employee."No.");
    //                 EmployeeAbsence.Validate("From Date", LeavePlanDetail.Date);
    //                 EmployeeAbsence.Validate("Cause of Absence Code", LeavePlanDetail."Cause of Absence Code");
    //                 EmployeeAbsence.Validate("Unit of Measure Code", Resource."Base Unit of Measure");
    //                 EmployeeAbsence.Validate(Quantity, LeavePlanDetail.Quantity);
    //                 OnBeforeInsertEmployeeAbsence(EmployeeAbsence, LeavePlanLine, LeavePlanDetail);
    //                 EmployeeAbsence.Insert(true);

    //                 LeavePlanDetail.Posted := true;
    //                 LeavePlanDetail.Modify();
    //                 LeavePlanMgt.CreateTSPostingEntry(
    //                   LeavePlanDetail,
    //                   LeavePlanDetail.Quantity,
    //                   LeavePlanDetail.Date,
    //                   '',
    //                   LeavePlanLine.Description);
    //             until LeavePlanDetail.Next() = 0;

    //         LeavePlanLine.Posted := true;
    //         LeavePlanLine.Modify();
    //     end;

    //     local procedure CheckApproverPermissions(LeavePlanLine: Record "Leave Plan Lines")
    //     var
    //         UserSetup: Record "User Setup";
    //         IsHandled: Boolean;
    //     begin
    //         IsHandled := false;
    //         OnBeforeCheckApproverPermissions(LeavePlanLine, IsHandled);
    //         if IsHandled then
    //             exit;

    //         UserSetup.Get(UserId);
    //         if not UserSetup."Leave Plan Admin." then
    //             if LeavePlanLine."Approver ID" <> UpperCase(UserId) then
    //                 Error(Text002);
    //     end;

    //     local procedure CheckLinkedServiceDoc(LeavePlanLine: Record "Leave Plan Lines")
    //     var
    //         ServiceLine: Record "Service Line";
    //     begin
    //         ServiceLine.SetRange("Document Type", ServiceLine."Document Type"::Order);
    //         ServiceLine.SetRange("Document No.", LeavePlanLine."Service Order No.");
    //         ServiceLine.SetRange("Leave Plan No.", LeavePlanLine."Leave Plan No.");
    //         ServiceLine.SetRange("Leave Plan Lines No.", LeavePlanLine."Line No.");
    //         if not ServiceLine.IsEmpty() then
    //             Error(Text003);
    //     end;

    procedure GetLeavePlanDialogText(ActionType: Option Submit,Reopen; LinesQty: Integer): Text[100]
    var
        IsHandled: Boolean;
        ReturnText: Text[100];
    begin
        IsHandled := false;
        OnBeforeGetLeavePlanDialogText(ActionType, LinesQty, ReturnText, IsHandled);
        if IsHandled then
            exit(ReturnText);

        case ActionType of
            ActionType::Submit:
                exit(StrSubstNo(Text004, LinesQty));
            ActionType::Reopen:
                exit(StrSubstNo(Text005, LinesQty));
        end;
    end;

    //     procedure GetManagerLeavePlanDialogText(ActionType: Option Approve,Reopen,Reject; LinesQty: Integer): Text[100]
    //     var
    //         IsHandled: Boolean;
    //         ReturnText: Text[100];
    //     begin
    //         IsHandled := false;
    //         OnBeforeGetManagerLeavePlanDialogText(ActionType, LinesQty, ReturnText, IsHandled);
    //         if IsHandled then
    //             exit(ReturnText);

    //         case ActionType of
    //             ActionType::Approve,
    //           ActionType::Reject:
    //                 exit(StrSubstNo(Text005, LinesQty));
    //             ActionType::Reopen:
    //                 exit(StrSubstNo(Text006, LinesQty));
    //         end;
    //     end;

    //     procedure GetCommonLeavePlanDialogText(ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject; LinesQty: Integer): Text[100]
    //     var
    //         IsHandled: Boolean;
    //         ReturnText: Text[100];
    //     begin
    //         IsHandled := false;
    //         OnBeforeGetLeavePlanDialogText(ActionType, LinesQty, ReturnText, IsHandled);
    //         if IsHandled then
    //             exit(ReturnText);

    //         case ActionType of
    //             ActionType::Submit:
    //                 exit(StrSubstNo(Text004, LinesQty));
    //             ActionType::ReopenSubmitted,
    //             ActionType::Approve,
    //             ActionType::Reject:
    //                 exit(StrSubstNo(Text005, LinesQty));
    //             ActionType::ReopenApproved:
    //                 exit(StrSubstNo(Text006, LinesQty));
    //         end;
    //     end;

    //     procedure ConfirmAction(ActionType: Option Submit,Reopen,Approve,ReopenApproved,Reject): Boolean
    //     begin
    //         exit(Confirm(GetConfirmInstructions(ActionType)));
    //     end;

    //     local procedure GetConfirmInstructions(ActionType: Option Submit,Reopen,Approve,ReopenApproved,Reject): Text
    //     begin
    //         case ActionType of
    //             ActionType::Submit:
    //                 exit(SubmitConfirmQst);
    //             ActionType::Reopen:
    //                 exit(ReopenConfirmQst);
    //             ActionType::ReopenApproved:
    //                 exit(ReopenApprovedConfirmQst);
    //             ActionType::Approve:
    //                 exit(ApproveConfirmQst);
    //             ActionType::Reject:
    //                 exit(RejectConfirmQst);
    //         end;
    //     end;

    procedure GetLeavePlanDialogInstruction(ActionType: Option Submit,Reopen): Text[100]
    begin
        case ActionType of
            ActionType::Submit:
                exit(Text007);
            ActionType::Reopen:
                exit(Text008);
        end;
    end;

    //     procedure GetManagerLeavePlanDialogInstruction(ActionType: Option Approve,Reopen,Reject): Text[100]
    //     begin
    //         case ActionType of
    //             ActionType::Approve:
    //                 exit(Text009);
    //             ActionType::Reject:
    //                 exit(Text010);
    //             ActionType::Reopen:
    //                 exit(Text008);
    //         end;
    //     end;

    //     procedure GetCommonLeavePlanDialogInstruction(ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject): Text
    //     begin
    //         case ActionType of
    //             ActionType::Submit:
    //                 exit(Text007);
    //             ActionType::ReopenSubmitted,
    //             ActionType::ReopenApproved:
    //                 exit(Text008);
    //             ActionType::Approve:
    //                 exit(Text009);
    //             ActionType::Reject:
    //                 exit(Text010);
    //         end;
    //     end;

    //     local procedure AfterApproveServiceOrderTmeSheetEntries(var LeavePlanLine: Record "Leave Plan Lines")
    //     var
    //         ServHeader: Record "Service Header";
    //         ServMgtSetup: Record "Service Mgt. Setup";
    //         LeavePlanMgt: Codeunit "Leave Plan Management";
    //     begin
    //         if ServMgtSetup.Get() and ServMgtSetup."Copy Leave Plan to Order" then begin
    //             ServHeader.Get(ServHeader."Document Type"::Order, LeavePlanLine."Service Order No.");
    //             LeavePlanMgt.CreateServDocLinesFromTSLine(ServHeader, LeavePlanLine);
    //         end;
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeInsertEmployeeAbsence(var EmployeeAbsence: Record "Employee Absence"; LeavePlanLine: Record "Leave Plan Lines"; var LeavePlanDetail: Record "Leave Plan Detail")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforePostAbsence(var LeavePlanLine: Record "Leave Plan Lines"; var IsHandled: Boolean)
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnAfterSubmit(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnAfterReopenSubmitted(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnAfterReopenApproved(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnAfterReject(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnAfterApprove(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnApproveOnBeforeLeavePlanLineModify(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnRejectOnBeforeLeavePlanLineModify(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnReopenApprovedOnBeforeLeavePlanLineModify(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnReopenSubmittedOnAfterModify(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnReopenSubmittedOnBeforeModify(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnSubmitOnBeforeLeavePlanLineModify(var LeavePlanLine: Record "Leave Plan Lines")
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeApprove(var LeavePlanLine: Record "Leave Plan Lines"; var IsHandled: Boolean)
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeCheckApproverPermissions(var LeavePlanLine: Record "Leave Plan Lines"; var IsHandled: Boolean)
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeSubmit(var LeavePlanLine: Record "Leave Plan Lines"; var IsHandled: Boolean)
    //     begin
    //     end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetLeavePlanDialogText(ActionType: Option; LinesQty: Decimal; var ReturnText: text[100]; var IsHandled: Boolean)
    begin
    end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeGetManagerLeavePlanDialogText(ActionType: Option; LinesQty: Decimal; var ReturnText: text[100]; var IsHandled: Boolean)
    //     begin
    //     end;

    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeReject(var LeavePlanLine: Record "Leave Plan Lines"; var IsHandled: Boolean)
    //     begin
    //     end;
}
