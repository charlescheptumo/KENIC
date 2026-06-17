page 80554 "Ind Performance Reporting"
{
    Caption = 'Staff Performance Reporting';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    Caption = 'Contract No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    Caption = 'Employee No';
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Functional Template ID"; Rec."Department/Center PC ID")
                {
                    Caption = 'HOD Awp';
                    ToolTip = 'Specifies the value of the HOD Awp field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Contract Year"; Rec."Annual Reporting Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Change Status"; Rec."Change Status")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Change Status field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Designation; Rec.Designation)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Caption = 'Department Code';
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    Caption = 'Department  Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department  Name field.';
                }
                field("Blocked?"; Rec."Blocked")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Blocked field.';
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
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    Caption = 'Total Assigned Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Assigned Weight(%) field.';
                }
                field("Secondary Assigned Weight(%)"; Rec."Secondary Assigned Weight(%)")
                {
                    Caption = 'Secondary Inititives Weight(%)';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Secondary Inititives Weight(%) field.';
                }
                field("JD Assigned Weight(%)"; Rec."JD Assigned Weight(%)")
                {
                    Caption = 'JD activity Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the JD activity Weight(%) field.';
                }
            }
            part("Core Activities"; "DirectorsPerformance Reporting")
            {
                Caption = 'Core Activities';
                SubPageLink = "Workplan No." = FIELD(No),
                              "Initiative Type" = FILTER(Activity | Board);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Performance)
            {
                Caption = 'Performance';
                Image = Vendor;
                group("Performance Review")
                {
                    Caption = 'Performance Review';
                    Image = Vendor;
                    action("Performance Appraisal")
                    {
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Standard Perfomance Appraisal";
                        ToolTip = 'Executes the Performance Appraisal action.';
                        //     RunPageLink = "Personal Scorecard ID"=FIELD(No),
                        //                   "Document Type"=CONST("Performance Appraisal");
                    }
                    action("Performance Appeal")
                    {
                        Caption = 'Performance Appeal';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Perfomance Appeals";
                        ToolTip = 'Executes the Performance Appeal action.';
                        // RunPageLink = "Personal Scorecard ID"=FIELD(No),
                        //               "Document Type"=CONST("Performance Appeal");
                    }
                    action(PIPs)
                    {
                        Caption = 'PIPs';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Performance Improvement Plans";
                        ToolTip = 'Executes the PIPs action.';
                        // RunPageLink = "Personal Scorecard ID"=FIELD(No);
                    }
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    ToolTip = 'Executes the Co&mments action.';
                    // RunObject = Page 5222;
                    // RunPageLink = Table Name=CONST(7),
                    //               No.=FIELD(No. Series);
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("Change Log")
                {
                    Image = Log;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Performance Diary Logs";
                    ToolTip = 'Executes the Change Log action.';
                    //RunPageLink = "Personal Scorecard ID"=FIELD(No);
                }
            }
        }
        area(creation)
        {
            action("Suggest Objective Lines")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Suggest Objective Lines action.';

                trigger OnAction()
                begin
                    IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
                        ERROR('Activities not Suggested');

                    Rec.TESTFIELD("Strategy Plan ID");
                    Rec.TESTFIELD("Department/Center PC ID");
                    Rec.TESTFIELD("Annual Reporting Code");
                    PCHeader.RESET;
                    PCHeader.SETRANGE(No, Rec."Department/Center PC ID");
                    IF PCHeader.FINDSET THEN BEGIN
                        SPMGeneralSetup.GET;

                        IF (SPMGeneralSetup."Allow Loading of  CSP" = TRUE) THEN BEGIN
                            PcLinesN.RESET;
                            PcLinesN.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                            PcLinesN.SETRANGE("Workplan No.", Rec."Department/Center PC ID");
                            //PcLinesN.SETRANGE("Primary Department","Responsibility Center");
                            IF PcLinesN.FIND('-') THEN BEGIN
                                REPEAT
                                    //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                                    PcLines.INIT;
                                    PcLines."Workplan No." := Rec.No;
                                    PcLines."Strategy Plan ID" := PcLinesN."Strategy Plan ID";
                                    PcLines."Initiative Type" := PcLinesN."Initiative Type";
                                    PcLines."Initiative No." := PcLinesN."Initiative No.";
                                    PcLines."Goal Template ID" := Rec."Goal Template ID";
                                    PcLines."Objective/Initiative" := PcLinesN."Objective/Initiative";
                                    PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                                    PcLines."Primary Directorate" := PcLinesN."Primary Directorate";
                                    PcLines."Primary Department" := PcLinesN."Primary Department";
                                    PcLines."Outcome Perfomance Indicator" := PcLinesN."Outcome Perfomance Indicator";
                                    PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                    PcLines."Assigned Weight (%)" := PcLinesN."Assigned Weight (%)";
                                    PcLines."Summary of subactivities" := PcLinesN."Summary of subactivities";
                                    PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                    PcLines."Start Date" := PcLinesN."Start Date";
                                    PcLines."Due Date" := PcLinesN."Due Date";
                                    PcLines.Budget := PcLinesN.Budget;
                                    PcLines."Q1 Target Qty" := PcLinesN."Q1 Target Qty";
                                    PcLines."Q2 Target Qty" := PcLinesN."Q2 Target Qty";
                                    PcLines."Q3 Target Qty" := PcLinesN."Q3 Target Qty";
                                    PcLines."Q4 Target Qty" := PcLinesN."Q4 Target Qty";
                                    PcLines.INSERT(TRUE);


                                    //Sub Activities
                                    OriginalSubActivities.RESET;
                                    OriginalSubActivities.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                                    OriginalSubActivities.SETRANGE("Workplan No.", Rec."Department/Center PC ID");
                                    OriginalSubActivities.SETRANGE("Initiative No.", PcLines."Initiative No.");
                                    IF OriginalSubActivities.FINDFIRST THEN BEGIN
                                        REPEAT
                                            PCSubActivities.INIT;
                                            PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                                            PCSubActivities."Workplan No." := Rec.No;
                                            PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                                            PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                                            PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                                            PCSubActivities.TRANSFERFIELDS(OriginalSubActivities, FALSE);
                                            PCSubActivities.INSERT(TRUE);
                                        UNTIL OriginalSubActivities.NEXT = 0;
                                    END;
                                //End Sub Activities
                                UNTIL PcLinesN.NEXT = 0;
                            END;
                        END;
                        //Load JD
                        IF (SPMGeneralSetup."Allow Loading of JD" = TRUE) THEN BEGIN
                            JobResponsiblities.RESET;
                            IF Rec."Acting Job ID" <> '' THEN BEGIN
                                JobResponsiblities.SETRANGE("Job ID", Rec."Acting Job ID");
                            END ELSE BEGIN
                                JobResponsiblities.SETRANGE("Job ID", Rec.Position);
                            END;
                            IF JobResponsiblities.FINDFIRST THEN BEGIN
                                REPEAT
                                    PCJobDescription.INIT;
                                    PCJobDescription."Workplan No." := Rec.No;
                                    //   PCJobDescription."Line Number":=FORMAT(JobResponsiblities."Entry No.");
                                    //   PCJobDescription.Description:=JobResponsiblities.Responsibility;
                                    PCJobDescription."Primary Department" := Rec."Responsibility Center";
                                    PCJobDescription.VALIDATE("Primary Department");
                                    PCJobDescription.INSERT;

                                UNTIL JobResponsiblities.NEXT = 0;
                            END;
                        END;
                    END;
                    //Loading JD from New HR Moduel   \\Kisavi
                    /*IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
                      JobRes.RESET;
                      IF "Acting Job ID"<>'' THEN BEGIN
                        JobRes.SETRANGE("Position ID","Acting Job ID");
                        END ELSE BEGIN
                        JobRes.SETRANGE("Position ID",Position);
                          END;
                        IF JobRes.FINDFIRST THEN BEGIN
                        REPEAT
                          PCJobDescription.INIT;
                          PCJobDescription."Workplan No.":=No;
                          PCJobDescription."Line Number":=FORMAT(JobRes."Line No");
                          PCJobDescription.Description:=JobRes.Description;
                          PCJobDescription."Primary Department":="Responsibility Center";
                          PCJobDescription.VALIDATE("Primary Department");
                          PCJobDescription.INSERT;
                    
                        UNTIL JobRes.NEXT=0;
                      END;
                    END;*/

                    //Board Sub-activities
                    BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE("Workplan No.", Rec."Annual Workplan");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                        REPEAT
                            PCSubActivities.INIT;
                            PCSubActivities.TRANSFERFIELDS(BoardSubActivities);
                            PCSubActivities."Workplan No." := Rec.No;
                            PCSubActivities."Initiative No." := BoardSubActivities."Activity Id";
                            PCSubActivities.INSERT(TRUE);
                        UNTIL BoardSubActivities.NEXT = 0;
                    END;

                    MESSAGE('Functional PC Populated Successfully');

                end;
            }
            action("Select Activities")
            {
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Select Activities action.';

                trigger OnAction()
                begin
                    CLEAR(WorkplanInitiatives);
                    PcLines.RESET;
                    PcLines.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                    PcLines.SETRANGE("Workplan No.", Rec."Directors PC ID");
                    PcLines.SETRANGE("Primary Department", Rec."Responsibility Center");
                    WorkplanInitiatives.SETTABLEVIEW(PcLines);
                    WorkplanInitiatives.LOOKUPMODE(TRUE);
                    IF WorkplanInitiatives.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        //Delete exist sub activities
                        OriginalSubActivities.RESET;
                        OriginalSubActivities.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                        OriginalSubActivities.SETRANGE("Workplan No.", Rec."Directors PC ID");
                        OriginalSubActivities.SETRANGE("Initiative No.", PcLines."Initiative No.");
                        OriginalSubActivities.DELETEALL;
                        //Delete exist sub activities

                        PcLines.RESET;
                        PcLines.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                        PcLines.SETRANGE("Workplan No.", Rec."Directors PC ID");
                        PcLines.SETRANGE(Selected, TRUE);
                        IF PcLines.FINDFIRST THEN BEGIN
                            REPEAT
                                PcLinesN.INIT;
                                PcLinesN."Strategy Plan ID" := Rec."Strategy Plan ID";
                                PcLinesN."Workplan No." := Rec.No;
                                PcLinesN."Initiative No." := PcLines."Initiative No.";
                                PcLinesN.TRANSFERFIELDS(PcLines, FALSE);
                                PcLinesN.INSERT;
                            UNTIL PcLines.NEXT = 0;
                        END;
                    END;

                    OriginalSubActivities.RESET;
                    OriginalSubActivities.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                    OriginalSubActivities.SETRANGE("Workplan No.", Rec."Directors PC ID");
                    OriginalSubActivities.SETRANGE("Initiative No.", PcLines."Initiative No.");
                    IF OriginalSubActivities.FINDFIRST THEN BEGIN
                        REPEAT
                            PCSubActivities.INIT;
                            PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                            PCSubActivities."Workplan No." := Rec.No;
                            PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                            PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                            PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                            PCSubActivities.TRANSFERFIELDS(OriginalSubActivities, FALSE);
                            PCSubActivities.INSERT(TRUE);
                        UNTIL OriginalSubActivities.NEXT = 0;
                    END;
                end;
            }
            action("Populate Goals Hub")
            {
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Populate Goals Hub action.';

                trigger OnAction()
                begin
                    GoalTemplateLine.RESET;
                    GoalTemplateLine.SETRANGE("Goal Template ID", Rec."Goal Template ID");
                    IF GoalTemplateLine.FIND('-') THEN BEGIN
                        REPEAT
                            workplangoalhub.INIT;
                            workplangoalhub."Goal ID" := GoalTemplateLine."Goal ID";
                            workplangoalhub."Performance Contract ID" := Rec.No;
                            workplangoalhub."Goal Description" := GoalTemplateLine.Description;
                            workplangoalhub."Aligned-To PC ID" := GoalTemplateLine."Corporate Strategic Plan ID";
                            workplangoalhub."Aligned-To PC Goal ID" := GoalTemplateLine."Strategic Objective ID";
                            workplangoalhub.INSERT(TRUE);
                        UNTIL GoalTemplateLine.NEXT = 0;
                    END;
                    MESSAGE('WorkPlan Hub Populated successfully');
                end;
            }
            action("Aligned Business Goals")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Aligned Business Goals";
                RunPageLink = "Performance Contract ID" = FIELD(No);
                Visible = false;
                ToolTip = 'Executes the Aligned Business Goals action.';
            }
            action("Risk Analysis")
            {
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Workplan Risk";
                //RunPageLink = "Document No"=FIELD(No);
                Visible = false;
                ToolTip = 'Executes the Risk Analysis action.';
            }
            action("Capability Matrix")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Workplan Capability Matrixs";
                //RunPageLink = "Document No"=FIELD(No);
                Visible = false;
                ToolTip = 'Executes the Capability Matrix action.';
            }
            // separator()
            // {
            // }
            action(Approvals)
            {
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
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
                Visible = false;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit Email;
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    //FileMangement: Codeunit "419";
                    ProgressWindow: Dialog;
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    // cu400: Codeunit "400";
                    DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                // ApprovalsMgmt: Codeunit "1535";
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);
                    TotalWeight := 0;
                    Rec.CALCFIELDS("Total Assigned Weight(%)", "Secondary Assigned Weight(%)", "JD Assigned Weight(%)");
                    TotalWeight := Rec."Total Assigned Weight(%)" + Rec."Secondary Assigned Weight(%)" + Rec."JD Assigned Weight(%)";
                    IF NOT (TotalWeight = 100) THEN
                        ERROR('Total Assigned Weight for all Core Mandate Primary Activities should be (100%),Currently is %1', TotalWeight);

                    PcLines.RESET;
                    PcLines.SETRANGE("Workplan No.", Rec.No);
                    IF PcLines.FINDFIRST THEN BEGIN
                        REPEAT
                        // PcLines.TESTFIELD("Primary Directorate");
                        // PcLines.TESTFIELD("Primary Department");
                        UNTIL PcLines.NEXT = 0;
                    END;



                    Rec.TESTFIELD("Created By", USERID); //control so that only the initiator of the document can send for approval
                                                         //  IF ApprovalsMgmt.CheckPerformanceContractApprovalsWorkflowEnabled(Rec) THEN
                                                         //   ApprovalsMgmt.OnSendPerformanceContractForApproval(Rec);
                                                         /*
                                                        CompanyInfo.GET();
                                                          SMTPMailSet.GET;
                                                          SenderAddress := SMTPMailSet."Email Sender Address";
                                                          SenderName :=CompanyInfo.Name+' M&E';
                                                          Subject := STRSUBSTNO('Individual PC');
                                                             PerfomanceContractHeader.RESET;
                                                             PerfomanceContractHeader.SETRANGE(No,No);
                                                             IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                                                                FileDirectory :=  'C:\DOCS\';
                                                                FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                                                                //Window.OPEN('processing');
                                                                Window.OPEN('PROCESSING Individual PC ############1##');
                                                                  Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);

                                                                WindowisOpen := TRUE;
                                                                IF FileName = '' THEN
                                                                  ERROR('Please specify what the file should be saved as');


                                                                 REPORT.SAVEASPDF(80007,FileDirectory+FileName,PerfomanceContractHeader);




                                                                IF EXISTS(FileDirectory+FileName) THEN BEGIN
                                                                  Counter:=Counter+1;

                                                                SMTPMailSet.GET;
                                                                SenderAddress := SMTPMailSet."Email Sender Address";



                                                               Employee.RESET;
                                                               Employee.SETRANGE("No.","Responsible Employee No.");
                                                               IF Employee.FIND('-') THEN BEGIN
                                                                 Recipients :=Employee."Company E-Mail";
                                                               END;
                                                               IF Recipients<>'' THEN BEGIN
                                                                 Body:='Dear Team <BR>Please find attached the Individual PC <Br>'+Description;
                                                                  cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,TRUE);

                                                                  cu400.AppendBody(
                                                                  '<BR><BR>Kind Regards,');
                                                                  cu400.AppendBody('<BR>'+CompInfo.Name);
                                                                  cu400.AddAttachment(FileDirectory+FileName,FileName);
                                                                  cu400.Send;

                                                                  SLEEP(1000);
                                                                  Window.CLOSE;
                                                              END;
                                                              END;
                                                            END;


                                                        MESSAGE('Document has been approved Automatically');
                                                        */

                end;
            }
            action("Cancel Approval Request")
            {
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                    // ApprovalsMgmt.OnCancelPerformanceContractApprovalRequest(Rec);
                end;
            }
            // separator()
            // {
            // }
            action("Send Appraisal")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Send Appraisal action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Released);
                    MESSAGE('Test');
                end;
            }
            // separator()
            // {
            // }
            action("Preview Tagets")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = false;
                ToolTip = 'Executes the Preview Tagets action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    //REPORT.RUN(80004,TRUE,TRUE,Rec)
                    //REPORT.RUN(80053,TRUE,TRUE,Rec)
                    REPORT.RUN(80058, TRUE, TRUE, Rec)
                end;
            }
            action("Preview Achievements")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Preview Achievements action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    //REPORT.RUN(80004,TRUE,TRUE,Rec)
                    REPORT.RUN(Report::"AWP Reporting", TRUE, TRUE, Rec)
                end;
            }
            action("Print Individual PC")
            {
                Caption = 'Individual Annual workplan Contract';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = false;
                ToolTip = 'Executes the Individual Annual workplan Contract action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(80031, TRUE, TRUE, Rec)
                end;
            }
            action("Sub activities")
            {
                Caption = 'Detailed Staff Performance Contract';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = false;
                ToolTip = 'Executes the Detailed Staff Performance Contract action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(80061, TRUE, TRUE, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(LockContract)
                {
                    ApplicationArea = Service;
                    Caption = '&Lock Contract';
                    Image = Lock;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Make sure that the changes will be part of the contract.';
                    Visible = false;

                    trigger OnAction()
                    var
                        LockOpenServContract: Codeunit "Lock-OpenServContract";
                    begin
                        Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Released);
                        Rec."Change Status" := Rec."Change Status"::Locked;
                        Rec.MODIFY;
                        MESSAGE('Contract Locked Successfully');
                    end;
                }
                action(SignContract)
                {
                    ApplicationArea = Service;
                    Caption = 'Si&gn Contract';
                    Image = Signature;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Confirm the contract.';
                    Visible = false;

                    trigger OnAction()
                    var
                        SignServContractDoc: Codeunit SignServContractDoc;
                    begin
                        Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Released);
                        Rec.TESTFIELD("Change Status", Rec."Change Status"::Locked);
                        Rec.Status := Rec.Status::Signed;
                        Rec.MODIFY;
                        MESSAGE('Contract signed Successfully');
                    end;
                }
                action(CopyWorkplan)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy WorkPlan';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Copy a Workplan and its Lines';
                    Visible = false;

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                        CopyJob.SetFromWorkplan(Rec);
                        CopyJob.RUNMODAL;
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."Document Type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."Score Card Type"::Staff;
        // "Contract Type":="Contract Type"::Staff;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."Score Card Type"::Staff;
        // "Contract Type":="Contract Type"::Staff;
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."Document Type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."Score Card Type"::Staff;
        // "Contract Type":="Contract Type"::Staff;
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        SPMGeneralSetup: Record "SPM General Setup";
        TotalWeight: Decimal;
        PCHeader: Record "Perfomance Contract Header";
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        OriginalSubActivities: Record "Sub PC Objective";
        // ApprovalsMgmt: Codeunit 1535;
        WorkplanInitiatives: Page "Workplan Initiatives";
}

