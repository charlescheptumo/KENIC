#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69813 "Interview Questions"
{
    PageType = ListPart;
    SourceTable = "Candidate Interview Question";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Category field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field(Rating; Rec.Rating)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Rating field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field("Score Code"; Rec."Score Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Score Code field.';
                }
                field("Evaluation Comments"; Rec."Evaluation Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Comments field.';
                }
                field("Maximum Raw Score"; Rec."Maximum Raw Score")
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Score';
                    ToolTip = 'Specifies the value of the Applicant Score field.';
                }
                field("Weighted Score %"; Rec."Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Score % field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Attachment")
            {
                Caption = 'Related Information';

                action("Document Attachment")
                {
                    ApplicationArea = Basic;
                    Image = Attachments;
                    
                    ToolTip = 'Executes the Document Attachment action.';
                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;

                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Maximum Raw Score" <> 0 then begin
            if Rec.Weight <> 0 then begin
                Rec."Weighted Score %" := (Rec."Maximum Raw Score" / Rec.Weight) * 100;
            end;
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Maximum Raw Score" <> 0 then begin
            if Rec.Weight <> 0 then begin
                Rec."Weighted Score %" := (Rec."Maximum Raw Score" / Rec.Weight) * 100;
            end;
        end;

        CandidateInterviewRecord.Reset();
        CandidateInterviewRecord.SetRange("Document No.", Rec."Document No.");
        CandidateInterviewRecord.SetRange("Interview Scoresheet Template", Rec."Interview Scoresheet Template");
        if CandidateInterviewRecord.FindFirst() then
            CandidateInterviewRecord.CalcFields("Panel Interview Score %");
    end;

    var
        CanIntQue: Record "Candidate Interview Question";
        CandidateInterviewRecord: Record "Candidate Interview Record";
}

