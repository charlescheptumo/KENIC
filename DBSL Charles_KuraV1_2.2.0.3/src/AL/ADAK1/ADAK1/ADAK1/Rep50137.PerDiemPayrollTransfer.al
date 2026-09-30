// namespace KENIC.KENIC;
// report 50137 "Per Diem Payroll Transfer"
// {
//     Caption = 'Transfer Per Diems to Payroll';
//     ProcessingOnly = true;
//     ApplicationArea = All;
//     UsageCategory = Tasks;

//     dataset
//     {
//     }

//     requestpage
//     {
//         SaveValues = false;

//         layout
//         {
//             area(Content)
//             {
//                 group(Options)
//                 {
//                     Caption = 'Options';
//                     field(RecipientTypeField; RecipientType)
//                     {
//                         ApplicationArea = All;
//                         Caption = 'Transfer For';
//                         OptionCaption = 'Staff Payroll,Board Payroll';
//                         ToolTip = 'Specifies whether to transfer staff or board per diems.';

//                         trigger OnValidate()
//                         begin
//                             SetDefaultPeriod();
//                         end;
//                     }
//                     field(PeriodStartField; PeriodStart)
//                     {
//                         ApplicationArea = All;
//                         Caption = 'Payroll Period';
//                         ToolTip = 'Specifies the open payroll period.';

//                         trigger OnLookup(var Text: Text): Boolean
//                         var
//                             PayrollPeriod: Record "Payroll PeriodX";
//                             DirectorPayrollPeriod: Record "Director Payroll Period";
//                         begin
//                             if RecipientType = RecipientType::"Staff Payroll" then begin
//                                 PayrollPeriod.SetRange(Closed, false);
//                                 if Page.RunModal(0, PayrollPeriod) = Action::LookupOK then
//                                     PeriodStart := PayrollPeriod."Starting Date";
//                             end else begin
//                                 DirectorPayrollPeriod.SetRange(Closed, false);
//                                 if Page.RunModal(0, DirectorPayrollPeriod) = Action::LookupOK then
//                                     PeriodStart := DirectorPayrollPeriod."Starting Date";
//                             end;
//                         end;
//                     }
//                 }
//             }
//         }

//         trigger OnOpenPage()
//         begin
//             SetDefaultPeriod();
//         end;
//     }

//     trigger OnPreReport()
//     var
//         PerDiemMgt: Codeunit "Per Diem Payroll Mgt.";
//         Counter: Integer;
//     begin
//         if PeriodStart = 0D then
//             Error(PeriodMissingErr);
//         if RecipientType = RecipientType::"Staff Payroll" then
//             Counter := PerDiemMgt.TransferEmployeesToPayroll(PeriodStart)
//         else
//             Counter := PerDiemMgt.TransferDirectorsToPayroll(PeriodStart);
//         Message(DoneMsg, Counter, PeriodStart);
//     end;

//     var
//         RecipientType: Option "Staff Payroll","Board Payroll";
//         PeriodStart: Date;
//         PeriodMissingErr: Label 'Select a payroll period.';
//         DoneMsg: Label '%1 per diem warrant(s) transferred to payroll period %2.', Comment = '%1 = count, %2 = period';

//     local procedure SetDefaultPeriod()
//     var
//         PayrollPeriod: Record "Payroll PeriodX";
//         DirectorPayrollPeriod: Record "Director Payroll Period";
//     begin
//         PeriodStart := 0D;
//         if RecipientType = RecipientType::"Staff Payroll" then begin
//             PayrollPeriod.SetRange(Closed, false);
//             if PayrollPeriod.FindFirst() then
//                 PeriodStart := PayrollPeriod."Starting Date";
//         end else begin
//             DirectorPayrollPeriod.SetRange(Closed, false);
//             if DirectorPayrollPeriod.FindFirst() then
//                 PeriodStart := DirectorPayrollPeriod."Starting Date";
//         end;
//     end;
// }