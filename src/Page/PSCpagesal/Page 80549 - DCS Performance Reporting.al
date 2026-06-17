// page 80549 "DCS Performance Reporting-New"
// {
//     Caption = 'DCS Annual Workplan Contract';
//     DeleteAllowed = false;
//     PageType = Card;
//     SourceTable = "80055";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field(No;No)
//                 {
//                     Caption = 'Contract No';
//                     Editable = false;
//                 }
//                 field("Responsible Employee No.";"Responsible Employee No.")
//                 {
//                     Caption = 'Employee No';
//                 }
//                 field("Employee Name";"Employee Name")
//                 {
//                     Editable = false;
//                 }
//                 field(Description;Description)
//                 {
//                 }
//                 field("Strategy Plan ID";"Strategy Plan ID")
//                 {
//                 }
//                 field("Functional WorkPlan";"Functional WorkPlan")
//                 {
//                     Caption = 'AWP Template';
//                 }
//                 field("Contract Year";"Annual Reporting Code")
//                 {
//                 }
//                 field("Goal Template ID";"Goal Template ID")
//                 {
//                     Visible = false;
//                 }
//                 field("Approval Status";"Approval Status")
//                 {
//                     Editable = false;
//                 }
//                 field(Status;Status)
//                 {
//                     Editable = false;
//                 }
//                 field("Change Status";"Change Status")
//                 {
//                     Editable = false;
//                 }
//                 field("Start Date";"Start Date")
//                 {
//                     Editable = false;
//                 }
//                 field("End Date";"End Date")
//                 {
//                     Editable = false;
//                 }
//                 field(Designation;Designation)
//                 {
//                     Visible = false;
//                 }
//                 field(Grade;Grade)
//                 {
//                     Visible = false;
//                 }
//                 field("Responsibility Center";"Responsibility Center")
//                 {
//                     Caption = 'Division Code';
//                 }
//                 field("Responsibility Center Name";"Responsibility Center Name")
//                 {
//                     Caption = 'Division Name';
//                     Editable = false;
//                 }
//                 field("Blocked?";"Blocked")
//                 {
//                     Visible = false;
//                 }
//                 field("Created By";"Created By")
//                 {
//                     Editable = false;
//                 }
//                 field("Created On";"Created On")
//                 {
//                     Editable = false;
//                 }
//                 // field("Total  Departments Count";"Total  Departments Count")
//                 // {
//                 // }
//                 // field("Total Weight(%)";"Total Weight(%)")
//                 // {
//                 //     Editable = false;
//                 // }
//                 field("Total Assigned Weight(%)";"Total Assigned Weight(%)")
//                 {
//                     Caption = 'Total Assigned Weight(%)';
//                     Editable = false;
//                 }
//             }
//             part("Core Activities";80547)
//             {
//                 Caption = 'Core Activities';
//                 SubPageLink = "Workplan No."=FIELD(No),
//                               "Initiative Type"=FILTER(Activity|Board);
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group(Performance)
//             {
//                 Caption = 'Performance';
//                 Image = Vendor;
//                 group("Performance Review")
//                 {
//                     Caption = 'Performance Review';
//                     Image = Vendor;
//                     action("Performance Appraisal")
//                     {
//                         Image = AddWatch;
//                         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedCategory = Process;
//                         // RunObject = Page 80084;
//                         // RunPageLink = "Personal Scorecard ID"=FIELD(No),
//                         //               Document Type=CONST(Performance Appraisal);
//                     }
//                     action("Performance Appeal")
//                     {
//                         Caption = 'Performance Appeal';
//                         Image = AddWatch;
//                         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedCategory = Process;
//                         // RunObject = Page 80089;
//                         // RunPageLink = "Personal Scorecard ID"=FIELD(No),
//                         //               "Document Type"=CONST(Performance Appeal);
//                     }
//                     action(PIPs)
//                     {
//                         Caption = 'PIPs';
//                         Image = AddWatch;
//                         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedCategory = Process;
//                         // RunObject = Page 80103;
//                         // RunPageLink = Personal Scorecard ID=FIELD(No);
//                     }
//                 }
//                 action("Co&mments")
//                 {
//                     Caption = 'Co&mments';
//                     Image = ViewComments;
//                     // RunObject = Page 5222;
//                     // RunPageLink = Table Name=CONST(7),
//                     //               No.=FIELD(No. Series);
//                 }
//                 action(Dimensions)
//                 {
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     ShortCutKey = 'Shift+Ctrl+D';

