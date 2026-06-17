#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80081 "Functional/Operational PC"
{
    Caption = 'Functional Objective Templates';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release';
    SourceTableView = where("Document Type" = const("Functional/Operational PC"));
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                // field("Objective Setting Due Date"; "Objective Setting Due Date")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Workplan field.';
                    // Caption = 'ADAK Annual Workplan';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("CEO WorkPlan"; Rec."CEO WorkPlan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the CEO WorkPlan field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Employee No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Blocked?"; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
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
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
            // part("Objectives and Intiatives"; "Workplan Initiatives")
            // {
            //     Caption = 'Board PC Initiatives';
            //     SubPageLink = "Workplan No." = field(No),
            //                   "Initiative Type" = const(Board);
            // }
            part("Core Mandate"; "Workplan Initiatives")
            {
                Caption = 'Core Mandate Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Activity);
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
            }
            action("Performance Appraisal")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Personal Scorecard ID" = field(No);
                ToolTip = 'Executes the Performance Appraisal action.';
            }
            action("PC Perspectives")
            {
                ApplicationArea = Basic;
                Image = Interaction;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "PC Perspectives";
                RunPageLink = "Document No" = field(No);
                Visible = false;
                ToolTip = 'Executes the PC Perspectives action.';
            }
        }
        area(creation)
        {
            action("Suggest Objective Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Cascade CSP Activities';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cascade CSP Activities action.';

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');
                    /*TESTFIELD("Strategy Plan ID");
                    TESTFIELD("CEO WorkPlan");
                    TESTFIELD("Annual Reporting Code");
                    PcLinesN.RESET;
                    PcLinesN.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    PcLinesN.SETRANGE("Workplan No.","CEO WorkPlan");
                    PcLinesN.SETRANGE("Primary Department","Responsibility Center");
                    IF PcLinesN.FIND('-') THEN BEGIN
                       REPEAT
                         //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                         PcLines.INIT;
                         PcLines."Workplan No.":=No;
                         PcLines."Strategy Plan ID":=PcLinesN."Strategy Plan ID";
                         PcLines."Initiative No.":=PcLinesN."Initiative No.";
                         PcLines."Goal Template ID":="Goal Template ID";
                         PcLines."Objective/Initiative":=PcLinesN."Objective/Initiative";
                         PcLines."Year Reporting Code":="Annual Reporting Code";
                         PcLines."Initiative Type":= PcLines."Initiative Type"::Activity;
                         PcLines."Primary Directorate":=PcLinesN."Primary Directorate";
                         PcLines."Primary Department":=PcLinesN."Primary Department";
                         PcLines."Imported Annual Target Qty":=PcLinesN."Imported Annual Target Qty";
                         PcLines."Q1 Target Qty":=PcLinesN."Q1 Target Qty";
                         PcLines."Q2 Target Qty":=PcLinesN."Q2 Target Qty";
                         PcLines."Q3 Target Qty":=PcLinesN."Q3 Target Qty";
                         PcLines."Q4 Target Qty":=PcLinesN."Q4 Target Qty";
                         PcLines.INSERT(TRUE);
                       UNTIL PcLinesN.NEXT=0;
                      END;
                    MESSAGE('Functional PC Populated Successfully');*/

                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Annual Workplan");
                    Rec.TestField("Annual Reporting Code");
                    StrategyObjLines.Reset;
                    StrategyObjLines.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                    StrategyObjLines.SetRange(No, Rec."Annual Workplan");
                    StrategyObjLines.SetRange("Primary Directorate", Rec.Directorate);
                    //StrategyObjLines.SETRANGE("Primary Department","Responsibility Center");
                    if StrategyObjLines.Find('-') then begin
                        repeat
                            // ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                            PcLines.Init;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := StrategyObjLines."Strategy Plan ID";
                            PcLines."Initiative No." := StrategyObjLines."Activity ID";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := StrategyObjLines.Description;
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Activity;
                            PcLines."Primary Directorate" := StrategyObjLines."Primary Directorate";
                            PcLines."Primary Directorate Name" := StrategyObjLines."Primary Directorate Name";
                            PcLines."Primary Department" := StrategyObjLines."Primary Department";
                            PcLines."Primary Department Name" := StrategyObjLines."Primary Department Name";
                            PcLines."Outcome Perfomance Indicator" := StrategyObjLines."Perfomance Indicator";
                            PcLines.Validate("Outcome Perfomance Indicator");
                            PcLines."Key Performance Indicator" := StrategyObjLines."Key Performance Indicator";
                            PcLines."Desired Perfomance Direction" := StrategyObjLines."Desired Perfomance Direction";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Start Date" := Rec."Start Date";
                            PcLines."Due Date" := Rec."End Date";
                            PcLines."Imported Annual Target Qty" := StrategyObjLines."Imported Annual Target Qty";
                            PcLines."Assigned Weight (%)" := StrategyObjLines."Assigned Weight(%)";
                            PcLines."Q1 Target Qty" := StrategyObjLines."Q1 Target";
                            PcLines."Q2 Target Qty" := StrategyObjLines."Q2 Target";
                            PcLines."Q3 Target Qty" := StrategyObjLines."Q3 Target";
                            PcLines."Q4 Target Qty" := StrategyObjLines."Q4 Target";
                            PcLines."Strategy Framework" := StrategyObjLines."Strategy Framework";
                            PcLines."Framework Perspective" := StrategyObjLines."Framework Perspective";
                            PcLines.Insert(true);
                            //
                            // SubWorkplanActivity.Reset;
                            // SubWorkplanActivity.SetRange("Workplan No.",No);
                            PCPerspectives.Reset;
                            PCPerspectives.SetRange(Code, StrategyObjLines."Framework Perspective");
                            PCPerspectives.SetRange("Document No", Rec.No);
                            if not PCPerspectives.FindSet then begin
                                PCPerspectives.Init;
                                PCPerspectives.Code := StrategyObjLines."Framework Perspective";
                                PCPerspectives."Document No" := Rec.No;
                                if CSPPerspective.Get(PCPerspectives.Code) then
                                    PCPerspectives.Description := CSPPerspective.Description;
                                PCPerspectives.Insert;
                            end;

                            // Insert sub Activities
                            SubWorkplanActivity.RESET;
                            SubWorkplanActivity.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                            SubWorkplanActivity.SETRANGE("Workplan No.", Rec."Annual Workplan");
                            SubWorkplanActivity.SETRANGE("Activity Id", StrategyObjLines."Activity ID");
                            IF SubWorkplanActivity.FINDSET THEN BEGIN
                                REPEAT
                                    PCSubActivities.INIT;
                                    PCSubActivities."Strategy Plan ID" := SubWorkplanActivity."Strategy Plan ID";
                                    PCSubActivities."Workplan No." := Rec.No;
                                    PCSubActivities."Initiative No." := SubWorkplanActivity."Activity Id";
                                    PCSubActivities."Sub Initiative No." := SubWorkplanActivity."Sub Initiative No.";
                                    PCSubActivities."Objective/Initiative" := SubWorkplanActivity."Objective/Initiative";
                                    PCSubActivities."Imported Annual Target Qty" := SubWorkplanActivity."Imported Annual Target Qty";
                                    PCSubActivities."Assigned Weight (%)" := SubWorkplanActivity.Weight;
                                    PCSubActivities."Unit of Measure" := SubWorkplanActivity."Unit of Measure";
                                    PCSubActivities."Due Date" := SubWorkplanActivity."Due Date";
                                    //PCSubActivities.Budget:=SubWorkplanActivity."Total Budget";
                                    PCSubActivities.INSERT;

                                UNTIL SubWorkplanActivity.NEXT = 0;
                            END;
                        until StrategyObjLines.Next = 0;
                    end;

                    //Board Activities
                    BoardActivities.Reset;
                    BoardActivities.SetRange("AWP No", Rec."Annual Workplan");
                    if BoardActivities.Find('-') then begin
                        repeat
                            PcLines.Init;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := Rec."Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Board;
                            PcLines."Start Date" := Rec."Start Date";
                            PcLines."Due Date" := Rec."End Date";
                            PcLines."Primary Directorate" := StrategyObjLines."Primary Directorate";
                            PcLines."Primary Directorate Name" := StrategyObjLines."Primary Directorate Name";
                            //PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                            // PcLines."Primary Department":=StrategyObjLines."Primary Department";
                            PcLines."Imported Annual Target Qty" := BoardActivities.Target;
                            PcLines."Unit of Measure" := BoardActivities."Unit of Measure";
                            PcLines."Assigned Weight (%)" := BoardActivities."WT(%)";
                            PcLines."Previous Annual Target Qty" := BoardActivities."Previous Annual Target Qty";
                            /*  PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                              PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                              PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                              PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";*/
                            PcLines.Insert(true);



                            //Board Sub-activities
                            BoardSubActivities.Reset;
                            BoardSubActivities.SetRange("Workplan No.", Rec."Annual Workplan");
                            BoardSubActivities.SetRange("Activity Id", BoardActivities."Activity Code");

                            if BoardSubActivities.FindSet then begin
                                repeat
                                    PCSubActivities.Init;
                                    PCSubActivities."Workplan No." := Rec.No;
                                    PCSubActivities."Initiative No." := BoardSubActivities."Activity Id";
                                    PCSubActivities."Strategy Plan ID" := Rec."Strategy Plan ID";
                                    PCSubActivities."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                                    PCSubActivities."Entry Number" := BoardSubActivities."Entry Number";
                                    PCSubActivities.TransferFields(BoardSubActivities, false);
                                    PCSubActivities.Insert(true);
                                until BoardSubActivities.Next = 0;
                            end;
                        until BoardActivities.Next = 0;
                    end;

                    // Message('Annual Workplan & Board PC Populated Successfully');
                    Message('Annual Workplan Populated Successfully');

                end;
            }
            action("Populate Goals Hub")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Populate Goals Hub action.';

                trigger OnAction()
                var
                    // ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit Mail;
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit "File Management";
                    ProgressWindow: Dialog;
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit Mail;
                    DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    FundingOpp: Record "Project Contract Header";
                    GrantsSetup: Record "Grants Setup";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                begin
                    GoalTemplateLine.Reset;
                    GoalTemplateLine.SetRange("Goal Template ID", Rec."Goal Template ID");
                    if GoalTemplateLine.Find('-') then begin
                        repeat
                            workplangoalhub.Init;
                            workplangoalhub."Goal ID" := GoalTemplateLine."Goal ID";
                            workplangoalhub."Performance Contract ID" := Rec.No;
                            workplangoalhub."Goal Description" := GoalTemplateLine.Description;
                            workplangoalhub."Aligned-To PC ID" := GoalTemplateLine."Corporate Strategic Plan ID";
                            workplangoalhub."Aligned-To PC Goal ID" := GoalTemplateLine."Strategic Objective ID";
                            workplangoalhub.Insert(true);
                        until GoalTemplateLine.Next = 0;
                    end;
                    Message('WorkPlan Hub Populated successfully');
                end;
            }
            action("Aligned Business Goals")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Aligned Business Goals";
                RunPageLink = "Performance Contract ID" = field(No);
                Visible = false;
                ToolTip = 'Executes the Aligned Business Goals action.';
            }
            // action("Risk Analysis")
            // {
            //     ApplicationArea = Basic;
            //     Image = Reserve;
            //     Promoted = true;
            //     PromotedCategory = Category5;
            //     PromotedIsBig = true;
            //     RunObject = Page "Workplan Risk";
            //     RunPageLink = "Document No" = field(No);

            // }
            // action("Capability Matrix")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Action";
            //     Promoted = true;
            //     PromotedCategory = Category5;
            //     PromotedIsBig = true;
            //     RunObject = Page "Workplan Capability Matrixs";
            //     RunPageLink = "Document No" = field(No);
            // }
            separator(Action35)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    //  ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit Mail;
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit "File Management";
                    ProgressWindow: Dialog;
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit Mail;
                    DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    FundingOpp: Record "Project Contract Header";
                    GrantsSetup: Record "Grants Setup";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);

                    PcLines.Reset;
                    PcLines.SetRange("Workplan No.", Rec.No);
                    if PcLines.FindFirst then begin
                        repeat
                        //PcLines.TESTFIELD("Primary Directorate");
                        //PcLines.TESTFIELD("Primary Department");
                        until PcLines.Next = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    /*
                      //MESSAGE('Nofity Team');
                    CompanyInfo.GET();
                    SMTPMailSet.GET;
                    SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName :=CompanyInfo.Name+' M&E';
                    Subject := STRSUBSTNO('Functional PC');
                       PerfomanceContractHeader.RESET;
                       PerfomanceContractHeader.SETRANGE(No,No);
                       IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                          FileDirectory :=  'C:\DOCS\';
                          FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                          //Window.OPEN('processing');
                          Window.OPEN('PROCESSING Functional PC ############1##');
                            Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);
                    
                          WindowisOpen := TRUE;
                          IF FileName = '' THEN
                            ERROR('Please specify what the file should be saved as');
                    
                    
                           // Report.SaveAsPdf(80006,FileDirectory+FileName,PerfomanceContractHeader);
                    
                    
                    
                    
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
                           Body:='Dear Team <BR>Please find attached the Functional PC <Br>'+Description;
                            cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,TRUE);
                    
                            cu400.AddBodyline(
                            '<BR><BR>Kind Regards,');
                            cu400.AddBodyline('<BR>'+CompInfo.Name);
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
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                ApprovalsMgmt.""(Rec);*/
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action31)
            {
            }
            action("Send Appraisal")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Send Appraisal action.';

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Message('Test');
                end;
            }
            separator(Action48)
            {
            }
            action("Print Functional PC")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Executes the Print Functional PC action.';

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80006, true, true, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyWorkplan)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy WorkPlan';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Copy a Workplan and its Lines';
                    Visible = false;

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                        CopyJob.SetFromWorkplan(Rec);
                        CopyJob.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Functional/Operational PC";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Functional/Operational PC";
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        BoardActivities: Record "Board Activities";
        PCPerspectives: Record "PC Perspective";
        CSPPerspective: Record "Strategy Framework Perspective";
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        SubWorkplanActivity: Record "Sub Workplan Activity";
}

