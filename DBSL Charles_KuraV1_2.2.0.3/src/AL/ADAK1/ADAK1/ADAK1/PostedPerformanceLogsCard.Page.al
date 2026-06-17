#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80382 "Posted Performance Logs Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Performance Diary Log";
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Personal Scorecard ID field.';
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("Activity Start Date"; Rec."Activity Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Start Date field.';
                }
                field("Activity End Date"; Rec."Activity End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity End Date field.';
                }
                field("CSP ID"; Rec."CSP ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the CSP ID field.';
                }
                field("AWP ID"; Rec."AWP ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AWP ID field.';
                }
                field("Board PC ID"; Rec."Board PC ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Board PC ID field.';
                }
                field("CEO PC ID"; Rec."CEO PC ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the CEO PC ID field.';
                }
                field("Functional PC"; Rec."Functional PC")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Functional PC field.';
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
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
            part(Control25; "Performance Log Lines")
            {
                SubPageLink = "PLog No." = field(No),
                              "Employee No." = field("Employee No."),
                              "Personal Scorecard ID" = field("Personal Scorecard ID"),
                              "Strategy Plan ID" = field("CSP ID");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Targets")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Targets action.';

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Targets', true) then
                        Error('Targets not Suggested');

                    StrategicPlanning.FnSuggestPlogLines(Rec);
                    Message('Performance log Target Lines Successfully');
                end;
            }
            separator(Action30)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ToolTip = 'Executes the Send Approval Request action.';
                // ApplicationArea = Basic;
                // Image = SendApprovalRequest;
                // Promoted = true;
                // PromotedCategory = Category5;

                // trigger OnAction()
                // var
                //     ApprovalMgt: Codeunit "Approvals Mgmt.";
                //     SMTPSetup: Codeunit Mail;
                //     CompanyInfo: Record "Company Information";
                //     UserSetup: Record "User Setup";
                //     SenderAddress: Text[80];
                //     Recipients: Text[80];
                //     SenderName: Text[70];
                //     Body: Text[250];
                //     Subject: Text[80];
                //     FileName: Text;
                //     FileMangement: Codeunit "File Management";
                //     ProgressWindow: Dialog;
                //     SMTPMailSet: Record "Email Account";
                //     FileDirectory: Text[100];
                //     Window: Dialog;
                //     WindowisOpen: Boolean;
                //     Counter: Integer;
                //     cu400: Codeunit Mail;
                //     DocLog: Record "Document E-mail Log";
                //     BranchName: Code[80];
                //     DimValue: Record "Dimension Value";
                //     CustEmail: Text[100];
                //     HRSetup: Record "Human Resources Setup";
                //     CompInfo: Record "Company Information";
                //     FundingOpp: Record "Project Contract Header";
                //     GrantsSetup: Record "Grants Setup";
                //     PerfomanceContractHeader: Record "Perfomance Contract Header";
                //     Employee: Record Employee;
                //     PlogLines: Record "Plog Lines";
                // begin
                //     TestField("Approval Status","approval status"::Open);

                //     PlogLines.Reset;
                //     PlogLines.SetRange("PLog No.",No);
                //     if PlogLines.FindFirst then begin
                //       repeat
                //          PlogLines.TestField("Achieved Target");
                //         until PlogLines.Next=0;
                //       end;


                //     //status must be open.
                //     /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                //      IF ApprovalsMgmt.IsBankRecReqApprovalsWorkflowEnabled(Rec) THEN
                //       ApprovalsMgmt.OnSendBankRecReqForApproval(Rec);*/




                //   CompanyInfo.Get();
                //     SMTPMailSet.Get;
                //     SenderAddress := SMTPMailSet."Email Address";
                //     SenderName :=CompanyInfo.Name+' M&E';
                //     Subject := StrSubstNo('Performance Log');
                //        PerfomanceContractHeader.Reset;
                //        PerfomanceContractHeader.SetRange(No,No);
                //        if PerfomanceContractHeader.FindFirst then begin
                //           FileDirectory :=  'C:\DOCS\';
                //           FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                //           //Window.OPEN('processing');
                //           Window.Open('PROCESSING Performance Log ############1##');
                //             Window.Update(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);

                //           WindowisOpen := true;
                //           if FileName = '' then
                //             Error('Please specify what the file should be saved as');


                //    // Report.SaveAsPdf(80007,FileDirectory+FileName,PerfomanceContractHeader);




                //   if Exists(FileDirectory+FileName) then begin
                //     Counter:=Counter+1;

                //   SMTPMailSet.Get;
                //   SenderAddress := SMTPMailSet."Email Address";



                //  Employee.Reset;
                //  Employee.SetRange("No.","Employee No.");
                //  if Employee.Find('-') then begin
                //    Recipients :=Employee."Company E-Mail";
                //  end;
                //              if Recipients<>'' then begin
                //                Body:='Dear Team <BR>Please find attached the Plog Report <Br>'+Description;
                //                 // cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,true);

                //                 // cu400.AddBodyline(
                //                 // '<BR><BR>Kind Regards,');
                //                 // cu400.AddBodyline('<BR>'+CompInfo.Name);
                //                 // cu400.AddAttachment(FileDirectory+FileName,FileName);
                //                 // cu400.Send;

                //                 Sleep(1000);
                //                 Window.Close;
                //             end;
                //             end;
                //           end;

                // end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    /*TESTFIELD("Approval Status","Approval Status"::"Pending Approval");//status must be open.
                    ApprovalsMgmt.OnCancelPerformanceLogsApprovalRequest(Rec);*/

                end;
            }
            separator(Action31)
            {
            }
            action("Print Performance Log Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Performance Log Summary action.';

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80011, true, true, Rec)
                end;
            }
            separator(Action33)
            {
            }
            action("Post Performance Log")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Performance Log action.';

                trigger OnAction()
                var
                    PlogLines: Record "Plog Lines";
                begin
                    if not Confirm('Are you sure you want to Post', true) then
                        Error('Perforamnce Log not Posted');
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    PlogLines.Reset;
                    PlogLines.SetRange("PLog No.", Rec.No);
                    if PlogLines.FindFirst then begin
                        repeat
                            if (PlogLines."Activity Type" <> PlogLines."activity type"::"JD Activity") then begin
                                StrategicPlanning.FnInsertPlogEntry(Rec."CSP ID", '', '', '', PlogLines."Initiative No.", Rec.Description, Entrytype::Actual, Rec."Year Reporting Code", '', PlogLines."Planned Date", Rec."Directorate Code", Rec."Department Code", PlogLines."Achieved Target", 0, Rec.No, SourceType
                               , Rec."Employee No.", PlogLines."Achieved Date", Documenttype::Plog, Rec."Region ID", Rec."Personal Scorecard ID", Rec."AWP ID", Rec."Board PC ID", Rec."CEO PC ID", Rec."Functional PC", PlogLines."Unit of Measure", PlogLines.Comments);
                            end;
                            if (PlogLines."Activity Type" = PlogLines."activity type"::"JD Activity") then begin
                                StrategicPlanning.FnInsertJDPlogEntry(PlogLines);
                            end;
                        until PlogLines.Next = 0;
                    end;
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted On" := Today;
                    Rec.Modify;

                    Message('Performance Log %1 has been Posted Successfully', Rec.No);
                end;
            }
        }
    }

    var
        PerformanceDiaryEntry: Record "Performance Diary Entry";
        StrategicPlanning: Codeunit "Strategic Planning";
        EntryType: Option Planned,Actual;
        SourceType: Option "Strategic Plan","Perfomance Contract";
        DocumentType: Option Plog,Appraisal;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

