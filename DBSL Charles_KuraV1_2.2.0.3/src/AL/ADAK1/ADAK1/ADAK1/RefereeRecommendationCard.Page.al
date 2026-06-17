#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69756 "Referee Recommendation Card"
{
    PageType = Card;
    SourceTable = "Referee Recommendation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Background Checks Invitation"; Rec."Background Checks Invitation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Background Checks Invitation field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Referee Id"; Rec."Referee Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Id field.';
                }
                field("Known From"; Rec."Known From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Known From field.';
                }
                field("Known To"; Rec."Known To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Known To field.';
                }
                field("Candidate Last Job Title"; Rec."Candidate Last Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Last Job Title field.';
                }
                field("Staff Exit Reason Code"; Rec."Staff Exit Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Exit Reason Code field.';
                }
                field("Recommend For Hire"; Rec."Recommend For Hire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommend For Hire field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Title/Designation"; Rec."Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title/Designation field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
            part(Control30; "Referee Recommendation Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
            }
            systempart(Control27; Notes)
            {
            }
            systempart(Control28; MyNotes)
            {
            }
            systempart(Control29; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Requirements Rating")
            {
                ApplicationArea = Basic;
                Image = Ranges;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Referee Recommendation Rating";
                RunPageLink = "Document No." = field("Document No."),
                              "Vacancy ID" = field("Vacancy ID");
                ToolTip = 'Executes the Requirements Rating action.';
            }
            action("Suggest Requirements")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Requirements action.';

                trigger OnAction()
                var
                    TXT001: label 'Suggest requirements for the position';
                begin
                    if Confirm(TXT001) = true then begin
                        // Recruitment.SuggestRefRequirements(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Post recommendation to the background checks header';

                trigger OnAction()
                begin
                    ChecksReference.Reset;
                    ChecksReference.SetRange("Referee Recomm Report ID", Rec."Document No.");
                    ChecksReference.SetRange("Referee Id", Rec."Referee Id");
                    if ChecksReference.FindFirst then begin
                        ChecksReference."Recommended for Hire" := Rec."Recommend For Hire";
                        ChecksReference.Modify(true);
                    end
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
        ChecksReference: Record "Background Checks Reference";
}

