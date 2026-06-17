#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80537 "Dept Workplan Rev Alignment"
{
    Caption = 'Workplan Revision Alignment Tool';
    PageType = List;
    SourceTable = 80264;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Activity Id"; Rec."Activity Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Activity Id field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Sub Activity No"; Rec."Sub Activity No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Activity No field.';
                }
                field("Sub Activity Name"; Rec."Sub Activity Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Sub Activity Name field.';
                }
                field("Cost Elements"; Rec."Cost Elements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Element';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cost Element field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Financial Budget';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Financial Budget field.';
                }
                field("Vote id"; Rec."Vote id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vote id field.';
                }
                field("Vote Desription"; Rec."Vote Desription")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vote Desription field.';
                }
                field("Procurment Plan No"; Rec."Procurment Plan No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Plan No';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Procurement Plan No field.';
                }
                field("Plan Category"; Rec."Plan Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Category';
                    Editable = false;
                    ToolTip = 'Specifies the value of the PP Category field.';
                }
                field("Plan Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Item No';
                    Visible = true;
                    ToolTip = 'Specifies the value of the PP Item No field.';
                }
                field("Plan Item Description"; Rec."Plan Item Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Item Category';
                    Editable = false;
                    ToolTip = 'Specifies the value of the PP Item Category field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Funding Level"; Rec."Funding Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Level field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Planning Budget Type"; Rec."Planning Budget Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planning Budget Type field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Copy AWP for Alignment")
            {
                ApplicationArea = Basic;
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Copy AWP for Alignment action.';

                trigger OnAction()
                var
                    CopyStrategicWorkplan: Page "Copy Annual Workplan";
                begin
                    AnnualStrategyWorkplan.Reset;
                    AnnualStrategyWorkplan.SetRange(No, Rec."Workplan No.");
                    if AnnualStrategyWorkplan.FindSet then
                        CopyStrategicWorkplan.SetFromJob(AnnualStrategyWorkplan);
                    CopyStrategicWorkplan.RunModal;
                end;
            }
            separator(Action28)
            {
            }
            action("Update Budgets Amounts")
            {
                ApplicationArea = Basic;
                Caption = 'Update New AWP Budgets Amounts';
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Update New AWP Budgets Amounts action.';

                trigger OnAction()
                begin
                    SPMGeneralSetup.Get();

                    WorkplanCostElements.Reset;
                    WorkplanCostElements.SetRange("Workplan No.", SPMGeneralSetup."Current Annual Workplan");
                    if WorkplanCostElements.Find('-') then begin
                        repeat
                            SubWorkplanActivity.Reset;
                            SubWorkplanActivity.SetRange("Workplan No.", WorkplanCostElements."Workplan No.");
                            SubWorkplanActivity.SetRange("Activity Id", WorkplanCostElements."Activity Id");
                            SubWorkplanActivity.SetRange("Sub Initiative No.", WorkplanCostElements."Sub Activity No");
                            if SubWorkplanActivity.FindFirst then begin
                                //    StrategicPlanning.FnSumSubActivityAmount(SubWorkplanActivity);

                                StrategyWorkplanLines.Reset;
                                StrategyWorkplanLines.SetRange(No, SubWorkplanActivity."Workplan No.");
                                StrategyWorkplanLines.SetRange("Activity ID", SubWorkplanActivity."Activity Id");
                                if StrategyWorkplanLines.FindFirst then begin
                                    //    StrategicPlanning.FnSumActivityAmount(StrategyWorkplanLines);
                                end;
                            end;

                        until WorkplanCostElements.Next = 0;
                    end;
                    Message('Budgets Updated Successfully');
                end;
            }
            separator(Action27)
            {
            }
            action("Combined Annual Workplan Report")
            {
                ApplicationArea = Basic;
                Caption = 'Preview Departmental AWP Report';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Preview Departmental AWP Report action.';

                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.Reset;
                    AnnualStrategyWorkplan.SetRange(No, Rec."Workplan No.");
                    if AnnualStrategyWorkplan.FindFirst then
                        Report.Run(80050, true, true, AnnualStrategyWorkplan);
                end;
            }
            separator(Action25)
            {
            }
            action("Annual Workplan Expenditure")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Annual Workplan Expenditure action.';

                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.Reset;
                    AnnualStrategyWorkplan.SetRange(No, Rec."Workplan No.");
                    if AnnualStrategyWorkplan.FindFirst then
                        Report.Run(80047, true, true, AnnualStrategyWorkplan);
                end;
            }
            action("Budget Alignment Analysis")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Budget Alignment Analysis action.';

                trigger OnAction()
                begin
                    WorkplanCostElements.Reset;
                    WorkplanCostElements.SetRange("Workplan No.", Rec."Workplan No.");
                    if WorkplanCostElements.FindFirst then
                        Report.Run(80057, true, true, WorkplanCostElements);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindSet then begin
                Directorate := Employee."Directorate Code";
                Department := Employee."Department Code";

                SPMGeneralSetup.Get();
                Rec.SetRange("Workplan No.", SPMGeneralSetup."Current Rev Annual Workplan");
                Rec.SetRange("Primary Directorate", Directorate);
                Rec.SetRange("Primary Department", Department);

            end;
        end;

        SubWorkplanActivity.Reset;
        SubWorkplanActivity.SetRange("Workplan No.", Rec."Workplan No.");
        SubWorkplanActivity.SetRange("Activity Id", Rec."Activity Id");
        SubWorkplanActivity.SetRange("Sub Initiative No.", Rec."Sub Activity No");
        if SubWorkplanActivity.FindSet then begin
            Rec."Sub Activity Name" := SubWorkplanActivity."Objective/Initiative";
        end;
    end;

    trigger OnOpenPage()
    begin

        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindSet then begin
                Directorate := Employee."Directorate Code";
                Department := Employee."Department Code";

                SPMGeneralSetup.Get();
                Rec.SetRange("Workplan No.", SPMGeneralSetup."Current Rev Annual Workplan");
                Rec.SetRange("Primary Directorate", Directorate);
                Rec.SetRange("Primary Department", Department);

            end;
        end;
    end;

    var
        SPMGeneralSetup: Record 80021;
        WorkplanCostElements: Record 80264;
        SubWorkplanActivity: Record 80262;
        StrategicPlanning: Codeunit 57007;
        StrategyWorkplanLines: Record 80020;
        AnnualStrategyWorkplan: Record 80019;
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
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        Directorate: Code[50];
        Department: Code[50];


    procedure fnPostPlanEntry(WPlanLines: Record 80020)
    var
        StrategyEntry: Record 80018;
    begin
        /*StrategicInt.RESET;
        StrategicInt.SETRANGE(Code,WPlanLines."Activity ID");
        IF StrategicInt.FIND('-') THEN BEGIN
          ThemeID:=StrategicInt."Theme ID";
          ObjectiveID:=StrategicInt."Objective ID";
        END;

        QYearCode.RESET;
        QYearCode.SETRANGE("Year Code",WPlanLines."Year Reporting Code");
        IF QYearCode.FIND('-')  THEN BEGIN
          REPEAT
           QCount:=QCount+1;
              IF (QCount=1) THEN BEGIN
                Q1:=QYearCode.Code;
                Q1date:=QYearCode."Reporting Start Date";
              END;
              IF (QCount=2) THEN BEGIN
                Q2:=QYearCode.Code;
                Q2date:=QYearCode."Reporting Start Date";
              END;
              IF (QCount=3) THEN BEGIN
                Q3:=QYearCode.Code;
                Q3date:=QYearCode."Reporting Start Date";
              END;
              IF (QCount=4) THEN BEGIN
                Q4:=QYearCode.Code;
                Q4date:=QYearCode."Reporting Start Date";
              END;
          UNTIL QYearCode.NEXT=0;
        END;


       // I:=0;
        FOR I:=1 TO 4 DO BEGIN

            IF (I=1) THEN BEGIN
                  FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
                  "Year Reporting Code",Q1,Q1date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q1 Target",WPlanLines."Q1 Budget",
                  No,SourceType::"Strategic Plan");
               END;
            IF (I=2) THEN BEGIN
                  FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
                  "Year Reporting Code",Q2,Q2date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q2 Target",WPlanLines."Q2 Budget",
                  No,SourceType::"Strategic Plan");
               END;

            IF (I=3) THEN BEGIN
                  FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
                  "Year Reporting Code",Q3,Q3date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q3 Target",WPlanLines."Q3 Budget",
                  No,SourceType::"Strategic Plan");

               END;
            IF (I=4) THEN BEGIN
                  FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
                  "Year Reporting Code",Q4,Q4date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q4 Target",WPlanLines."Q4 Budget",
                  No,SourceType::"Strategic Plan");
               END;
        END;*/

    end;


    procedure FnInsertEntryS(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record 80018;
    begin
        /*
        StrategyEntry.INIT;
        StrategyEntry."Strategic Plan ID":=PlanID;
        StrategyEntry."Theme ID":=ThemeID;
        StrategyEntry."Objective ID":=ObjectiveID;
        StrategyEntry."Strategy ID":=StrategyID;
        StrategyEntry."Activity ID":=Actitvityid;
        StrategyEntry."Entry Description":=Description;
        StrategyEntry."Entry Type":=EntryType;
        StrategyEntry."Year Reporting Code":=YearCode;
        StrategyEntry."Quarter Reporting Code":=QYearCode;
        StrategyEntry."Planning Date":=PlanningDate;
        StrategyEntry."Primary Directorate":=PrimaryDirectorate;
        StrategyEntry."Primary Department":=PrimaryDepartment;
        StrategyEntry.Quantity:=Quantity;
        StrategyEntry."Cost Amount":=CostAmount;
        StrategyEntry."External Document No":=Extdoc;
        StrategyEntry."Source Type":=SourceType;
        StrategyEntry.INSERT(TRUE);*/

    end;


    procedure FnGetCount(StrategicInitiative: Record 80015) NumCount: Integer
    var
        StrategicInitiativeYears: Record 80110;
    begin
        /*StrategicInitiativeYears.RESET;
        StrategicInitiativeYears.SETRANGE("Strategic Plan ID",StrategicInitiative."Strategic Plan ID");
        StrategicInitiativeYears.SETRANGE("Theme ID",StrategicInitiative."Theme ID");
        StrategicInitiativeYears.SETRANGE("Objective ID",StrategicInitiative."Objective ID");
        StrategicInitiativeYears.SETRANGE("Strategy ID",StrategicInitiative."Strategy ID");
        StrategicInitiativeYears.SETRANGE(Code,StrategicInitiative.Code);
        IF StrategicInitiativeYears.FIND('-') THEN BEGIN
          NumCount:=StrategicInitiativeYears.COUNT;
        END;
        EXIT(NumCount);
        */

    end;

    local procedure ValidateUserInput()
    var
        SPMGeneralSetup: Record 80021;
        NoSeriesManagement: Codeunit "No. Series";
    begin
        if (SourceAnnualWorkplanNo = '') or not SourceWorkPlan.Get(SourceWorkPlan.No) then
            Error(Text004, SourceWorkPlan.TableCaption);

        SPMGeneralSetup.Get;
        SPMGeneralSetup.TestField("Functional Annual Workplan Nos");
        if TargetAnnualWorkplanNo = '' then begin
            TargetAnnualWorkplanNo := NoSeriesManagement.GetNextNo(SPMGeneralSetup."Functional Annual Workplan Nos", 0D, true);
            if not Confirm(Text002, true, TargetAnnualWorkplanNo) then begin
                TargetAnnualWorkplanNo := '';
                Error('');
            end;
        end else
            NoSeriesManagement.TestManual(SPMGeneralSetup."Functional Annual Workplan Nos");
    end;

    procedure SetFromJob(SourceWorkplan2: Record 80019)
    begin
        SourceWorkPlan := SourceWorkplan2;
        SourceAnnualWorkplanNo := SourceWorkPlan.No;
        TargetJobDescription := SourceWorkPlan.Description;
        TargetBillToCustomerNo := SourceWorkPlan."Department Name";
    end;
}
