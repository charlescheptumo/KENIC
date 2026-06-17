page 80514 "Functional/Operational RPC"
{
    Caption = 'Functional Objective Templates';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = 80055;
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
                field("Document Type"; Rec."Document Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Objective Setting Due Date"; Rec."Objective Setting Due Date")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Objective Setting Due Date field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ToolTip = 'Specifies the value of the Annual Workplan field.';
                    // Caption = 'ADAK Annual Workplan';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("CEO WorkPlan"; Rec."CEO WorkPlan")
                {
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the CEO WorkPlan field.';
                }
                // field("Original Signed PC";"Original Signed PC")
                // {
                //     Visible = false;
                // }
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
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ToolTip = 'Specifies the value of the Responsible Employee No. field.';
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
                field(Directorate; Rec.Directorate)
                {
                    Caption = 'Division';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    Caption = 'Division Name';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Blocked?"; Rec."Blocked")
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                // field("Total  Departments Count";"Total  Departments Count")
                // {
                //     Editable = false;
                // }
                // field("Total Weight(%)";"Total Weight(%)")
                // {
                //     Editable = false;
                //     Visible = false;
                // }
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Assigned Weight(%) field.';
                }
                field("Created On"; Rec."Created On")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Annual perfomance contract';
                SubPageLink = "Workplan No." = FIELD(No),
                              "Initiative Type" = CONST(Board);
                Visible = false;
                ApplicationArea = Basic;
            }
            part("Core Mandate"; "Workplan Initiatives")
            {
                Caption = 'Core Mandate Activities';
                SubPageLink = "Workplan No." = FIELD(No),
                              "Initiative Type" = CONST(Activity);
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
                Image = AddWatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 80084;
                //RunPageLink ="Personal Scorecard ID"=FIELD(No);
                Visible = false;
                ToolTip = 'Executes the Performance Appraisal action.';
            }
            action("PC Perspectives")
            {
                Image = Interaction;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 80365;
                // RunPageLink = Field2=FIELD(No);
                Visible = false;
                ToolTip = 'Executes the PC Perspectives action.';
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
                ToolTip = 'Executes the Suggest Objective Lines action.';

                trigger OnAction()
                begin
                    /*  IF NOT CONFIRM( 'Are you sure you want to Suggest Activities',TRUE) THEN
                            ERROR('Activities not suggested');
                    TESTFIELD("Strategy Plan ID");
                    TESTFIELD("CEO WorkPlan");
                    TESTFIELD("Annual Reporting Code");
                    PcLinesN.RESET;
                    PcLinesN.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    //PcLinesN.SETRANGE("Workplan No.","CEO WorkPlan");
                    PcLinesN.SETRANGE("Primary Directorate",Directorate);
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

                    Rec.TESTFIELD("Strategy Plan ID");
                    Rec.TESTFIELD("Annual Workplan");
                    Rec.TESTFIELD("Annual Reporting Code");
                    StrategyObjLines.RESET;
                    StrategyObjLines.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                    StrategyObjLines.SETRANGE(No, Rec."Annual Workplan");
                    StrategyObjLines.SETRANGE("Primary Directorate", Rec.Directorate);
                    //StrategyObjLines.SETRANGE("Primary Department","Responsibility Center");
                    // StrategyObjLines.SETRANGE("Primary Directorate","Responsibility Center");
                    IF StrategyObjLines.FIND('-') THEN BEGIN
                        REPEAT
                            // ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                            PcLines.INIT;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := StrategyObjLines."Strategy Plan ID";
                            PcLines."Initiative No." := StrategyObjLines."Activity ID";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := StrategyObjLines.Description;
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."Initiative Type"::Activity;
                            //MESSAGE('wow');
                            PcLines."Primary Directorate" := StrategyObjLines."Primary Directorate";
                            PcLines."Primary Department" := StrategyObjLines."Primary Department";
                            PcLines."Outcome Perfomance Indicator" := StrategyObjLines."Perfomance Indicator";
                            PcLines."Desired Perfomance Direction" := StrategyObjLines."Desired Perfomance Direction";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Imported Annual Target Qty" := StrategyObjLines."Annual Target";
                            PcLines."Q1 Target Qty" := StrategyObjLines."Q1 Target";
                            PcLines."Q2 Target Qty" := StrategyObjLines."Q2 Target";
                            PcLines."Q3 Target Qty" := StrategyObjLines."Q3 Target";
                            PcLines."Q4 Target Qty" := StrategyObjLines."Q4 Target";
                            PcLines."Start Date" := Rec."Start Date";
                            PcLines."Due Date" := Rec."End Date";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Strategy Framework" := StrategyObjLines."Strategy Framework";
                            PcLines."Framework Perspective" := StrategyObjLines."Framework Perspective";
                            PcLines."Assigned Weight (%)" := StrategyObjLines."Departmental Activity Weight";
                            //  PcLines."Summary of subactivities":=StrategyObjLines."Assigned Weight(%)";
                            //  PcLines.Budget:=StrategyObjLines."Total Subactivity budget";
                            //  PcLines."Planning Budget Type":=StrategyObjLines."Planning Budget Type";
                            PcLines.INSERT(TRUE);
                            PCPerspectives.RESET;
                            PCPerspectives.SETRANGE(Code, StrategyObjLines."Framework Perspective");
                            PCPerspectives.SETRANGE("Document No", Rec.No);
                            IF NOT PCPerspectives.FINDSET THEN BEGIN
                                PCPerspectives.INIT;
                                PCPerspectives.Code := StrategyObjLines."Framework Perspective";
                                PCPerspectives."Document No" := Rec.No;
                                IF CSPPerspective.GET(PCPerspectives.Code) THEN
                                    PCPerspectives.Description := CSPPerspective.Description;
                                PCPerspectives.INSERT;
                            END;

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
                                    PCSubActivities."Sub Targets" := SubWorkplanActivity."Imported Annual Target Qty";
                                    PCSubActivities."Sub Activity weight %" := SubWorkplanActivity.Weight;
                                    PCSubActivities."Unit of Measure" := SubWorkplanActivity."Unit of Measure";
                                    PCSubActivities."Due Date" := SubWorkplanActivity."Due Date";
                                    //PCSubActivities.Budget:=SubWorkplanActivity."Total Budget";
                                    //PCSubActivities."Planning Budget Type":=SubWorkplanActivity."Planning Budget Type";
                                    PCSubActivities.INSERT;

                                UNTIL SubWorkplanActivity.NEXT = 0;
                            END;
                        UNTIL StrategyObjLines.NEXT = 0;
                    END;



                    BoardActivities.RESET;
                    BoardActivities.SETRANGE("AWP No", Rec."Annual Workplan");
                    IF BoardActivities.FIND('-') THEN BEGIN
                        REPEAT
                            PcLines.INIT;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := Rec."Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."Initiative Type"::Board;
                            //PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                            // PcLines."Primary Department":=StrategyObjLines."Primary Department";
                            PcLines."Imported Annual Target Qty" := BoardActivities.Target;
                            PcLines."Unit of Measure" := BoardActivities."Unit of Measure";
                            PcLines."Strategy Framework" := BoardActivities."Strategy Framework";
                            PcLines."Framework Perspective" := BoardActivities."Framework Perspective";
                            //PcLines."Planning Budget Type":=BoardActivities."Planning Budget Type";
                            /*  PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                              PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                              PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                              PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";*/
                            PcLines.INSERT(TRUE);

                            //Board Sub-activities
                            BoardSubActivities.RESET;
                            BoardSubActivities.SETRANGE("Workplan No.", Rec."Annual Workplan");
                            BoardSubActivities.SETRANGE("Activity Id", BoardActivities."Activity Code");

                            IF BoardSubActivities.FINDSET THEN BEGIN
                                REPEAT
                                    PCSubActivities.INIT;
                                    PCSubActivities."Workplan No." := Rec.No;
                                    PCSubActivities."Initiative No." := BoardSubActivities."Activity Id";
                                    PCSubActivities."Strategy Plan ID" := Rec."Strategy Plan ID";
                                    PCSubActivities."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                                    PCSubActivities."Entry Number" := BoardSubActivities."Entry Number";
                                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities, FALSE);
                                    PCSubActivities.INSERT(TRUE);
                                UNTIL BoardSubActivities.NEXT = 0;
                            END;
                        UNTIL BoardActivities.NEXT = 0;
                    END;
                    MESSAGE('Activities Populated Successfully');

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
                var
                    //ApprovalMgt: Codeunit "1535";
                    //SMTPSetup: Codeunit "400";
                    CompanyInfo: Record 79;
                    UserSetup: Record 91;
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit 419;
                    ProgressWindow: Dialog;
                    //SMTPMailSet: Record 409;
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    //cu400: Codeunit "400";
                    //DocLog: Record 5000;
                    BranchName: Code[80];
                    DimValue: Record 349;
                    CustEmail: Text[100];
                    HRSetup: Record 5218;
                    CompInfo: Record 79;
                    PerfomanceContractHeader: Record 80055;
                    Employee: Record 5200;
                begin
                    /*GoalTemplateLine.RESET;
                    GoalTemplateLine.SETRANGE("Goal Template ID","Goal Template ID");
                    IF GoalTemplateLine.FIND('-') THEN BEGIN
                        REPEAT
                          workplangoalhub.INIT;
                          workplangoalhub."Goal ID":=GoalTemplateLine."Goal ID";
                          workplangoalhub."Performance Contract ID":=No;
                          workplangoalhub."Goal Description":=GoalTemplateLine.Description;
                          workplangoalhub."Aligned-To PC ID":=GoalTemplateLine."Corporate Strategic Plan ID";
                          workplangoalhub."Aligned-To PC Goal ID":=GoalTemplateLine."Strategic Objective ID";
                          workplangoalhub.INSERT(TRUE);
                          UNTIL GoalTemplateLine.NEXT=0;
                      END;
                      MESSAGE('WorkPlan Hub Populated successfully');*/

                end;
            }
            action("Aligned Business Goals")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page 80051;
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
                RunObject = Page 80052;
                ToolTip = 'Executes the Risk Analysis action.';
                //RunPageLink = "Document No"=FIELD(No);
            }
            action("Capability Matrix")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page 80053;
                ToolTip = 'Executes the Capability Matrix action.';
                //RunPageLink = "Document No"=FIELD(No);
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
                Visible = false;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    // ApprovalMgt: Codeunit 1535";
                    // SMTPSetup: Codeunit "400";
                    CompanyInfo: Record 79;
                    UserSetup: Record 91;
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    //FileMangement: Codeunit 419;
                    ProgressWindow: Dialog;
                    //SMTPMailSet: Record "409";
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
                begin

                    PcLines.RESET;
                    PcLines.SETRANGE("Workplan No.", Rec.No);
                    IF PcLines.FINDFIRST THEN BEGIN
                        REPEAT
                        //PcLines.TESTFIELD("Primary Directorate");
                        //PcLines.TESTFIELD("Primary Department");
                        UNTIL PcLines.NEXT = 0;
                    END;

                    Rec.TESTFIELD("Created By", USERID); //control so that only the initiator of the document can send for approval
                                                         //  IF ApprovalsMgmt.CheckPerformanceContractApprovalsWorkflowEnabled(Rec) THEN
                                                         //   ApprovalsMgmt.OnSendPerformanceContractForApproval(Rec);



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
                    
                    
                           REPORT.SAVEASPDF(80006,FileDirectory+FileName,PerfomanceContractHeader);
                    
                    
                    
                    
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
            action("Notify DCS &CEO")
            {
                Caption = 'Notify DCS and CEO';
                Image = Add;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Notify DCS and CEO action.';

                trigger OnAction()
                var
                    // ApprovalMgt: Codeunit "1535";
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
                    // SMTPMailSet: Record "409";
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
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);
                    Rec."Approval Status" := Rec."Approval Status"::Released;
                    Rec.MODIFY(TRUE);
                    PcLines.RESET;
                    PcLines.SETRANGE("Workplan No.", Rec.No);
                    IF PcLines.FINDFIRST THEN BEGIN
                        REPEAT
                        //PcLines.TESTFIELD("Primary Directorate");
                        //PcLines.TESTFIELD("Primary Department");
                        UNTIL PcLines.NEXT = 0;
                    END;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendGFAForApproval(Rec);*/




                    //MESSAGE('Nofity Team');
                    //         CompanyInfo.GET();
                    //         SMTPMailSet.GET;
                    //         SenderAddress := SMTPMailSet."Email Sender Address";
                    //         SenderName :=CompanyInfo.Name+' M&E';
                    //         Subject := STRSUBSTNO('Functional PC');
                    //            PerfomanceContractHeader.RESET;
                    //            PerfomanceContractHeader.SETRANGE(No,No);
                    //            IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                    //               FileDirectory :=  'C:\DOCS\';
                    //               FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                    //               //Window.OPEN('processing');
                    //               Window.OPEN('PROCESSING Functional PC ############1##');
                    //                 Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);

                    //               WindowisOpen := TRUE;
                    //               IF FileName = '' THEN
                    //                 ERROR('Please specify what the file should be saved as');


                    //                REPORT.SAVEASPDF(80006,FileDirectory+FileName,PerfomanceContractHeader);




                    //               IF EXISTS(FileDirectory+FileName) THEN BEGIN
                    //                 Counter:=Counter+1;

                    //               SMTPMailSet.GET;
                    //               SenderAddress := SMTPMailSet."Email Sender Address";



                    //              Employee.RESET;
                    //              Employee.SETRANGE("No.","Responsible Employee No.");
                    //              IF Employee.FIND('-') THEN BEGIN
                    //                Recipients :=Employee."Company E-Mail";
                    //              END;
                    //              IF Recipients<>'' THEN BEGIN
                    //                Body:='Dear Team <BR>Please find attached the Functional PC <Br>'+Description;
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

                    //           MESSAGE('Notified Succesfully');


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
                    // TESTFIELD("Approval Status","Approval Status"::"Pending Approval");//status must be open.
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
                ToolTip = 'Executes the Preview Tagets action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    //REPORT.RUN(80004,TRUE,TRUE,Rec)
                    REPORT.RUN(80053, TRUE, TRUE, Rec)
                end;
            }
            action("Print Functional PC")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Functional PC action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(80006, TRUE, TRUE, Rec)
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

                    // trigger OnAction()
                    // var
                    //     CopyJob: Page "80088";
                    // begin
                    //     CopyJob.SetFromWorkplan(Rec);
                    //     CopyJob.RUNMODAL;
                    // end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Functional/Operational PC";
        Rec."Planning Budget Type" := Rec."Planning Budget Type"::Supplementary;
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."Document Type"::"Functional/Operational PC";
    end;

    var
        GoalTemplateLine: Record 80082;
        workplangoalhub: Record 80057;
        StrategyObjLines: Record 80020;
        PcLines: Record 80060;
        PcLinesN: Record 80060;
        BoardActivities: Record 80104;
        PCPerspectives: Record 80228;
        CSPPerspective: Record 80009;
        BoardSubActivities: Record 80229;
        PCSubActivities: Record 80102;
        SubPCObjective: Record 80102;
        SubWorkplanActivity: Record 80262;
    //ApprovalsMgmt: Codeunit "1535";
}

