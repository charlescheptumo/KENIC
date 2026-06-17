#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50026 "pageextension50026" extends "Job Card"
{
    Caption = 'Project Card';
    PromotedActionCategories = 'New,Process,Report,Prices & Discounts,WIP,Navigate,Job,Print/Send,Approvals';


    layout
    {
        modify("No.")
        {

            //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".

            Caption = 'Project Number';
        }
        modify(Description)
        {
            Caption = 'Project Description';
        }

        modify("Bill-to Name")
        {
            Caption = 'Bill-to Name';
            Visible = true;
            Editable = false;

            //Unsupported feature: Property Insertion (Visible) on ""Bill-to Name"(Control 8)".

        }
        addafter("Bill-to Name")
        {
            field("CIT Committee No."; Rec."CIT Committee No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the CIT Committee No. field.';
            }
        }

        modify("Bill-to Address 2")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Bill-to Address 2"(Control 47)".


            //Unsupported feature: Property Modification (Name) on ""Bill-to Address 2"(Control 47)".

        }

        //Unsupported feature: Property Modification (Visible) on "Control56(Control 56)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to County"(Control 52)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Post Code"(Control 55)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to City"(Control 49)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Country/Region Code"(Control 43)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Contact"(Control 51)".

        modify("Person Responsible")
        {
            Caption = 'Resident Engineer';
            Visible = false;

            //Unsupported feature: Property Insertion (Visible) on ""Person Responsible"(Control 6)".

        }
        modify("Project Manager")
        {
            Caption = 'Resident Engineer';
            Visible = false;
        }
        modify(JobTaskLines)
        {
            Caption = 'Project Activities';
        }
        // modify("Bill-to Customer No.")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to Customer No."(Control 32)".


        //Unsupported feature: Property Deletion (Importance) on ""Bill-to Customer No."(Control 32)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Bill-to Customer No."(Control 32)".

        // modify("Bill-to Contact No.")
        // {
        //     Visible = false;
        // }
        modify("Bill-to Address")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to Address 2"(Control 47)".


        //Unsupported feature: Property Deletion (Importance) on ""Bill-to Address 2"(Control 47)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Bill-to Address 2"(Control 47)".


        //Unsupported feature: Code Modification on "Status(Control 34).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF (Status = Status::Completed) AND Complete THEN BEGIN
          RecalculateJobWIP;
          CurrPage.UPDATE(FALSE);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF (Status = Status::"Under PBRM") AND Complete THEN BEGIN
        #2..4
        */
        //end;
        modify("Sell-to")
        {
            Visible = false;
        }
        addbefore("Sell-to")
        {
            field("Contractor No."; Rec."Contractor No.")
            {
                ApplicationArea = Basic;
                Visible = false;
                Caption = 'Contracting Vendor No.';
                ToolTip = 'Specifies the value of the Contracting Vendor No. field.';

            }
            field("Contractor Name"; Rec."Contractor Name")
            {
                ApplicationArea = Basic;
                Visible = false;
                editable = false;
                ToolTip = 'Specifies the value of the Contractor Name field.';
            }
            field("Vendor Bank Account No."; Rec."Vendor Bank Account No.")
            {
                Caption = 'Contractor Bank Account';
                Visible = false;
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contractor Bank Account field.';
            }
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Description 2 field.';
            }
            field("Description 3"; Rec."Description 3")
            {
                ApplicationArea = Basic;
                caption = 'Project Description 2';
                Visible = true;
                ToolTip = 'Specifies the value of the Project Description 2 field.';
            }
        }

        addafter("Bill-to Name")
        {


            field("Road Class ID"; Rec."Road Class ID")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Class ID field.';
            }
            field("Year Code"; Rec."Year Code")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Year Code field.';
            }

            field("Type of Project"; Rec."Type of Project")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Type of Project field.';
            }
            field("Road Code"; Rec."Road Code")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Code field.';
            }

            field("Road Length(KM)"; Rec."Road Length(KM)")
            {
                ApplicationArea = Basic;
                Caption = 'Road Length(KM)';
                Visible = false;
                ToolTip = 'Specifies the value of the Road Length(KM) field.';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Region Code';
                ToolTip = 'Specifies the value of the Region Code field.';
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Funding Source';
                ToolTip = 'Specifies the value of the Funding Source field.';
            }
            field("Assignment Area ID"; Rec."Assignment Area ID")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Assignment Area ID field.';
            }
            field("Assignment Area Name"; Rec."Assignment Area Name")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Assignment Area Name field.';
            }
            field("Constituency ID"; Rec."Constituency ID")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Constituency ID field.';
            }
            field("Road Section No"; Rec."Road Section No")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Section No field.';
            }
            field("Purchase Contract ID"; Rec."Purchase Contract ID")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Purchase Contract ID field.';
            }

            field("Road Project Catergory"; Rec."Road Project Catergory")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Project Catergory field.';
            }

        }
        addafter("Project Manager")
        {
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Directorate Code field.';
            }
            field("Department ID"; Rec."Department ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Department ID field.';
            }
            field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the value of the Work Execution Plan ID field.';
            }
            field("Total Project Cost Excl. VAT"; Rec."Total Project Cost Excl. VAT")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total Project Cost Excl. VAT field.';
            }
            field("Contingency Amount"; Rec."Contingency Amount")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Contingency Amount field.';
            }
            field("Variation of Price Amount"; Rec."Variation of Price Amount")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Variation of Price Amount field.';
            }
            field("Total Project Cost Incl. VAT"; Rec."Total Project Cost Incl. VAT")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Total Project Cost Incl. VAT field.';
            }
            field("Project Location ID"; Rec."Project Location ID")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the value of the Project Location ID field.';
            }
            field("Total Contract Sum Inc VAT"; Rec."Total Contract Sum Inc VAT")
            {
                ApplicationArea = All;
                Visible = false;
                ToolTip = 'Specifies the value of the Total Contract Sum Inc VAT field.';
            }
            field("Last Variation Request No."; Rec."Last Variation Request No.")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Last Variation Request No. field.';
            }
            field("% Physical Progress"; Rec."% Physical Progress")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the % Physical Progress field.';
            }
            field("KM of Tarmac Completed"; Rec."KM of Tarmac Completed")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the KM of Tarmac Completed field.';
            }
            field("Total KM Designed"; Rec."Total KM Designed")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Total KM Designed field.';
            }
            field("Workplanned Length"; Rec."Workplanned Length")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Workplanned Length field.';
            }

            field("No of Structures(Planned)"; Rec."No of Structures(Planned)")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the No of Structures(Planned) field.';
            }
            field("No of Structures Completed"; Rec."No of Structures Completed")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the No of Structures Completed field.';
            }
            field("Total No of Men Employed"; Rec."Total No of Men Employed")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Total No of Men Employed field.';
            }
            field("Total No of Women Employed"; Rec."Total No of Women Employed")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Total No of Women Employed field.';
            }
            field("Total Men Mandays"; Rec."Total Men Mandays")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Total Men Mandays field.';
            }
            field("Total Women Mandays"; Rec."Total Women Mandays")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Total Women Mandays field.';
            }
        }
        addafter("Bill-to Address 2")
        {
            group(Control144)
            {

            }
        }
        addafter("Last Date Modified")
        {
            field("Opportunity Reference"; Rec."Opportunity Reference")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Opportunity Reference field.';
            }
            field("Fund Opportunity Name"; Rec."Fund Opportunity Name")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the value of the Fund Opportunity Name field.';
            }
            field("Grant Amount"; Rec."Grant Amount")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the value of the Grant Amount field.';
            }
            field(exchequer; Rec.exchequer)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the exchequer field.';
            }
            group("Project Details")
            {
                Visible = false;
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                    Caption = 'Road';
                    ToolTip = 'Specifies the value of the Road field.';
                }
                field("Research Project Area"; Rec."Research Project Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Project Area field.';
                }
                field("Researcher Code"; Rec."Researcher Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Researcher Code field.';
                }
            }
        }
        addafter("Last Date Modified")
        {
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = basic;
                editable = false;
                ToolTip = 'Specifies the value of the Created By field.';
            }
        }
        addafter(JobTaskLines)
        {
            part(Control75; "Project Monthly Progress List")
            {
                SubPageLink = "Job No" = field("No.");
                Visible = false;
                ApplicationArea = All;
            }
            // part("Other Related Project s";"Job List")
            // {
            //     Caption = 'Other Related Projects';
            //     SubPageLink = "Type of Proje = t"=filter("Survey/Stu | y"|"Structure Construction");
            // }
            group("Virtual Reality")
            {
                Caption = 'Virtual Reality';
                Visible = false;
                field("Virtual Reality Link"; Rec."VR Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Virtual Reality Link';
                    ToolTip = 'Specifies the value of the Virtual Reality Link field.';
                }
            }
        }
        addafter(Status)
        {
            field("Reasons for Suspension"; Rec."Reasons for Suspension")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Reasons for Suspension field.';
            }
        }
        addfirst(Duration)
        {
            field("Commencement Date"; Rec."Commencement Date")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Commencement Date field.';
            }
        }
        addafter("Ending Date")
        {
            field("Revised End Date"; Rec."Revised End Date")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Revised End Date field.';
            }
        }
        moveafter("Bill-to Name"; "Project Manager")
    }
    actions
    {
        modify("Copy Job Tasks &to...")
        {
            Caption = 'Copy Project Activities &to...';

            //Unsupported feature: Property Modification (Name) on ""Copy Job Tasks &to..."(Action 27)".

        }
        addafter("&Dimensions")
        {
            action("Contract Details")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ContractPayment;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Contract List";
                RunPageLink = Job = field("No."),
                              "Contract Status" = filter(" ");
                ToolTip = 'Executes the Contract Details action.';
            }
            action("Generate Payment Certificate")
            {
                ApplicationArea = Basic;
                Image = CalculateConsumption;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Report "Customer - List";
                Visible = false;
                ToolTip = 'Executes the Generate Payment Certificate action.';
            }
            action("Internal Project Resources")
            {
                ApplicationArea = Basic;
                Image = Resource;
                Visible = false;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Internal Project Resources";
                RunPageLink = "Project ID" = field("No.");
                ToolTip = 'Executes the Internal Project Resources action.';
                //  Visible = false;
            }
            action("Project Funding Sources")
            {
                ApplicationArea = Basic;
                Image = MapSetup;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Funding Source List";
                ToolTip = 'Executes the Project Funding Sources action.';
            }
            action("Project Road Links")
            {
                ApplicationArea = Basic;
                Caption = 'Project Road Links';
                Visible = false;
                Image = LiFo;
                Promoted = true;
                RunObject = Page "Project Road Links";
                RunPageLink = "Global Budget Book Code" = field("No."),
                              "KeRRA Budget Code" = field("KeRRA Budget Code");
                ToolTip = 'Project Road Links';
            }
            action("Project Road Facilities")
            {
                ApplicationArea = Basic;
                Caption = 'Project Road Facilities';
                Visible = false;
                Image = Components;
                Promoted = true;
                RunObject = Page "Project Road Facility Items";
                RunPageLink = "Global Budget Book Code" = field("No."),
                              "KeRRA Budget Code" = field("KeRRA Budget Code");
                ToolTip = 'Project Road Facilities';
            }
            action("Initate Procurement Process")
            {
                ApplicationArea = Basic;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Funding Source List";
                ToolTip = 'Executes the Initate Procurement Process action.';
            }
            action("Project Funding Line")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                Visible = false;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Funding Line";
                RunPageLink = "Project No" = field("No.");
                ToolTip = 'Executes the Project Funding Line action.';
            }
            action("Approval User SetUp")
            {
                ApplicationArea = Jobs;
                Caption = 'Approval User SetUp';
                Visible = false;
                Image = Default;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedOnly = true;
                RunObject = Page "Project Approval Setup Matrice";
                RunPageLink = "Project ID" = field("No.");
                RunPageMode = View;
                ToolTip = 'View the job''s resource group allocation.';
            }
            action("Suggest Def  Project Approvers")
            {
                ApplicationArea = All;
                ToolTip = 'Executes the Suggest Def  Project Approvers action.';
                // ApplicationArea = Jobs;
                // Caption = 'Suggest Default  Project Approvers';
                // Image = Suggest;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedOnly = true;
                // RunPageMode = View;
                // ToolTip = 'View the job''s resource group allocation.';
                // Visible = false;

                // trigger OnAction()
                // begin
                //     ProjectTemplateHeader.Reset;
                //     ProjectTemplateHeader.SetRange(ProjectTemplateHeader."Project Typ e","Type of Project");
                //     ProjectTemplateHeader.SetRange(ProjectTemplateHeader."Assignment Area I D","Assignment Area ID");
                //     if ProjectTemplateHeader.FindSet then begin
                //         ProjectTemplateHeader.TestField("Assignment Area ID");
                //         "Assignment Area  := ":=ProjectTemplateHeader."Assignment Area ID";
                //         Validate("Assignment Area ID");
                //         ProjectTemplateLineSub.Reset;
                //         ProjectTemplateLineSub.SetRange(ProjectTemplateLineSub."Template I D",ProjectTemplateHeader."Template ID");
                //         if ProjectTemplateLineSub.FindSet then
                //          repeat
                //           ProjectApprovalSetupMatrix.Init;
                //                 ProjectApprovalSetupMatrix."Project  := "No.";
                //           ProjectApprovalSetupMatrix."Line N := ":=ProjectApprovalSetupMatrix.Co + 1;
                //           ProjectApprovalSetupMatrix."Document Ty := ":=ProjectTemplateLineSub."Document Type";
                //                 ProjectApprovalSetupMatrix."Assignment Area  := ":=ProjectTemplateHeader."Assignment Area ID";
                //                 ProjectApprovalSetupMatrix."Sequence N := ":=ProjectTemplateLineSub."Sequence No.";
                //                 ProjectApprovalSetupMatrix."Project Role Co := ":=ProjectTemplateLineSub."Project Role Code";
                //                 ProjectApprovalSetupMatrix."Approver  := ":=ProjectTemplateLineSub."Approver ID";
                //                 ProjectApprovalSetupMatrix.Validate("Approver ID");
                //                 if not ProjectApprovalSetupMatrix.Insert(true) then
                //                     ProjectApprovalSetupMatrix.Modify(true);
                //             until ProjectTemplateLineSub.N = 0;
                //       end;
                // end;
            }
        }
        addafter("&Statistics")
        {
            action(EOTs)
            {
                ApplicationArea = Basic;
                Image = BOMLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Extension of Time Request"));
                ToolTip = 'Executes the EOTs action.';
            }
            action("Contractor Variation Requests")
            {
                ApplicationArea = Basic;
                Image = BreakpointsList;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                PromotedIsBig = true;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Contractor Variation Request"));
                ToolTip = 'Executes the Contractor Variation Requests action.';
            }
            action("Cost Claims")
            {
                ApplicationArea = Basic;
                Image = ActivateDiscounts;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Cost Claim"));
                ToolTip = 'Executes the Cost Claims action.';
            }
            action("Engineer's Variation Requests")
            {
                ApplicationArea = Basic;
                Image = CancelAttachment;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Engineer Variation Request"));
                ToolTip = 'Executes the Engineer''s Variation Requests action.';
            }
            action("Other Related Projects")
            {
                ApplicationArea = Basic;
                Image = Relationship;
                Promoted = true;
                Visible = false;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Other Related Projects";
                ToolTip = 'Executes the Other Related Projects action.';
            }
        }
        addafter("&Online Map")
        {
            action("Import Job Task(s)")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ImportChartOfAccounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Job Tasks";
                ToolTip = 'Executes the Import Job Task(s) action.';
            }
            action("Import Job Planning Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ImportChartOfAccounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Job Planning Lines";
                ToolTip = 'Executes the Import Job Planning Lines action.';
            }
        }
        addafter(Attachments)
        {
            action("Meeting Register")
            {
                ApplicationArea = Jobs;
                Caption = 'Meeting Register';
                Image = ViewJob;
                Visible = false;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                RunObject = Page "Project Meeting Registers";
                RunPageLink = "Project ID" = field("No.");
                RunPageMode = View;
                ToolTip = 'View the job''s resource group allocation.';
            }
        }
        addafter(History)
        {
            group("Task Lines")
            {
                action("Populate Task Lines")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Populate Task Lines action.';

                    trigger OnAction()
                    begin
                        ProjectTemplates.Reset;
                        ProjectTemplates.SetRange(Blocked, false);
                        ProjectTemplates.SetFilter("Project  Task No.", '<>%1', '');
                        if ProjectTemplates.Find('-') then begin
                            repeat
                                JobTaskLines.Reset;
                                JobTaskLines.SetRange("Job No.", Rec."No.");
                                JobTaskLines.SetRange("Job Task No.", ProjectTemplates."Project  Task No.");
                                if not JobTaskLines.FindSet then begin

                                    JobTaskLines.Init;
                                    JobTaskLines."Job No." := Rec."No.";
                                    JobTaskLines."Job Task No." := ProjectTemplates."Project  Task No.";
                                    JobTaskLines.Description := ProjectTemplates."Project Description";
                                    JobTaskLines.Insert(true);
                                end;
                            until ProjectTemplates.Next = 0;
                        end;
                        Message('Job Task Lines loaded successfully');
                    end;
                }
            }
        }
        addafter("Send Job Quote")
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations & Photos';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Documentations & Photos action.';

                trigger OnAction()
                begin
                    //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
                    //  DMSManagement.UploadRoadLinkDocuments("No. 'Project Number', RecordId, d,"Region ID");
                end;
            }
        }

    }

    var
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;

    var
        JobTaskLines: Record "Job Task";
        ProjectTemplates: Record "Project Templates";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        RoadManagementSetup: Record "Road Management Setup";
        ProjectTemplateLine: Record "Project Template Line";
        ProjectTemplateHeader: Record "Project Template Header";
        ProjectApprovalSetup: Record "Project Approval Setup";
        //ProjectTemplateLineSub: Record UnknownRecord72377;
        ProjectApprovalSetupMatrix: Record "Project Approval Setup Matrix";


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetNoFieldVisible;
    IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //Ushindi
    CALCFIELDS("Project Budget","Actual Project Costs","PO Commitments","PRN Commitments","Store Requisition Commitments","Imprest Application Commitment");
    TotalBudgetCommitments:="PO Commitments"+"PRN Commitments"+"Store Requisition Commitments"+"Imprest Application Commitment";
    AvailableFunds:="Project Budget"-"Actual Project Costs"-TotalBudgetCommitments;
    //Ushindi

    SetNoFieldVisible;
    IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
    */
    //end;
}



