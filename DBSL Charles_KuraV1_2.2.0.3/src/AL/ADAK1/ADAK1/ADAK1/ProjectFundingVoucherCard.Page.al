#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72060 "Project Funding Voucher Card"
{
    PageType = Card;
    SourceTable = "Project Funding Request Vouche";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Default Works Category"; Rec."Default Works Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Category';
                    ToolTip = 'Specifies the value of the Procurement Category field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Default Funding Source"; Rec."Default Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Funding Source field.';
                }
                field("Funding Total Value(LCY)"; Rec."Funding Total Value(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Estimated Cost(LCY)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Estimated Cost(LCY) field.';
                }
            }
            part(Control25; "Project Funding Voucher Line")
            {
                Caption = 'Road Work Sections';
                SubPageLink = "Document No" = field("Document No");
            }
        }
        area(factboxes)
        {
            systempart(Control21; Outlook)
            {
            }
            systempart(Control22; Notes)
            {
            }
            systempart(Control23; MyNotes)
            {
            }
            systempart(Control24; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    ObjApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // if ObjApprovalsMgmt.CheckProjectReqApprovalPossible(Rec) then
                    //   ObjApprovalsMgmt.OnSendProjectReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelProjectReqApprovalRequest(Rec);
                end;
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Approval Entries action.';

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(Consolidate)
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Consolidate action.';

                trigger OnAction()
                begin
                    FnDeleteOldEntriesForSameDocNo();
                    FnConsolidateEntries();
                    if not Confirm('Are you sure you wanna transfer to procurement plan?') then
                        exit;
                    FnPopulateProcPlanEntryAndLines(ProcurementPlan, ProcurementPlanEntry);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::PFV;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ObjConsolidatedFunding: Record "Consolidated Project Funding R";
        ObjProjFundVLine: Record "Project Funding Voucher Line";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlan: Record "Procurement Plan";
        PFVoucherL: Record "Project Funding Voucher Line";
        PFVoucherH: Record "Project Funding Request Vouche";

    local procedure FnDeleteOldEntriesForSameDocNo()
    begin
        ObjConsolidatedFunding.Reset;
        ObjConsolidatedFunding.SetRange(ObjConsolidatedFunding."Document No", Rec."Document No");
        if ObjConsolidatedFunding.FindSet then
            ObjConsolidatedFunding.DeleteAll;
    end;

    local procedure FnConsolidateEntries()
    begin
        ObjProjFundVLine.Reset;
        ObjProjFundVLine.SetRange(ObjProjFundVLine."Document No", Rec."Document No");
        if ObjProjFundVLine.FindSet then
            repeat
                ObjConsolidatedFunding.Init;
                //ObjConsolidatedFunding."Responsibilty Center":="Responsibility Center";
                ObjConsolidatedFunding.TransferFields(ObjProjFundVLine);
                ObjConsolidatedFunding.Insert(true);
                Commit;
            until ObjProjFundVLine.Next = 0;
        Message('Consolidated Successfully');
    end;


    procedure FnPopulateProcPlanEntryAndLines(var ProcPlan: Record "Procurement Plan"; var ProcPlanENtry: Record "Procurement Plan Entry")
    begin
        PFVoucherL.Reset;
        PFVoucherL.SetRange(PFVoucherL."Document No", Rec."Document No");
        if PFVoucherL.FindSet then begin
            ProcurementPlanEntry.Reset;
            ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Work Plan Project ID", PFVoucherL."Project No");
            if ProcurementPlanEntry.FindSet then
                ProcurementPlanEntry.DeleteAll;
            repeat
                PFVoucherL.CalcFields("Total Estimated Cost");
                ProcurementPlanEntry.Init;
                ProcurementPlanEntry.Reset;
                ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Procurement Plan ID", FnGetCurrentProcPlan);
                if ProcurementPlanEntry.FindLast then
                    ProcurementPlanEntry."Entry No." := ProcurementPlanEntry."Entry No." + 1000;
                //MESSAGE(FORMAT(ProcurementPlanEntry."Entry No."));
                ProcurementPlanEntry."Procurement Plan ID" := FnGetCurrentProcPlan();
                //MESSAGE(FnGetCurrentProcPlan());
                ProcurementPlanEntry.Department := PFVoucherL.Department;
                ProcurementPlanEntry."Funding Source ID" := PFVoucherL."Funding Source";
                ProcurementPlanEntry."Work Plan Project ID" := PFVoucherL."Project No";
                ProcurementPlanEntry."Workplan Task No." := PFVoucherL."Section Code";
                ProcurementPlanEntry."Procurement Type" := 'WORKS';
                ProcurementPlanEntry."Planning Category" := PFVoucherL."Works Category";
                ProcurementPlanEntry.Constituency := Rec."Constituency Code";
                ProcurementPlanEntry.Description := Rec.Description;
                ProcurementPlanEntry.Quantity := 1;
                ProcurementPlanEntry."Start Chainage(Km)" := PFVoucherL."Start Chainage(Km)";
                ProcurementPlanEntry."End Chainage(Km)" := PFVoucherL."End Chainage(Km)";
                if PFVoucherL."End Chainage(Km)" - PFVoucherL."Start Chainage(Km)" <= 0 then
                    ProcurementPlanEntry."Section Length(Km)" := PFVoucherL."End Chainage(Km)" - PFVoucherL."Start Chainage(Km)";
                ProcurementPlanEntry.Validate(Quantity);
                ProcurementPlanEntry."Unit Cost" := PFVoucherL."Total Estimated Cost";
                ProcurementPlanEntry.Validate("Unit Cost");
                ProcurementPlanEntry."Road No." := PFVoucherL."Road Code";
                ProcurementPlanEntry.Validate("Road No.");
                ProcurementPlanEntry."Procurement Method" := ProcurementPlanEntry."procurement method"::"Open Tender";
                ProcurementPlanEntry."Solicitation Type" := ProcurementPlanEntry."Solicitation Type";
                ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."requisition product group"::Works;
                ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."procurement use"::"Project-Specific Use";
                ProcurementPlanEntry.Insert(true);
                Message(Format(ProcurementPlanEntry));
            until PFVoucherL.Next = 0;
            Message('Successful');
        end;
    end;


    procedure FnGetCurrentProcPlan(): Code[20]
    begin
        ProcurementPlan.Reset;
        ProcurementPlan.SetRange(ProcurementPlan."Financial Year Code", Rec."Year Code");
        ProcurementPlan.SetRange(ProcurementPlan.Blocked, false);
        if ProcurementPlan.FindFirst then
            exit(ProcurementPlan.Code);
    end;
}

