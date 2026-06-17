page 80534 "Functional Revision AWP Card"
{
    Caption = 'Functional Revision AWP Card';
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
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    Enabled = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    Caption = 'AWP Consolidation Revision Template';
                    ToolTip = 'Specifies the value of the AWP Consolidation Revision Template field.';
                }
                field("Functional Procurment Plan No"; Rec."Functional Procurment Plan No")
                {
                    Caption = 'Departmental Procurement Plan RevisionTemplate';
                    ToolTip = 'Specifies the value of the Departmental Procurement Plan RevisionTemplate field.';
                }
                field(Posted; Rec.Posted)
                {
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
                field("Workplan No"; Rec."Workplan No")
                {
                    Caption = 'Current Approved Workplan';
                    ToolTip = 'Specifies the value of the Current Approved Workplan field.';
                }
                // field("Alligned Wishlist Temp";"Alligned Wishlist Temp")
                // {
                //     Caption = 'Aligned Wushlist Temp';
                // }
            }
            part(part; "Strategy Workplan Lines")
            {
                // SubPageLink = "Strategy Plan ID"=FIELD("Strategy Plan ID"),
                //               No=FIELD(No),
                //               Cross Cutting=CONST(No);
                // ToolTip = '<>';
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
                    //StrategicPlanning.FnCopyFunctionallWorkplanReview(Rec,Rec.No,Rec."Division Filter",Rec.Department);
                    //StrategicPlanning.FnSuggestNotFunded(Rec,Rec.No);

                    MESSAGE('Work Plan Lines Populated Successfully');
                end;
            }
            // separator()
            // {
            // }
            action("Update Annual Workplan")
            {
                Caption = 'Consolidate to Workplan Revision Voucher';
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Consolidate to Workplan Revision Voucher action.';

                trigger OnAction()
                begin
                    //Post to Annual Workplan.... Fred
                    //IF Department='PRM' THEN
                    //StrategicPlanning.FnUpdateAnnualWorkplan(Rec)
                    //ELSE
                    // ERROR('Only PRM Department is allowed to Consolidate');
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
                        //XMLPORT.RUN(80000,TRUE,FALSE,AnnualWorkPlan);
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

                    //XMLPORT.RUN(80001);
                end;
            }
            action("Import From Excel_TobeUsed")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Import From Excel_TobeUsed action.';
                // RunObject = Report 80000;
                // Visible = false;
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
                        //StrategicPlanning.fnPostPlanEntry(WPlanLines);
                        UNTIL WPlanLines.NEXT = 0;
                    END;
                    MESSAGE('Targets Posted Successfully');
                end;
            }
            // separator()
            // {
            // }
            action("Preview Departmental Targets Report")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Preview Departmental Targets Report action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    //REPORT.RUN(80048,TRUE,TRUE,Rec)
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
                // RunObject = Page 80117;
                // RunPageLink = "AWP No"=FIELD(No);
                Visible = false;
                ToolTip = 'Executes the PC Activities action.';
            }
            action("Dept Workplan Alignments")
            {
                Caption = 'Align Budget';
                Image = BlanketOrder;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Align Budget action.';
                // RunObject = Page 80538;
                // RunPageLink = "Workplan No."=FIELD(No);
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
            // separator()
            // {
            // }
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
                        Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);
                        Rec.Archived := TRUE;
                        Rec."Archived By" := USERID;
                        Rec."Archived On" := TODAY;
                        Rec.MODIFY(TRUE);
                        MESSAGE('Archived Successfully');

                    END;
                    CurrPage.CLOSE;
                end;
            }
            action("Combined Annual Workplan Report")
            {
                Caption = 'Preview AWP Report';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Preview AWP Report action.';

                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.RESET;
                    AnnualStrategyWorkplan.SETRANGE(No, Rec.No);
                    IF AnnualStrategyWorkplan.FINDFIRST THEN
                        REPORT.RUN(Report::"Consolidated Workplan Plan", TRUE, TRUE, AnnualStrategyWorkplan);
                end;
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

                        /*
                        WPlanLines.RESET;
                        WPlanLines.SETRANGE(No,No);
                        IF WPlanLines.FINDFIRST THEN BEGIN
                           REPEAT
                                WPlanLines.TESTFIELD("Primary Directorate");
                                WPlanLines.TESTFIELD("Primary Department");
                        
                                SubWorkplanActivity.RESET;
                                //SubWorkplanActivity.SETRANGE("Strategy Plan ID",WPlanLines."Strategy Plan ID");
                                SubWorkplanActivity.SETRANGE("Workplan No.",WPlanLines.No);
                                SubWorkplanActivity.SETRANGE("Activity Id",WPlanLines."Activity ID");
                                IF SubWorkplanActivity.FINDFIRST THEN BEGIN
                                   REPEAT
                        
                                     WorkplanCostElements.RESET;
                                     WorkplanCostElements.SETRANGE("Workplan No.",SubWorkplanActivity."Workplan No.");
                                     WorkplanCostElements.SETRANGE("Activity Id",SubWorkplanActivity."Activity Id");
                                     WorkplanCostElements.SETRANGE("Sub Activity No",SubWorkplanActivity."Sub Initiative No.");
                                     IF  NOT WorkplanCostElements.FIND('-')  THEN BEGIN
                                       REPEAT
                        
                                         ERROR('All Sub activities must have Workplan Cost Elements. Please enter Workplan Cost Elements for sub activity %1  %2',
                                         SubWorkplanActivity."Sub Initiative No.",SubWorkplanActivity."Objective/Initiative");
                                       UNTIL WorkplanCostElements.NEXT=0;
                                     END;
                                     UNTIL SubWorkplanActivity.NEXT=0;
                                   END;
                          UNTIL WPlanLines.NEXT=0;
                        END;
                        */
                        //IF ("Approval Status"="Approval Status"::Open) THEN
                        // IF ApprovalsMgmt.CheckAnnualStrategyApprovalsWorkflowEnabled(Rec) THEN
                        //    ApprovalsMgmt.OnSendAnnualStrategyForApproval(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "1535";
                    begin

                        //IF "Approval Status"="Approval Status"::"Pending Approval" THEN
                        //ApprovalsMgmt.OnCancelAnnualStrategyApprovalRequest(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Annual Strategy Type" := Rec."Annual Strategy Type"::Functional;
        Rec."Planning Budget Type" := Rec."Planning Budget Type"::Supplementary;
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
        //FIleManagement: Codeunit "419";
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
        //StrategicPlanning: Codeunit 57007;
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

