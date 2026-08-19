page 50362 "Successor Form Card"
{
    PageType = Card;
    SourceTable = "Successor Form Header";
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Successor Form';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("Successor"; Rec."Successor")
                {
                    ApplicationArea = All;
                }
                field("Successor Job Title"; Rec."Successor Job Title")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = All;
                }
            }
            part(TopDevAreas; "Successor Form Top Dev Areas")
            {
                ApplicationArea = All;
                Caption = 'Top Development Areas';
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            part(Lines; "Successor Form Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            group(Signatures)
            {
                Caption = 'Signatures';
                field("Job Holder Signature"; Rec."Job Holder Signature")
                {
                    ApplicationArea = All;
                }
                field("Job Holder Signature Date"; Rec."Job Holder Signature Date")
                {
                    ApplicationArea = All;
                }
                field("Successor Signature"; Rec."Successor Signature")
                {
                    ApplicationArea = All;
                }
                field("Successor Signature Date"; Rec."Successor Signature Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Successor Form")
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ToolTip = 'Print the Successor Form.';

                trigger OnAction()
                var
                    SuccessorFormHeader: Record "Successor Form Header";
                begin
                    SuccessorFormHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Successor Form", true, false, SuccessorFormHeader);
                end;
            }
        }
    }
}