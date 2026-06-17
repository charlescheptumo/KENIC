// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 80491 "Approved Dept Annual Workplans"
// {
//     Caption = 'Functional Annual Workplans';
//     CardPageID = "Approved Functional AWP";
//     DeleteAllowed = false;
//     Editable = false;
//     PageType = List;
//     SourceTable = 80019;
//     SourceTableView = where("Annual Strategy Type"=filter(Functional),
//                             "Approval Status"=filter(Released),
//                             Archived=const(false));

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field(No;No)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Strategy Plan ID";"Strategy Plan ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Year Reporting Code";"Year Reporting Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Start Date";"Start Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("End Date";"End Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Department;Department)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Department Name";"Department Name")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }
// }
