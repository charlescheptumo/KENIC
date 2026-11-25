page 69731 "Approved Shortlisted Candidates"
{
    Caption = 'Approved Shortlisted Candidates';
    PageType = List;
    SourceTable = "Candidate Shortlist Matrix";
    SourceTableView = where("Document Type" = const("Candidate Shortlisting"),
                            "Shortlist Approval Status" = const(Approved));
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    Caption = 'Shortlist No.';
                    ToolTip = 'Specifies the approved candidate shortlist voucher.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vacancy.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the job application.';
                }
                field("Candidate No"; Rec."Candidate No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the candidate.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the middle name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last name.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the gender.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the highest academic qualification.';
                }
                field("Work Experience (Years)"; Rec."Work Experience (Years)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the years of work experience.';
                }
                field("Shortlisting Outcome"; Rec."Shortlisting Outcome")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the shortlisting outcome.';
                }
                field("Committee Remarks"; Rec."Committee Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the committee remarks.';
                }
                field("Shortlist Approval Status"; Rec."Shortlist Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the approval status of the shortlist.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(OpenShortlist)
            {
                ApplicationArea = All;
                Caption = 'Open Shortlist Voucher';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open the approved candidate shortlist voucher.';

                trigger OnAction()
                var
                    SelectionHeader: Record "Candidate Selection Header";
                begin
                    SelectionHeader.SetRange("Document Type", SelectionHeader."Document Type"::"Candidate Shortlisting");
                    SelectionHeader.SetRange("Document No.", Rec."Document No");
                    Page.Run(Page::"Candidate Shortlist Voucher", SelectionHeader);
                end;
            }
        }
    }
}
