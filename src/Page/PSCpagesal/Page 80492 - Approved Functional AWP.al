page 80492 "Approved Functional AWP"
{
    Caption = 'Approved Functional AWP';
    DeleteAllowed = false;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                // field(""Strategy Plan ID"";""Strategy Plan ID"")
                // {
                //     Editable = false;
                // }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Department; Rec.Department)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    // Caption = 'Consolidated Annual Workplan';
                    Editable = false;
                    Caption = 'Consolidated KICD Annual Workplan';
                    ToolTip = 'Specifies the value of the Consolidated KICD Annual Workplan field.';
                }
                field("Functional Procurment Plan No"; Rec."Functional Procurment Plan No")
                {
                    ToolTip = 'Specifies the value of the Functional Procurment Plan No field.';
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Assigned Weight(%) field.';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
            }
            part(part; "Strategy Workplan Lines")
            {
                Editable = false;
                SubPageLink = "Strategy Plan ID" = FIELD("Strategy Plan ID"),
                              No = FIELD(No),
                              "Cross Cutting" = CONST(false);
                ToolTip = '<>';
            }
            part("Cross Cutting Activites"; "Cross Cutting Activites")
            {
                Caption = 'Cross Cutting Activites';
                Editable = false;
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
                Visible = false;
                ToolTip = 'Executes the Suggest Activity Lines action.';

                trigger OnAction()
                var
                    NumCount: Integer;
                begin
                    IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
                        ERROR('Activities not Suggested');
                    /*StrategicAct.RESET;
                    StrategicAct.SETRANGE("Strategic Plan ID",""Strategy Plan ID"");
                    IF StrategicAct.FIND('-') THEN BEGIN
                       REPEAT
                         NumCount:=5;
                        // NumCount:=FnGetCount(StrategicAct);
                         WPLines.INIT;
                         WPLines.No:=No;
                         WPLines.""Strategy Plan ID"":=StrategicAct."Strategic Plan ID";
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
                    //StrategicIntPlanningLines.SETRANGE("Primary Directorate","Primary Directorate");
                    //StrategicIntPlanningLines.SETRANGE("Primary Department","primary department);
                    IF StrategicIntPlanningLines.FIND('-') THEN BEGIN
                        REPEAT
                            WPLines.INIT;
                            WPLines.No := Rec.No;
                            WPLines."Strategy Plan ID" := StrategicIntPlanningLines."Strategic Plan ID";
                            WPLines."Activity ID" := StrategicIntPlanningLines.Code;
                            StrategicInt.RESET;
                            StrategicInt.SETRANGE(Code, WPLines."Activity ID");
                            IF StrategicInt.FIND('-') THEN BEGIN
                                WPLines."Perfomance Indicator" := StrategicInt."Perfomance Indicator";
                                //WPLines."Key Performance Indicator":=StrategicInt."Key Perfromance Indicator";
                                //WPLines."Primary Directorate Name":=StrategicInt."Primary Directorate Name";
                                //WPLines."Primary Department Name":=StrategicInt."Primary Department Name";
                                WPLines."Unit of Measure" := StrategicInt."Unit of Measure";
                                WPLines."Desired Perfomance Direction" := StrategicInt."Desired Perfomance Direction";
                                WPLines."Strategy Framework" := StrategicInt."Strategy Framework";
                                WPLines."Framework Perspective" := StrategicInt."Framework Perspective";
                                WPLines."Source Of Fund" := StrategicInt."Source Of Fund";
                            END;
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
                            WPLines.INSERT(TRUE);
                        UNTIL StrategicIntPlanningLines.NEXT = 0;
                    END;
                    MESSAGE('Work Plan Lines Populated Successfully');

                end;
            }
            action("Suggest Functional lines")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ToolTip = 'Executes the Suggest Functional lines action.';

                trigger OnAction()
                var
                    NumCount: Integer;
                begin
                    IF NOT CONFIRM('Are you sure you want to Suggest Activities', TRUE) THEN
                        ERROR('Activities not Suggested');
                    /*StrategicAct.RESET;
                    StrategicAct.SETRANGE("Strategic Plan ID",""Strategy Plan ID"");
                    IF StrategicAct.FIND('-') THEN BEGIN
                       REPEAT
                         NumCount:=5;
                        // NumCount:=FnGetCount(StrategicAct);
                         WPLines.INIT;
                         WPLines.No:=No;
                         WPLines.""Strategy Plan ID"":=StrategicAct."Strategic Plan ID";
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
                    WPLines.RESET;
                    WPLines.SETRANGE(No, Rec.No);
                    IF WPLines.FINDSET THEN BEGIN
                        WPLines.DELETEALL;
                    END;


                    StrategicIntPlanningLines.RESET;
                    StrategicIntPlanningLines.SETRANGE("Strategic Plan ID", Rec."Strategy Plan ID");
                    StrategicIntPlanningLines.SETRANGE("Annual Reporting Codes", Rec."Year Reporting Code");
                    //StrategicIntPlanningLines.SETRANGE("Primary Directorate","Primary Directorate");
                    StrategicIntPlanningLines.SETRANGE("Primary Department", Rec.Department);
                    IF StrategicIntPlanningLines.FIND('-') THEN BEGIN
                        REPEAT
                            WPLines.INIT;
                            WPLines.No := Rec.No;
                            WPLines."Strategy Plan ID" := StrategicIntPlanningLines."Strategic Plan ID";
                            WPLines."Activity ID" := StrategicIntPlanningLines.Code;
                            StrategicInt.RESET;
                            StrategicInt.SETRANGE(Code, WPLines."Activity ID");
                            IF StrategicInt.FIND('-') THEN BEGIN
                                WPLines."Perfomance Indicator" := StrategicInt."Perfomance Indicator";
                                //WPLines."Key Performance Indicator":=StrategicInt."Key Perfromance Indicator";
                                //WPLines."Primary Directorate Name":=StrategicInt."Primary Directorate Name";
                                //WPLines."Primary Department Name":=StrategicInt."Primary Department Name";
                                WPLines."Unit of Measure" := StrategicInt."Unit of Measure";
                                WPLines."Desired Perfomance Direction" := StrategicInt."Desired Perfomance Direction";
                                WPLines."Strategy Framework" := StrategicInt."Strategy Framework";
                                WPLines."Framework Perspective" := StrategicInt."Framework Perspective";
                                WPLines."Source Of Fund" := StrategicInt."Source Of Fund";
                            END;
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
                            WPLines.INSERT(TRUE);
                        UNTIL StrategicIntPlanningLines.NEXT = 0;
                    END;
                    MESSAGE('Work Plan Lines Populated Successfully');

                end;
            }
            // separator()
            // {
            // }
            action("Update Annual Workplan")
            {
                Caption = 'Consolidate Annual Workplan';
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Consolidate Annual Workplan action.';

                trigger OnAction()
                begin
                    //Post to Annual Workplan.... Fred
                    StrategicPlanning.FnUpdateAnnualWorkplan(Rec);
                end;
            }
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
                Visible = false;
                ToolTip = 'Executes the Post Targets action.';

                trigger OnAction()
                begin
                    WPlanLines.RESET;
                    WPlanLines.SETRANGE(No, Rec.No);
                    IF WPlanLines.FIND('-') THEN BEGIN
                        REPEAT
                            //fnPostPlanEntry(WPlanLines);
                            StrategicPlanning.fnPostPlanEntry(WPlanLines);
                        UNTIL WPlanLines.NEXT = 0;
                    END;
                    MESSAGE('Targets Posted Successfully');
                end;
            }
            // separator()
            // {
            // }
            action("Print Annual Plan")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Annual Plan action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    REPORT.RUN(Report::"Annual Strategy Workplan", TRUE, TRUE, Rec)
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
            action("Archive Document")
            {
                Image = Archive;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Archive Document action.';

                trigger OnAction()
                begin
                    IF CONFIRM('Are You sure you want to Archive this Document ?', TRUE) THEN BEGIN
                        Rec.TESTFIELD(Archived, FALSE);
                        Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Released);
                        Rec.Archived := TRUE;
                        Rec."Archived By" := USERID;
                        Rec."Archived On" := TODAY;
                        Rec.MODIFY(TRUE);
                        MESSAGE('Archived Successfully');

                    END;

                    CurrPage.CLOSE;
                end;
            }
            // separator()
            // {
            // }
            action("Combined Annual Workplan Report")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Combined Annual Workplan Report action.';

                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.RESET;
                    AnnualStrategyWorkplan.SETRANGE(No, Rec.No);
                    IF AnnualStrategyWorkplan.FINDFIRST THEN
                        REPORT.RUN(Report::"Consolidated Workplan Plan", TRUE, TRUE, AnnualStrategyWorkplan);
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyFunctionalWorkplan)
                {
                    ApplicationArea = CopyFunctionalWorkplan;
                    Caption = '&Copy Functional Workplan';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Copy Previous Functional Workplan';

                    // trigger OnAction()
                    // var
                    //     CopyStrategicWorkplan: Page 80503;
                    // begin
                    //     CopyStrategicWorkplan.SetFromJob(Rec);
                    //     CopyStrategicWorkplan.RUNMODAL;
                    // end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send for review';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    Visible = false;
                    ToolTip = 'Executes the Send for review action.';

                    trigger OnAction()
                    var
                        //ApprovalsMgmt: Codeunit "1535";
                        SubWorkplanActivity: Record "Sub Workplan Activity";
                        WorkplanCostElements: Record "Workplan Cost Elements";
                    begin


                        Rec.CALCFIELDS("Total Assigned Weight(%)");
                        IF Rec."Total Assigned Weight(%)" <> 100 THEN
                            ERROR('Total Assigned weight should be equal to 100%');

                        WPlanLines.RESET;
                        WPlanLines.SETRANGE(No, Rec.No);
                        IF WPlanLines.FINDFIRST THEN BEGIN
                            REPEAT

                                SubWorkplanActivity.RESET;
                                //SubWorkplanActivity.SETRANGE(""Strategy Plan ID"",WPlanLines.""Strategy Plan ID"");
                                SubWorkplanActivity.SETRANGE("Workplan No.", WPlanLines.No);
                                SubWorkplanActivity.SETRANGE("Activity Id", WPlanLines."Activity ID");
                                IF SubWorkplanActivity.FINDFIRST THEN BEGIN
                                    REPEAT

                                        WorkplanCostElements.RESET;
                                        WorkplanCostElements.SETRANGE("Workplan No.", SubWorkplanActivity."Workplan No.");
                                        WorkplanCostElements.SETRANGE("Activity Id", SubWorkplanActivity."Activity Id");
                                        WorkplanCostElements.SETRANGE("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                                        IF NOT WorkplanCostElements.FIND('-') THEN BEGIN
                                            REPEAT

                                                ERROR('All Sub activities must have Workplan Cost Elements. Please enter Workplan Cost Elements for sub activity %1  %2',
                                                SubWorkplanActivity."Sub Initiative No.", SubWorkplanActivity."Objective/Initiative");
                                            UNTIL WorkplanCostElements.NEXT = 0;
                                        END;
                                    UNTIL SubWorkplanActivity.NEXT = 0;
                                END;
                            UNTIL WPlanLines.NEXT = 0;
                        END;
                        //      IF ("Approval Status"="Approval Status"::Open) THEN
                        //     // IF ApprovalsMgmt.CheckAnnualStrategyApprovalsWorkflowEnabled(Rec) THEN
                        //     //    ApprovalsMgmt.OnSendAnnualStrategyForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "1535";
                    begin

                        //  IF "Approval Status"="Approval Status"::"Pending Approval" THEN
                        //    ApprovalsMgmt.OnCancelAnnualStrategyApprovalRequest(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Annual Strategy Type" := Rec."Annual Strategy Type"::Functional;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        ExcelBuffer: Record "Excel Buffer";
    begin
    end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        //FIleManagement: Codeunit 419;
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
        // ApprovalsMgmt: Codeunit "1535";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";

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

