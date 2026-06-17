// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 80538 "Dept Workplan Alignments"
// {
//     Caption = 'Workplan Revision Alignment Tool';
//     InsertAllowed = false;
//     PageType = List;
//     SourceTable = 80264;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Primary Directorate";"Primary Directorate")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Primary Department";"Primary Department")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Activity Id";"Activity Id")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Activity Description";"Activity Description")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Sub Activity No";"Sub Activity No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Sub Activity Name";"Sub Activity Name")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Cost Elements";"Cost Elements")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Cost Element';
//                     Editable = false;
//                 }
//                 field("Job No";"Job No")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Financial Budget';
//                     Visible = false;
//                 }
//                 field("Vote id";"Vote id")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Vote Desription";"Vote Desription")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Procurment Plan No";"Procurment Plan No")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Procurement Plan No';
//                     Visible = false;
//                 }
//                 field("Plan Category";"Plan Category")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'PP Category';
//                     Editable = false;
//                 }
//                 field("Plan Item No";"Plan Item No")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'PP Item No';
//                     Visible = false;
//                 }
//                 field("Plan Item Description";"Plan Item Description")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'PP Item Category';
//                     Editable = false;
//                 }
//                 field("Unit Cost";"Unit Cost")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Quantity;Quantity)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Amount;Amount)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Funding Level";"Funding Level")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Comments;Comments)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Planning Budget Type";"Planning Budget Type")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             action("Copy AWP for Alignment")
//             {
//                 ApplicationArea = Basic;
//                 Image = UpdateDescription;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     CopyStrategicWorkplan: Page "Copy Annual Workplan";
//                 begin
//                     AnnualStrategyWorkplan.Reset;
//                     AnnualStrategyWorkplan.SetRange(No,"Workplan No.");
//                     if AnnualStrategyWorkplan.FindSet then
//                     CopyStrategicWorkplan.SetFromJob(AnnualStrategyWorkplan);
//                     CopyStrategicWorkplan.RunModal;
//                 end;
//             }
//             separator(Action28)
//             {
//             }
//             action("Update Budgets Amounts")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Update New AWP Budgets Amounts';
//                 Image = UpdateUnitCost;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     SPMGeneralSetup.Get();

//                     WorkplanCostElements.Reset;
//                     WorkplanCostElements.SetRange("Workplan No.",SPMGeneralSetup."Current Annual Workplan");
//                     if WorkplanCostElements.Find('-') then begin
//                        repeat
//                           SubWorkplanActivity.Reset;
//                           SubWorkplanActivity.SetRange("Workplan No.",WorkplanCostElements."Workplan No.");
//                           SubWorkplanActivity.SetRange("Activity Id",WorkplanCostElements."Activity Id");
//                           SubWorkplanActivity.SetRange("Sub Initiative No.",WorkplanCostElements."Sub Activity No");
//                           if SubWorkplanActivity.FindFirst then begin
//                             //    StrategicPlanning.FnSumSubActivityAmount(SubWorkplanActivity);

//                                StrategyWorkplanLines.Reset;
//                                StrategyWorkplanLines.SetRange(No,SubWorkplanActivity."Workplan No.");
//                                StrategyWorkplanLines.SetRange("Activity ID",SubWorkplanActivity."Activity Id");
//                                if StrategyWorkplanLines.FindFirst then begin
//                                 //    StrategicPlanning.FnSumActivityAmount(StrategyWorkplanLines);
//                                  end;
//                             end;

//                        until WorkplanCostElements.Next=0;
//                     end;
//                     Message('Budgets Updated Successfully');
//                 end;
//             }
//             separator(Action27)
//             {
//             }
//             action("Combined Annual Workplan Report")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Preview Departmental AWP Report';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     AnnualStrategyWorkplan.Reset;
//                     AnnualStrategyWorkplan.SetRange(No,"Workplan No.");
//                     if AnnualStrategyWorkplan.FindFirst then
//                        Report.Run(80050,true,true,AnnualStrategyWorkplan);
//                 end;
//             }
//             separator(Action25)
//             {
//             }
//             action("Annual Workplan Expenditure")
//             {
//                 ApplicationArea = Basic;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     AnnualStrategyWorkplan.Reset;
//                     AnnualStrategyWorkplan.SetRange(No,"Workplan No.");
//                     if AnnualStrategyWorkplan.FindFirst then
//                        Report.Run(80047,true,true,AnnualStrategyWorkplan);
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin

//         UserSetup.Reset;
//         UserSetup.SetRange("User ID",UserId);
//         if UserSetup.FindSet then  begin
//           Employee.Reset;
//           Employee.SetRange("No.",UserSetup."Employee No.");
//           if Employee.FindSet then begin
//             Directorate:=Employee."Directorate Code";
//             Department:=Employee."Department Code";

