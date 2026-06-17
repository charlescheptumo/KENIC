// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 80350 "BR Survey Participants"
// {
//     PageType = List;
//     SourceTable = 80221;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Target Respondent Type";"Target Respondent Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Participant ID";"Participant ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Name;Name)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Email;Email)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Response Due Date";"Response Due Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Invited;Invited)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Date Invited";"Date Invited")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Time Invited";"Time Invited")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Invited By";"Invited By")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Survey Response ID";"Survey Response ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             action("Send E-Invites")
//             {
//                 ApplicationArea = Basic;
//                 Image = Email;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     ApprovalMgt: Codeunit "Approvals Mgmt.";
//                     // SMTPSetup: Codeunit 400
//                     CompanyInfo: Record "Company Information";
//                     UserSetup: Record "User Setup";
//                     SenderAddress: Text[80];
//                     Recipients: Text[80];
//                     SenderName: Text[70];
//                     Body: Text[500];
//                     Subject: Text[80];
//                     FileName: Text;
//                     FileMangement: Codeunit "File Management";
//                     ProgressWindow: Dialog;
//                     // SMTPMailSet: Record "SMTP Mail Setup";
//                     FileDirectory: Text[100];
//                     Window: Dialog;
//                     WindowisOpen: Boolean;
//                     Counter: Integer;
//                     // cu400: Codeunit UnknownCodeunit400;
//                     // DocLog: Record 50004;
//                     BranchName: Code[80];
//                     DimValue: Record "Dimension Value";
//                     CustEmail: Text[100];
//                     HRSetup: Record "Human Resources Setup";
//                     CompInfo: Record "Company Information";
//                     PerfomanceContractHeader: Record 80055;
//                     Employee: Record Employee;
//                     Policy: Record 80111;
//                 begin
//                     eBRInnovationSetup.Get;
//                     BRSurveyParticipant.Reset;
//                     BRSurveyParticipant.SetRange("Document No.","Document No.");
//                     if BRSurveyParticipant.Find('-')then begin
//                       repeat
//                         BRSurveyParticipant.TestField(Invited,false);
//                         BrSurveyNo:='';
//                         BusinessResearchResponse.Init;
//                         BusinessResearchResponse."Document No.":=NoSeriesManagement.GetNextNo(eBRInnovationSetup."Survey Response No. Series",Today,true);
//                         BusinessResearchResponse."Document Date":=Today;
//                         BusinessResearchResponse."Target Respondent Type":=BRSurveyParticipant."Target Respondent Type";
//                         BusinessResearchResponse."Survey ID":=BRSurveyParticipant."Document No.";
//                         BusinessResearchResponse.Validate("Survey ID");
//                         BusinessResearchResponse."Participant ID":=BRSurveyParticipant."Participant ID";
//                         BusinessResearchResponse.Name:=BRSurveyParticipant.Name;
//                         BusinessResearchResponse.Validate("Participant ID");
//                         BusinessResearchResponse."Due Date":=BRSurveyParticipant."Response Due Date";
//                         BusinessResearchResponse.Description:=BRSurveyParticipant.Description;
//                         BusinessResearchResponse.Insert;


//                         BrSurveyNo:=BusinessResearchResponse."Document No.";
//                         Recipients :=BRSurveyParticipant.Email;

//                         BRSurveyParticipant."Survey Response ID":=BrSurveyNo;
//                         BRSurveyParticipant.Invited:=true;
//                         BRSurveyParticipant."Invited By":=UserId;
//                         BRSurveyParticipant."Date Invited":=Today;
//                         BRSurveyParticipant."Time Invited":=Time;
//                         BRSurveyParticipant.Modify;

//                         BRSurveySection.Reset;
//                         BRSurveySection.SetRange("Survey ID","Document No.");
//                         if BRSurveySection.FindFirst then begin
//                            repeat
//                              BRResponseSection.Init;
//                              BRResponseSection."Survey Response ID":=BrSurveyNo;
//                              BRResponseSection."Section Code":=BRSurveySection."Section Code";
//                              BRResponseSection.TransferFields(BRSurveySection,false);
//                              BRResponseSection.Insert;

//                              BRSurveyQuestion.Reset;
//                              BRSurveyQuestion.SetRange("Survey ID","Document No.");
//                              BRSurveyQuestion.SetRange("Section Code",BRResponseSection."Section Code");
//                              if BRSurveyQuestion.Find('-') then begin
//                                 repeat
//                                   //EVALUATE(QInteger,BRSurveyQuestion."Question ID");
//                                   BRResponseQuestion.Init;
//                                   BRResponseQuestion."Survey Response ID":=BrSurveyNo;
//                                   BRResponseQuestion."Section Code":=BRSurveyQuestion."Section Code";
//                                   BRResponseQuestion."Question ID":=BRSurveyQuestion."Question ID";
//                                   BRResponseQuestion.Question:=BRSurveyQuestion.Question;
//                                   BRResponseQuestion."Rating Type":=BRSurveyQuestion."Rating Type";
//                                   BRResponseQuestion."Assigned Weight %":=BRSurveyQuestion."Assigned Weight %";
//                                   BRResponseQuestion."Option Text Response Type":=BRSurveyQuestion."Option Text Response Type";
//                                   BRResponseQuestion."Question Type":=BRSurveyQuestion."Question Type";
//                                   BRResponseQuestion."Branch Logic Question":=BRSurveyQuestion."Branch Logic Question";
//                                   BRResponseQuestion."Response Type":=BRSurveyQuestion."Response Type";
//                                   BRResponseQuestion.Mandatory:=BRSurveyQuestion.Mandatory;
//                                   BRResponseQuestion.Insert;

