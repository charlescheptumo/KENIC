#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69225 "Training Evaluation Page"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Training Evaluation Header";
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
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field("Course Methodology"; Rec."Course Methodology")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Course Methodology field.';
                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start DateTime field.';
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End DateTime field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Course Justification"; Rec."Course Justification")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Course Justification field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field(Facilitators; Rec.Facilitators)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facilitators field.';
                }
                field("Comment on Relevance of Course"; Rec."Comment on Relevance of Course")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment on Relevance of Course field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Links)
            {
            }
            systempart(Control1000000009; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(69104, true, false, Rec);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                ToolTip = 'Executes the Submit action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to submit this evaluation?') = false then
                        exit else
                        Rec.Status := Rec.Status::Submitted;
                    Rec.Modify
                end;
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Submitted then
            Error('You cannot modify a submitted evaluation')
    end;

    var
        EvaluationAreas: Record "HR Models";
        EvaluationLines: Record "Training Evaluation Lines";
}