//                     trigger OnAction()
//                     begin
//                         ShowDocDim;
//                         CurrPage.SAVERECORD;
//                     end;
//                 }
//                 action("Change Log")
//                 {
//                     Image = Log;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     // RunObject = Page 80100;
//                     // RunPageLink = "Personal Scorecard ID"=FIELD(No);
//                 }
//             }
//         }
//         area(creation)
//         {
//             action("Suggest Objective Lines")
//             {
//                 Image = Suggest;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
//                       ERROR('Activities not Suggested');

//                     TESTFIELD("Strategy Plan ID");
//                     //TESTFIELD("Annual Performance Contract");
//                     TESTFIELD("Functional WorkPlan");
//                     TESTFIELD("Annual Reporting Code");

//                     SPMGeneralSetup.GET;

//                     IF (SPMGeneralSetup."Allow Loading of  CSP"=TRUE) THEN BEGIN
//                       PcLinesN.RESET;
//                       PcLinesN.SETRANGE("Strategy Plan ID","Strategy Plan ID");
//                       PcLinesN.SETRANGE("Workplan No.","Functional WorkPlan");
//                       PcLinesN.SETRANGE("Primary Directorate","Responsibility Center");
//                       IF PcLinesN.FIND('-') THEN BEGIN
//                          REPEAT
//                            //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
//                            PcLines.INIT;
//                            PcLines."Workplan No.":=No;
//                            PcLines."Strategy Plan ID":=PcLinesN."Strategy Plan ID";
//                            PcLines."Initiative Type":= PcLinesN."Initiative Type";
//                            PcLines."Initiative No.":=PcLinesN."Initiative No.";
//                            PcLines."Goal Template ID":="Goal Template ID";
//                            PcLines."Objective/Initiative":=PcLinesN."Objective/Initiative";
//                            PcLines."Year Reporting Code":="Annual Reporting Code";
//                            PcLines."Primary Directorate":=PcLinesN."Primary Directorate";
//                            PcLines."Primary Department":=PcLinesN."Primary Department";
//                            PcLines."Outcome Perfomance Indicator":=PcLinesN."Outcome Perfomance Indicator";
//                            PcLines."Assigned Weight (%)":=PcLinesN."Assigned Weight (%)";
//                            PcLines."Summary of subactivities":=PcLinesN."Summary of subactivities";
//                            PcLines."Strategy Framework":=PcLinesN."Strategy Framework";
//                            PcLines."Framework Perspective":=PcLines."Framework Perspective";
//                            PcLines."Unit of Measure":=PcLinesN."Unit of Measure";
//                            PcLines."Start Date":="Start Date";
//                            PcLines."Due Date":="End Date";
//                            PcLines.Budget:=PcLinesN.Budget;
//                            PcLines."Imported Annual Target Qty":=PcLinesN."Imported Annual Target Qty";
//                            PcLines."Q1 Target Qty":=PcLinesN."Q1 Target Qty";
//                            PcLines."Q2 Target Qty":=PcLinesN."Q2 Target Qty";
//                            PcLines."Q3 Target Qty":=PcLinesN."Q3 Target Qty";
//                            PcLines."Q4 Target Qty":=PcLinesN."Q4 Target Qty";
//                            PcLines.INSERT(TRUE);

//                           //Sub Activities
//                               OriginalSubActivities.RESET;
//                               OriginalSubActivities.SETRANGE("Strategy Plan ID","Strategy Plan ID");
//                               OriginalSubActivities.SETRANGE("Workplan No.","Functional WorkPlan");
//                               OriginalSubActivities.SETRANGE("Initiative No.",PcLines."Initiative No.");
//                               IF  OriginalSubActivities.FINDFIRST THEN BEGIN
//                                 REPEAT
//                                   PCSubActivities.INIT;
//                                   PCSubActivities."Strategy Plan ID":=OriginalSubActivities."Strategy Plan ID";
//                                   PCSubActivities."Workplan No.":=No;
//                                   PCSubActivities."Initiative No.":= OriginalSubActivities."Initiative No.";
//                                   PCSubActivities."Sub Initiative No.":=OriginalSubActivities."Sub Initiative No.";
//                                   PCSubActivities."Entry Number":=OriginalSubActivities."Entry Number";
//                                   PCSubActivities.TRANSFERFIELDS(OriginalSubActivities,FALSE);
//                                   PCSubActivities.INSERT(TRUE);
//                                 UNTIL OriginalSubActivities.NEXT=0;
//                               END;
//                               //End Sub Activities


