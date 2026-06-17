// page 80543 "Approved Departments PCs"
// {
//     Caption = 'Departmental Annual Performance Workplans';
//     CardPageID = "Approved Departments Pc";
//     DeleteAllowed = false;
//     Editable = false;
//     PageType = List;
//     SourceTable = 80055;
//     SourceTableView = WHERE("Document Type"=FILTER("Individual Scorecard"),
//                             "Score Card Type"=FILTER(Departmental),
//                             "Approval Status"=FILTER(Released),
//                             "Planning Budget Type"=CONST(Original));

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field(No;No)
//                 {
//                 }
//                 field("Document Type";"Document Type")
//                 {
//                 }
//                 field(Description;Description)
//                 {
//                 }
//                 field("Document Date";"Document Date")
//                 {
//                 }
//                 field("Objective Setting Due Date";"Objective Setting Due Date")
//                 {
//                 }
//                 field("Strategy Plan ID";"Strategy Plan ID")
//                 {
//                 }
//                 field("Annual Reporting Code";"Annual Reporting Code")
//                 {
//                 }
//                 field("Start Date";"Start Date")
//                 {
//                 }
//                 field("End Date";"End Date")
//                 {
//                 }
//                 field("Responsible Employee No.";"Responsible Employee No.")
//                 {
//                 }
//                 field(Designation;Designation)
//                 {
//                 }
//                 field(Grade;Grade)
//                 {
//                 }
//                 field("Employee Name";"Employee Name")
//                 {
//                 }
//                 field("Responsibility Center";"Responsibility Center")
//                 {
//                 }
//                 field("Responsibility Center Name";"Responsibility Center Name")
//                 {
//                 }
//                 field("Evaluation Type";"Evaluation Type")
//                 {
//                 }
//                 field("Approval Status";"Approval Status")
//                 {
//                 }
//                 field("Blocked?";"Blocked?")
//                 {
//                 }
//                 field("Created By";"Created By")
//                 {
//                 }
//                 field("Created On";"Created On")
//                 {
//                 }
//                 field("Last Evaluation Date";"Last Evaluation Date")
//                 {
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }
// }

