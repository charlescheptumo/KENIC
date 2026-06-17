page 80477 "Depart Performance Logs Card"
{
    PageType = Card;
    SourceTable = 80090;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    Caption = 'Division';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    Caption = 'Department';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                // field("Reporting PC Type";"Reporting PC Type")
                // {
                // }
                field("HOD Scorecard ID"; Rec."HOD Scorecard ID")
                {
                    Caption = 'Targets';
                    ToolTip = 'Specifies the value of the Targets field.';
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("CSP ID"; Rec."CSP ID")
                {
                    ToolTip = 'Specifies the value of the CSP ID field.';
                }
                field("Activity Start Date"; Rec."Activity Start Date")
                {
                    ToolTip = 'Specifies the value of the Activity Start Date field.';
                }
                field("Activity End Date"; Rec."Activity End Date")
                {
                    ToolTip = 'Specifies the value of the Activity End Date field.';
                }
                field("Reporting Quater Code"; Rec."Reporting Quater Code")
                {
                    ToolTip = 'Specifies the value of the Reporting Quater Code field.';
                }
                field("AWP ID"; Rec."AWP ID")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the AWP ID field.';
                }
                field("CEO PC ID"; Rec."CEO PC ID")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the CEO PC ID field.';
                }
                field("Functional PC"; Rec."Functional PC")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Functional PC field.';
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
            part(Part; 80199)
            {
                SubPageLink = "PLog No." = FIELD(No),
                              "Employee No." = FIELD("Employee No."),
                              "Personal Scorecard ID" = FIELD("HOD Scorecard ID"),
                              "Strategy Plan ID" = FIELD("CSP ID");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Targets")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Targets action.';

                trigger OnAction()
                begin
                    // StrategicPlanning.FnSuggestDepartPlogLines(Rec);
                    MESSAGE('Performance log Target Lines Successfully');
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
            action("Send Approval Request")
            {
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    // ApprovalMgt: Codeunit 1535;
                    // SMTPSetup: Codeunit "400";
                    CompanyInfo: Record 79;
                    UserSetup: Record 91;
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    // FileMangement: Codeunit "419";
                    ProgressWindow: Dialog;
                    // SMTPMailSet: Record 409;
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    // cu400: Codeunit "400";
                    DocLog: Record 50004;
                    BranchName: Code[80];
                    DimValue: Record 349;
                    CustEmail: Text[100];
                    HRSetup: Record 5218;
                    CompInfo: Record 79;
                    PerfomanceContractHeader: Record 80055;
                    Employee: Record 5200;
                    PlogLines: Record 80191;
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);

                    PlogLines.RESET;
                    PlogLines.SETRANGE("PLog No.", Rec.No);
                    IF PlogLines.FINDFIRST THEN BEGIN
                        REPEAT
                            PlogLines.TESTFIELD("Achieved Target");
                        UNTIL PlogLines.NEXT = 0;
                    END;


                    //  IF ApprovalsMgmt.CheckPerformanceLogsApprovalsWorkflowEnabled(Rec) THEN
                    //   ApprovalsMgmt.OnSendPerformanceLogsForApproval(Rec);



                    //       CompanyInfo.GET();
                    //         SMTPMailSet.GET;
                    //         SenderAddress := SMTPMailSet."Email Sender Address";
                    //         SenderName :=CompanyInfo.Name+' M&E';
                    //         Subject := STRSUBSTNO('Performance Log');
                    //            PerfomanceContractHeader.RESET;
                    //            PerfomanceContractHeader.SETRANGE(No,No);
                    //            IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                    //               FileDirectory :=  'C:\DOCS\';
                    //               FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                    //               //Window.OPEN('processing');
                    //               Window.OPEN('PROCESSING Performance Log ############1##');
                    //                 Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);

                    //               WindowisOpen := TRUE;
                    //               IF FileName = '' THEN
                    //                 ERROR('Please specify what the file should be saved as');


                    //                REPORT.SAVEASPDF(80007,FileDirectory+FileName,PerfomanceContractHeader);




                    //               IF EXISTS(FileDirectory+FileName) THEN BEGIN
                    //                 Counter:=Counter+1;

                    //               SMTPMailSet.GET;
                    //               SenderAddress := SMTPMailSet."Email Sender Address";



                    //              Employee.RESET;
                    //              Employee.SETRANGE("No.","Employee No.");
                    //              IF Employee.FIND('-') THEN BEGIN
                    //                Recipients :=Employee."Company E-Mail";
                    //              END;
                    //              IF Recipients<>'' THEN BEGIN
                    //                Body:='Dear Team <BR>Please find attached the Plog Report <Br>'+Description;
                    //                 cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,TRUE);

                    //                 cu400.AppendBody(
                    //                 '<BR><BR>Kind Regards,');
                    //                 cu400.AppendBody('<BR>'+CompInfo.Name);
                    //                 cu400.AddAttachment(FileDirectory+FileName,FileName);
                    //                 cu400.Send;

                    //                 SLEEP(1000);
                    //                 Window.CLOSE;
                    //             END;
                    //             END;
                    //           END;
                end;
            }
            action("Cancel Approval Request")
            {
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                    //ApprovalsMgmt.OnCancelPerformanceLogsApprovalRequest(Rec);
                end;
            }
            // separator()
            // {
            // }
            action("Print Performance Log Summary")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Performance Log Summary action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(80011, TRUE, TRUE, Rec)
                end;
            }
            // separator()
            // {
            // }
            action("Post Performance Log")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = true;
                ToolTip = 'Executes the Post Performance Log action.';

                // trigger OnAction()
                // var
                //     PlogLines: Record "80191";
                //     ContractType: Option " ",HOD,Staff;
                // begin
                //     TESTFIELD("Approval Status","Approval Status"::Released);
                //     PlogLines.RESET;
                //     PlogLines.SETRANGE("PLog No.",No);
                //     IF PlogLines.FINDFIRST THEN BEGIN
                //       REPEAT
                //         // IF (PlogLines."Activity Type"<>PlogLines."Activity Type"::"JD Activity") THEN BEGIN
                //         //    //StrategicPlanning.FnInsertPlogEntry("CSP ID",'','','',PlogLines."Initiative No.",Description,EntryType::Actual,"Year Reporting Code","Reporting Quater Code",PlogLines."Planned Date","Directorate Code",
                //         //   "Department Code",PlogLines."Achieved Target",0,No,SourceType
                //         //   ,"Employee No.",PlogLines."Achieved Date",DocumentType::Plog,"Region ID","HOD Scorecard ID","AWP ID","Board PC ID","CEO PC ID","Functional PC",PlogLines."Unit of Measure",
                //         //   ContractType::HOD,PlogLines."Reporting Category");
                //         END;
                //          IF (PlogLines."Activity Type"=PlogLines."Activity Type"::"JD Activity") THEN BEGIN
                //              //StrategicPlanning.FnInsertJDPlogEntry(PlogLines);
                //          END;
                //         UNTIL PlogLines.NEXT=0;
                //       END;
                //       Posted:=TRUE;
                //       "Posted By":=USERID;
                //       "Posted On":=TODAY;
                //       MODIFY;

                //     MESSAGE('Performance Log %1 has been Posted Successfully',No);
                // end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Plog Type" := Rec."Plog Type"::AWP;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Plog Type" := Rec."Plog Type"::AWP;
    end;

    trigger OnOpenPage()
    begin
        Rec."Plog Type" := Rec."Plog Type"::AWP;
    end;

    var
        PerformanceDiaryEntry: Record 80091;
        StrategicPlanning: Codeunit 57007;
        EntryType: Option Planned,Actual;
        SourceType: Option "Strategic Plan","Perfomance Contract";
        DocumentType: Option Plog,Appraisal;
    //ApprovalsMgmt: Codeunit 
}

