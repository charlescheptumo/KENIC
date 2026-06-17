#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72789 "EVR Professional Opinion"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Project Evaluation Header";
    SourceTableView = where("Document Type" = filter("Professional Opinion"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Cost Claim Amount"; Rec."Cost Claim Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Claim Amount field.';
                }
                field("Variation Order No"; Rec."Variation Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variation Order No field.';
                }
                field("Variation Reason Code"; Rec."Variation Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variation Reason Code field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("External Contract Reference"; Rec."External Contract Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Contract Reference field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contracting Vendor No. field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Contractor Representative"; Rec."Contractor Representative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contractor Representative field.';
                }
                field("Contractor Rep Email"; Rec."Contractor Rep Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Representative Email field.';
                }
                field("Original Value of Work (LCY)"; Rec."Original Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Value of Work (LCY) field.';
                }
                field("Value of Work Added"; Rec."Value of Work Added")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value of Work Added field.';
                }
                field("Value of Work Omitted"; Rec."Value of Work Omitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value of Work Omitted field.';
                }
                field("Net Change Value of Work (LCY)"; Rec."Net Change Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Change Value of Work (LCY) field.';
                }
                field("New Varied Works Value (LCY)"; Rec."New Varied Works Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Varied Works Value (LCY) field.';
                }
                field("Approved Net Change(LCY)"; Rec."Approved Net Change(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Net Change(LCY) field.';
                }
                field("Variation Percentage(%)"; Rec."Variation Percentage(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variation Percentage(%) field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Review Status"; Rec."Review Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Status field.';
                }
                field("Review Rejection Notes"; Rec."Review Rejection Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Rejection Notes field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
                field("Contract Sum Variation %"; Rec."Contract Sum Variation %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Sum Variation % field.';
                }
                field("Maximum Allowed Variation %"; Rec."Maximum Allowed Variation %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Allowed Variation % field.';
                }
                field("Maximum Variation Of Works"; Rec."Maximum Variation Of Works")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Variation Of Works field.';
                }
            }
            part(Control9; "EVR Proj Professional Op Lines")
            {
                Caption = 'Valuation of Proposed Varied Works';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer No. field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Tender Sum Inc Taxes (LCY) field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Variation Justification")
            {
                ApplicationArea = Basic;
                Image = ExtendedDataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter(Justification);
                ToolTip = 'Executes the Variation Justification action.';
            }
            action("Scope Change Summary")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Scope Impact");
                ToolTip = 'Executes the Scope Change Summary action.';
            }
            action("Cost Change Summary")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Cost Impact");
                ToolTip = 'Executes the Cost Change Summary action.';
            }
            action("Schedule Change Summary")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Schedule Impact");
                ToolTip = 'Executes the Schedule Change Summary action.';
            }
            action("Other Variation Impact")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Other Impact");
                ToolTip = 'Executes the Other Variation Impact action.';
            }
            action("Referenced Contract Clauses")
            {
                ApplicationArea = Basic;
                Caption = 'Referenced Contract Clauses';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Contract Clause");
                ToolTip = 'Executes the Referenced Contract Clauses action.';
            }
            action("Additional Notes/Notes")
            {
                ApplicationArea = Basic;
                Image = Note;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter(Comments);
                ToolTip = 'Executes the Additional Notes/Notes action.';
            }
            action("Decline Variation Request")
            {
                ApplicationArea = Basic;
                Caption = 'Decline Variation Request';
                Image = ReviewWorksheet;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Decline Variation Request action.';

                trigger OnAction()
                begin
                    /*IF "Project Manager"<>USERID THEN
                      ERROR('You do not have permissions to decline this request. \\Only project engineers are authorised to decline.');
                    
                    TESTFIELD("Review Rejection Notes");
                    "Review Status":="Review Status"::Declined;
                    MODIFY(TRUE);
                    
                    TESTFIELD("Contractor Rep Email");
                    
                    RoadManagementSetup.GET();
                    IF RoadManagementSetup."Contractor Variation Notify"=TRUE THEN BEGIN
                      RMSManagement.FnNotifyContractorRepDecline(Rec);
                      END;
                    MESSAGE(FORMAT("Document Type")+' '+"Document No."+' '+'posted successfully.');
                    */

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document Type", Rec."Document Type");
                    Rec.SetRange("Document No.", Rec."Document No.");
                    if Rec.FindSet then
                        Report.Run(72049, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Dimensions action.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim();
                    CurrPage.SaveRecord();
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    //  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Create Variation Order")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Create Variation Order action.';

                trigger OnAction()
                begin
                    /*TESTFIELD(Status,Status::Released);
                    TESTFIELD(Posted,FALSE);
                    //TESTFIELD("Review Status",'<>%1',"Review Status"::Declined);
                    IF "Review Status"="Review Status"::Declined THEN
                      ERROR('This Variation Order %1 has been declined. Please process another one.',"Document No.");
                    RMSManagement.FnCreateVariationOrder(Rec,ProjectVariationLine,ProjectVariationSection,ProjectVariationCommittee);
                    "Review Status":="Review Status"::Approved;
                    // "Contractor Variation Req No.":="Document No.";
                    "Project Variation Order No.":="Document No.";
                    VALIDATE("Contractor Variation Req No.");
                    MODIFY(TRUE);
                    
                    //Update Job
                    Job.RESET;
                    Job.SETRANGE(Job."No.","Project ID");
                    IF Job.FINDSET THEN BEGIN
                      Job."Last Variation Request No.":="Variation Order No";
                      Job.MODIFY(TRUE);
                      END;*/

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    Rec.CalcFields("Value of Work Added");
                    if Rec."Value of Work Added" > Rec."Maximum Variation Of Works" then begin
                        Error('You cannot exceed the maximum Variation of works in the contract %1', Rec."Maximum Variation Of Works");
                    end;

                    //IF ApprovalsMgmt.CheckPVHReqApprovalPossible(Rec) THEN
                    //ApprovalsMgmt.OnSendPVHReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelPVHReqApprovalRequest(Rec);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category18;
                PromotedIsBig = true;
                ToolTip = 'Executes the Release action.';

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify();
                    Message('Document %1 released successfully', Rec."Document No.");
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category18;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reopen action.';

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    Message('Document %1 reopened successfully', Rec."Document No.");
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
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);
                    //RMSManagement.FnPostEngineerVariationRequest(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("New Varied Works Value (LCY)", "Original Value of Work (LCY)");
        if Rec."Original Value of Work (LCY)" <> 0 then
            Rec."Variation Percentage(%)" := (Rec."New Varied Works Value (LCY)" - Rec."Original Value of Work (LCY)") / Rec."Original Value of Work (LCY)" * 100;


        if Rec."Total Project Cost Excl. VAT" <> 0 then
            Rec."Contract Sum Variation %" := (Rec."New Varied Works Value (LCY)" - Rec."Total Project Cost Excl. VAT") / Rec."Total Project Cost Excl. VAT" * 100;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("New Varied Works Value (LCY)", "Original Value of Work (LCY)");
        if Rec."Original Value of Work (LCY)" <> 0 then
            Rec."Variation Percentage(%)" := (Rec."New Varied Works Value (LCY)" - Rec."Original Value of Work (LCY)") / Rec."Original Value of Work (LCY)" * 100;


        if Rec."Total Project Cost Excl. VAT" <> 0 then
            Rec."Contract Sum Variation %" := (Rec."New Varied Works Value (LCY)" - Rec."Total Project Cost Excl. VAT") / Rec."Total Project Cost Excl. VAT" * 100;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Document Type":="Document Type"::"Engineer Variation Request";
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields("New Varied Works Value (LCY)", "Original Value of Work (LCY)");
        if Rec."Original Value of Work (LCY)" <> 0 then
            Rec."Variation Percentage(%)" := (Rec."New Varied Works Value (LCY)" - Rec."Original Value of Work (LCY)") / Rec."Original Value of Work (LCY)" * 100;


        if Rec."Total Project Cost Excl. VAT" <> 0 then
            Rec."Contract Sum Variation %" := (Rec."New Varied Works Value (LCY)" - Rec."Total Project Cost Excl. VAT") / Rec."Total Project Cost Excl. VAT" * 100;
    end;

    var
        RMSManagement: Codeunit "RMS Management";
        JobPlanningLine: Record "Job Planning Line";
        ExtensionofTimeLine: Record "Extension of Time Line";
        RoadManagementSetup: Record "Road Management Setup";
        ProjectVariationHeader: Record "Project Variation Header";
        ProjectVariationLine: Record "Project Variation Line";
        ProjectVariationSection: Record "Project Variation Section";
        ProjectVariationCommittee: Record "Project Variation Committee";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Job: Record Job;
}