//                                   //
//                                     BRSurveyScoreGuide.Reset;
//                                     BRSurveyScoreGuide.SetRange("Survey ID","Document No.");
//                                     BRSurveyScoreGuide.SetRange("Section Code",BRResponseQuestion."Section Code");
//                                     BRSurveyScoreGuide.SetRange("Question ID",BRResponseQuestion."Question ID");
//                                     if BRSurveyScoreGuide.FindFirst then begin
//                                        repeat
//                                             BRResponseScoreGuide.Init;
//                                             BRResponseScoreGuide."Survey Response ID":=BrSurveyNo;
//                                             BRResponseScoreGuide."Section Code":=BRSurveyScoreGuide."Section Code";
//                                             BRResponseScoreGuide."Question ID":=BRSurveyScoreGuide."Question ID";
//                                             BRResponseScoreGuide."Line No":=BRSurveyScoreGuide."Line No.";
//                                             BRResponseScoreGuide."Rating Type":=BRSurveyScoreGuide."Rating Type";
//                                             BRResponseScoreGuide."Desired Perfomance Direction":=BRSurveyScoreGuide."Desired Perfomance Direction";
//                                             BRResponseScoreGuide."Response Value":=BRSurveyScoreGuide."Response Value";
//                                             BRResponseScoreGuide."Score %":=BRSurveyScoreGuide."Score %";
//                                             BRResponseScoreGuide.Insert;

//                                        until BRSurveyScoreGuide.Next=0;
//                                     end;

//                                     //Branching Questions
//                                     if BRSurveyQuestion."Branch Logic Question"=true then begin
//                                      BRBranchSurveyQuestion.Reset;
//                                      BRBranchSurveyQuestion.SetRange("Survey ID","Document No.");
//                                      BRBranchSurveyQuestion.SetRange("Section Code",BRResponseQuestion."Section Code");
//                                      BRBranchSurveyQuestion.SetRange("Parent Question ID",BRResponseQuestion."Question ID");

//                                       if BRBranchSurveyQuestion.FindFirst then begin
//                                         repeat
//                                           BRBranchResponseQuestion.Init;
//                                           BRBranchResponseQuestion."Response ID":=BrSurveyNo;
//                                           BRBranchResponseQuestion."Section Code":=BRBranchSurveyQuestion."Section Code";
//                                           BRBranchResponseQuestion."Parent Question ID":=BRBranchSurveyQuestion."Parent Question ID";
//                                           BRBranchResponseQuestion."Parent Response":=BRBranchSurveyQuestion."Parent Response";
//                                           BRBranchResponseQuestion."Question ID":=BRBranchSurveyQuestion."Question ID";
//                                           BRBranchResponseQuestion.Question:=BRBranchSurveyQuestion.Question;
//                                           BRBranchResponseQuestion."Rating Type":=BRBranchSurveyQuestion."rating type"::"Open Text";
//                                           BRBranchResponseQuestion.Insert;
//                                           until BRBranchSurveyQuestion.Next=0;
//                                         end;
//                                      end;
//                                   //Multiple Questions Response
//                                     if BRSurveyQuestion."Response Type"=BRSurveyQuestion."response type"::"Multiple Response" then begin
//                                       BRSurveyScoreGuide.Reset;
//                                       BRSurveyScoreGuide.SetRange("Survey ID","Document No.");
//                                       BRSurveyScoreGuide.SetRange("Section Code",BRResponseQuestion."Section Code");
//                                       BRSurveyScoreGuide.SetRange("Question ID",BRResponseQuestion."Question ID");
//                                       if BRSurveyScoreGuide.FindFirst then begin
//                                          repeat
//                                               BRMultipleResponse.Init;
//                                               BRMultipleResponse."Survey Response ID":=BrSurveyNo;
//                                               BRMultipleResponse."Section Code":=BRSurveyScoreGuide."Section Code";
//                                               BRMultipleResponse."Question ID":=BRSurveyScoreGuide."Question ID";
//                                               BRMultipleResponse."Line No":=BRSurveyScoreGuide."Line No.";
//                                               BRMultipleResponse."Rating Type":=BRSurveyScoreGuide."Rating Type";
//                                               BRMultipleResponse."Desired Perfomance Direction":=BRSurveyScoreGuide."Desired Perfomance Direction";
//                                               BRMultipleResponse."Response Value":=BRSurveyScoreGuide."Response Value";
//                                               BRMultipleResponse."Score %":=BRSurveyScoreGuide."Score %";
//                                               BRMultipleResponse.Insert;
//                                          until BRSurveyScoreGuide.Next=0;
//                                       end;
//                                 end;


