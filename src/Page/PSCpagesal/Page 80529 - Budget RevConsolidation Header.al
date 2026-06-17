page 80529 "Budget RevConsolidation Header"
{
    Caption = 'Budget Revision Consolidation Header';
    PageType = Card;
    SourceTable = 80265;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    Caption = 'Financial Year';
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ToolTip = 'Specifies the value of the Annual Workplan field.';
                    // Caption = 'ADAK Annual Workplan';
                }
                field("Proposed Procurement Plan"; Rec."Proposed Procurement Plan")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Proposed Procurement Plan field.';
                }
                field("Current Job"; Rec."Current Job")
                {
                    Caption = 'Previous Financial Year';
                    ToolTip = 'Specifies the value of the Previous Financial Year field.';
                }
                field("Current Financial Budget"; Rec."Current Financial Budget")
                {
                    Caption = 'Current Financial Year';
                    ToolTip = 'Specifies the value of the Current Financial Year field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            // part(;80530)
            // {
            //     SubPageLink = Consolidation Header No=FIELD(Code);
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Consolidation Lines")
            {
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Suggest Consolidation Lines action.';

                trigger OnAction()
                var
                    NumCount: Integer;
                    EntryNo: Integer;
                    TotalAmount: Decimal;
                begin
                    //TESTFIELD("Proposed Procurement Plan");
                    Rec.TESTFIELD("Annual Workplan");
                    Rec.TESTFIELD("Current Job");
                    Rec.TESTFIELD("Current Financial Budget");
                    EntryNo := 0;
                    ProcEntryNo := 0;

                    //clear Procurement Lines
                    ProcurementPlanLinesN.RESET;
                    ProcurementPlanLinesN.SETRANGE("AWP No", Rec."Annual Workplan");
                    ProcurementPlanLinesN.DELETEALL;


                    //Clear Procurement Entry Line Items
                    ProcurementPlanEntryN.RESET;
                    ProcurementPlanEntryN.SETRANGE("AWP No", Rec."Annual Workplan");
                    ProcurementPlanEntryN.DELETEALL;

                    //clear Detailed PP Plan Entries
                    DetailedPPPlanEntryN.RESET;
                    //DetailedPPPlanEntryN.SETRANGE("Workplan No.","Annual Workplan");
                    DetailedPPPlanEntryN.DELETEALL;
                    //
                    ConsolidatedBugdetEntry3.RESET;
                    ConsolidatedBugdetEntry3.SETRANGE("Consolidation Header No", Rec.Code);
                    ConsolidatedBugdetEntry3.DELETEALL;
                    //

                    WorkplanCostElements.RESET;
                    WorkplanCostElements.SETRANGE("Workplan No.", Rec."Annual Workplan");
                    WorkplanCostElements.SETRANGE("Job No", Rec."Current Job");
                    IF WorkplanCostElements.FINDSET THEN BEGIN
                        REPEAT

                            IF WorkplanCostElements."Plan Item No" <> '' THEN BEGIN
                                //Procurement Lines
                                FnUpdateProcurementLines(WorkplanCostElements."Functional Procurment Plan No", WorkplanCostElements."Plan Category", WorkplanCostElements."Workplan No.");
                                //Procurement Plan Entries
                                ProcurementPlanEntryOriginal.RESET;
                                ProcurementPlanEntryOriginal.SETRANGE("Procurement Plan ID", WorkplanCostElements."Functional Procurment Plan No");
                                ProcurementPlanEntryOriginal.SETRANGE("Planning Category", WorkplanCostElements."Plan Category");
                                //ProcurementPlanEntryOriginal.SETRANGE("Plan Item No",WorkplanCostElements."Plan Item No");
                                ProcurementPlanEntryOriginal.SETRANGE("AWP No", WorkplanCostElements."Workplan No.");
                                ProcurementPlanEntryOriginal.SETRANGE(Directorate, FnGetDirectorate(Rec."Annual Workplan", WorkplanCostElements."Activity Id"));
                                ProcurementPlanEntryOriginal.SETRANGE(Department, FnGetDepartment(Rec."Annual Workplan", WorkplanCostElements."Activity Id"));

                                IF NOT ProcurementPlanEntryOriginal.FINDSET THEN BEGIN

                                    ProcEntryNo := FngetLastProcEntryNo;
                                    IF ProcEntryNo = 0 THEN
                                        ProcEntryNo := 1
                                    ELSE
                                        ProcEntryNo := ProcEntryNo + 1;

                                    ProcurementPlanEntry.INIT;
                                    ProcurementPlanEntry."Procurement Plan ID" := WorkplanCostElements."Functional Procurment Plan No";
                                    ProcurementPlanEntry."Planning Category" := WorkplanCostElements."Plan Category";
                                    ProcurementPlanEntry."Entry No." := ProcEntryNo;
                                    ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."Document Type"::"Procurement Plan";
                                    ProcurementPlanEntry.Description := WorkplanCostElements."Plan Item Description";
                                    ProcurementPlanEntry."Planning Category" := WorkplanCostElements."Plan Category";
                                    //ProcurementPlanEntry."Plan Item Type":=ProcurementPlanEntry."Plan Item Type"::Item;
                                    //ProcurementPlanEntry."Plan Item No":=WorkplanCostElements."Plan Item No";
                                    ProcurementPlanEntry.Quantity := 1;
                                    ProcurementPlanEntry."Unit Cost" := CalculateTotalAmount(WorkplanCostElements);
                                    // ProcurementPlanEntry."Line Budget Cost":=WorkplanCostElements.Amount;
                                    ProcurementPlanEntry."Line Budget Cost" := CalculateTotalAmount(WorkplanCostElements);
                                    ProcurementPlanEntry."Budget Control Job No" := WorkplanCostElements."Job No";
                                    ProcurementPlanEntry."Budget Control Job Task No." := WorkplanCostElements."Vote id";
                                    StrategyWorkplanLines.SETRANGE(No, Rec."Annual Workplan");
                                    StrategyWorkplanLines.SETRANGE("Activity ID", WorkplanCostElements."Activity Id");
                                    IF StrategyWorkplanLines.FINDFIRST THEN BEGIN
                                        ProcurementPlanEntry.Directorate := StrategyWorkplanLines."Primary Directorate";
                                        ProcurementPlanEntry.Department := StrategyWorkplanLines."Primary Department";
                                    END;
                                    ProcurementPlanEntry."AWP No" := WorkplanCostElements."Workplan No.";
                                    ProcurementPlanEntry."Activity No" := WorkplanCostElements."Activity Id";
                                    ProcurementPlanEntry."Sub Activity No" := WorkplanCostElements."Sub Activity No";
                                    ProcurementPlanEntry.INSERT(TRUE);
                                    //         END ELSE BEGIN
                                    //           ProcurementPlanEntryOriginal."Unit Cost":=ProcurementPlanEntryOriginal."Unit Cost"+CalculateTotalAmount(WorkplanCostElements);
                                    //           ProcurementPlanEntryOriginal."Line Budget Cost":=ProcurementPlanEntryOriginal."Unit Cost"+CalculateTotalAmount(WorkplanCostElements);
                                    //           ProcurementPlanEntryOriginal.MODIFY(TRUE);
                                END;
                            END; /*ELSE BEGIN
                                   ProcurementPlanEntryOriginal.Quantity:=1;
                                   TotalAmount:=TotalAmount+WorkplanCostElements.Amount;
                                   ProcurementPlanEntryOriginal.VALIDATE("Unit Cost",TotalAmount);
                                   ProcurementPlanEntryOriginal.MODIFY;
                             END;*/

                            //Consolidation Entries
                            EntryNo := FngetLastEntryNo;
                            IF EntryNo = 0 THEN
                                EntryNo := 1
                            ELSE
                                EntryNo := EntryNo + 1;
                            VoteIdHolder := '';
                            ConsolidatedBugdetEntry.INIT;
                            ConsolidatedBugdetEntry."Consolidation Header No" := Rec.Code;
                            ConsolidatedBugdetEntry."Entry No" := EntryNo;
                            ConsolidatedBugdetEntry."Job No" := WorkplanCostElements."Job No";
                            ConsolidatedBugdetEntry."Vote id" := WorkplanCostElements."Vote id";
                            ConsolidatedBugdetEntry.VALIDATE("Vote id");
                            ConsolidatedBugdetEntry.Amount := WorkplanCostElements.Amount;
                            ConsolidatedBugdetEntry."Activity Id" := WorkplanCostElements."Activity Id";
                            ConsolidatedBugdetEntry.Description := WorkplanCostElements."Cost Elements";
                            ConsolidatedBugdetEntry."Activity Description" := WorkplanCostElements."Activity Description";
                            ConsolidatedBugdetEntry."Workplan No" := Rec."Annual Workplan";
                            ConsolidatedBugdetEntry."Initiative No." := WorkplanCostElements."Initiative No.";
                            ConsolidatedBugdetEntry."Planned Item No" := WorkplanCostElements."Plan Item No";
                            StrategyWorkplanLines.RESET;
                            StrategyWorkplanLines.SETRANGE(No, Rec."Annual Workplan");
                            StrategyWorkplanLines.SETRANGE("Activity ID", WorkplanCostElements."Activity Id");
                            IF StrategyWorkplanLines.FINDFIRST THEN BEGIN
                                ConsolidatedBugdetEntry."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                                ConsolidatedBugdetEntry."Primary Department" := StrategyWorkplanLines."Primary Department";
                            END;
                            ConsolidatedBugdetEntry."Sub Initiative No." := WorkplanCostElements."Sub Activity No";
                            IF (ConsolidatedBugdetEntry.INSERT = TRUE) THEN BEGIN

                                VoteIdHolder := ConsolidatedBugdetEntry."Vote id";
                                BudgetConsolidationLines.RESET;
                                BudgetConsolidationLines.SETRANGE("Consolidation Header No", Rec.Code);
                                BudgetConsolidationLines.SETRANGE("Job No", Rec."Current Job");
                                BudgetConsolidationLines.SETRANGE("Vote id", VoteIdHolder);
                                IF NOT BudgetConsolidationLines.FINDSET THEN BEGIN
                                    BudgetConsolidationL.INIT;
                                    BudgetConsolidationL."Consolidation Header No" := Rec.Code;
                                    BudgetConsolidationL."Job No" := Rec."Current Job";
                                    BudgetConsolidationL."Vote id" := VoteIdHolder;
                                    BudgetConsolidationL."Workplan No" := Rec."Annual Workplan";
                                    BudgetConsolidationL.VALIDATE("Vote id");
                                    JobTask.RESET;
                                    JobTask.SETRANGE("Job No.", Rec."Current Job");
                                    JobTask.SETRANGE("Job Task No.", BudgetConsolidationL."Vote id");
                                    IF JobTask.FINDFIRST THEN
                                        JobTask.CALCFIELDS("Schedule (Total Cost)");
                                    BudgetConsolidationL."GL Budgeted Amount" := JobTask."Schedule (Total Cost)";
                                    BudgetConsolidationL.INSERT;
                                END;
                            END;
                            DetailedPPPlanEntry.INIT;
                            DetailedPPPlanEntry.TRANSFERFIELDS(WorkplanCostElements);
                            //DetailedPPPlanEntry."Plan Type":=DetailedPPPlanEntry."Plan Type"::Functional;
                            DetailedPPPlanEntry.INSERT;
                        UNTIL WorkplanCostElements.NEXT = 0;
                    END;

                end;
            }
            // separator()
            // {
            // }
            action("Update Annual Workplan")
            {
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;
                ToolTip = 'Executes the Update Annual Workplan action.';

                trigger OnAction()
                begin
                    ConsolidatedBugdetEntry.RESET;
                    ConsolidatedBugdetEntry.SETRANGE("Consolidation Header No", Rec.Code);
                    ConsolidatedBugdetEntry.SETRANGE("Workplan No", Rec."Annual Workplan");

                    IF ConsolidatedBugdetEntry.FIND('-') THEN BEGIN
                        REPEAT
                            WorkplanCostElements.RESET;
                            WorkplanCostElements.SETRANGE("Workplan No.", ConsolidatedBugdetEntry."Workplan No");
                            WorkplanCostElements.SETRANGE("Activity Id", ConsolidatedBugdetEntry."Activity Id");
                            WorkplanCostElements.SETRANGE("Sub Activity No", ConsolidatedBugdetEntry."Sub Initiative No.");
                            IF NOT WorkplanCostElements.FIND('-') THEN BEGIN

                                WorkplanCostElements.INIT;
                                WorkplanCostElements."Workplan No." := Rec."Annual Workplan";
                                WorkplanCostElements."Job No" := ConsolidatedBugdetEntry."Job No";
                                WorkplanCostElements."Vote id" := ConsolidatedBugdetEntry."Vote id";
                                WorkplanCostElements.VALIDATE("Vote id");
                                WorkplanCostElements."Initiative No." := ConsolidatedBugdetEntry."Initiative No.";
                                WorkplanCostElements.Amount := ConsolidatedBugdetEntry.Amount;
                                WorkplanCostElements."Activity Id" := ConsolidatedBugdetEntry."Activity Id";
                                WorkplanCostElements."Cost Elements" := ConsolidatedBugdetEntry.Description;
                                WorkplanCostElements."Activity Description" := ConsolidatedBugdetEntry."Activity Description";
                                WorkplanCostElements.INSERT;
                            END ELSE BEGIN
                                WorkplanCostElements.Amount := ConsolidatedBugdetEntry.Amount;
                                WorkplanCostElements.MODIFY;
                            END;
                        UNTIL ConsolidatedBugdetEntry.NEXT = 0;
                    END;

                    MESSAGE('Annual Workplan updated successfully');
                end;
            }
            action(Post)
            {
                Image = Archive;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    IF CONFIRM('Are you sure you want to post this document ?', TRUE) THEN BEGIN
                        //TESTFIELD(Posted,FALSE);
                        Rec.TESTFIELD("Document Status", Rec."Document Status"::Draft);
                        //Posted:=TRUE;
                        //"Posted By":=USERID;
                        Rec."Document Status" := Rec."Document Status"::Posted;
                        //"Posted On":=CURRENTDATETIME;
                        MESSAGE('Posted successfully');
                    END;
                    CurrPage.CLOSE;
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "1535";
                    begin
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
                    //ApprovalsMgmt: Codeunit ;
                    begin
                    end;
                }
            }
            // separator()
            // {
            // }
            action("Print Budget Analysis")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print Budget Analysis action.';

                trigger OnAction()
                begin
                    ConsolidatedBugdetEntry.RESET;
                    ConsolidatedBugdetEntry.SETRANGE("Consolidation Header No", Rec.Code);
                    IF ConsolidatedBugdetEntry.FIND('-') THEN BEGIN
                        REPORT.RUN(80039, TRUE, TRUE, ConsolidatedBugdetEntry);
                    END;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Planning Budget Type" := Rec."Planning Budget Type"::Supplementary;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."Document Status" = Rec."Document Status"::Posted THEN BEGIN
            CurrPage.EDITABLE := FALSE;
        END;
    end;

    var
        WorkplanCostElements: Record 80264;
        ConsolidatedBugdetEntry: Record 80267;
        BudgetConsolidationLines: Record 80266;
        ConsolidatedBugdetEntryN: Record 80267;
        VoteIdHolder: Code[10];
        BudgetConsolidationL: Record 80266;
        JobTask: Record 1001;
        StrategyWorkplanLines: Record 80020;
        ProcurementPlanEntry: Record 70101;
        ProcurementPlanEntryN: Record 70101;
        ProcEntryNo: Integer;
        BudgetConsolidationHeader: Record 70011;
        ProcurementPlanLinesN: Record 70100;
        ProcLineNo: Integer;
        ProcurementPlanEntryOriginal: Record 70101;
        DetailedPPPlanEntry: Record 70238;
        DetailedPPPlanEntryN: Record 70238;
        ConsolidatedBugdetEntry3: Record 80267;

    local procedure FngetLastEntryNo() EntryN: Integer
    var
        ConsolidatedBugdetEntry: Record 80267;
    begin

        ConsolidatedBugdetEntry.SETCURRENTKEY("Entry No");
        ConsolidatedBugdetEntry.FINDLAST;
        EntryN := ConsolidatedBugdetEntry."Entry No";
    end;

    local procedure FngetLastProcEntryNo() EntryProcN: Integer
    var
        ProcurementPlanEntry: Record 70101;
    begin
        ProcurementPlanEntry.SETCURRENTKEY("Entry No.");
        ProcurementPlanEntry.FINDLAST;
        EntryProcN := ProcurementPlanEntry."Entry No.";
    end;

    procedure FnUpdateProcurementLines(FunctionalProcurementPlanId: Code[30]; ProcurementCategory: Code[30]; AnnualWorkplan: Code[30])
    var
        ProcurementPlanLines: Record 70100;
        ProcurementPlanLinesNew: Record 70100;
    begin
        ProcurementPlanLines.RESET;
        ProcurementPlanLines.SETRANGE("Procurement Plan ID", FunctionalProcurementPlanId);
        ProcurementPlanLines.SETRANGE("Planning Category", ProcurementCategory);
        IF NOT ProcurementPlanLines.FIND('-') THEN BEGIN
            ProcLineNo := FngetLastProcLineNo;
            IF ProcLineNo = 0 THEN
                ProcLineNo := 1
            ELSE
                ProcLineNo := ProcLineNo + 1;
            ProcurementPlanLinesNew.INIT;
            ProcurementPlanLinesNew."Procurement Plan ID" := FunctionalProcurementPlanId;
            ProcurementPlanLinesNew."PP Line No" := ProcLineNo;
            ProcurementPlanLinesNew."Document Type" := ProcurementPlanLinesNew."Document Type"::"Procurement Plan";
            ProcurementPlanLinesNew."Planning Category" := ProcurementCategory;
            ProcurementPlanLinesNew.VALIDATE("Planning Category");
            ProcurementPlanLinesNew."AWP No" := AnnualWorkplan;
            ProcurementPlanLinesNew.INSERT;

        END;
    end;

    local procedure FngetLastProcLineNo() PPLineNo: Integer
    var
        ProcurementPlanLines: Record 70100;
    begin
        ProcurementPlanLines.RESET;
        ProcurementPlanLines.FINDLAST;
        PPLineNo := ProcurementPlanLines."PP Line No";
    end;

    procedure FnGetDirectorate(AnnualWorkplan: Code[30]; ActivityId: Code[30]) Directorate: Code[30]
    var
        SWLines: Record 80020;
    begin
        SWLines.RESET;
        SWLines.SETRANGE(No, AnnualWorkplan);
        SWLines.SETRANGE("Activity ID", ActivityId);
        IF SWLines.FINDFIRST THEN BEGIN
            Directorate := SWLines."Primary Directorate";
        END;
        EXIT(Directorate);
    end;

    procedure FnGetDepartment(AnnualWorkplan: Code[30]; ActivityId: Code[30]) Department: Code[30]
    var
        SWLines: Record 80020;
    begin
        SWLines.RESET;
        SWLines.SETRANGE(No, AnnualWorkplan);
        SWLines.SETRANGE("Activity ID", ActivityId);
        IF SWLines.FINDFIRST THEN BEGIN
            Department := SWLines."Primary Department";
        END;
        EXIT(Department);
    end;

    procedure CalculateTotalAmount(WPCostElements: Record 80264) TAmount: Decimal
    var
        WorkplanCostElements: Record 80264;
    begin
        TAmount := 0;
        WorkplanCostElements.RESET;
        WorkplanCostElements.SETRANGE("Workplan No.", WPCostElements."Workplan No.");
        WorkplanCostElements.SETRANGE("Primary Directorate", WPCostElements."Primary Directorate");
        WorkplanCostElements.SETRANGE("Primary Department", WPCostElements."Primary Department");
        WorkplanCostElements.SETRANGE("Plan Item No", WPCostElements."Plan Item No");
        WorkplanCostElements.CALCSUMS(Amount);
        TAmount := WorkplanCostElements.Amount;
        EXIT(TAmount);
    end;
}

