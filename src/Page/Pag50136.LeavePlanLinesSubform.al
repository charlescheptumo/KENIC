page 50136 "Leave Plan Lines Subform"
{
    ApplicationArea = All;
    Caption = 'Leave Plan Lines Subform';
    PageType = ListPart;
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    // SourceTable = "Leave Plan Lines";
    SourceTable = "Leave Plan Lines";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                // field(Type; Rec.Type)
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the type of Leave Plan Lines.';

                //     trigger OnValidate()
                //     begin
                //         UpdateControls();
                //         CurrPage.Update(true);
                //     end;
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies information about the status of a Leave Plan Lines.';
                    Width = 4;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    Editable = AllowEdit;
                    ToolTip = 'Specifies a description of the Leave Plan Lines.';

                    trigger OnAssistEdit()
                    begin
                        if Rec."Line No." = 0 then
                            exit;

                        // Rec.ShowLineDetails(false);
                        CurrPage.Update(false);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                // field("Job No."; Rec."Job No.")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the number for the job that is associated with the Leave Plan Lines.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                // field("Job Task No."; Rec."Job Task No.")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the number of the related job task.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                field("Cause of Absence Code"; Rec."Cause of Absence Code")
                {
                    ApplicationArea = Jobs;
                    Editable = AllowEdit;
                    ToolTip = 'Specifies a list of standard absence codes, from which you may select one.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field(Chargeable; Rec.Chargeable)
                {
                    ApplicationArea = Jobs;
                    Editable = AllowEdit;
                    ToolTip = 'Specifies if the usage that you are posting is chargeable.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                // field("Work Type Code"; Rec."Work Type Code")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies which work type the resource applies to. Prices are updated based on this entry.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                // field("Service Order No."; Rec."Service Order No.")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the service order number that is associated with the Leave Plan Lines.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                // field("Assembly Order No."; Rec."Assembly Order No.")
                // {
                //     ApplicationArea = Assembly;
                //     ToolTip = 'Specifies the assembly order number that is associated with the Leave Plan Lines.';
                //     Visible = false;
                // }
                field(Field1; CellData[1])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[1];
                    ToolTip = 'Specifies the number of hours registered for this day.';
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 3;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(1);
                    end;
                }
                field(Field2; CellData[2])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[2];
                    ToolTip = 'Specifies the number of hours registered for this day.';
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 3;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(2);
                    end;
                }
                field(Field3; CellData[3])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[3];
                    ToolTip = 'Specifies the number of hours registered for this day.';
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 3;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(3);
                    end;
                }
                field(Field4; CellData[4])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[4];
                    ToolTip = 'Specifies the number of hours registered for this day.';
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 3;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(4);
                    end;
                }
                field(Field5; CellData[5])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[5];
                    ToolTip = 'Specifies the number of hours registered for this day.';
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 3;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(5);
                    end;
                }
                field(Field6; CellData[6])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[6];
                    ToolTip = 'Specifies the number of hours registered for this day.';
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 3;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(6);
                    end;
                }
                field(Field7; CellData[7])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[7];
                    ToolTip = 'Specifies the number of hours registered for this day.';
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 3;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(7);
                    end;
                }
                // field("Total Quantity"; Rec."Total Quantity")
                // {
                //     ApplicationArea = Jobs;
                //     Caption = 'Total';
                //     DrillDown = false;
                //     ToolTip = 'Specifies the total number of hours that have been entered on a Leave Plan.';
                //     DecimalPlaces = 0 : 2;
                //     Width = 3;
                // }
            }
            group(GroupTotal)
            {
                ShowCaption = false;
                // field(UnitOfMeasureCode; UnitOfMeasureCode)
                // {
                //     ApplicationArea = Jobs;
                //     Caption = 'Unit of Measure';
                //     ToolTip = 'Specifies the unit of measure for the Leave Plan.';
                //     Editable = false;
                // }
                // field(TimeSheetTotalQuantity; GetTimeSheetTotalQuantity())
                // {
                //     ApplicationArea = Jobs;
                //     Caption = 'Total';
                //     ToolTip = 'Specifies the total number of hours that are registered on the Leave Plan.';
                //     Editable = false;
                //     DecimalPlaces = 0 : 2;
                // }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action(Submit)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Submit';
                    Image = ReleaseDoc;
                    ShortCutKey = 'F9';
                    ToolTip = 'Submit the Leave Plan Lines for approval.';
                    
                    Scope = Repeater;
                    Gesture = RightSwipe;
                    Enabled = SubmitLineEnabled;
                    Visible = not ManagerTimeSheet;

                    trigger OnAction()
                    begin
                        SubmitLines();
                    end;
                }
                action(ReopenSubmitted)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Reopen';
                    Image = ReOpen;
                    
                    Scope = Repeater;
                    Gesture = LeftSwipe;
                    ToolTip = 'Reopen the Leave Plan Lines, for example, after it has been rejected. The approver of a Leave Plan has permission to approve, reject, or reopen a Leave Plan. The approver can also submit a Leave Plan for approval.';
                    Enabled = ReopenSubmittedLineEnabled;
                    Visible = not ManagerTimeSheet;

                    trigger OnAction()
                    begin
                        ReopenSubmittedLines();
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Approve';
                    Ellipsis = true;
                    Image = ReleaseDoc;
                    ToolTip = 'Approve the lines on the Leave Plan.';
                    
                    Scope = Repeater;
                    Gesture = RightSwipe;
                    Enabled = ApproveLineEnabled;
                    Visible = ManagerTimeSheet;

                    trigger OnAction()
                    begin
                        ApproveLines();
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the lines on the Leave Plan.';
                    
                    Scope = Repeater;
                    Gesture = RightSwipe;
                    Enabled = RejectLineEnabled;
                    Visible = ManagerTimeSheet;

                    trigger OnAction()
                    begin
                        RejectLines();
                    end;
                }
                action(ReopenApproved)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Reopen';
                    Image = ReOpen;
                    
                    Scope = Repeater;
                    Gesture = LeftSwipe;
                    ToolTip = 'Reopen the approved or rejected Leave Plan Lines.';
                    Enabled = ReopenApprovedLineEnabled;
                    Visible = ManagerTimeSheet;

                    trigger OnAction()
                    begin
                        ReopenApprovedLines();
                    end;
                }
                action("Leave Plan Allocation")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Leave Plan Allocation';
                    Image = Allocate;
                    
                    ToolTip = 'Allocate posted hours among days of the week on a Leave Plan.';
                    Enabled = Rec.Posted;

                    trigger OnAction()
                    begin
                        TimeAllocation();
                    end;
                }
                action("Activity &Details")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Activity &Details';
                    Image = View;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View the quantity of hours for each Leave Plan status.';

                    trigger OnAction()
                    begin
                        // Rec.ShowLineDetails(false);
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    var
                        DimMgt: Codeunit DimensionManagement;
                    begin
                        Rec."Dimension Set ID" := DimMgt.EditDimensionSet(Rec."Dimension Set ID", DimensionCaptionTok);
                    end;
                }
                action(LineComments)
                {
                    ApplicationArea = Comments;
                    Caption = 'Comments';
                    Image = ViewComments;
                    
                    RunObject = Page "Leave Plan Comment Sheet";
                    // RunPageLink = "No." = field("Leave Plan No."),
                    //               "Leave Plan Lines No." = field("Line No.");
                    Scope = Repeater;
                    ToolTip = 'View or create comments.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    var
        LeavePlanDetail: Record "Leave Plan Detail";
        ColumnRecords: array[32] of Record Date;
        LeavePlanMgt: Codeunit "Leave Plan Management";
        LeavePlanApprovalMgt: Codeunit "Leave Plan Approval Management";
        RefActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject;
        NoOfColumns: Integer;
        ColumnCaption: array[32] of Text[1024];
        UnitOfMeasureCode: Code[10];
        InvalidTypeErr: Label 'The type of Leave Plan Lines cannot be empty.';
        DimensionCaptionTok: Label 'Dimensions';

    protected var
        LeavePlanHeader: Record "Leave Plan Header";
        CellData: array[32] of Decimal;
        ManagerTimeSheet: Boolean;
        SubmitLineEnabled: Boolean;
        ReopenSubmittedLineEnabled: Boolean;
        ApproveLineEnabled: Boolean;
        RejectLineEnabled: Boolean;
        ReopenApprovedLineEnabled: Boolean;
        AllowEdit: Boolean;

    procedure SetManagerTimeSheetMode()
    begin
        ManagerTimeSheet := true;
    end;

    procedure SetColumns(TimeSheetNo: Code[20])
    var
        Calendar: Record Date;
    begin
        Clear(ColumnCaption);
        Clear(ColumnRecords);
        Clear(Calendar);
        Clear(NoOfColumns);

        GetLeavePlanHeader(TimeSheetNo);
        // LeavePlanHeader.CalcFields("Unit of Measure");
        // UnitOfMeasureCode := LeavePlanHeader."Unit of Measure";

        Calendar.SetRange("Period Type", Calendar."Period Type"::Date);
        Calendar.SetRange("Period Start", LeavePlanHeader."Starting Date", LeavePlanHeader."Ending Date");
        if Calendar.FindSet() then
            repeat
                NoOfColumns += 1;
                ColumnRecords[NoOfColumns]."Period Start" := Calendar."Period Start";
                ColumnCaption[NoOfColumns] := LeavePlanMgt.FormatDate(Calendar."Period Start", 1);
            until Calendar.Next() = 0;
    end;

    local procedure GetLeavePlanHeader(TimeSheetNo: Code[20])
    begin
        LeavePlanHeader.Get(TimeSheetNo);

        OnAfterGetLeavePlanHeader(LeavePlanHeader);
    end;

    local procedure UpdateControls()
    var
        i: Integer;
    begin
        i := 0;
        while i < NoOfColumns do begin
            i := i + 1;
            if (Rec."Line No." <> 0) and LeavePlanDetail.Get(
                 Rec."Leave Plan No.",
                 Rec."Line No.",
                 ColumnRecords[i]."Period Start")
            then
                CellData[i] := LeavePlanDetail.Quantity
            else
                CellData[i] := 0;
        end;
        AllowEdit := Rec.Status in [Rec.Status::Open, Rec.Status::Rejected];

        SubmitLineEnabled := Rec.Status = Rec.Status::Open;
        ReopenSubmittedLineEnabled := Rec.Status in [Rec.Status::Submitted, Rec.Status::Rejected];
        ApproveLineEnabled := Rec.Status = Rec.Status::Submitted;
        RejectLineEnabled := Rec.Status = Rec.Status::Submitted;
        ReopenApprovedLineEnabled := Rec.Status in [Rec.Status::Approved, Rec.Status::Rejected];
    end;

    procedure ValidateQuantity(ColumnNo: Integer)
    begin
        // if (CellData[ColumnNo] <> 0) and (Rec.Type = Rec.Type::" ") then
        //     Error(InvalidTypeErr);

        if LeavePlanDetail.Get(
             Rec."Leave Plan No.",
             Rec."Line No.",
             ColumnRecords[ColumnNo]."Period Start")
        then begin
            if CellData[ColumnNo] <> LeavePlanDetail.Quantity then
                TestLeavePlanLinesStatus();

            if CellData[ColumnNo] = 0 then
                LeavePlanDetail.Delete()
            else begin
                LeavePlanDetail.Quantity := CellData[ColumnNo];
                OnValidateQuantityOnBeforeModifyLeavePlanDetail(LeavePlanDetail, Rec);
                LeavePlanDetail.Modify(true);
            end;
        end else
            if CellData[ColumnNo] <> 0 then begin
                TestLeavePlanLinesStatus();

                LeavePlanDetail.Init();
                LeavePlanDetail.CopyFromLeavePlanLines(Rec);
                LeavePlanDetail.Date := ColumnRecords[ColumnNo]."Period Start";
                LeavePlanDetail.Quantity := CellData[ColumnNo];
                LeavePlanDetail.Insert(true);
            end;

        // Rec.CalcFields("Total Quantity");
        CurrPage.Update(false);
    end;

    local procedure GetTimeSheetTotalQuantity(): Decimal
    begin
        LeavePlanHeader.Get(Rec."Leave Plan No.");
        // LeavePlanHeader.CalcFields(Quantity);
        // exit(LeavePlanHeader.Quantity);
    end;

    procedure Process(ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject; ProcessAll: Boolean)
    var
        LeavePlanLines: Record "Leave Plan Lines";
        TempLeavePlanLines: Record "Leave Plan Lines" temporary;
    begin
        CurrPage.SaveRecord();
        FilterLines(LeavePlanLines, ActionType, ProcessAll);
        LeavePlanMgt.CopyFilteredLeavePlanLinesToBuffer(LeavePlanLines, TempLeavePlanLines);
        OnProcessOnBeforeProcessLeavePlanLiness(LeavePlanLines, TempLeavePlanLines, ActionType, ProcessAll);
        if LeavePlanLines.FindSet() then
            repeat
                LeavePlanApprovalMgt.ProcessAction(LeavePlanLines, ActionType);
            until LeavePlanLines.Next() = 0;
        OnAfterProcess(TempLeavePlanLines, ActionType, ProcessAll);
        CurrPage.Update(true);
    end;

    local procedure FilterLines(var LeavePlanLines: Record "Leave Plan Lines"; ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject; ProcessAll: Boolean)
    begin
        if not ProcessAll then
            CurrPage.SetSelectionFilter(LeavePlanLines)
        else
            FilterAllLines(LeavePlanLines, ActionType);
        OnAfterFilterLines(LeavePlanLines, ActionType, ProcessAll);
    end;

    local procedure TestLeavePlanLinesStatus()
    var
        LeavePlanLines: Record "Leave Plan Lines";
    begin
        LeavePlanLines.Get(Rec."Leave Plan No.", Rec."Line No.");
        LeavePlanLines.TestStatus();
    end;

    local procedure SubmitLines()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeSubmitLines(Rec, IsHandled);
        if IsHandled then
            exit;

        if IsPhone() then
            Message('LeavePlanApprovalMgt.SubmitIfConfirmed(Rec)')
        else
            case ShowDialog(RefActionType::Submit) of
                1:
                    Process(RefActionType::Submit, true);
                2:
                    Process(RefActionType::Submit, false);
            end;
    end;

    local procedure ApproveLines()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeApproveLines(Rec, IsHandled);
        if IsHandled then
            exit;

        if IsPhone() then
            Message('LeavePlanApprovalMgt.ApproveIfConfirmed(Rec)')
        else
            case ShowDialog(RefActionType::Approve) of
                1:
                    Process(RefActionType::Approve, true);
                2:
                    Process(RefActionType::Approve, false);
            end;
    end;

    local procedure RejectLines()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeRejectLines(Rec, IsHandled);
        if IsHandled then
            exit;

        if IsPhone() then
            Message('LeavePlanApprovalMgt.RejectIfConfirmed(Rec)')
        else
            case ShowDialog(RefActionType::Reject) of
                1:
                    Process(RefActionType::Reject, true);
                2:
                    Process(RefActionType::Reject, false);
            end;
    end;

    local procedure ReopenSubmittedLines()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeReopenSubmittedLines(Rec, IsHandled);
        if IsHandled then
            exit;

        if IsPhone() then
            Message('LeavePlanApprovalMgt.ReopenSubmittedIfConfirmed(Rec)')
        else
            case ShowDialog(RefActionType::ReopenSubmitted) of
                1:
                    Process(RefActionType::ReopenSubmitted, true);
                2:
                    Process(RefActionType::ReopenSubmitted, false);
            end;
    end;

    local procedure ReopenApprovedLines()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeReopenApprovedLines(Rec, IsHandled);
        if IsHandled then
            exit;

        if IsPhone() then
            Message('LeavePlanApprovalMgt.ReopenApprovedIfConfirmed(Rec)')
        else
            case ShowDialog(RefActionType::ReopenApproved) of
                1:
                    Process(RefActionType::ReopenApproved, true);
                2:
                    Process(RefActionType::ReopenApproved, false);
            end;
    end;

    local procedure TimeAllocation()
    var
        TimeSheetAllocation: Page "Leave Plan Allocation";
        AllocatedQty: array[7] of Decimal;
    begin
        Rec.TestField(Posted, true);
        // Rec.CalcFields("Total Quantity");
        // TimeSheetAllocation.InitParameters(Rec."Leave Plan No.", Rec."Line No.", Rec."Total Quantity");
        if TimeSheetAllocation.RunModal() = ACTION::OK then begin
            TimeSheetAllocation.GetAllocation(AllocatedQty);
            LeavePlanMgt.UpdateTimeAllocation(Rec, AllocatedQty);
        end;
    end;

    local procedure GetDialogText(ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject): Text
    var
        LeavePlanLines: Record "Leave Plan Lines";
    begin
        FilterAllLines(LeavePlanLines, ActionType);
        // exit(LeavePlanApprovalMgt.GetCommonTimeSheetDialogText(ActionType, LeavePlanLines.Count));
    end;

    local procedure FilterAllLines(var LeavePlanLines: Record "Leave Plan Lines"; ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject)
    begin
        LeavePlanLines.CopyFilters(Rec);
        LeavePlanMgt.FilterAllLeavePlanLines(LeavePlanLines, ActionType);
    end;

    local procedure IsPhone(): Boolean
    var
        ClientTypeManagement: Codeunit "Client Type Management";
    begin
        exit(ClientTypeManagement.GetCurrentClientType() = CLIENTTYPE::Phone);
    end;

    local procedure ShowDialog(ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject): Integer
    begin
        // exit(StrMenu(GetDialogText(ActionType), 1, LeavePlanApprovalMgt.GetCommonTimeSheetDialogInstruction(ActionType)));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetLeavePlanHeader(var LeavePlanHeader: Record "Leave Plan Header");
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFilterLines(var LeavePlanLines: Record "Leave Plan Lines"; ActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject; ProcessAll: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterProcess(var LeavePlanLines: Record "Leave Plan Lines"; "Action": Option "Submit Selected","Submit All","Reopen Selected","Reopen All"; ProcessAll: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenSubmittedLines(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenApprovedLines(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSubmitLines(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApproveLines(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRejectLines(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnValidateQuantityOnBeforeModifyLeavePlanDetail(var LeavePlanDetail: Record "Leave Plan Detail"; LeavePlanLines: Record "Leave Plan Lines");
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnProcessOnBeforeProcessLeavePlanLiness(var LeavePlanLines: Record "Leave Plan Lines"; var TempLeavePlanLines: Record "Leave Plan Lines" temporary; "Action": Option "Submit Selected","Submit All","Reopen Selected","Reopen All"; ProcessAll: Boolean)
    begin
    end;
}
