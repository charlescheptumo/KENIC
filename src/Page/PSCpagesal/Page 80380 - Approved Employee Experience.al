// page 80380 "Approved Employee Experience"
// {
//     PageType = Card;
//     SourceTable = 80217;
//     SourceTableView = WHERE("Business Research Category"=CONST("Employee Experience"));

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("Document No.";"Document No.")
//                 {
//                     Editable = false;
//                 }
//                 field("Document Date";"Document Date")
//                 {
//                     Editable = false;
//                 }
//                 field("Survey Type";"Survey Type")
//                 {
//                 }
//                 field(Description;Description)
//                 {
//                     Editable = false;
//                 }
//                 field("Business Research Template ID";"Business Research Template ID")
//                 {
//                 }
//                 field("Target Respondent Type";"Target Respondent Type")
//                 {
//                 }
//                 field("Primary Department ID";"Primary Department ID")
//                 {
//                 }
//                 field("Primary Directorate ID";"Primary Directorate ID")
//                 {
//                 }
//                 field(Published;Published)
//                 {
//                 }
//                 field("Date Published";"Date Published")
//                 {
//                 }
//                 field("Response Due Date";"Response Due Date")
//                 {
//                 }
//                 field("Created By";"Created By")
//                 {
//                     Editable = false;
//                 }
//                 field("Creation Date";"Creation Date")
//                 {
//                     Editable = false;
//                 }
//                 field("Creation Time";"Creation Time")
//                 {
//                     Editable = false;
//                 }
//                 field("Approval Status";"Approval Status")
//                 {
//                 }
//                 field("No. of Responses";"No. of Responses")
//                 {
//                 }
//             }
//             part(part;80348)
//             {
//                 SubPageLink = "Survey ID"=FIELD("Document No.");
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             action("BR Survey Section")
//             {
//                 Caption = 'Survey Section';
//                 Image = AbsenceCategory;
//                 Promoted = true;
//                 PromotedCategory = Category5;
//                 PromotedIsBig = true;
//                 RunObject = Page 80347;
//                 RunPageLink = "Survey ID"=FIELD("Document No.");
//             }
//             action("Suggest Business Sections")
//             {
//                 Image = Suggest;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     TESTFIELD("Business Research Template ID");
//                     BRTemplateSection.RESET;
//                     BRTemplateSection.SETRANGE("Template ID","Business Research Template ID");
//                     IF BRTemplateSection.FINDFIRST THEN BEGIN
//                       REPEAT
//                         BRSurveySection.INIT;
//                         BRSurveySection."Survey ID":="Document No.";
//                         BRSurveySection."Section Code":= BRTemplateSection."Section Code";
//                         BRSurveySection.Description:=BRTemplateSection.Description;
//                         BRSurveySection."Section Completion Instruction":=BRTemplateSection."Section Completion Instruction";
//                         BRSurveySection."No. of Questions":=BRTemplateSection."No. of Questions";
//                         BRSurveySection."Total Weight %":=BRTemplateSection."Total Weight %";
//                         BRSurveySection.INSERT;
//                       UNTIL BRTemplateSection.NEXT=0;
//                     END;

//                     BRTemplateLine.RESET;
//                     BRTemplateLine.SETRANGE("Template ID","Business Research Template ID");
//                     IF BRTemplateLine.FINDFIRST THEN BEGIN
//                       REPEAT
//                         BRSurveyQuestion.INIT;
//                         BRSurveyQuestion."Survey ID":="Document No.";
//                         BRSurveyQuestion."Section Code":=BRTemplateLine."Section ID";
//                         BRSurveyQuestion."Question ID":=BRTemplateLine."Question ID";
//                         BRSurveyQuestion.Question:=BRTemplateLine.Question;
//                         BRSurveyQuestion."Rating Type":=BRTemplateLine."Rating Type";
//                         BRSurveyQuestion."Option Text Response Type":=BRTemplateLine."Option Text Response Type";
//                         BRSurveyQuestion."Assigned Weight %":=BRTemplateLine."Assigned Weight %";
//                         BRSurveyQuestion."Desired Perfomance Direction":=BRTemplateLine."Desired Perfomance Direction";
//                         BRSurveyQuestion.INSERT;

//                         BRTemplateScoreGuide.RESET;
//                         BRTemplateScoreGuide.SETRANGE("Template ID","Business Research Template ID");
//                         BRTemplateScoreGuide.SETRANGE("Section ID",BRTemplateLine."Section ID");
//                         BRTemplateScoreGuide.SETRANGE("Question ID",BRTemplateLine."Question ID");
//                         IF BRTemplateScoreGuide.FINDFIRST THEN BEGIN
//                           REPEAT
//                             BRSurveyScoreGuide.INIT;
//                             BRSurveyScoreGuide."Survey ID":="Document No.";
//                             BRSurveyScoreGuide."Section Code":=BRTemplateScoreGuide."Section ID";
//                             BRSurveyScoreGuide."Question ID":=BRTemplateScoreGuide."Question ID";
//                             BRSurveyScoreGuide."Line No.":=BRTemplateScoreGuide."Line No.";
//                             BRSurveyScoreGuide."Rating Type":= BRTemplateScoreGuide."Rating Type";
//                             BRSurveyScoreGuide."Desired Perfomance Direction":= BRTemplateScoreGuide."Desired Perfomance Direction";
//                             BRSurveyScoreGuide."Response Value":= BRTemplateScoreGuide."Response Value";
//                             BRSurveyScoreGuide."Score %":= BRTemplateScoreGuide."Score %";
//                             BRSurveyScoreGuide.INSERT
//                          UNTIL BRTemplateScoreGuide.NEXT=0;
//                        END;

//                         UNTIL BRTemplateLine.NEXT=0;
//                     END;


//                     MESSAGE('Lines Suggested Successfully');
//                 end;
//             }
//             // separator()
//             // {
//             // }
//             action(Approvals)
//             {
//                 Image = Approval;
//                 Promoted = true;
//                 PromotedCategory = Category5;

//                 trigger OnAction()
//                 begin
//                     // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
//                 end;
//             }
//             // separator()
//             // {
//             // }
//             action(Print)
//             {
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Category6;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     //MESSAGE('Printed Successfully');
//                     RESET;
//                     SETRANGE("Document No.","Document No.");
//                     REPORT.RUN(80024,TRUE,TRUE,Rec)
//                 end;
//             }
//         }
//         area(processing)
//         {
//             group("<Action9>")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("Generate Participant Invites")
//                 {
//                     ApplicationArea = Jobs;
//                     Caption = 'Generate Participant Invites';
//                     Ellipsis = true;
//                     Image = CreateDocument;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     // RunObject = Report 80015;
//                     ToolTip = 'Generate Participant Invites';

//                     trigger OnAction()
//                     var
//                         CopyJob: Page "80088";
//                     begin
//                     end;
//                 }
//                 action("Participant Invitations")
//                 {
//                     Caption = 'Participant Invitations';
//                     Image = Allocations;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     RunObject = Page 80350;
//                     RunPageLink = "Document No."=FIELD("Document No.");
//                 }
//             }
//         }
//     }

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         "Business Research Category":="Business Research Category"::"Employee Experience";
//     end;

//     trigger OnOpenPage()
//     begin
//         "Business Research Category":="Business Research Category"::"Employee Experience";
//     end;

//     var
//         BRTemplateLine: Record 80215;
//         BRSurveySection: Record 80218;
//         BRSurveyQuestion: Record 80219;
//         BRSurveyScoreGuide: Record 80220;
//         BRTemplateSection: Record 80214;
//         BRTemplateScoreGuide: Record 80216;
// }

