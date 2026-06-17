// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 80356 "Customer Survey Responses"
// {
//     CardPageID = "Customer Survey Response";
//     PageType = List;
//     SourceTable = 80222;
//     SourceTableView = where("Target Respondent Type"=const(Customers),
//                             Status=const(Open));

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Document No.";"Document No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Business Research Category";"Business Research Category")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Document Date";"Document Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Survey ID";"Survey ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Survey Type";"Survey Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Target Respondent Type";"Target Respondent Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Participant ID";"Participant ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Name;Name)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Project ID";"Project ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Primary Department ID";"Primary Department ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Primary Directorate ID";"Primary Directorate ID")
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