//             SPMGeneralSetup.Get();
//             Rec.SetRange("Workplan No.",SPMGeneralSetup."Current Rev Annual Workplan");
//             Rec.SetRange("Primary Directorate",Directorate);
//             Rec.SetRange("Primary Department",Department);

//             end;
//           end;

//         SubWorkplanActivity.Reset;
//         SubWorkplanActivity.SetRange("Workplan No.","Workplan No.");
//         SubWorkplanActivity.SetRange("Activity Id","Activity Id");
//         SubWorkplanActivity.SetRange("Sub Initiative No.","Sub Activity No");
//         if SubWorkplanActivity.FindSet then begin
//             "Sub Activity Name":=SubWorkplanActivity."Objective/Initiative";
//           end;
//     end;

//     trigger OnOpenPage()
//     begin

//         UserSetup.Reset;
//         UserSetup.SetRange("User ID",UserId);
//         if UserSetup.FindSet then  begin
//           Employee.Reset;
//           Employee.SetRange("No.",UserSetup."Employee No.");
//           if Employee.FindSet then begin
//             Directorate:=Employee."Directorate Code";
//             Department:=Employee."Department Code";

//             SPMGeneralSetup.Get();
//             Rec.SetRange("Workplan No.",SPMGeneralSetup."Current Rev Annual Workplan");
//             Rec.SetRange("Primary Directorate",Directorate);
//             Rec.SetRange("Primary Department",Department);

//             end;
//           end;
//     end;

//     var
//         SPMGeneralSetup: Record 80021;
//         WorkplanCostElements: Record 80264;
//         SubWorkplanActivity: Record 80262;
//         StrategicPlanning: Codeunit 
//         57007;
//         StrategyWorkplanLines: Record 80020;
//         AnnualStrategyWorkplan: Record 80019;
//         SourceWorkPlan: Record 80019;
//         CopyAnnualWorkplan: Codeunit 
//         57007;
//         SourceAnnualWorkplanNo: Code[20];
//         TargetAnnualWorkplanNo: Code[20];
//         TargetJobDescription: Text[100];
//         TargetBillToCustomerNo: Code[20];
//         Sources: Option "Job Planning Lines","Job Ledger Entries","None";
//         Text001: label 'The Workplan was successfully copied.';
//         Text002: label 'Workplan No. %1 will be assigned to the new Workplan. Do you want to continue?';
//         Text003: label '%1 %2 does not exist.', Comment='Job Task 1000 does not exist.';
//         Text004: label 'Provide a valid source %1.';
//         UserSetup: Record "User Setup";
//         Employee: Record Employee;
//         Directorate: Code[50];
//         Department: Code[50];


//     procedure fnPostPlanEntry(WPlanLines: Record 80020)
//     var
//         StrategyEntry: Record 80018;
//     begin
//             /*StrategicInt.RESET;
//             StrategicInt.SETRANGE(Code,WPlanLines."Activity ID");
//             IF StrategicInt.FIND('-') THEN BEGIN
//               ThemeID:=StrategicInt."Theme ID";
//               ObjectiveID:=StrategicInt."Objective ID";
//             END;

//             QYearCode.RESET;
//             QYearCode.SETRANGE("Year Code",WPlanLines."Year Reporting Code");
//             IF QYearCode.FIND('-')  THEN BEGIN
//               REPEAT
//                QCount:=QCount+1;
//                   IF (QCount=1) THEN BEGIN
//                     Q1:=QYearCode.Code;
//                     Q1date:=QYearCode."Reporting Start Date";
//                   END;
//                   IF (QCount=2) THEN BEGIN
//                     Q2:=QYearCode.Code;
//                     Q2date:=QYearCode."Reporting Start Date";
//                   END;
//                   IF (QCount=3) THEN BEGIN
//                     Q3:=QYearCode.Code;
//                     Q3date:=QYearCode."Reporting Start Date";
//                   END;
//                   IF (QCount=4) THEN BEGIN
//                     Q4:=QYearCode.Code;
//                     Q4date:=QYearCode."Reporting Start Date";
//                   END;
//               UNTIL QYearCode.NEXT=0;
//             END;


//            // I:=0;
//             FOR I:=1 TO 4 DO BEGIN

//                 IF (I=1) THEN BEGIN
//                       FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
//                       "Year Reporting Code",Q1,Q1date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q1 Target",WPlanLines."Q1 Budget",
//                       No,SourceType::"Strategic Plan");
//                    END;
//                 IF (I=2) THEN BEGIN
//                       FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
//                       "Year Reporting Code",Q2,Q2date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q2 Target",WPlanLines."Q2 Budget",
//                       No,SourceType::"Strategic Plan");
//                    END;

//                 IF (I=3) THEN BEGIN
//                       FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
//                       "Year Reporting Code",Q3,Q3date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q3 Target",WPlanLines."Q3 Budget",
//                       No,SourceType::"Strategic Plan");

