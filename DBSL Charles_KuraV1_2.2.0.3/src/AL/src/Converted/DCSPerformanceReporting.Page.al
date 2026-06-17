#pragma warning disable AA0005, AA0008, AL0603,AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80549 "DCS Performance Reporting"
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
                    ApplicationArea = Basic;
                    Caption = 'Contract No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No';
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Functional WorkPlan"; Rec."Functional WorkPlan")
                {
                    ApplicationArea = Basic;
                    Caption = 'AWP Template';
                    ToolTip = 'Specifies the value of the AWP Template field.';
                }
                field("Contract Year"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Change Status"; Rec."Change Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Change Status field.';
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division Code';
                    ToolTip = 'Specifies the value of the Division Code field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                // field("Blocked?"; "Blocked?")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
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
                // field("Total  Departments Count";"Total  Departments Count")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Total Weight(%)";"Total Weight(%)")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Assigned Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Assigned Weight(%) field.';
                }
            }
            part("Core Activities"; "DirectorsPerformance Reporting")
            {
                Caption = 'Core Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity | Board);
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
                        ApplicationArea = Basic;
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Standard Perfomance Appraisal";
                        RunPageLink = "Personal Scorecard ID" = field(No),
                                      "Document Type" = const("Performance Appraisal");
                        ToolTip = 'Executes the Performance Appraisal action.';
                    }
                    action("Performance Appeal")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Performance Appeal';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Perfomance Appeals";
                        RunPageLink = "Personal Scorecard ID" = field(No),
                                      "Document Type" = const("Performance Appeal");
                        ToolTip = 'Executes the Performance Appeal action.';
                    }
                    action(PIPs)
                    {
                        ApplicationArea = Basic;
                        Caption = 'PIPs';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Performance Improvement Plans";
                        RunPageLink = "Personal Scorecard ID" = field(No);
                        ToolTip = 'Executes the PIPs action.';
                    }
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(7),
                                  "No." = field("No. Series");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action("Change Log")
                {
                    ApplicationArea = Basic;
                    Image = Log;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Performance Diary Logs";
                    RunPageLink = "Personal Scorecard ID" = field(No);
                    ToolTip = 'Executes the Change Log action.';
                }
            }
        }
        area(creation)
        {
            action("Suggest Objective Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Objective Lines action.';

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');

                    Rec.TestField("Strategy Plan ID");
                    //TESTFIELD("Annual Performance Contract");
                    Rec.TestField("Functional WorkPlan");
                    Rec.TestField("Annual Reporting Code");

                    SPMGeneralSetup.Get;

                    if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                        PcLinesN.Reset;
                        PcLinesN.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                        PcLinesN.SetRange("Workplan No.", Rec."Functional WorkPlan");
                        PcLinesN.SetRange("Primary Directorate", Rec."Responsibility Center");
                        if PcLinesN.Find('-') then begin
                            repeat
                                //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                                PcLines.Init;
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
                                PcLines.Insert(true);

                                //Sub Activities
                                OriginalSubActivities.Reset;
                                OriginalSubActivities.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                                OriginalSubActivities.SetRange("Workplan No.", Rec."Functional WorkPlan");
                                OriginalSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                                if OriginalSubActivities.FindFirst then begin
                                    repeat
                                        PCSubActivities.Init;
                                        PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                                        PCSubActivities."Workplan No." := Rec.No;
                                        PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                                        PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                                        PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                                        PCSubActivities.TransferFields(OriginalSubActivities, false);
                                        PCSubActivities.Insert(true);
                                    until OriginalSubActivities.Next = 0;
                                end;
                                //End Sub Activities


                                BoardSubActivities.Reset;
                                BoardSubActivities.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                                //BoardSubActivities.SetRange("Workplan No.","Annual Performance Contract");
                                BoardSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                                if BoardSubActivities.FindFirst then begin
                                    repeat
                                        PCSubActivities.Init;
                                        PCSubActivities."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                                        PCSubActivities."Workplan No." := Rec.No;
                                        PCSubActivities."Initiative No." := BoardSubActivities."Initiative No.";
                                        PCSubActivities."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                                        PCSubActivities."Entry Number" := BoardSubActivities."Entry Number";
                                        PCSubActivities.TransferFields(BoardSubActivities, false);
                                        PCSubActivities.Insert(true);
                                    until BoardSubActivities.Next = 0;
                                end;
                            //End Sub Activities
                            until PcLinesN.Next = 0;
                        end;
                    end;
                    //Loading JD
                    if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                        JobResponsiblities.Reset;
                        if Rec."Acting Job ID" <> '' then begin
                            JobResponsiblities.SetRange("Job ID", Rec."Acting Job ID");
                        end else begin
                            JobResponsiblities.SetRange("Job ID", Rec.Position);
                        end;
                        if JobResponsiblities.FindFirst then begin
                            repeat
                                PCJobDescription.Init;
                                PCJobDescription."Workplan No." := Rec.No;
                                //   PCJobDescription."Line Number":=Format(JobResponsiblities."Entry No.");
                                //  PCJobDescription.Description:=JobResponsiblities.Responsibility;
                                PCJobDescription."Primary Department" := Rec."Responsibility Center";
                                PCJobDescription.Validate("Primary Department");
                                PCJobDescription.Insert;

                            until JobResponsiblities.Next = 0;
                        end;
                    end;

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
                          PCJobDescription."Workplan No.":=No;
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
                    BoardSubActivities.SETRANGE("Workplan No.","Annual Workplan");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                    REPEAT
                    PCSubActivities.INIT;
                    PCSubActivities."Workplan No.":=No;
                    PCSubActivities."Initiative No.":=BoardSubActivities."Activity Id";
                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities,FALSE);
                    PCSubActivities.INSERT(TRUE);
                    UNTIL BoardSubActivities.NEXT=0;
                    END;*/

                    Message('Functional PC Populated Successfully');

                end;
            }
            action("Populate Goals Hub")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Populate Goals Hub action.';

                trigger OnAction()
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
                ToolTip = 'Executes the Aligned Business Goals action.';
            }
            action("Risk Analysis")
            {
                ApplicationArea = Basic;
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Workplan Risk";
                RunPageLink = "Document No" = field(No);
                ToolTip = 'Executes the Risk Analysis action.';
            }
            action("Capability Matrix")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Capability Matrix action.';
                //RunObject = Page "Worklan capability Matrix";
                // RunPageLink = "Document No"=field(No);
            }
            separator(Action34)
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
            separator(Action49)
            {
            }
            action("Preview Tagets")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Preview Tagets action.';

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    //REPORT.RUN(80004,TRUE,TRUE,Rec)
                    Report.Run(80053, true, true, Rec)
                end;
            }
            action("Print Individual PC")
            {
                ApplicationArea = Basic;
                Caption = ' Individual Annual Workplan Contract';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the  Individual Annual Workplan Contract action.';

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80007, true, true, Rec)
                end;
            }
            action("Individual PC-Sub Indicators")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Report 80017;
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
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        Rec."Change Status" := Rec."change status"::Locked;
                        Rec.Modify;
                        Message('Contract Locked Successfully');
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
                        SignServContractDoc: Codeunit SignServContractDoc;
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        Rec.TestField("Change Status", Rec."change status"::Locked);
                        Rec.Status := Rec.Status::Signed;
                        Rec.Modify;
                        Message('Contract signed Successfully');
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

                    trigger OnAction()
                    var
                        CopyJob: Page 80088;
                    begin
                        CopyJob.SetFromWorkplan(Rec);
                        CopyJob.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //  "Document Type":="document type"::"Individual Scorecard PC";
        Rec."Score Card Type" := Rec."score card type"::Directors;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        // "Document Type":="document type"::"Individual Scorecard PC";
        Rec."Score Card Type" := Rec."score card type"::Directors;
    end;

    trigger OnOpenPage()
    begin
        //"Document Type":="document type"::"Individual Scorecard PC";
        Rec."Score Card Type" := Rec."score card type"::Directors;
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OriginalSubActivities: Record "Sub PC Objective";
        JobRes: Record "Positions Responsibility";
        SubWorkplanActivity: Record 80262;
}

