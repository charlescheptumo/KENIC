report 50047 "Create Leave Plans"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Create Leave Plans';
    ProcessingOnly = true;
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = sorting(Number);
            dataitem(Employee; Employee)
            {
                DataItemTableView = where("Use Leave Plan" = const(true));
                // RequestFilterFields = "No.", Type;
                RequestFilterFields = "No.";

                trigger OnAfterGetRecord()
                var
                    LeavePlanMgt: Codeunit "Leave Plan Management";
                    IsHandled: Boolean;
                begin
                    IsHandled := false;
                    OnBeforeEmployeeOnAfterGerRecord(Employee, IsHandled, StartingDate, EndingDate);
                    if IsHandled then
                        CurrReport.Skip();

                    if CheckExistingPeriods() then begin
                        LeavePlanHeader.Init();
                        LeavePlanHeader."No." := NoSeriesMgt.GetNextNo(HumanResourceSetup."Leave Plan Nos.", Today, true);
                        LeavePlanHeader."Starting Date" := StartingDate;
                        LeavePlanHeader."Ending Date" := EndingDate;
                        LeavePlanHeader.Validate("Employee No.", "No.");
                        LeavePlanHeader.Description := StrSubstNo(DescriptionTxt, GetWeekNumber(StartingDate));
                        OnEmployeeOnAfterGerRecordOnBeforeLeavePlanHeaderInsert(LeavePlanHeader, Employee);
                        LeavePlanHeader.Insert(true);
                        LeavePlanCounter += 1;

                        if CreateLinesFromJobPlanning then
                            LeavePlanMgt.CreateLinesFromJobPlanning(LeavePlanHeader);
                        OnEmployeeOnAfterGerRecordOnAfterLeavePlanHeaderInserted(LeavePlanHeader, Employee);
                    end;
                end;

                trigger OnPostDataItem()
                begin
                    StartingDate := CalcDate('<1W>', StartingDate);
                end;

                trigger OnPreDataItem()
                begin
                    if HidEmployeeFilter <> '' then
                        SetFilter("No.", HidEmployeeFilter);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                EndingDate := CalcDate('<1W>', StartingDate) - 1;
            end;

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, NoOfPeriods);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StartingDate; StartingDate)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Starting Date';
                        ToolTip = 'Specifies the first date of the Leave Plan.';

                        trigger OnValidate()
                        begin
                            ValidateStartingDate();
                        end;
                    }
                    field(NoOfPeriods; NoOfPeriods)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'No. of Weeks';
                        MinValue = 1;
                        ToolTip = 'Specifies the number of weeks that the Leave Plan covers, such as 1 or 4.';
                    }
                    field(CreateLinesFromJobPlanning; CreateLinesFromJobPlanning)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Create Lines From Job Planning';
                        ToolTip = 'Specifies if you want to create Leave Plan lines that are based on job planning lines.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        var
            LeavePlanMgt: Codeunit "Leave Plan Management";
        begin
            if NoOfPeriods = 0 then
                NoOfPeriods := 1;

            if LeavePlanHeader.FindLast() then
                StartingDate := LeavePlanHeader."Ending Date" + 1
            else
                StartingDate := LeavePlanMgt.FindNearestLeavePlanStartDate(WorkDate());
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        HumanResourceSetup.Get();
    end;

    trigger OnPostReport()
    begin
        if not HideDialog then
            Message(Text003, LeavePlanCounter);
    end;

    trigger OnPreReport()
    var
        i: Integer;
        LastDate: Date;
        FirstLeavePeriodStartingDate: Date;
        LastLeavePeriodStartingDate: Date;
    begin
        CheckUserSetup();

        if StartingDate = 0D then
            Error(Text004, Text005);

        if NoOfPeriods = 0 then
            Error(Text004, Text006);

        HumanResourceSetup.TestField("Leave Plan Nos.");

        EndingDate := CalcDate('<1W>', StartingDate);

        LastDate := StartingDate;
        for i := 1 to NoOfPeriods do
            LastDate := CalcDate('<1W>', LastDate);

        if LeavePeriod.IsEmpty() then begin
            FirstLeavePeriodStartingDate := CalcDate('<-CM>', StartingDate);
            LastLeavePeriodStartingDate := CalcDate('<CM>', StartingDate);
        end else begin
            LeavePeriod.SetFilter(Starts, '..%1', StartingDate);
            LeavePeriod.FindLast();
            FirstLeavePeriodStartingDate := LeavePeriod.Starts;

            LeavePeriod.SetFilter(Starts, '..%1', LastDate);
            LeavePeriod.FindLast();
            LastLeavePeriodStartingDate := LeavePeriod.Starts;

            LeavePeriod.SetRange(Starts, FirstLeavePeriodStartingDate, LastLeavePeriodStartingDate);
            LeavePeriod.FindSet();
            repeat
                LeavePeriod.TestField(Closed, false);
            until LeavePeriod.Next() = 0;
        end;
    end;

    var
        // LeavePeriod: Record "Accounting Period";
        LeavePeriod: Record "HR Leave Periods";
        HumanResourceSetup: Record "Human Resources Setup";
        LeavePlanHeader: Record "Leave Plan Header";
        NoSeriesMgt: Codeunit "No. Series";
        HidEmployeeFilter: Code[250];
        StartingDate: Date;
        EndingDate: Date;
        LeavePlanCounter: Integer;
        NoOfPeriods: Integer;
        CreateLinesFromJobPlanning: Boolean;
        Text002: Label 'Leave Plan administrator only is allowed to create Leave Plans.';
        Text003: Label '%1 Leave Plans have been created.';
        Text004: Label '%1 must be filled in.';
        Text005: Label 'Starting Date';
        Text006: Label 'No. of Weeks';
        Text010: Label 'Starting Date must be %1.';
        HideDialog: Boolean;
        OpenUserSetupQst: Label 'You aren''t allowed to run this report. If you want, you can give yourself the Leave Plan Admin. rights, and then try again.\\ Do you want to do that now?';
        DescriptionTxt: Label 'Week %1', Comment = '%1 - week number';

    procedure InitParameters(NewStartingDate: Date; NewNoOfPeriods: Integer; NewEmployeeFilter: Code[250]; NewCreateLinesFromJobPlanning: Boolean; NewHideDialog: Boolean)
    begin
        ClearAll();
        HumanResourceSetup.Get();
        StartingDate := NewStartingDate;
        NoOfPeriods := NewNoOfPeriods;
        HidEmployeeFilter := NewEmployeeFilter;
        CreateLinesFromJobPlanning := NewCreateLinesFromJobPlanning;
        HideDialog := NewHideDialog;
    end;

    local procedure CheckUserSetup()
    var
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckUserSetup(IsHandled);
        if IsHandled then
            exit;

        if (not UserSetup.Get(UserId) or not UserSetup."Leave Plan Admin.") and UserSetup.WritePermission then
            if Confirm(OpenUserSetupQst, true) then
                PAGE.RunModal(PAGE::"User Setup");

        if not UserSetup.Get(UserId) or not UserSetup."Leave Plan Admin." then
            Error(Text002);
    end;

    local procedure CheckExistingPeriods(): Boolean
    begin
        LeavePlanHeader.SetRange("Employee No.", Employee."No.");
        LeavePlanHeader.SetRange("Starting Date", StartingDate);
        LeavePlanHeader.SetRange("Ending Date", EndingDate);
        if LeavePlanHeader.FindFirst() then
            exit(false);

        exit(true);
    end;

    local procedure GetWeekNumber(StartingDate: Date): Integer
    var
        DateRec: Record Date;
    begin
        DateRec.SetRange("Period Type", DateRec."Period Type"::Week);
        DateRec.SetFilter("Period Start", '%1..', StartingDate);
        if DateRec.FindFirst() then
            exit(DateRec."Period No.");
    end;

    local procedure ValidateStartingDate()
    begin
        if Date2DWY(StartingDate, 1) <> HumanResourceSetup."Leave Plan First Weekday" + 1 then
            Error(Text010, HumanResourceSetup."Leave Plan First Weekday");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckUserSetup(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeEmployeeOnAfterGerRecord(var Employee: Record Employee; var IsHandled: Boolean; var StartingDate: Date; var EndingDate: Date)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnEmployeeOnAfterGerRecordOnBeforeLeavePlanHeaderInsert(var LeavePlanHeader: Record "Leave Plan Header"; Employee: Record Employee)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnEmployeeOnAfterGerRecordOnAfterLeavePlanHeaderInserted(LeavePlanHeader: Record "Leave Plan Header"; Employee: Record Employee)
    begin
    end;
}
