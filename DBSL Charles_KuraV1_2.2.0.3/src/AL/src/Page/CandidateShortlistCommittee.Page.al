#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69707 "Candidate Shortlist Committee"
{
    PageType = List;
    SourceTable = "Candidate Selection Committee";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appointed Committee ID"; Rec."Appointed Committee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Committee ID field.';
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the panelist''s interview score for this candidate.';
                }
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
        action("Scoresheet")
        {
            ApplicationArea = Basic;
            Caption = 'Scoresheet';
            Image = ChecklistItem;
            Promoted = true;
            PromotedCategory = Process;
            PromotedIsBig = true;
            ToolTip = 'Opens the interview scoresheet for this panelist to enter their score for this candidate.';

            trigger OnAction()
            var
                CandidateInterviewLine: Record "Candidate Interview Line";
                CandidateInterviewRecord: Record "Candidate Interview Record";
                CandidateInterviewRecordPage: Page "Candidate Interview Record";
            begin
                CandidateInterviewLine.Reset();
                CandidateInterviewLine.SetRange("Document Type", CandidateInterviewLine."Document Type"::"Interview Invitation");
                CandidateInterviewLine.SetRange("Assigned Panel ID", Rec."Appointed Committee ID");
                CandidateInterviewLine.SetRange("Candidate No.", Rec."Candidate No.");
                if not CandidateInterviewLine.FindFirst() then
                    Error('Could not find the related interview invitation line for this candidate and panel.');

                CandidateInterviewRecord.Reset();
                CandidateInterviewRecord.SetRange("Assigned Panel ID", Rec."Appointed Committee ID");
                CandidateInterviewRecord.SetRange("Candidate No.", Rec."Candidate No.");
                CandidateInterviewRecord.SetRange("Panel Member No.", Rec."Member No.");
                if not CandidateInterviewRecord.FindFirst() then begin
                    CandidateInterviewRecord.Init();
                    CandidateInterviewRecord.Insert(true);
                    CandidateInterviewRecord.Validate("Interview Invitation No.", CandidateInterviewLine."Document No.");
                    CandidateInterviewRecord.Validate("Application No.", CandidateInterviewLine."Application No.");
                    CandidateInterviewRecord.Validate("Panel Member No.", Rec."Member No.");
                    CandidateInterviewRecord.Modify(true);
                end;

                CandidateInterviewRecordPage.SetRecord(CandidateInterviewRecord);
                CandidateInterviewRecordPage.RunModal();

                Rec.UpdatePanelistScore();
                CurrPage.Update(false);
            end;
        }
    }
}
    trigger OnAfterGetRecord()
    begin
        Rec.UpdatePanelistScore();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.UpdatePanelistScore();
    end;
}