//                        BoardSubActivities.RESET;
//                           BoardSubActivities.SETRANGE("Strategy Plan ID","Strategy Plan ID");
//                           //BoardSubActivities.SETRANGE("Workplan No.","Annual Performance Contract");
//                           BoardSubActivities.SETRANGE("Initiative No.",PcLines."Initiative No.");
//                           IF  BoardSubActivities.FINDFIRST THEN BEGIN
//                             REPEAT
//                               PCSubActivities.INIT;
//                               PCSubActivities."Strategy Plan ID":=BoardSubActivities."Strategy Plan ID";
//                               PCSubActivities."Workplan No.":=No;
//                               PCSubActivities."Initiative No.":= BoardSubActivities."Initiative No.";
//                               PCSubActivities."Sub Initiative No.":=BoardSubActivities."Sub Initiative No.";
//                               PCSubActivities."Entry Number":=BoardSubActivities."Entry Number";
//                               PCSubActivities.TRANSFERFIELDS(BoardSubActivities,FALSE);
//                               PCSubActivities.INSERT(TRUE);
//                             UNTIL BoardSubActivities.NEXT=0;
//                           END;
//                           //End Sub Activities
//                          UNTIL PcLinesN.NEXT=0;
//                         END;
//                       END;
//                       //Loading JD
//                     IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
//                       JobResponsiblities.RESET;
//                        IF "Acting Job ID"<>'' THEN BEGIN
//                         JobResponsiblities.SETRANGE("Job ID","Acting Job ID");
//                       END ELSE BEGIN
//                       JobResponsiblities.SETRANGE("Job ID",Position);
//                         END;
//                       IF JobResponsiblities.FINDFIRST THEN BEGIN
//                         REPEAT
//                           PCJobDescription.INIT;
//                           PCJobDescription."Workplan No.":=No;
//                         //   PCJobDescription."Line Number":=FORMAT(JobResponsiblities."Entry No.");
//                         //   PCJobDescription.Description:=JobResponsiblities.Responsibility;
//                           PCJobDescription."Primary Department":="Responsibility Center";
//                           PCJobDescription.VALIDATE("Primary Department");
//                           PCJobDescription.INSERT;

//                         UNTIL JobResponsiblities.NEXT=0;
//                       END;
//                     END;

//                     //load JD from New HR Module    \\Kisavi
//                     /*IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
//                       JobRes.RESET;
//                       IF "Acting Job ID"<>'' THEN BEGIN
//                         JobRes.SETRANGE("Position ID","Acting Job ID");
//                         END ELSE BEGIN
//                         JobRes.SETRANGE("Position ID",Position);
//                           END;
//                         IF JobRes.FINDFIRST THEN BEGIN
//                         REPEAT
//                           PCJobDescription.INIT;
//                           PCJobDescription."Workplan No.":=No;
//                           PCJobDescription."Line Number":=FORMAT(JobRes."Line No");
//                           PCJobDescription.Description:=JobRes.Description;
//                           PCJobDescription."Primary Department":="Responsibility Center";
//                           PCJobDescription.VALIDATE("Primary Department");
//                           PCJobDescription.INSERT;

//                         UNTIL JobRes.NEXT=0;
//                       END;
//                     END; */


//                     //Board Sub-activities
//                     /*BoardSubActivities.RESET;
//                     BoardSubActivities.SETRANGE("Workplan No.","Annual Workplan");
//                     IF BoardSubActivities.FINDSET THEN BEGIN
//                     REPEAT
//                     PCSubActivities.INIT;
//                     PCSubActivities."Workplan No.":=No;
//                     PCSubActivities."Initiative No.":=BoardSubActivities."Activity Id";
//                     PCSubActivities.TRANSFERFIELDS(BoardSubActivities,FALSE);
//                     PCSubActivities.INSERT(TRUE);
//                     UNTIL BoardSubActivities.NEXT=0;
//                     END;*/

//                     MESSAGE('Functional PC Populated Successfully');

//                 end;
//             }
//             action("Populate Goals Hub")
//             {
//                 Image = PostBatch;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     GoalTemplateLine.RESET;
//                     GoalTemplateLine.SETRANGE("Goal Template ID","Goal Template ID");
//                     IF GoalTemplateLine.FIND('-') THEN BEGIN
//                         REPEAT
//                           workplangoalhub.INIT;
//                           workplangoalhub."Goal ID":=GoalTemplateLine."Goal ID";
//                           workplangoalhub."Performance Contract ID":=No;
//                           workplangoalhub."Goal Description":=GoalTemplateLine.Description;
//                           workplangoalhub."Aligned-To PC ID":=GoalTemplateLine."Corporate Strategic Plan ID";
//                           workplangoalhub."Aligned-To PC Goal ID":=GoalTemplateLine."Strategic Objective ID";
//                           workplangoalhub.INSERT(TRUE);
//                           UNTIL GoalTemplateLine.NEXT=0;
//                       END;
//                       MESSAGE('WorkPlan Hub Populated successfully');
//                 end;
//             }
//             action("Aligned Business Goals")
//             {
//                 Image = "Action";
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;
//                 // RunObject = Page 80051;
//                 // RunPageLink = "Performance Contract ID"=FIELD(No);
//                 Visible = false;
//             }
//             action("Risk Analysis")
//             {
//                 Image = Reserve;
//                 Promoted = true;
//                 PromotedCategory = Category5;
//                 PromotedIsBig = true;
//                 // RunObject = Page 80052;
//                 // RunPageLink = "Document No"=FIELD(No);
//                 Visible = false;
//             }
//             action("Capability Matrix")
//             {
//                 Image = "Action";
//                 Promoted = true;
//                 PromotedCategory = Category5;
//                 PromotedIsBig = true;
//                 // RunObject = Page 80053;
//                 // RunPageLink = "Document No"=FIELD(No);
//                 Visible = false;
//             }
//             // separator()
//             // {
//             // }
//             action(Approvals)
//             {
//                 Image = Approval;
//                 Promoted = true;
//                 PromotedCategory = Category5;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                      //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
//                 end;
//             }
//             // separator()
//             // {
//             // }
//             action("Preview Tagets")
//             {
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Category6;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     SETRANGE(No,No);
//                     //REPORT.RUN(80004,TRUE,TRUE,Rec)
//                     //REPORT.RUN(80053,TRUE,TRUE,Rec)
//                 end;
//             }
//             action("Preview Achievements")
//             {
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Category6;

