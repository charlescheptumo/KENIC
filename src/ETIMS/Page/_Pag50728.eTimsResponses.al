// /// <summary>
// /// Administration list page over eTimsPushCredit showing the raw JSON response received from eTIMS for each pushed credit note/invoice code.
// /// </summary>
// page 50728 "eTims Responses"
// {
//     ApplicationArea = Basic;
//     Caption = 'eTims Responses';
//     PageType = List;
//     SourceTable = eTimsPushCredit;
//     UsageCategory = Administration;


//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';

//                 field("Code"; Rec."Code")
//                 {
//                     ToolTip = 'Specifies the value of the Code field.';
//                 }
//                 field(Json; Rec.Json)
//                 {
//                     Caption = 'Response';
//                     ToolTip = 'Specifies the value of the Json field.';
//                 }
//             }
//         }
//     }
// }
