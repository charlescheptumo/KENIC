#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72310 "Global Maintenance Budget Card"
{
    Caption = 'Global Maintenance Budget Book';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Work Program";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Annual Maintenance Budget Ceilings Year: ' + Rec."Financial Year Code";
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Authority; Rec.Authority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authority field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Financial Budget ID field.';
                }
                field("Budget Line/ Vote Item"; Rec."Budget Line/ Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Budget Line/ Vote Item field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Total Workplanned Length (Km)"; Rec."Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Workplanned Length (Km) field.';
                }
                field("Total Financial Budget"; Rec."Total Financial Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Financial Budget field.';
                }
                field("Total Budget Ceiling"; Rec."Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Book Amount';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Budget Book Amount field.';
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Actual Costs field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control22; "Maintenance Budget  Ceilings")
            {
                SubPageLink = "Road Work Program ID" = field(Code);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Import Budget Entries")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Config. Packages";
                RunPageView = where(Code = const('GLOBALBUDGET'));
                ToolTip = 'Executes the Import Budget Entries action.';

                trigger OnAction()
                begin
                    //MESSAGE('Success');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    //RMS.CheckBudgetCeiling(Rec);
                    Rec.CalcFields("Total Budget Ceiling");
                    Rec.TestField("Total Budget Ceiling");
                    //  RMS.FnCheckWorkPlanLinesExist(NewRoadWorkProgramPackage, Code);
                    //  if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
                    //  ApprovalsMgmt.OnSendRWPReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    //  ApprovalsMgmt.OnCancelRWPReqApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    //  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Code, Rec.Code);
                    if Rec.FindSet then
                        Report.Run(72016, true, false, Rec);
                end;
            }
            group(ActionGroup5)
            {
                action("G/l Budget Entries")
                {
                    ApplicationArea = Basic;
                    Image = LedgerEntries;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Program G/L budget";
                    RunPageLink = "Road Work Program" = field(Code),
                                  "Road Project Category" = filter("Maitenance Works");
                    Visible = false;
                    ToolTip = 'Executes the G/l Budget Entries action.';
                }
                action("Check Budget ")
                {
                    ApplicationArea = Basic;
                    Image = CheckLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Check Budget  action.';

                    trigger OnAction()
                    begin
                        //RMS.CheckBudgetCeiling(Rec)
                    end;
                }
                action("Suggest Projects")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = false;
                    ToolTip = 'Executes the Suggest Projects action.';

                    trigger OnAction()
                    begin
                        //  RMS.FnSuggestProjectsFromBudgetEntriesWorksType(Rec, "Document Type", Workstype::Maintenance);
                        Message('Lines suggested successfully');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Global Budget Book";
        Rec."Road Project Category" := Rec."road project category"::Maintenance;
        Rec."Type of Project" := Rec."type of project"::MAINTENANCE;

        if UserSetup.Get(UserId) then begin
            if UserSetup."Create Maintenance Budget Book" = false then
                Error('You are not allowed to create budgets');
        end;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        NewRoadWorkProgramTask: Record "New Road Work Program Task";
        NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
        RequisitionTemplateLine: Record "BoQ Template Line1";
        BoQTemplateBillCode: Record "BoQ Template Bill Code";
        NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
        TariffCodes1: Record "Tariff Codes1";
        Job: Record Job;
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        NoSeriesManagement: Codeunit "No. Series";
        JobsSetup: Record "Jobs Setup";
        TAskNo: Integer;
        Item: Record Item;
        JobList: Page "Job List";
        Procurement: Codeunit "Procurement Processing";
        ConsRoadWorkProgram: Record "Road Work Program";
        ExistingRoadWPPackage: Record "Existing Road WP Package";
        ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ExistingRoadWPActivity: Record "Existing Road WP Activity";
        ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
        ConsRoadWorkProgramTask: Record "Cons Road Work Program Task";
        ConRoadWorkProgramActivity: Record "Con Road Work Program Activity";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RoadWorkProgram: Record "Road Work Program";
        RMS: Codeunit "RMS Management";
        UserSetup: Record "User Setup";
        WorksType: Option " ",Maintenance,Construction,"Studies_Surveys & Design","Axle Load";
}

