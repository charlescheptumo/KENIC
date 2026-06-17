page 80488 "Approved CEO Perform Contract"
{
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
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ToolTip = 'Specifies the value of the Annual Workplan field.';
                    // Caption = 'ADAK Annual Workplan';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ToolTip = 'Specifies the value of the Responsible Employee No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                // field(Title;Title)
                // {
                // }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
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
                field("Created On"; Rec."Created On")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Assigned Weight(%) field.';
                }
                // field("Total  Departments Count";"Total  Departments Count")
                // {
                //     Editable = false;
                //     Visible = false;
                // }
                // field("Total Weight(%)";"Total Weight(%)")
                // {
                //     Editable = false;
                //     Visible = false;
                // }
            }
            // part("Objectives and Intiatives";80421)
            // {
            //     SubPageLink = "Workplan No."=FIELD(No);
            // }
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
                ToolTip = 'Executes the Performance Appraisal action.';
                //RunPageLink = "Personal Scorecard ID"=FIELD(No);
            }
            action("PC Perspectives")
            {
                Image = Interaction;
                Promoted = true;
                PromotedCategory = Process;
                // RunObject = Page 80365;
                // RunPageLink = Field2=FIELD(No);
                Visible = false;
                ToolTip = 'Executes the PC Perspectives action.';
            }
        }
        area(creation)
        {
            action("Core Mandate")
            {
                Image = Hierarchy;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page 80003;
                ToolTip = 'Executes the Core Mandate action.';
            }
            action("Strategic Theme")
            {
                Image = Planning;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page 80027;
                ToolTip = 'Executes the Strategic Theme action.';
                //RunPageLink = "Strategic Plan ID"=FIELD(Strategy Plan ID);
            }
            action("Strategic Objectives")
            {
                Image = Route;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page 80028;
                RunPageLink = "Strategic Plan ID" = FIELD("Strategy Plan ID");
                ToolTip = 'Executes the Strategic Objectives action.';
            }
            action("Suggest Objective Lines2")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Suggest Objective Lines2 action.';

                trigger OnAction()
                begin
                    IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
                        ERROR('Activities not suggested');
                    Rec.TESTFIELD("Strategy Plan ID");
                    Rec.TESTFIELD("Annual Workplan");
                    Rec.TESTFIELD("Annual Reporting Code");

                    /*
                    StrategyObjLines.RESET;
                    StrategyObjLines.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    StrategyObjLines.SETRANGE(No,"Annual Workplan");
                    IF StrategyObjLines.FIND('-') THEN BEGIN
                       REPEAT
                        // ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                         PcLines.INIT;
                         PcLines."Workplan No.":=No;
                         PcLines."Strategy Plan ID":=StrategyObjLines."Strategy Plan ID";
                         PcLines."Initiative No.":=StrategyObjLines."Activity ID";
                         PcLines."Goal Template ID":="Goal Template ID";
                         PcLines."Objective/Initiative":=StrategyObjLines.Description;
                         PcLines."Year Reporting Code":="Annual Reporting Code";
                         PcLines."Initiative Type":= PcLines."Initiative Type"::Activity;
                         PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                         PcLines."Primary Department":=StrategyObjLines."Primary Department";
                         PcLines."Outcome Perfomance Indicator":=StrategyObjLines."Perfomance Indicator";
                         PcLines."Desired Perfomance Direction":=StrategyObjLines."Desired Perfomance Direction";
                         PcLines."Unit of Measure":=StrategyObjLines."Unit of Measure";
                         PcLines."Imported Annual Target Qty":=StrategyObjLines."Imported Annual Target Qty";
                         PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                         PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                         PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                         PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";
                         PcLines."Start Date":="Start Date";
                         PcLines."Due Date":="End Date";
                         PcLines."Strategy Framework":=StrategyObjLines."Strategy Framework";
                         PcLines."Framework Perspective":=StrategyObjLines."Framework Perspective";
                         PcLines.INSERT(TRUE);
                      //added by daudi to add PC Perspectives
                      PCPerspectives.RESET;
                      PCPerspectives.SETRANGE(Code,StrategyObjLines."Framework Perspective");
                      PCPerspectives.SETRANGE("Document No",No);
                      IF NOT PCPerspectives.FINDSET THEN BEGIN
                        PCPerspectives.INIT;
                        PCPerspectives.Code:=StrategyObjLines."Framework Perspective";
                        PCPerspectives."Document No":=No;
                        IF CSPPerspective.GET(PCPerspectives.Code) THEN
                        PCPerspectives.Description:=CSPPerspective.Description;
                        PCPerspectives.INSERT;
                        END;
                    
                       UNTIL StrategyObjLines.NEXT=0;
                      END;
                      */
                    BoardActivities.RESET;
                    BoardActivities.SETRANGE("AWP No", Rec."Annual Workplan");
                    IF BoardActivities.FIND('-') THEN BEGIN
                        REPEAT
                            PcLines.INIT;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := Rec."Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Unit of Measure" := BoardActivities."Unit of Measure";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."Initiative Type"::Board;
                            PcLines."Strategy Framework" := BoardActivities."Strategy Framework";
                            PcLines."Framework Perspective" := BoardActivities."Framework Perspective";
                            PcLines."Assigned Weight (%)" := BoardActivities."WT(%)";
                            //PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                            // PcLines."Primary Department":=StrategyObjLines."Primary Department";
                            PcLines."Imported Annual Target Qty" := BoardActivities.Target;
                            PcLines."Start Date" := Rec."Start Date";
                            PcLines."Due Date" := Rec."End Date";
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
                    //Board Sub-activities
                    /*BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE("Workplan No.","Annual Workplan");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                    REPEAT
                    PCSubActivities.INIT;
                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities);
                    PCSubActivities."Workplan No.":=No;
                    PCSubActivities."Initiative No.":=BoardSubActivities."Activity Id";
                    PCSubActivities.INSERT(TRUE);
                    UNTIL BoardSubActivities.NEXT=0;
                    END;*/
                    MESSAGE('Board PC Populated Successfully');

                end;
            }
            action("Suggest Objective Lines")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Objective Lines action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Strategy Plan ID");
                    Rec.TESTFIELD("Annual Workplan");
                    Rec.TESTFIELD("Annual Reporting Code");
                    StrategyObjLines.RESET;
                    StrategyObjLines.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                    StrategyObjLines.SETRANGE(No, Rec."Annual Workplan");
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
                            PcLines."Primary Directorate" := StrategyObjLines."Primary Directorate";
                            PcLines."Primary Department" := StrategyObjLines."Primary Department";
                            PcLines."Outcome Perfomance Indicator" := StrategyObjLines."Perfomance Indicator";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Desired Perfomance Direction" := StrategyObjLines."Desired Perfomance Direction";
                            PcLines."Imported Annual Target Qty" := StrategyObjLines."Imported Annual Target Qty";
                            PcLines."Assigned Weight (%)" := StrategyObjLines."Departmental Activity Weight";
                            //PcLines.Budget:=StrategyObjLines."Total Subactivity budget";
                            PcLines."Q1 Target Qty" := StrategyObjLines."Q1 Target";
                            PcLines."Q2 Target Qty" := StrategyObjLines."Q2 Target";
                            PcLines."Q3 Target Qty" := StrategyObjLines."Q3 Target";
                            PcLines."Q4 Target Qty" := StrategyObjLines."Q4 Target";
                            PcLines."Strategy Framework" := StrategyObjLines."Strategy Framework";
                            PcLines."Framework Perspective" := StrategyObjLines."Framework Perspective";
                            PcLines.INSERT(TRUE);
                            //added by daudi to add PC Perspectives
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
                                    PCSubActivities.INSERT;

                                UNTIL SubWorkplanActivity.NEXT = 0;
                            END;
                        UNTIL StrategyObjLines.NEXT = 0;
                    END;



                    /*
                    
                    BoardActivities.RESET;
                    BoardActivities.SETRANGE("AWP No","Annual Workplan");
                    IF BoardActivities.FIND('-') THEN BEGIN
                      REPEAT
                         PcLines.INIT;
                         PcLines."Workplan No.":=No;
                         PcLines."Strategy Plan ID":="Strategy Plan ID";
                         PcLines."Initiative No.":=BoardActivities."Activity Code";
                         PcLines."Goal Template ID":="Goal Template ID";
                         PcLines."Objective/Initiative":=BoardActivities."Activity Description";
                         PcLines."Year Reporting Code":="Annual Reporting Code";
                         PcLines."Initiative Type":= PcLines."Initiative Type"::Board;
                         //PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                        // PcLines."Primary Department":=StrategyObjLines."Primary Department";
                         PcLines."Imported Annual Target Qty":=BoardActivities.Target;
                       {  PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                         PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                         PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                         PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";}
                         PcLines.INSERT(TRUE);
                      UNTIL BoardActivities.NEXT=0;
                    END;*/

                    MESSAGE('Annual workplan Populated Successfully');

                end;
            }
            action("Populate Goals Hub")
            {
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
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
            // separator()
            // {
            // }
            action("Send Appraisal")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
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
                    //REPORT.RUN(80053,TRUE,TRUE,Rec) 80058
                    REPORT.RUN(80058, TRUE, TRUE, Rec)
                end;
            }
            action("Print C.E.O PC")
            {
                Caption = 'Print C.E.O AWP';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print C.E.O AWP action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    //REPORT.RUN(80005,TRUE,TRUE,Rec)
                    //REPORT.RUN(80019,TRUE,TRUE,Rec)
                end;
            }
            action("Print C.E.O Contract SubAct")
            {
                Caption = 'Print Detailed C.E.O AWP';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Detailed C.E.O AWP action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    //REPORT.RUN(80005,TRUE,TRUE,Rec)
                    //REPORT.RUN(80054,TRUE,TRUE,Rec)
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
        Rec."Document Type" := Rec."Document Type"::"CEO/Corporate Awp";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."Document Type"::"CEO/Corporate Awp";
    end;

    var
        GoalTemplateLine: Record 80082;
        workplangoalhub: Record 80057;
        StrategyObjLines: Record 80020;
        PcLines: Record 80060;
        BoardActivities: Record 80104;
        PCPerspectives: Record 80228;
        CSPPerspective: Record 80009;
        BoardSubActivities: Record 80229;
        PCSubActivities: Record 80102;
        SubWorkplanActivity: Record 80262;
}

