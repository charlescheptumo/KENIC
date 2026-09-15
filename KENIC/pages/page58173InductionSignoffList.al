#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
#pragma implicitwith disable

page 58173 "Induction Signoff List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Induction Signoff Form";
    CardPageId = "Induction Signoff Card";
    Editable = false;
    SourceTableView = sorting("Induction No.") order(descending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Induction No."; Rec."Induction No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unique document number for the induction signoff form.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the document was created.';
                }
                field("Offer ID"; Rec."Offer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment offer reference associated with this induction.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the candidate application number.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the candidate number.';
                }
                field("Intern Name"; Rec."Intern Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the full name of the intern or candidate.';
                }
                field("Position Title"; Rec."Position Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job title or position.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the assigned supervisor name.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the scheduled reporting date.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the overall processing status of the signoff document.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the user who generated this record.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date and time the record was created.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control66; Outlook)
            {
            }
            systempart(Control67; Notes)
            {
            }
            systempart(Control68; MyNotes)
            {
            }
            systempart(Control69; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Card")
            {
                Caption = 'Card';
                Image = EditLines;

                action("View")
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Induction Signoff Card";
                    RunPageLink = "Induction No." = field("Induction No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the card view for the selected record.';
                }
            }
        }
    }
}

#pragma implicitwith restore