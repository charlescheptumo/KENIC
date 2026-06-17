// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 80078 "Objectives and Outcomes-N"
// {
//     PageType = ListPart;
//     SourceTable =80080;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Performance Evaluation ID";"Performance Evaluation ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Line No";"Line No")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Scorecard ID";"Scorecard ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Scorecard Line No";"Scorecard Line No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Objective/Initiative";"Objective/Initiative")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Outcome Perfomance Indicator";"Outcome Perfomance Indicator")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Unit of Measure";"Unit of Measure")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Desired Perfomance Direction";"Desired Perfomance Direction")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Performance Rating Scale";"Performance Rating Scale")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Scale Type";"Scale Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Target Qty";"Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Self-Review Qty";"Self-Review Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("AppraiserReview Qty";"AppraiserReview Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Final/Actual Qty";"Final/Actual Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("Related Information")
//             {
//                 Caption = 'Related Information';
//                 action(DocAttach)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Attachments';
//                     Image = Attach;
//                     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

//                     trigger OnAction()
//                     var
//                         DocumentAttachmentDetails: Page "Document Attachment Details";
//                         RecRef: RecordRef;
//                     begin
//                         RecRef.GetTable(Rec);
//                         DocumentAttachmentDetails.OpenForRecRef(RecRef);
//                         DocumentAttachmentDetails.RunModal;
//                     end;
//                 }
//             }
//         }
//     }
// }
