// page 58125 "Board Meeting Conflicts"
// {
//     PageType = ListPart;
//     SourceTable = "Board Meeting Conflict";
//     ApplicationArea = All;
//     Caption = 'Board Meeting Conflicts';
//     AutoSplitKey = true;

//     Editable = false;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     DeleteAllowed = false;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Agenda No."; Rec."Agenda No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the agenda item number tied to this conflict.';
//                 }
//                 field("Board Member No."; Rec."Board Member No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the board member declaring the conflict.';

//                     trigger OnValidate()
//                     begin
//                         CurrPage.Update(false);
//                     end;
//                 }
//                 field("Board Member Name"; Rec."Board Member Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Shows the calculated name of the board member.';
//                 }
//                 field("Declaration No."; Rec."Declaration No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the standing annual/general declaration reference number.';
//                 }
//                 field("Conflict Type"; Rec."Conflict Type")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the nature of the conflict of interest.';
//                 }
//                 field(Comments; Rec.Comments)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies additional details regarding the declared conflict.';
//                 }
//             }
//         }
//     }
// }