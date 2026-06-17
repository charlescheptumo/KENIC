page 80509 "Corporate Revision Workplan"
{
    Caption = 'Corporate Revision Workplan Card';
    DeleteAllowed = true;
    PageType = Card;
    SourceTable = "Annual Strategy Workplan";
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Current AWP"; Rec."Current AWP")
                {
                    ToolTip = 'Specifies the value of the Current AWP field.';
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("End Date"; Rec."End Date")
                {
                    Enabled = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Assigned Weight(%) field.';
                }
                field("Total  Departments Count"; Rec."Total  Departments Count")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total  Departments Count field.';
                }
                field("Total Weight(%)"; Rec."Total Weight(%)")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Weight(%) field.';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
                field("Approved Budget"; Rec."Approved Budget")
                {
                    ToolTip = 'Specifies the value of the Approved Budget field.';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
            part(Part; "Strategy Workplan Lines")
            {
                SubPageLink = "Strategy Plan ID" = FIELD("Strategy Plan ID"),
                              No = FIELD(No),
                              "Cross Cutting" = CONST(false);
                ToolTip = '<>';
            }
            part("Cross Cutting Activites"; "Cross Cutting Activites")
            {
                Caption = 'Cross Cutting Activites';
                SubPageLink = "Strategy Plan ID" = FIELD("Strategy Plan ID"),
                              No = FIELD(No),
                              "Cross Cutting" = CONST(true);
                ToolTip = '<>';
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Activity Lines")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Suggest Activity Lines action.';

                trigger OnAction()
                var
                    NumCount: Integer;
                begin
                    IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
                        ERROR('Activities not Suggested');
                    /*StrategicAct.RESET;
                    StrategicAct.SETRANGE("Strategic Plan ID","Strategy Plan ID");
                    IF StrategicAct.FIND('-') THEN BEGIN
                       REPEAT
                         NumCount:=5;
                        // NumCount:=FnGetCount(StrategicAct);
                         WPLines.INIT;
                         WPLines.No:=No;
                         WPLines."Strategy Plan ID":=StrategicAct."Strategic Plan ID";
                         WPLines."Activity ID":=StrategicAct.Code;
                         WPLines."Year Reporting Code":="Year Reporting Code";
                         WPLines.Description:=StrategicAct.Description;
                         WPLines."Primary Directorate":=StrategicAct."Primary Directorate";
                         IF (NumCount>0) THEN
                            WPLines."Imported Annual Target Qty":=StrategicAct."Collective target"/NumCount;
                           WPLines.VALIDATE( WPLines."Imported Annual Target Qty");
                          IF (NumCount>0) THEN
                            WPLines."Imported Annual Budget Est.":=StrategicAct."Collective Budget"/NumCount;
                           WPLines.VALIDATE( WPLines."Imported Annual Budget Est.");
                         WPLines.INSERT(TRUE);
                       UNTIL StrategicAct.NEXT=0;
                      END;*///old

                    //new


                    StrategicIntPlanningLines.RESET;
                    StrategicIntPlanningLines.SETRANGE("Strategic Plan ID", Rec."Strategy Plan ID");
                    StrategicIntPlanningLines.SETRANGE("Annual Reporting Codes", Rec."Year Reporting Code");
                    IF StrategicIntPlanningLines.FINDSET THEN BEGIN
                        REPEAT
                            WPLines.INIT;
                            WPLines.No := Rec.No;
                            WPLines."Strategy Plan ID" := StrategicIntPlanningLines."Strategic Plan ID";
                            //WPLines."Planning Budget Type":="Planning Budget Type";
                            WPLines."Activity ID" := StrategicIntPlanningLines.Code;
                            WPLines."Year Reporting Code" := Rec."Year Reporting Code";
                            WPLines.VALIDATE("Activity ID");
                            //WPLines.Description:=StrategicIntPlanningLines.Description;
                            WPLines."Primary Directorate" := StrategicIntPlanningLines."Primary Directorate";
                            //MESSAGE('StrategicIntPlanningLines."Primary Department" is %1',StrategicIntPlanningLines."Primary Department");
                            WPLines."Primary Department" := StrategicIntPlanningLines."Primary Department";
                            WPLines."Imported Annual Target Qty" := StrategicIntPlanningLines."Target Qty";
                            WPLines.VALIDATE("Imported Annual Target Qty");
                            WPLines."Imported Annual Budget Est." := StrategicIntPlanningLines."Target Budget";
                            WPLines.VALIDATE("Imported Annual Budget Est.");
                            StrategicInt.RESET;
                            StrategicInt.SETRANGE(Code, WPLines."Activity ID");
                            IF StrategicInt.FINDSET THEN BEGIN
                                WPLines."Perfomance Indicator" := StrategicInt."Perfomance Indicator";
                                // WPLines."Key Performance Indicator":=StrategicInt."Date Filter";
                                WPLines."Primary Directorate Name" := StrategicInt."Primary Directorate";
                                WPLines."Primary Department Name" := StrategicInt."Primary Department";
                                WPLines."Unit of Measure" := StrategicInt."Unit of Measure";
                                WPLines."Desired Perfomance Direction" := StrategicInt."Desired Perfomance Direction";
                                WPLines."Strategy Framework" := StrategicInt."Strategy Framework";
                                WPLines."Framework Perspective" := StrategicInt."Framework Perspective";
                                WPLines."Source Of Fund" := StrategicInt."Source Of Fund";
                            END;
                            WPLines.INSERT(TRUE);
                        UNTIL StrategicIntPlanningLines.NEXT = 0;
                    END;
                    MESSAGE('Work Plan Lines Populated Successfully');

                end;
            }
            // separator()
            // {
            // }
            action("Export To Excel")
            {
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Export To Excel action.';

                trigger OnAction()
                begin
                    AnnualWorkPlan.RESET;
                    AnnualWorkPlan.SETRANGE(No, Rec.No);
                    IF AnnualWorkPlan.FIND('-') THEN BEGIN
                        XMLPORT.RUN(XmlPort::"Export Work Plan Lines", TRUE, FALSE, AnnualWorkPlan);
                    END;
                end;
            }
            // separator()
            // {
            // }
            action("Import To Excel")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Import To Excel action.';

                trigger OnAction()
                begin

                    XMLPORT.RUN(XmlPort::"Import Work Plan Lines");
                end;
            }
            action("Import From Excel_TobeUsed")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report 80000;
                Visible = false;
                ToolTip = 'Executes the Import From Excel_TobeUsed action.';
            }
            // separator()
            // {
            // }
            action("Post Targets")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post Targets action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD(Posted, FALSE);
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Released);
                    WPlanLines.RESET;
                    WPlanLines.SETRANGE(No, Rec.No);
                    IF WPlanLines.FIND('-') THEN BEGIN
                        REPEAT
                            //fnPostPlanEntry(WPlanLines);
                            StrategicPlanning.fnPostPlanEntry(WPlanLines);
                        //StrategicPlanning.FnCopyandCloseApprovedWorkplan(Rec.No,Rec."Workplan No");
                        //StrategicPlanning.FnCloseRelatedPCDocuments(Rec.No,Rec."Workplan No");
                        //StrategicPlanning.fnPostRevisionPlanEntry(WPlanLines);
                        UNTIL WPlanLines.NEXT = 0;
                    END;
                    Rec.Posted := TRUE;
                    MESSAGE('Targets Posted Successfully');
                end;
            }
            // separator()
            // {
            // }
            action("Preview Departmental Targets Report")
            {
                Caption = 'Preview Annual Targets Report';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = false;
                ToolTip = 'Executes the Preview Annual Targets Report action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(Report::"Preview targets AWP Report", TRUE, TRUE, Rec)
                end;
            }
            // separator()
            // {
            // }
            action("Board Activities")
            {
                Caption = 'PC Activities';
                Image = EmployeeAgreement;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "Board Activities";
                //RunPageLink = "AWP No"=FIELD(No);
                Visible = false;
                ToolTip = 'Executes the PC Activities action.';
            }
            // separator()
            // {
            // }
            action("Combined Annual Workplan Report")
            {
                Caption = 'Preview Consolidated Annual Workplan';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Preview Consolidated Annual Workplan action.';

                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.RESET;
                    AnnualStrategyWorkplan.SETRANGE(No, Rec.No);
                    IF AnnualStrategyWorkplan.FINDFIRST THEN
                        REPORT.RUN(Report::"PRM Consolidated Workplan Plan", TRUE, TRUE, AnnualStrategyWorkplan);
                end;
            }
            // separator()
            // {
            // }
            action("Annual Workplan Expenditure")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Annual Workplan Expenditure action.';

                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.RESET;
                    AnnualStrategyWorkplan.SETRANGE(No, Rec.No);
                    IF AnnualStrategyWorkplan.FINDFIRST THEN
                        REPORT.RUN(Report::"Annual Workplan Expenditure", TRUE, TRUE, AnnualStrategyWorkplan);
                end;
            }
            action("Suggest Non Funded Activities")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Non Funded Activities action.';

                trigger OnAction()
                var
                    NumCount: Integer;
                begin
                    IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
                        ERROR('Activities not Suggested');
                    Rec.TESTFIELD("Workplan No");
                    AnnualWorkplan2.RESET;
                    AnnualWorkplan2.SETRANGE(No, Rec."Workplan No");
                    IF AnnualWorkplan2.FINDSET THEN BEGIN
                        //StrategicPlanning.FnSuggestNotAnnuallWorkplan(AnnualWorkplan2,Rec.No);
                    END;
                    MESSAGE('Work Plan Lines Populated Successfully');
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Send Approval Request action.';

                    // trigger OnAction()
                    // var
                    //     ApprovalsMgmt: codeunit Approval
                    // begin
                    //     CALCFIELDS("Total Budget");
                    //     TESTFIELD("Approved Budget");
                    //     IF "Total Budget"<=0 THEN BEGIN
                    //       ERROR('Error!, Ensure the total budget is greater than 0');

                    //     END;

                    //     IF "Approved Budget"<>"Total Budget" THEN BEGIN
                    //       ERROR('Error!, Ensure the Approved Budget is aligned to the total budget');

                    //     END;
                    //      IF ("Approval Status"="Approval Status"::Open) THEN
                    //     IF ApprovalsMgmt.CheckAnnualStrategyApprovalsWorkflowEnabled(Rec) THEN
                    //        ApprovalsMgmt.OnSendAnnualStrategyForApproval(Rec);



                    //      IF "Approval Status"="Approval Status"::"Pending Approval" THEN
                    //        ApprovalsMgmt.OnCancelAnnualStrategyApprovalRequest(Rec);
                    // end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    // trigger OnAction()
                    // var
                    //     ApprovalsMgmt: Codeunit "1535";
                    // begin
                    //      IF "Approval Status"="Approval Status"::"Pending Approval" THEN
                    //        ApprovalsMgmt.OnCancelAnnualStrategyApprovalRequest(Rec);
                    // end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                    end;
                }
            }
            action("Preview funded")
            {
                Caption = 'Preview Funded Annual Targets Report';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Preview Funded Annual Targets Report action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(80052, TRUE, TRUE, Rec)
                end;
            }
            action("Preview unFunded")
            {
                Caption = 'Preview Not Funded Annual Targets Report';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Preview Not Funded Annual Targets Report action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(80051, TRUE, TRUE, Rec)
                end;
            }
            action("Update AWP Amounts")
            {
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Update AWP Amounts action.';

                trigger OnAction()
                begin

                    WorkplanActiv.RESET;
                    WorkplanActiv.SETRANGE("Workplan No.", Rec.No);
                    IF WorkplanActiv.FINDSET THEN BEGIN
                        REPEAT
                            WorkplanActiv.CALCFIELDS("Total Autocalculated Amount");
                            WorkplanActiv."Total Budget" := WorkplanActiv."Total Autocalculated Amount";
                            WorkplanActiv.MODIFY(TRUE);
                        UNTIL WorkplanActiv.NEXT = 0;
                    END;

                    WPlanLines.RESET;
                    WPlanLines.SETRANGE(No, Rec.No);
                    IF WPlanLines.FIND('-') THEN BEGIN
                        REPEAT
                            WPlanLines.CALCFIELDS("Sub Activity Budget Sum");
                            WPlanLines."Total Subactivity budget" := WPlanLines."Sub Activity Budget Sum";
                            WPlanLines.MODIFY(TRUE);
                        UNTIL WPlanLines.NEXT = 0;
                    END;
                    MESSAGE('Updated Successfully');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CALCFIELDS("Total Assigned Weight(%)", "Total  Departments Count");
        IF Rec."Total  Departments Count" <> 0 THEN
            Rec."Total Weight(%)" := (Rec."Total Assigned Weight(%)" / Rec."Total  Departments Count");

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Annual Strategy Type" := Rec."Annual Strategy Type"::Organizational;
        Rec."Planning Budget Type" := Rec."Planning Budget Type"::Supplementary;
        Rec.CALCFIELDS("Total Assigned Weight(%)", "Total  Departments Count");
        IF Rec."Total  Departments Count" <> 0 THEN
            Rec."Total Weight(%)" := (Rec."Total Assigned Weight(%)" / Rec."Total  Departments Count");

    end;

    trigger OnOpenPage()
    begin
        Rec.CALCFIELDS("Total Assigned Weight(%)", "Total  Departments Count");
        IF Rec."Total  Departments Count" <> 0 THEN
            Rec."Total Weight(%)" := (Rec."Total Assigned Weight(%)" / Rec."Total  Departments Count");

    end;

    // trigger OnQueryClosePage(CloseAction: Action): Boolean
    // var
    //     ExcelBuffer: Record "370";
    // begin
    // end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        FIleManagement: Codeunit "File Management";
        Text0001: Label 'testing';
        ExcelExt: Text;
        AnnualWorkPlan: Record "Strategy Workplan Lines";
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        WPlanLines: Record "Strategy Workplan Lines";
        I: Integer;
        ThemeID: Code[50];
        ObjectiveID: Code[50];
        StrategicInt: Record "Strategic Initiative";
        SourceType: Option "Strategic Plan","Perfomance Contract";
        YearCode: Record "Annual Reporting Codes";
        QYearCode: Record "Quarterly Reporting Periods";
        QCount: Integer;
        Q1: Code[20];
        Q1date: Date;
        Q2: Code[20];
        Q2date: Date;
        Q3: Code[20];
        Q3date: Date;
        Q4: Code[20];
        Q4date: Date;
        StrategicPlanning: Codeunit "Strategic Planning";
        StrategicIntPlanningLines: Record "Strategic Int Planning Lines";
        //ApprovalsMgmt: Codeunit "1535";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        AnnualWorkplan2: Record "Annual Strategy Workplan";
        WorkplanActiv: Record "Sub Workplan Activity";

    procedure fnPostPlanEntry(WPlanLines: Record "Strategy Workplan Lines")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin
        StrategicInt.RESET;
        StrategicInt.SETRANGE(Code, WPlanLines."Activity ID");
        IF StrategicInt.FIND('-') THEN BEGIN
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        END;

        QYearCode.RESET;
        QYearCode.SETRANGE("Year Code", WPlanLines."Year Reporting Code");
        IF QYearCode.FIND('-') THEN BEGIN
            REPEAT
                QCount := QCount + 1;
                IF (QCount = 1) THEN BEGIN
                    Q1 := QYearCode.Code;
                    Q1date := QYearCode."Reporting Start Date";
                END;
                IF (QCount = 2) THEN BEGIN
                    Q2 := QYearCode.Code;
                    Q2date := QYearCode."Reporting Start Date";
                END;
                IF (QCount = 3) THEN BEGIN
                    Q3 := QYearCode.Code;
                    Q3date := QYearCode."Reporting Start Date";
                END;
                IF (QCount = 4) THEN BEGIN
                    Q4 := QYearCode.Code;
                    Q4date := QYearCode."Reporting Start Date";
                END;
            UNTIL QYearCode.NEXT = 0;
        END;


        // I:=0;
        FOR I := 1 TO 4 DO BEGIN

            IF (I = 1) THEN BEGIN
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."Entry Type"::Planned,
                Rec."Year Reporting Code", Q1, Q1date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q1 Target", WPlanLines."Q1 Budget",
                Rec.No, SourceType::"Strategic Plan");
            END;
            IF (I = 2) THEN BEGIN
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."Entry Type"::Planned,
                Rec."Year Reporting Code", Q2, Q2date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q2 Target", WPlanLines."Q2 Budget",
                Rec.No, SourceType::"Strategic Plan");
            END;

            IF (I = 3) THEN BEGIN
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."Entry Type"::Planned,
                Rec."Year Reporting Code", Q3, Q3date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q3 Target", WPlanLines."Q3 Budget",
                Rec.No, SourceType::"Strategic Plan");

            END;
            IF (I = 4) THEN BEGIN
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."Entry Type"::Planned,
                Rec."Year Reporting Code", Q4, Q4date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q4 Target", WPlanLines."Q4 Budget",
                Rec.No, SourceType::"Strategic Plan");
            END;
        END;
    end;

    procedure FnInsertEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.INIT;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry.INSERT(TRUE);
    end;

    procedure FnGetCount(StrategicInitiative: Record "Strategic Initiative") NumCount: Integer
    var
        StrategicInitiativeYears: Record "Strategic Int Planning Lines";
    begin
        StrategicInitiativeYears.RESET;
        StrategicInitiativeYears.SETRANGE("Strategic Plan ID", StrategicInitiative."Strategic Plan ID");
        StrategicInitiativeYears.SETRANGE("Theme ID", StrategicInitiative."Theme ID");
        StrategicInitiativeYears.SETRANGE("Objective ID", StrategicInitiative."Objective ID");
        StrategicInitiativeYears.SETRANGE("Strategy ID", StrategicInitiative."Strategy ID");
        StrategicInitiativeYears.SETRANGE(Code, StrategicInitiative.Code);
        IF StrategicInitiativeYears.FIND('-') THEN BEGIN
            NumCount := StrategicInitiativeYears.COUNT;
        END;
        EXIT(NumCount);
    end;
}

