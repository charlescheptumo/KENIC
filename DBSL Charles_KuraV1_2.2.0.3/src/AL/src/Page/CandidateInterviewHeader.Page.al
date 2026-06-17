#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69770 "Candidate Interview Header"
{
    PageType = Card;
    SourceTable = "Candidate Shortlist Scoring";
    SourceTableView = where("Document No." = filter('2'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Candidate's Response"; Rec."Candidate's Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate''s Response field.';
                }
                // field("No. of Openings"; Rec."No. of Openings")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("No. of Submitted Applications"; Rec."No. of Submitted Applications")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Shortlisting Venue"; Rec."Shortlisting Venue")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Directorate; Directorate)
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                // }
                // field(Department; Department)
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                // }
                // field("Seniority Level"; Rec."Seniority Level")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                // }
                // field("Employment Type"; Rec."Employment Type")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                // }
                // field("Application Closing Date"; Rec."Application Closing Date")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                // }
                // field("Application Closing Time"; Rec."Application Closing Time")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                // }
                // field("Planned Start Date"; Rec."Planned Start Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Planned End Date"; Rec."Planned End Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Document Status"; Rec."Document Status")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                // }
                // field("Created By"; Rec."Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created On"; Rec."Created On")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            part(Control41; "Candidate Interview Line")
            {
                // SubPageLink = "Document No." = field("Document No."),
                //               "Document Type" = field("Document Type"),
                //               "Vacancy ID" = field("Qualification Category");
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
            }
            systempart(Control38; Notes)
            {
            }
            systempart(Control39; MyNotes)
            {
            }
            systempart(Control40; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Candidate Selection Committee")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Candidate Shortlist Committee";
                RunPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                ToolTip = 'Executes the Candidate Selection Committee action.';
            }
            action("Failed Education")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Failed Education action.';
            }
            action("Failed Management Experience")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Failed Management Experience action.';
            }
            action("Failed Work Experience")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Failed Work Experience action.';
            }
        }
    }
}

