// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 75202 "Low Value Procurements (LVP)"
// {
//     Caption = 'Low Value Procurements (LVP)';
//     CardPageID = "Direct Procurement Card";
//     PageType = List;
//     SourceTable = "Standard Purchase Code";
//     SourceTableView = where("Procurement Method"=const("Low Value Procurement"),
//                             Status=filter(<>Released));

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Code";Code)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Tender Name";"Tender Name")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Status;Status)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("PRN No.";"PRN No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Awarded Bidder No";"Awarded Bidder No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Awarded Bidder Name";"Awarded Bidder Name")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Procurement Method";"Procurement Method")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("RFQ Sent";"RFQ Sent")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Awarded Quote No";"Awarded Quote No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Awarded Bidder Sum";"Awarded Bidder Sum")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("External Document No";"External Document No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Tender Summary";"Tender Summary")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Procurement Category ID";"Procurement Category ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control7;Outlook)
//             {
//             }
//             systempart(Control8;Notes)
//             {
//             }
//             systempart(Control9;MyNotes)
//             {
//             }
//             systempart(Control10;Links)
//             {
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnAfterGetRecord()
//     begin
//         UserSetup.Reset;
//         UserSetup.SetRange("User ID",UserId);
//         if UserSetup.FindSet then begin
//           if UserSetup."Procurement Manager"=false or UserSetup."Procurement officer"= false then
//             Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
//           end;
//     end;

//     trigger OnOpenPage()
//     begin
//         UserSetup.Reset;
//         UserSetup.SetRange("User ID",UserId);
//         if UserSetup.FindSet then begin
//           if UserSetup."Procurement Manager"=false or UserSetup."Procurement officer"= false then
//             Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
//           end;
//     end;

//     var
//         UserSetup: Record "User Setup";
// }

