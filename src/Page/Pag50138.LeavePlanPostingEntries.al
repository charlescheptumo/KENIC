page 50138 "Leave Plan Posting Entries"
{
    ApplicationArea = All;
    Caption = 'Leave Plan Posting Entries';
    DataCaptionFields = "Leave Plan No.";
    Editable = false;
    PageType = List;
    SourceTable = "Leave Plan Posting Entry";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Leave Plan No."; Rec."Leave Plan No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of a Leave Plan.';
                }
                field("Leave Plan Line No."; Rec."Leave Plan Line No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of a Leave Plan line.';
                }
                field("Leave Plan Date"; Rec."Leave Plan Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the date for which time usage information was entered in a Leave Plan.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the description that is contained in the details about the Leave Plan line.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of hours that have been posted for that date in the Leave Plan.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the document number that was generated or created for the Leave Plan during posting.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the posting date of the posted document.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Navigate")
            {
                ApplicationArea = Jobs;
                Caption = 'Find entries...';
                Image = Navigate;
                ShortCutKey = 'Ctrl+Alt+Q';
                ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.Run();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref("&Navigate_Promoted"; "&Navigate")
                {
                }
            }
        }
    }

    var
        Navigate: Page Navigate;
}
