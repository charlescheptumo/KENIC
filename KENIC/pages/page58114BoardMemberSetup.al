// page 58114 "Board Member Setup"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "Board Member Setup";
//     Caption = 'Board Member Setup';

//     layout
//     {
//         area(Content)
//         {
//             repeater(Control1)
//             {
//                 field("Employee No."; Rec."Employee No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the unique identification code of the employee.';
//                 }
//                 field("Employee Name"; Rec."Employee Name")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                     ToolTip = 'Displays the employee full name.';
//                 }
//                 field("Board Role"; Rec."Board Role")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the seat/role held by this board member.';
//                 }
//                 field("Department Code"; Rec."Department Code")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                     ToolTip = 'Displays the corporate division department linked to this member.';
//                 }
//                 field(Email; Rec.Email)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                     ToolTip = 'Displays the primary contact email address.';
//                 }
//                 field(Active; Rec.Active)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies whether this member is eligible to participate in active voting campaigns.';
//                 }
//                 field("Default Voter"; Rec."Default Voter")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies if they are automatically added to every newly initiated Circular Resolution.';
//                 }
//                 field("Start Date"; Rec."Start Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies when their legal term or active service on the board begins.';
//                 }
//                 field("End Date"; Rec."End Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the expiration date of their board term.';
//                 }
//             }
//         }
//     }
// }