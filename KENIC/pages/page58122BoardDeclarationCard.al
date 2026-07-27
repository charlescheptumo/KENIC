page 58122 "Board Declaration Card"
{
    PageType = Document;
    SourceTable = "Board Declaration Header";
    Caption = 'Board Declaration';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = IsEditable;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the declaration.';
                }
                field("Board Member No."; Rec."Board Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member making the declaration.';
                }
                field("Board Member Name"; Rec."Board Member Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the board member.';
                }
                field("Declaration Type"; Rec."Declaration Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this is an annual or meeting-specific declaration.';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }

                field("Declaration Date"; Rec."Declaration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the declaration.';
                }
                field("Declaration Status"; Rec."Declaration Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the current status of the declaration.';
                }
                field("Declaration Year"; Rec."Declaration Year")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the year of the declaration.';
                }
            }

            part(Lines; "Board Declaration Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Declaration No." = field("No.");
                UpdatePropagation = Both;
                Editable = IsEditable;
            }

            group(Audit)
            {
                Caption = 'Audit Trail';
                Editable = false;

                field("Createdd By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who submitted the declaration.';
                }
                field("Submitted DateTime"; Rec."Submitted DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the declaration was submitted.';
                }
                field("Reviewed By"; Rec."Reviewed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who reviewed or approved the declaration.';
                }
                field("Reviewed DateTime"; Rec."Reviewed DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the declaration was reviewed or approved.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PublishToPortal)
            {
                Caption = 'Publish to Portal';
                ApplicationArea = All;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;

                Enabled = Rec."Declaration Status" = Rec."Declaration Status"::Open;

                trigger OnAction()
                begin
                    if not Confirm(
                        'This declaration will be published to the Board Portal and will become available to the board member for completion. Continue?',
                        false)
                    then
                        exit;

                    Rec.Validate("Declaration Status", Rec."Declaration Status"::Draft);
                    Rec.Modify(true);

                    SetEditable();
                    CurrPage.Update(false);

                    Message('The declaration has been published to the Board Portal.');
                end;
            }

            action(Approve)
            {
                Caption = 'Approve';
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                // Enabled = (Rec."Declaration Status" = Rec."Declaration Status"::Submitted);

                // trigger OnAction()
                // begin
                //     Rec.Validate("Declaration Status", Rec."Declaration Status"::Approved);
                //     Rec.Modify(true);
                //     Message('Declaration successfully approved.');
                // end;
            }
        }
    }
    var
        IsEditable: Boolean;

    trigger OnOpenPage()
    begin
        SetEditable();
    end;

    trigger OnAfterGetRecord()
    begin
        SetEditable();
    end;

    local procedure SetEditable()
    begin
        IsEditable := Rec."Declaration Status" = Rec."Declaration Status"::Open;
    end;
}