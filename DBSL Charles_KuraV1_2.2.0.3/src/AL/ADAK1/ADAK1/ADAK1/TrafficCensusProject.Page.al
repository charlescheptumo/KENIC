// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72035 "Traffic Census Project"
{
    PageType = Card;
    SourceTable = Job;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request No field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Type of Project"; Rec."Type of Project")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Project field.';
                }
                field("Study/Survey Type"; Rec."Study/Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study/Survey Type field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
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
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Posting Group field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible Officer';
                    ToolTip = 'Specifies the value of the Responsible Officer field.';
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Contract Sum';
                    ToolTip = 'Specifies the value of the Total Contract Sum field.';
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Project Costs field.';
                }
                field("Workplanned Length"; Rec."Workplanned Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplanned Length field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contracting Vendor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("No. Of Project Imprest Memos"; Rec."No. Of Project Imprest Memos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Project Imprest Memos field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
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
                field("Total Project Cost Excl. VAT"; Rec."Total Project Cost Excl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Project Cost Excl. VAT field.';
                }
                field("Contingency Amount"; Rec."Contingency Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contingency Amount field.';
                }
                field("Variation of Price Amount"; Rec."Variation of Price Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variation of Price Amount field.';
                }
                field("Total Project Cost Incl. VAT"; Rec."Total Project Cost Incl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Project Cost Incl. VAT field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(JobTaskLines; "Job Task Lines Subform")
            {
                ApplicationArea = Jobs;
                Caption = 'Project Activities';
                SubPageLink = "Job No." = field("No.");
                SubPageView = sorting("Job Task No.")
                              order(ascending);
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Creation Date/Time"; Rec."Creation Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date/Time field.';
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award No. field.';
                }
                field("Project Location ID"; Rec."Project Location ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Location ID field.';
                }
                field("Award Date"; Rec."Award Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Date field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Road Project Catergory"; Rec."Road Project Catergory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Catergory field.';
                }
                field("Primary Works Category"; Rec."Primary Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Works Category field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field("Revised End Date"; Rec."Revised End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revised End Date field.';
                }
                field("External Contract Reference"; Rec."External Contract Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Contract Reference field.';
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bid No field.';
                }
                field("Staff Appmnt Voucher ID"; Rec."Staff Appmnt Voucher ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Appmnt Voucher ID field.';
                }
                field("Project Commencement Order"; Rec."Project Commencement Order")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Commencement Order field.';
                }
                field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan ID field.';
                }
                field("Global Budget Book ID"; Rec."Global Budget Book ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Budget Book ID field.';
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KeRRA Budget Code field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action(JobPlanningLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (Budget) or you can specify what you actually agreed with your customer that he should pay for the job (Billable).';

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        Rec.TestField("No.");
                        JobPlanningLine.FilterGroup(2);
                        JobPlanningLine.SetRange("Job No.", Rec."No.");
                        JobPlanningLine.FilterGroup(0);
                        JobPlanningLines.SetJobTaskNoVisible(true);
                        JobPlanningLines.SetTableview(JobPlanningLine);
                        JobPlanningLines.Editable := true;
                        JobPlanningLines.Run;
                    end;
                }
                action("&Dimensions")
                {
                    ApplicationArea = Dimensions;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    //  RunObject = Page "Default Dimensions";
                    // RunPageLink = "Table ID"=const(167),
                    //               "No."=field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to journal lines to distribute costs and analyze transaction history.';
                }
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
                    Image = LiFo;
                    Promoted = true;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "Global Budget Book Code" = field("No."),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Project Road Links';
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
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Funding Line";
                    RunPageLink = "Project No" = field("No.");
                    ToolTip = 'Executes the Project Funding Line action.';
                }
                action("&Statistics")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View this job''s statistics.';
                }
                separator(Action60)
                {
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Job),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action("&Online Map")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Online Map';
                    Image = Map;
                    ToolTip = 'View online map for addresses assigned to this job.';

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
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
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("Meeting Register")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Meeting Register';
                    Image = ViewJob;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    RunObject = Page "Project Meeting Registers";
                    RunPageLink = "Project ID" = field("No.");
                    RunPageMode = View;
                    ToolTip = 'View the job''s resource group allocation.';
                }
                action("Linked Road Works Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Study/Survey Road Projects";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Linked Road Works Projects action.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ledger E&ntries';
                    Image = JobLedger;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
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
                        // ProjectTemplates.RESET;
                        // ProjectTemplates.SETRANGE(Blocked,FALSE);
                        // ProjectTemplates.SETFILTER("Project  Task No.",'<>%1','');
                        // IF ProjectTemplates.FIND('-') THEN BEGIN
                        //  REPEAT
                        //    JobTaskLines.RESET;
                        //    JobTaskLines.SETRANGE("Job No.","No.");
                        //    JobTaskLines.SETRANGE("Job Task No.",ProjectTemplates."Project  Task No.");
                        //    IF NOT JobTaskLines.FINDSET THEN BEGIN
                        //
                        //        JobTaskLines.INIT;
                        //        JobTaskLines."Job No.":="No.";
                        //        JobTaskLines."Job Task No.":=ProjectTemplates."Project  Task No.";
                        //        JobTaskLines.Description:=ProjectTemplates."Project Description";
                        //        JobTaskLines.INSERT(TRUE);
                        //    END;
                        //  UNTIL ProjectTemplates.NEXT=0;
                        // END;
                        // MESSAGE('Job Task Lines loaded successfully');
                    end;
                }
            }
        }
        area(processing)
        {
            group("&Copy")
            {
                Caption = '&Copy';
                Image = Copy;
                action("Copy Job Tasks &from...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Job Tasks &from...';
                    Ellipsis = true;
                    Image = CopyToTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the Copy Job Tasks page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
                action("Copy Project Activities &to...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Project Activities &to...';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the Copy Jobs To page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Job Actual to Budget")
            {
                ApplicationArea = Suite;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Actual To Budget";
                ToolTip = 'Compare budgeted and usage amounts for selected jobs. All lines of the selected job show quantity, total cost, and line amount.';
            }
            action("Job Analysis")
            {
                ApplicationArea = Suite;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Analysis";
                ToolTip = 'Analyze the job, such as the budgeted prices, usage prices, and billable prices, and then compares the three sets of prices.';
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job - Planning Lines";
                ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Suggested Billing";
                ToolTip = 'View a list of all jobs, grouped by customer, how much the customer has already been invoiced, and how much remains to be invoiced, that is, the suggested billing.';
            }
            action("Report Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Preview Job Quote';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Open the Job Quote report.';

                trigger OnAction()
                var
                    Job: Record Job;
                begin
                    Job.SetCurrentkey("No.");
                    Job.SetFilter("No.", Rec."No.");
                    Report.Run(Report::"Job Quote", true, false, Job);
                end;
            }
            action("Send Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Send Job Quote';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Send the job quote to the customer. You can change the way that the document is sent in the window that appears.';

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Jobs-Send", Rec);
                end;
            }
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
                    DMSManagement.UploadRoadLinkDocuments(Rec."No.", 'Project Number', Rec.RecordId, Rec."Region ID");
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Study/Survey Type" := Rec."study/survey type"::"Traffic Census";
    end;

    var
        JobTaskLines: Record "Job Task";
        ProjectTemplates: Record "Project Templates";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}

