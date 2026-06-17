#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72613 "Final Account"
{
    PageType = Card;
    SourceTable = "Final Account";
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
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Defects Liability Period field.';
                }
                field("DLP Start Date"; Rec."DLP Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DLP Start Date field.';
                }
                field("DLP End Date"; Rec."DLP End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DLP End Date field.';
                }
                field("Workplanned Length"; Rec."Workplanned Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplanned Length field.';
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Sum field.';
                }
                field("Payments to Date"; Rec."Payments to Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payments to Date field.';
                }
                field("Completed Issues"; Rec."Completed Issues")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completed Issues field.';
                }
                field("Pending Issues"; Rec."Pending Issues")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Issues field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control19; "Final Account Lines")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Project ID" = field("Project ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Submit action.';

                trigger OnAction()
                begin
                    Message('Document Submitted Successfully');
                end;
            }
            action("Project Vendors")
            {
                ApplicationArea = Basic;
                Caption = 'Project Contractors';
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Vendors";
                RunPageLink = "Contract No" = field("Contract ID");
                ToolTip = 'Executes the Project Contractors action.';
            }
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Documents';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Attach Documents action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No", 'Testing', Rec.RecordId, '');
                    //Attached:=TRUE;
                    Rec.Modify();
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    FinalAccountLine.Reset;
                    FinalAccountLine.SetRange(FinalAccountLine."Document No", Rec."Document No");
                    if FinalAccountLine.FindSet then
                        repeat
                            FinalAccountLine.TestField(FinalAccountLine."Response Type", FinalAccountLine."response type"::Completed);
                        until FinalAccountLine.Next = 0;

                    //Notify RE,Contractor,Subcontractor,Assignee, and send acceptance letter as an attachment
                    ProcurementProcessing.FnNotifyREFinalAccount(Rec);
                    ProcurementProcessing.FnNotifyMainContractorFinalAccount(Rec);
                    ProcurementProcessing.FnNotifyAssigneeFinalAccount(Rec);

                    //Mark the project as completed
                    ObjJob.Reset;
                    ObjJob.SetRange(ObjJob."No.", Rec."Project ID");
                    if ObjJob.FindSet then begin
                        ObjJob.CalcFields("Actual Project Costs");
                        ObjJob.Status := ObjJob.Status::Completed;
                        ObjJob.Modify();
                    end;

                    //Update Road Inventory
                    // ObjJob.RESET;
                    // ObjJob.SETRANGE(ObjJob."No.","Project ID");
                    // IF ObjJob.FINDSET THEN
                    //  BEGIN
                    //    ObjJob.CALCFIELDS("Actual Project Costs");
                    TotalWorkPlannedLength := 0;
                    ProjectRoadLink.Reset;
                    ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", Rec."Project ID");
                    ProjectRoadLink.SetFilter(ProjectRoadLink."Workplanned Length(KM)", '<>%1', 0);
                    if ProjectRoadLink.FindSet then
                        repeat
                            TotalWorkPlannedLength += ProjectRoadLink."Workplanned Length(KM)";
                        until ProjectRoadLink.Next = 0;
                    Message('Total Workplanned Length %1', Format(TotalWorkPlannedLength));

                    if Rec."Payments to Date" <> 0 then begin
                        ProjectRoadLink.Reset;
                        ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", Rec."Project ID");
                        if ProjectRoadLink.FindSet then begin
                            repeat
                                RoadInventory.Reset;
                                RoadInventory.SetRange(RoadInventory."Road Code", ProjectRoadLink."Road Code");
                                if RoadInventory.FindSet then begin
                                    repeat
                                        RoadInventory."Road Valuation" := RoadInventory."Road Valuation" + (ProjectRoadLink."Workplanned Length(KM)" / TotalWorkPlannedLength * Rec."Payments to Date");
                                        RoadInventory.Modify(true);
                                        Message('Valuation per road %1', Format(ProjectRoadLink."Workplanned Length(KM)" / TotalWorkPlannedLength * Rec."Payments to Date"));
                                    until RoadInventory.Next = 0;
                                end;
                            until ProjectRoadLink.Next = 0;
                        end;
                    end;
                    Dialog.Message('Posted successfully');
                end;
            }
            action("Acceptance Letter")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Acceptance Letter action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    if Rec.FindSet then begin
                        Report.Run(72053, true, false, Rec);
                    end;
                end;
            }
            action("Project Road Links")
            {
                ApplicationArea = Basic;
                Image = Line;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Road Links";
                ToolTip = 'Executes the Project Road Links action.';
                // RunPageLink = "Global Budget Book Code"=field("Project ID"),
                //"KeRRA Budget Code"=field(Field24);
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Open;
        Rec."Document Date" := Today;
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        FinalAccountLine: Record "Final Account Line";
        ObjJob: Record Job;
        RoadInventory: Record "Road Inventory";
        ProjectRoadLink: Record "Project Road Link";
        ProcurementProcessing: Codeunit "Procurement Processing";
        TotalWorkPlannedLength: Decimal;
}

