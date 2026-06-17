// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 80115 "Sub Objectives/Intiatives-ViewN"
// {
//     Caption = 'Sub Activities';
//     PageType = List;
//     SourceTable = 80102;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Sub Initiative No."; "Sub Initiative No.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sub Activities No.';
//                 }
//                 field("Sub-Initiative"; "Objective/Initiative")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sub Activities';
//                 }
//                 field("Sub Activity Description"; "Sub Activity Description")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Individual Action';
//                 }
//                 field("Sub-Indicator"; "Outcome Perfomance Indicator")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = true;
//                 }
//                 field("Unit of Measure"; "Unit of Measure")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Sub Targets"; "Sub Targets")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Target; "Imported Annual Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Target';
//                     Visible = false;
//                 }
//                 field("Completion Date"; "Due Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Budget; Budget)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Sub Activity weight %"; "Sub Activity weight %")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Expense Amount"; "Expense Amount")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q1 Target Qty"; "Q1 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q2 Target Qty"; "Q2 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q3 Target Qty"; "Q3 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q4 Target Qty"; "Q4 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnQueryClosePage(CloseAction: action): Boolean
//     begin
//         SubPCObjective.Reset;
//         SubPCObjective.SetRange("Workplan No.", "Workplan No.");
//         SubPCObjective.SetRange("Initiative No.", "Initiative No.");
//         SubPCObjective.CalcSums("Sub Activity weight %");
//         if SubPCObjective."Sub Activity weight %" <> 100 then begin
//             Message('Sub Activity agreed weight should equal to 100%');
//             exit(false);
//         end;
//     end;

//     var
//         SubPCObjective: Record 80102;
// }