//                    END;
//                 IF (I=4) THEN BEGIN
//                       FnInsertEntry(WPlanLines."Strategy Plan ID",ThemeID,ObjectiveID,WPlanLines."Strategy Plan ID",WPlanLines."Activity ID",WPlanLines.Description,WPlanLines."Entry Type"::Planned,
//                       "Year Reporting Code",Q4,Q4date,WPlanLines."Primary Directorate",WPlanLines."Primary Department",WPlanLines."Q4 Target",WPlanLines."Q4 Budget",
//                       No,SourceType::"Strategic Plan");
//                    END;
//             END;*/

//     end;


//     procedure FnInsertEntryS(PlanID: Code[50];ThemeID: Code[50];ObjectiveID: Code[50];StrategyID: Code[50];Actitvityid: Code[50];Description: Code[255];EntryType: Option Planned,Actual;YearCode: Code[50];QYearCode: Code[50];PlanningDate: Date;PrimaryDirectorate: Code[100];PrimaryDepartment: Code[100];Quantity: Decimal;CostAmount: Decimal;Extdoc: Code[50];SourceType: Option "Strategic Plan","Perfomance Contract")
//     var
//         StrategyEntry: Record 80018;
//     begin
//         /*
//         StrategyEntry.INIT;
//         StrategyEntry."Strategic Plan ID":=PlanID;
//         StrategyEntry."Theme ID":=ThemeID;
//         StrategyEntry."Objective ID":=ObjectiveID;
//         StrategyEntry."Strategy ID":=StrategyID;
//         StrategyEntry."Activity ID":=Actitvityid;
//         StrategyEntry."Entry Description":=Description;
//         StrategyEntry."Entry Type":=EntryType;
//         StrategyEntry."Year Reporting Code":=YearCode;
//         StrategyEntry."Quarter Reporting Code":=QYearCode;
//         StrategyEntry."Planning Date":=PlanningDate;
//         StrategyEntry."Primary Directorate":=PrimaryDirectorate;
//         StrategyEntry."Primary Department":=PrimaryDepartment;
//         StrategyEntry.Quantity:=Quantity;
//         StrategyEntry."Cost Amount":=CostAmount;
//         StrategyEntry."External Document No":=Extdoc;
//         StrategyEntry."Source Type":=SourceType;
//         StrategyEntry.INSERT(TRUE);*/

//     end;


//     procedure FnGetCount(StrategicInitiative: Record 80015) NumCount: Integer
//     var
//         StrategicInitiativeYears: Record 80110;
//     begin
//         /*StrategicInitiativeYears.RESET;
//         StrategicInitiativeYears.SETRANGE("Strategic Plan ID",StrategicInitiative."Strategic Plan ID");
//         StrategicInitiativeYears.SETRANGE("Theme ID",StrategicInitiative."Theme ID");
//         StrategicInitiativeYears.SETRANGE("Objective ID",StrategicInitiative."Objective ID");
//         StrategicInitiativeYears.SETRANGE("Strategy ID",StrategicInitiative."Strategy ID");
//         StrategicInitiativeYears.SETRANGE(Code,StrategicInitiative.Code);
//         IF StrategicInitiativeYears.FIND('-') THEN BEGIN
//           NumCount:=StrategicInitiativeYears.COUNT;
//         END;
//         EXIT(NumCount);
//         */

//     end;

//     local procedure ValidateUserInput()
//     var
//         SPMGeneralSetup: Record 80021;
//         NoSeriesManagement: Codeunit "No. Series";
//     begin
//         if (SourceAnnualWorkplanNo = '') or not SourceWorkPlan.Get(SourceWorkPlan.No) then
//           Error(Text004,SourceWorkPlan.TableCaption);

//         SPMGeneralSetup.Get;
//         SPMGeneralSetup.TestField("Functional Annual Workplan Nos");
//         if TargetAnnualWorkplanNo = '' then begin
//           TargetAnnualWorkplanNo:= NoSeriesManagement.GetNextNo(SPMGeneralSetup."Functional Annual Workplan Nos",0D,true);
//           if not Confirm(Text002,true,TargetAnnualWorkplanNo) then begin
//             TargetAnnualWorkplanNo := '';
//             Error('');
//           end;
//         end else
//           NoSeriesManagement.TestManual(SPMGeneralSetup."Functional Annual Workplan Nos");
//     end;

//     procedure SetFromJob(SourceWorkplan2: Record 80019)
//     begin
//         SourceWorkPlan := SourceWorkplan2;
//         SourceAnnualWorkplanNo := SourceWorkPlan.No;
//         TargetJobDescription := SourceWorkPlan.Description;
//         TargetBillToCustomerNo := SourceWorkPlan."Department Name";
//     end;
// }
