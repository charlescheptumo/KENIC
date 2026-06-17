#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75387 "IFS Appeal Card"
{
    PageType = Document;
    SourceTable = "IFS Appeal Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Awarded Bidder Name field.';
                }
                field("Bid Response No"; Rec."Bid Response No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Response No field.';
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Tender Sum Inc Taxes field.';
                }
                field("Appeal Date"; Rec."Appeal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appeal Date field.';
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Decision field.';
                }
                field("Reason for Appeal"; Rec."Reason for Appeal")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason for Appeal field.';
                }
                field("Date of Approval"; Rec."Date of Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Approval field.';
                }
                field("No. of Bidders"; Rec."No. of Bidders")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Bidders field.';
                }
                field("ITC Issuance Date"; Rec."ITC Issuance Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ITC Issuance Date field.';
                }
                field("Date of Verdict"; Rec."Date of Verdict")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Verdict field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part(Control18; "IFS Appeal Lines")
            {
                SubPageLink = "Document No" = field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    Rec.TestField(Decision);
                    Procurement.FnPostAppeal(Rec);

                    Message('Posted Successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::IFS;
    end;

    var
        IFSAppealEntry: Record "IFS Appeal Entry";
        Procurement: Codeunit "Procurement Processing";
}

