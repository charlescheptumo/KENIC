page 58141 "Compliance Calendar Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Compliance Calendar Entry";
    Caption = 'Compliance Calendar Entries';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the calendar entry number.';
                }
                field("Obligation No."; Rec."Obligation No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the related compliance obligation number.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the compliance category code.';
                }

                field("Legislation Name"; Rec."Legislation Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the legislation name.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the title or requirement for the entry.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when this entry is due.';
                }
                field("Responsible Officer No."; Rec."Assigned Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assigned officer number.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current completion status.';
                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the entry was completed.';
                }
                // field("Proof Attached"; Rec."Proof Attached")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies if supporting documentation has been attached.';
                // }
            }
        }
    }

//     actions
// {
//     area(Processing)
//     {
//         action(DeleteEntry)
//         {
//             ApplicationArea = All;
//             Caption = 'Delete';
//             Image = Delete;
//             Promoted = true;
//             PromotedCategory = Process;

//             trigger OnAction()
//             begin
//                 if Confirm('Delete Compliance Calendar Entry %1?', false, Rec."No.") then begin
//                     Rec.Delete(true);
//                     CurrPage.Update(false);
//                 end;
//             end;
//         }
//     }
// }
}