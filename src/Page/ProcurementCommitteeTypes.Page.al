// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 75111 "Procurement Committee Types"
// {
//     CardPageID = "Procurement Comm Types Card";
//     PageType = List;
//     SourceTable = "Procurement Committee Types";

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Committee Type";"Committee Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Title of Appointing Officer";"Title of Appointing Officer")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Non-Staff Allowed";"Non-Staff Allowed")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Min. No. of Members";"Min. No. of Members")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Mandate Type";"Mandate Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("No. of Appointments Made";"No. of Appointments Made")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Blocked;Blocked)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Inspection Committee";"Inspection Committee")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(IFS;IFS)
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group(ActionGroup9)
//             {
//                 action("Procurement Committe Composition")
//                 {
//                     ApplicationArea = Basic;
//                     Image = TeamSales;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     RunObject = Page "Procurement Comm Composition";
//                     RunPageLink = "Committee Type"=field("Committee Type");
//                 }
//                 action("Procurement Committee Function")
//                 {
//                     ApplicationArea = Basic;
//                     Image = WorkCenterLoad;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     RunObject = Page "Procurement Committee Function";
//                     RunPageLink = "Committee Type"=field("Committee Type");
//                 }
//             }
//         }
//     }
// }

