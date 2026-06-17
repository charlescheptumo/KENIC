page 80524 "Approved DCS Revision Contrac"
{
    Caption = 'DCS Annual Workplan Contract';
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Functional WorkPlan"; Rec."Functional WorkPlan")
                {
                    Caption = 'AWP Template';
                    ToolTip = 'Specifies the value of the AWP Template field.';
                }
                field("Contract Year"; Rec."Annual Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
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
                    Caption = 'Division Code';
                    ToolTip = 'Specifies the value of the Division Code field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    Caption = 'Division Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Division Name field.';
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
                // field("Total  Departments Count";"Total  Departments Count")
                // {
                // }
                // field("Total Weight(%)";"Total Weight(%)")
                // {
                //     Editable = false;
                // }
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    Caption = 'Total Assigned Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Assigned Weight(%) field.';
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Board PC Activities';
                SubPageLink = "Workplan No." = FIELD(No),
                              "Initiative Type" = CONST(Board);
                Visible = false;
                ApplicationArea = Basic;
            }
            part("Core Activities"; "Workplan Initiatives")
            {
                Caption = 'Core Activities';
                SubPageLink = "Workplan No." = FIELD(No),
                              "Initiative Type" = FILTER(Activity | Board);
            }
            part("Added Activities"; "Secondary Workplan Initiatives")
            {
                Caption = 'Additional Activities';
                SubPageLink = "Workplan No." = FIELD(No),
                              "Strategy Plan ID" = FIELD("Strategy Plan ID"),
                              "Year Reporting Code" = FIELD("Annual Reporting Code");
                Visible = false;
            }
            part("Job Description"; "PC Job Description")
            {
                Caption = 'Job Description';
                SubPageLink = "Workplan No." = FIELD(No);
                Visible = false;
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
                        //     RunPageLink ="Personal Scorecard ID"=FIELD(No),
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
                        // RunPageLink ="Personal Scorecard ID"=FIELD(No),
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
                        //RunPageLink = "Personal Scorecard ID"=FIELD(No);
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
                ToolTip = 'Executes the Suggest Objective Lines action.';

                trigger OnAction()
                begin
                    IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
                        ERROR('Activities not Suggested');

                    Rec.TESTFIELD("Strategy Plan ID");
                    //TESTFIELD("Annual Performance Contract");
                    Rec.TESTFIELD("Functional WorkPlan");
                    Rec.TESTFIELD("Annual Reporting Code");

                    SPMGeneralSetup.GET;

                    IF (SPMGeneralSetup."Allow Loading of  CSP" = TRUE) THEN BEGIN
                        PcLinesN.RESET;
                        PcLinesN.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                        PcLinesN.SETRANGE("Workplan No.", Rec."Functional WorkPlan");
                        PcLinesN.SETRANGE("Primary Directorate", Rec."Responsibility Center");
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
                                PcLines."Assigned Weight (%)" := PcLinesN."Assigned Weight (%)";
                                PcLines."Summary of subactivities" := PcLinesN."Summary of subactivities";
                                PcLines."Strategy Framework" := PcLinesN."Strategy Framework";
                                PcLines."Framework Perspective" := PcLines."Framework Perspective";
                                PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                PcLines."Start Date" := Rec."Start Date";
                                PcLines."Due Date" := Rec."End Date";
                                PcLines.Budget := PcLinesN.Budget;
                                PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                PcLines."Q1 Target Qty" := PcLinesN."Q1 Target Qty";
                                PcLines."Q2 Target Qty" := PcLinesN."Q2 Target Qty";
                                PcLines."Q3 Target Qty" := PcLinesN."Q3 Target Qty";
                                PcLines."Q4 Target Qty" := PcLinesN."Q4 Target Qty";
                                PcLines.INSERT(TRUE);

                                //Sub Activities
                                OriginalSubActivities.RESET;
                                OriginalSubActivities.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                                OriginalSubActivities.SETRANGE("Workplan No.", Rec."Functional WorkPlan");
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


                                BoardSubActivities.RESET;
                                BoardSubActivities.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                                //BoardSubActivities.SETRANGE("Workplan No.","Annual Performance Contract");
                                BoardSubActivities.SETRANGE("Initiative No.", PcLines."Initiative No.");
                                IF BoardSubActivities.FINDFIRST THEN BEGIN
                                    REPEAT
                                        PCSubActivities.INIT;
                                        PCSubActivities."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                                        PCSubActivities."Workplan No." := Rec.No;
                                        PCSubActivities."Initiative No." := BoardSubActivities."Initiative No.";
                                        PCSubActivities."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                                        PCSubActivities."Entry Number" := BoardSubActivities."Entry Number";
                                        PCSubActivities.TRANSFERFIELDS(BoardSubActivities, FALSE);
                                        PCSubActivities.INSERT(TRUE);
                                    UNTIL BoardSubActivities.NEXT = 0;
                                END;
                            //End Sub Activities
                            UNTIL PcLinesN.NEXT = 0;
                        END;
                    END;
                    //Loading JD
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
                                //PCJobDescription.""Workplan No."":=No;
                                //PCJobDescription."Line Number":=FORMAT(JobResponsiblities."Entry No.");
                                //PCJobDescription.Description:=JobResponsiblities.Responsibility;
                                PCJobDescription."Primary Department" := Rec."Responsibility Center";
                                PCJobDescription.VALIDATE("Primary Department");
                                PCJobDescription.INSERT;

                            UNTIL JobResponsiblities.NEXT = 0;
                        END;
                    END;

                    //load JD from New HR Module    \\Kisavi
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
                          PCJobDescription.""Workplan No."":=No;
                          PCJobDescription."Line Number":=FORMAT(JobRes."Line No");
                          PCJobDescription.Description:=JobRes.Description;
                          PCJobDescription."Primary Department":="Responsibility Center";
                          PCJobDescription.VALIDATE("Primary Department");
                          PCJobDescription.INSERT;
                    
                        UNTIL JobRes.NEXT=0;
                      END;
                    END; */


                    //Board Sub-activities
                    /*BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE(""Workplan No."","Annual Workplan");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                    REPEAT
                    PCSubActivities.INIT;
                    PCSubActivities.""Workplan No."":=No;
                    PCSubActivities."Initiative No.":=BoardSubActivities."Activity Id";
                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities,FALSE);
                    PCSubActivities.INSERT(TRUE);
                    UNTIL BoardSubActivities.NEXT=0;
                    END;*/

                    MESSAGE('Functional PC Populated Successfully');

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
                RunObject = Page "Aligned Business Goals";
                RunPageLink = "Performance Contract ID" = FIELD(No);
                ToolTip = 'Executes the Aligned Business Goals action.';
            }
            action("Risk Analysis")
            {
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Workplan Risk";
                ToolTip = 'Executes the Risk Analysis action.';
                //RunPageLink = "Document No"=FIELD(No);
            }
            action("Capability Matrix")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Workplan Capability Matrixs";
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
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
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
                    REPORT.RUN(Report::"performance Contract Grouped", TRUE, TRUE, Rec)
                end;
            }
            action("Print Individual PC")
            {
                Caption = ' Individual Annual Workplan Contract';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the  Individual Annual Workplan Contract action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(Report::"Individual PC", TRUE, TRUE, Rec)
                end;
            }
            action("Individual PC-Sub Indicators")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Report "Individual PC-Sub Indicators";
                ToolTip = 'Executes the Individual PC-Sub Indicators action.';
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

                    trigger OnAction()
                    var
                    //SignServContractDoc: Codeunit "5944";
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."Document Type"::"Individual Scorecard PC";
        Rec."Score Card Type" := Rec."Score Card Type"::Directors;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Document Type" := Rec."Document Type"::"Individual Scorecard PC";
        Rec."Score Card Type" := Rec."Score Card Type"::Directors;
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."Document Type"::"Individual Scorecard PC";
        Rec."Score Card Type" := Rec."Score Card Type"::Directors;
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
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        //ApprovalsMgmt: Codeunit 1535;
        OriginalSubActivities: Record "Sub PC Objective";
        JobRes: Record "Positions Responsibility";
        SubWorkplanActivity: Record "Sub Workplan Activity";
}

