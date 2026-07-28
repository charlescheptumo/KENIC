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

                field(Published; Rec.Published)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the declaration has been published to the Board Portal.';
                }
            }

            part(Lines; "Board Declaration Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Declaration No." = field("No.");
                UpdatePropagation = Both;
                Editable = IsEditable;
            }
            group("General Declarations")
            {
                Caption = 'General Declarations';
                Editable = IsEditable;

                field("Convicted of Crime"; Rec."Convicted of Crime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if you have ever been convicted of a criminal offence.';
                }
                field("Conviction Details"; Rec."Conviction Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies details of the conviction.';
                    Editable = Rec."Convicted of Crime" and IsEditable;
                }

                field("Bankrupt or Insolvent"; Rec."Bankrupt or Insolvent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if you have ever been declared bankrupt or insolvent.';
                }
                field("Bankruptcy Details"; Rec."Bankruptcy Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies details of the insolvency/bankruptcy.';
                    Editable = Rec."Bankrupt or Insolvent" and IsEditable;
                }

                field("Involved in Litigation"; Rec."Involved in Litigation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if you are involved in litigation.';
                }
                field("Litigation Details"; Rec."Litigation Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies details of the litigation.';
                    Editable = Rec."Involved in Litigation" and IsEditable;
                }

                field("Received Gifts/Hospitality"; Rec."Received Gifts/Hospitality")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if you received gifts/hospitality influencing independence.';
                }
                field("Gifts Details"; Rec."Gifts Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies details of gifts or hospitality.';
                    Editable = Rec."Received Gifts/Hospitality" and IsEditable;
                }

                field("Family Employed in Org"; Rec."Family Employed in Org")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if close family members work for or do business with the organization.';
                }
                field("Family Details"; Rec."Family Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies details of family relationship/employment.';
                    Editable = Rec."Family Employed in Org" and IsEditable;
                }

                field("Other Conflict Matter"; Rec."Other Conflict Matter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any other potential conflict of interest matter.';
                }
                field("Other Conflict Details"; Rec."Other Conflict Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies details of other potential conflicts.';
                    Editable = Rec."Other Conflict Matter" and IsEditable;
                }
            }

            group("Sign-Off")
            {
                Caption = 'Declaration Sign-Off';
                Editable = IsEditable;

                field("Declaration Statement Accepted"; Rec."Declaration Statement Accepted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Confirms accuracy of provided information.';
                }
                field("Electronic Signature"; Rec."Electronic Signature")
                {
                    ApplicationArea = All;
                    ToolTip = 'Typed full name acting as electronic signature from the portal.';
                }
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
                    Rec.Validate(Published, true);
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

            action(PrintDeclaration)
            {
                Caption = 'Print Declaration';
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Print or export the annual declaration form for the selected board member.';

                trigger OnAction()
                var
                    HeaderRec: Record "Board Declaration Header";
                begin
                    HeaderRec.Reset();
                    HeaderRec.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Board Declaration Report", true, true, HeaderRec);
                end;
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