//                                 until BRSurveyQuestion.Next=0;
//                              end;

//                            until BRSurveySection.Next=0;
//                         end;


//                         // eBRInnovationSetup.Get;
//                         // if eBRInnovationSetup."Enable Email Alerts" then begin
//                         //   CompanyInfo.Get();
//                         //   SMTPMailSet.Get;
//                         //   SenderAddress := SMTPMailSet."Email Sender Address";

//                           Message(SenderAddress);
//                           SenderName :=CompanyInfo.Name+' M&E';
//                           Subject := StrSubstNo('Survey Invite');

//                                 FileDirectory :=  'C:\DOCS\';
//                                 FileName := 'PCA_'+BRSurveyParticipant."Document No."+'.pdf';
//                                 //Window.OPEN('processing');
//                                 Window.Open('PROCESSING SURVEY INVITES ############1##');
//                                   Window.Update(1,BRSurveyParticipant."Document No."+'-'+BRSurveyParticipant.Name);

//                                 WindowisOpen := true;
//                                 if FileName = '' then
//                                   Error('Please specify what the file should be saved as');
//                                  BrResponse.Reset;
//                                  BrResponse.SetRange("Document No.",BRSurveyParticipant."Document No.");
//                                  if BrResponse.Find('-') then   begin
//                                 //    Report.SaveAsPdf(80020,FileDirectory+FileName,BrResponse);
//                                  end;



//                                 ///IF EXISTS(FileDirectory+FileName) THEN BEGIN
//                                 ///  Counter:=Counter+1;



//                     //             Recipients :=BRSurveyParticipant.Email;
//                     //          Message(Format(Recipients));
//                     //            if Recipients<>'' then begin
//                     //              Body:='Dear '+BRSurveyParticipant.Name+'<BR>This email is to invite you to submit your Survey Response for this Survey:<Br>'
//                     //              +BRSurveyParticipant."Document No."+' '+Format(BRSurveyParticipant."Target Respondent Type")+' '+BRSurveyParticipant.Description+''+'<Br>Response Due Date is '+''
//                     //              +Format(BRSurveyParticipant."Response Due Date")
//                     //               +'<BR>To access the Survey, Log into the Employee Self-Service Portal(ESS) under Perfromance Management, Business Research.'
//                     //              +'<BR>Please read the questions and Respond.<Br> if you require any assistance, please contact Strategy and Compliance office via E-mail:';
//                     //               cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,true);

//                     //               cu400.AppendBody(
//                     //               '<BR><BR>Kind Regards,</BR>'+BrResponse."Primary Department ID"+' '+'Department');
//                     //               cu400.AppendBody('<BR>'+CompInfo.Name);
//                     // //              cu400.AddAttachment(FileDirectory+FileName,FileName);
//                     //               cu400.Send;

//                     //               Sleep(1000);
//                     //               Window.Close;
//                     //           end;
//                     //           end;
//                     //        // END;

//                     //   until BRSurveyParticipant.Next=0;


//                 //             BusinessResearchSurvey.Reset;
//                 //             BusinessResearchSurvey.SetRange("Document No.","Document No.");
//                 //             if BusinessResearchSurvey.Find('-') then begin
//                 //                BusinessResearchSurvey.Published:=true;
//                 //                BusinessResearchSurvey."Date Published":=Today;
//                 //                BusinessResearchSurvey."Published By":=UserId;
//                 //                BusinessResearchSurvey.Modify;

//                 //             end;

//                 //     end;
//                 // end;
//             }
//         }
//     }

//     var
//         BRSurveyParticipant: Record 80221;
//         BrSurveyNo: Code[50];
//         PolicyManagementSetup: Record 80121;
//         NoSeriesManagement: Codeunit "No. Series";
//         BusinessResearchResponse: Record 80222;
//         BRResponseQuestion: Record 80224;
//         BRResponseSection: Record 80223;
//         BRResponseScoreGuide: Record 80225;
//         BRSurveySection: Record 80218;
//         BRSurveyQuestion: Record 80219;
//         BRSurveyScoreGuide: Record 80220;
//         BrResponse: Record 80222;
//         eBRInnovationSetup: Record 80207;
//         QInteger: Integer;
//         QScoreGuide: Integer;
//         BRBranchResponseQuestion: Record 80236;
//         BRBranchSurveyQuestion: Record 80235;
//         ParentQuestionID: Integer;
//         QuestionID: Integer;
//         BRMultipleResponse: Record 80237;
//         BusinessResearchSurvey: Record 80217;
// }
