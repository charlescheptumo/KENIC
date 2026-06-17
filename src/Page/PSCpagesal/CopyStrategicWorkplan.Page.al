#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80503 "Copy Strategic Workplan"
{
    Caption = 'Copy Job';
    PageType = StandardDialog;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Copy from")
            {
                Caption = 'Copy from';
                field(SourceAnnualWorkplanNo; SourceAnnualWorkplanNo)
                {
                    ApplicationArea = Workplan;
                    Caption = 'Annual Workplan No';
                    TableRelation = "Annual Strategy Workplan" where("Annual Strategy Type" = const(Functional),
                                                                      "Approval Status" = const(Released));
                    ToolTip = 'Specifies the job number.';

                    trigger OnValidate()
                    begin
                        if (SourceAnnualWorkplanNo <> '') and not SourceWorkPlan.Get(SourceAnnualWorkplanNo) then
                            Error(Text003, SourceWorkPlan.TableCaption, SourceWorkPlan);
                        TargetJobDescription := SourceWorkPlan.Description;
                        TargetBillToCustomerNo := SourceWorkPlan.Department;
                    end;
                }
            }
            group("Copy to")
            {
                Caption = 'Copy to';
                field(TargetAnnualWorkplanNo; TargetAnnualWorkplanNo)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Annual Workplan No';
                    ToolTip = 'Specifies the job number.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        if CloseAction in [Action::OK, Action::LookupOK] then begin
            ValidateUserInput;
            // CopyJob.SetCopyOptions(CopyJobPrices,CopyQuantity,CopyDimensions,Source,PlanningLineType,LedgerEntryType);
            // CopyJob.SetJobTaskRange(FromJobTaskNo,ToJobTaskNo);
            //CopyJob.SetJobTaskDateRange(FromDate,ToDate);
            // CopyAnnualWorkplan.FnCopyFunctionallWorkplan(SourceWorkPlan,TargetAnnualWorkplanNo);
            // // MESSAGE(Text001);
        end
    end;

    var
        SourceWorkPlan: Record 80019;
        CopyAnnualWorkplan: Codeunit 57007;
        SourceAnnualWorkplanNo: Code[20];
        TargetAnnualWorkplanNo: Code[20];
        TargetJobDescription: Text[100];
        TargetBillToCustomerNo: Code[20];
        Sources: Option "Job Planning Lines","Job Ledger Entries","None";
        Text001: label 'The Workplan was successfully copied.';
        Text002: label 'Workplan No. %1 will be assigned to the new Workplan. Do you want to continue?';
        Text003: label '%1 %2 does not exist.', Comment = 'Job Task 1000 does not exist.';
        Text004: label 'Provide a valid source %1.';
        AnnualStrategyType: Option Organizational,Functional,"Functional PC","Organizational PC";

    local procedure ValidateUserInput()
    var
        SPMGeneralSetup: Record 80021;
        NoSeriesManagement: Codeunit "No. Series";
    begin
        if (SourceAnnualWorkplanNo = '') or not SourceWorkPlan.Get(SourceWorkPlan.No) then
            Error(Text004, SourceWorkPlan.TableCaption);

        SPMGeneralSetup.Get;
        SPMGeneralSetup.TestField("Work Plan Nos");
        SPMGeneralSetup.TestField("Functional Annual Workplan Nos");
        if TargetAnnualWorkplanNo = '' then begin
            if AnnualStrategyType = Annualstrategytype::Organizational then
                TargetAnnualWorkplanNo := NoSeriesManagement.GetNextNo(SPMGeneralSetup."Work Plan Nos", 0D, true)
            else if AnnualStrategyType = Annualstrategytype::Functional then
                TargetAnnualWorkplanNo := NoSeriesManagement.GetNextNo(SPMGeneralSetup."Functional Annual Workplan Nos", 0D, true);
            if not Confirm(Text002, true, TargetAnnualWorkplanNo) then begin
                TargetAnnualWorkplanNo := '';
                Error('');
            end;
        end else begin
            if AnnualStrategyType = Annualstrategytype::Organizational then
                NoSeriesManagement.TestManual(SPMGeneralSetup."Work Plan Nos")
            else if AnnualStrategyType = Annualstrategytype::Functional then
                NoSeriesManagement.TestManual(SPMGeneralSetup."Functional Annual Workplan Nos");
        end;
        //SPMGeneralSetup."Current Annual Workplan":=TargetAnnualWorkplanNo;
        //SPMGeneralSetup.MODIFY;
    end;

    procedure SetFromJob(SourceWorkplan2: Record 80019)
    begin
        SourceWorkPlan := SourceWorkplan2;
        SourceAnnualWorkplanNo := SourceWorkPlan.No;
        TargetJobDescription := SourceWorkPlan.Description;
        TargetBillToCustomerNo := SourceWorkPlan."Department Name";
        AnnualStrategyType := SourceWorkPlan."Annual Strategy Type";
    end;
}
