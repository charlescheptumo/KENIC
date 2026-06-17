// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 80043 "Performance Plan Tasks"
// {
//     CardPageID = "Performance Plan Task";
//     PageType = ListPart;
//     SourceTable =80052;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Performance Mgt Plan ID";"Performance Mgt Plan ID")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Task Code";"Task Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Task Category";"Task Category")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Review Periods";"Review Periods")
//                 {
//                     ApplicationArea = Basic;

//                     trigger OnValidate()
//                     begin
//                         if ReviewPeriod.Get("Review Periods") then begin
//                           "Performance Cycle Start Date":=ReviewPeriod."Starting Date";
//                           "Performance Cycle End Date":=ReviewPeriod."End Date";
//                           "Processing Start Date":=ReviewPeriod."Starting Date";
//                           "Processing Due Date":=ReviewPeriod."End Date";
//                           end;
//                     end;
//                 }
//                 field("Performance Cycle Start Date";"Performance Cycle Start Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Performance Cycle End Date";"Performance Cycle End Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Processing Start Date";"Processing Start Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Processing Due Date";"Processing Due Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Published?";"Published?")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Closed?";"Closed?")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Published By";"Published By")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Closed By";"Closed By")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("No of Evaluations/Appeals";"No of Evaluations/Appeals")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("Line Functions")
//             {
//                 action("Publish Task")
//                 {
//                     ApplicationArea = Basic;

//                     trigger OnAction()
//                     begin
//                         "Published?":=true;
//                         "Published By":=UserId;
//                         Message('Task Published Successfully');
//                     end;
//                 }
//                 action("Generate Appraisals")
//                 {
//                     ApplicationArea = Basic;
//                     Image = CreateDocument;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     begin
//                         if "Task Category"= "task category"::"Performance Review" then begin
//                           PerformanceManagementPlan.Reset;
//                           PerformanceManagementPlan.SetRange(No,"Performance Mgt Plan ID");
//                           if PerformanceManagementPlan.FindFirst then begin
//                             StrategicPlanning.FnGenerateBatchAppraisals(Rec,PerformanceManagementPlan."Strategy Plan ID");
//                           end;
//                         end;
//                     end;
//                 }
//                 action("Close Task")
//                 {
//                     ApplicationArea = Basic;

//                     trigger OnAction()
//                     begin
//                         Rec.TestField("Published?",true);
//                         "Closed?":=true;
//                         "Closed By":=UserId;
//                         Message('Task Closed Successfully');
//                     end;
//                 }
//             }
//         }
//     }

//     var
//         ReviewPeriod: Record UnknownRecord80101;
//         StrategicPlanning: Codeunit UnknownCodeunit57007;
//         PerformanceManagementPlan: Record UnknownRecord80050;
// }