//                 trigger OnAction()
//                 begin
//                     SETRANGE(No,No);
//                     //REPORT.RUN(80004,TRUE,TRUE,Rec)
//                     //REPORT.RUN(80062,TRUE,TRUE,Rec)
//                 end;
//             }
//             action("Print Individual PC")
//             {
//                 Caption = ' Individual Annual Workplan Contract';
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Category6;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     SETRANGE(No,No);
//                     //REPORT.RUN(80007,TRUE,TRUE,Rec)
//                 end;
//             }
//             action("Individual PC-Sub Indicators")
//             {
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Category6;
//                 // RunObject = Report 80017;
//                 // Visible = false;
//             }
//         }
//         area(processing)
//         {
//             group("<Action9>")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action(LockContract)
//                 {
//                     ApplicationArea = Service;
//                     Caption = '&Lock Contract';
//                     Image = Lock;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     ToolTip = 'Make sure that the changes will be part of the contract.';
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         //LockOpenServContract: Codeunit "5943";
//                     begin
//                         TESTFIELD("Approval Status","Approval Status"::Released);
//                         "Change Status":="Change Status"::Locked;
//                         MODIFY;
//                         MESSAGE('Contract Locked Successfully');
//                     end;
//                 }
//                 action(SignContract)
//                 {
//                     ApplicationArea = Service;
//                     Caption = 'Si&gn Contract';
//                     Image = Signature;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     ToolTip = 'Confirm the contract.';
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         //SignServContractDoc: Codeunit "5944";
//                     begin
//                         TESTFIELD("Approval Status","Approval Status"::Released);
//                         TESTFIELD("Change Status","Change Status"::Locked);
//                         Status:=Status::Signed;
//                         MODIFY;
//                         MESSAGE('Contract signed Successfully');
//                     end;
//                 }
//                 action(CopyWorkplan)
//                 {
//                     ApplicationArea = Jobs;
//                     Caption = '&Copy WorkPlan';
//                     Ellipsis = true;
//                     Image = CopyFromTask;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     ToolTip = 'Copy a Workplan and its Lines';
//                     Visible = false;

//                     trigger OnAction()
//                     // var
//                     //     CopyJob: Page "80088";
//                     begin
//                     //     CopyJob.SetFromWorkplan(Rec);
//                     //     CopyJob.RUNMODAL;
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         "Document Type":="Document Type"::"Individual Scorecard PC";
//         "Score Card Type":="Score Card Type"::Directors;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin

//         "Document Type":="Document Type"::"Individual Scorecard PC";
//         "Score Card Type":="Score Card Type"::Directors;
//     end;

//     trigger OnOpenPage()
//     begin
//         "Document Type":="Document Type"::"Individual Scorecard PC";
//         "Score Card Type":="Score Card Type"::Directors;
//     end;

//     var
//         GoalTemplateLine: Record 80082;
//         workplangoalhub: Record 80057;
//         StrategyObjLines: Record 80020;
//         PcLines: Record 80060;
//         PcLinesN: Record 80060;
//         JobResponsiblities: Record 69108;
//         PCJobDescription: Record 80120;
//         SPMGeneralSetup: Record 80021;
//         TotalWeight: Decimal;
//         BoardSubActivities: Record 80229;
//         PCSubActivities: Record 80102;
//         //ApprovalsMgmt: Codeunit "1535";
//         OriginalSubActivities: Record 80102;
//         JobRes: Record 69603;
//         SubWorkplanActivity: Record 80262;
// }

