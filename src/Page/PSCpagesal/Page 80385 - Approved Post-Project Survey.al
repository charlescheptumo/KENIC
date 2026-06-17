page 80385 "Approved Post-Project Survey"
{
    PageType = Card;
    SourceTable = 80217;
    SourceTableView = WHERE("Business Research Category" = CONST("Customer Experience"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ToolTip = 'Specifies the value of the Survey Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Business Research Template ID"; Rec."Business Research Template ID")
                {
                    ToolTip = 'Specifies the value of the Business Research Template ID field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ToolTip = 'Specifies the value of the Primary Department ID field.';
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ToolTip = 'Specifies the value of the Primary Directorate ID field.';
                }
                field(Published; Rec.Published)
                {
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
                field("Response Due Date"; Rec."Response Due Date")
                {
                    ToolTip = 'Specifies the value of the Response Due Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ToolTip = 'Specifies the value of the No. of Responses field.';
                }
            }
            part(Part; 80347)
            {
                SubPageLink = "Survey ID" = FIELD("Document No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Survey Section")
            {
                Caption = 'Survey Section';
                Image = AbsenceCategory;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page 80347;
                RunPageLink = "Survey ID" = FIELD("Document No.");
                ToolTip = 'Executes the Survey Section action.';
            }
            action("Suggest Business Sections")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Business Sections action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Business Research Template ID");
                    BRTemplateSection.RESET;
                    BRTemplateSection.SETRANGE("Template ID", Rec."Business Research Template ID");
                    IF BRTemplateSection.FINDFIRST THEN BEGIN
                        REPEAT
                            BRSurveySection.INIT;
                            BRSurveySection."Survey ID" := Rec."Document No.";
                            BRSurveySection."Section Code" := BRTemplateSection."Section Code";
                            BRSurveySection.Description := BRTemplateSection.Description;
                            BRSurveySection."Section Completion Instruction" := BRTemplateSection."Section Completion Instruction";
                            BRSurveySection."No. of Questions" := BRTemplateSection."No. of Questions";
                            BRSurveySection."Total Weight %" := BRTemplateSection."Total Weight %";
                            BRSurveySection.INSERT;
                        UNTIL BRTemplateSection.NEXT = 0;
                    END;

                    BRTemplateLine.RESET;
                    BRTemplateLine.SETRANGE("Template ID", Rec."Business Research Template ID");
                    IF BRTemplateLine.FINDFIRST THEN BEGIN
                        REPEAT
                            BRSurveyQuestion.INIT;
                            BRSurveyQuestion."Survey ID" := Rec."Document No.";
                            BRSurveyQuestion."Section Code" := BRTemplateLine."Section ID";
                            BRSurveyQuestion."Question ID" := BRTemplateLine."Question ID";
                            BRSurveyQuestion.Question := BRTemplateLine.Question;
                            BRSurveyQuestion."Rating Type" := BRTemplateLine."Rating Type";
                            BRSurveyQuestion."Option Text Response Type" := BRTemplateLine."Option Text Response Type";
                            BRSurveyQuestion."Assigned Weight %" := BRTemplateLine."Assigned Weight %";
                            BRSurveyQuestion."Desired Perfomance Direction" := BRTemplateLine."Desired Perfomance Direction";
                            BRSurveyQuestion.INSERT;

                            BRTemplateScoreGuide.RESET;
                            BRTemplateScoreGuide.SETRANGE("Template ID", Rec."Business Research Template ID");
                            BRTemplateScoreGuide.SETRANGE("Section ID", BRTemplateLine."Section ID");
                            BRTemplateScoreGuide.SETRANGE("Question ID", BRTemplateLine."Question ID");
                            IF BRTemplateScoreGuide.FINDFIRST THEN BEGIN
                                BRSurveyScoreGuide.INIT;
                                BRSurveyScoreGuide."Survey ID" := Rec."Document No.";
                                BRSurveyScoreGuide."Section Code" := BRTemplateScoreGuide."Section ID";
                                BRSurveyScoreGuide."Question ID" := BRTemplateScoreGuide."Question ID";
                                BRSurveyScoreGuide."Line No." := BRTemplateScoreGuide."Line No.";
                                BRSurveyScoreGuide."Rating Type" := BRSurveyScoreGuide."Rating Type";
                                BRSurveyScoreGuide."Desired Perfomance Direction" := BRSurveyScoreGuide."Desired Perfomance Direction";
                                BRSurveyScoreGuide."Response Value" := BRSurveyScoreGuide."Response Value";
                                BRSurveyScoreGuide."Score %" := BRSurveyScoreGuide."Score %";
                                BRSurveyScoreGuide.INSERT
                            END;

                        UNTIL BRTemplateLine.NEXT = 0;
                    END;


                    MESSAGE('Lines Suggested Successfully');
                end;
            }
            // separator()
            // {
            // }
            action(Approvals)
            {
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            // separator()
            // {
            // }
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    MESSAGE('Printed Successfully');
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Generate Participant Invites")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Generate Participant Invites';
                    Ellipsis = true;
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    //RunObject = Report 80022;
                    ToolTip = 'Generate Participant Invites';

                    // trigger OnAction()
                    // var
                    //     CopyJob: Page "80088";
                    // begin
                    // end;
                }
                action("Participant Invitations")
                {
                    Caption = 'Participant Invitations';
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page 80350;
                    RunPageLink = "Document No." = FIELD("Document No.");
                    ToolTip = 'Executes the Participant Invitations action.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Business Research Category" := Rec."Business Research Category"::"Post-Project Survey";
    end;

    trigger OnOpenPage()
    begin
        Rec."Business Research Category" := Rec."Business Research Category"::"Post-Project Survey";
    end;

    var
        BRTemplateLine: Record 80215;
        BRSurveySection: Record 80218;
        BRSurveyQuestion: Record 80219;
        BRSurveyScoreGuide: Record 80220;
        BRTemplateSection: Record 80214;
        BRTemplateScoreGuide: Record 80216;
}

