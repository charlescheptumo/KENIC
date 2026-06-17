#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72367 "Road WorkPlan Package Line"
{
    PageType = ListPart;
    SourceTable = "Road WorkPlan Package";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Program ID field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("KeRRA Budget Code"; Rec."KERRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'ADAK Budget Code';
                    ToolTip = 'Specifies the value of the ADAK Budget Code field.';
                }
                field("Budget Entry No"; Rec."Budget Entry No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Entry No';
                    ToolTip = 'Specifies the value of the Budget Entry No field.';
                }
                field("Package Name"; Rec."Package Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Has PBRM Component"; Rec."Has PBRM Component")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has PBRM Component field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Road Works Category"; Rec."Road Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Works Category field.';
                }
                field("Pavement Surface Type"; Rec."Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pavement Surface Type field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Works Type';
                    ToolTip = 'Specifies the value of the Works Type field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Workplanned Length (Km)"; Rec."Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplanned Length (Km) field.';
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Agency ID field.';
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Construction BoQTemplate Code';
                    ToolTip = 'Specifies the value of the Construction BoQTemplate Code field.';
                }
                field("PBRM BoQ Template Code"; Rec."PBRM BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PBRM BoQ Template Code field.';
                }
                field("Equipment Specs Template"; Rec."Equipment Specs Template")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Equipment Specs Template field.';
                }
                field("Personnel Specs Template"; Rec."Personnel Specs Template")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Personnel Specs Template field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Project Status"; Rec."Project Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Status field.';
                }
                field("Total Road Section Length"; Rec."Total Road Section Length")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Road Section Length field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default VAT Bus. Posting Group field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default VAT Prod. Posting Group field.';
                }
                field("Total Budget Cost"; Rec."Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Year Budget';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Year Budget field.';
                }
                field("Global Budget ID"; Rec."Global Budget ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Global Budget ID';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Budget ID field.';
                }
                field("Total Project Cost Exc. VAT"; Rec."Total Project Cost Exc. VAT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Project Cost Exc. VAT(KES)';
                    ToolTip = 'Specifies the value of the Total Project Cost Exc. VAT(KES) field.';
                }
                field("Total Project Cost Inc. VAT"; Rec."Total Project Cost Inc. VAT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Project Cost Inc. VAT(KES)';
                    ToolTip = 'Specifies the value of the Total Project Cost Inc. VAT(KES) field.';
                }
                field("Bid Sum 1"; Rec."Bid Sum 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 1 field.';
                }
                field("Bid Sum 2"; Rec."Bid Sum 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 2 field.';
                }
                field("Bid Sum 1 Contingency Rate"; Rec."Bid Sum 1 Contingency Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 1 Contingency Rate field.';
                }
                field("Bid Sum 1 VoP Rate"; Rec."Bid Sum 1 VoP Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 1 VoP Rate field.';
                }
                field("Bid Sum 2 Contingency Rate"; Rec."Bid Sum 2 Contingency Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 2 Contingency Rate field.';
                }
                field("Bid Sum 2 VoP Rate"; Rec."Bid Sum 2 VoP Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 2 VoP Rate field.';
                }
                field("Bid Sum 1 Contingency Amount"; Rec."Bid Sum 1 Contingency Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 1 Contingency Amount field.';
                }
                field("Bid Sum 2 Contingency Amount"; Rec."Bid Sum 2 Contingency Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 2 Contingency Amount field.';
                }
                field("Bid Sum 1 VoP Amount"; Rec."Bid Sum 1 VoP Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 1 VoP Amount field.';
                }
                field("Bid Sum 2 VoP Amount"; Rec."Bid Sum 2 VoP Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Sum 2 VoP Amount field.';
                }
                field("Total Bid Sum 1 Incl. VAT"; Rec."Total Bid Sum 1 Incl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Bid Sum 1 Incl. VAT field.';
                }
                field("Total Bid Sum 2 Incl. VAT"; Rec."Total Bid Sum 2 Incl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Bid Sum 2 Incl. VAT field.';
                }
                field("Total Contract Sum Incl. VAT"; Rec."Total Contract Sum Incl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Contract Sum Incl. VAT field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Project Details")
            {
                Caption = '&Project Details';
                action("Road Links")
                {
                    ApplicationArea = Basic;
                    Image = CreateJobSalesInvoice;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                  "Global Budget Book Code" = field("Road Work Program ID");
                    ToolTip = 'Executes the Road Links action.';
                }
                action("Road Facilities")
                {
                    ApplicationArea = Basic;
                    Image = Components;
                    RunObject = Page "Project Road Facility Items";
                    RunPageLink = "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                  "Global Budget Book Code" = field("Road Work Program ID");
                    ToolTip = 'Executes the Road Facilities action.';
                }
                action(Tasks)
                {
                    ApplicationArea = Basic;
                    Caption = 'BoQ';
                    Ellipsis = true;
                    Image = TaskList;
                    RunObject = Page "Work Plan Tasks";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Package No." = field("Project No");
                    ToolTip = 'Executes the BoQ action.';
                }
                action("Planning Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'BiIl Items';
                    Ellipsis = true;
                    Image = Planning;
                    RunObject = Page "WP Plan Lines";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Project No" = field("Project No"),
                                  "Budget Entry No" = field("Budget Entry No");
                    Visible = false;
                    ToolTip = 'Executes the BiIl Items action.';
                }
                action("Funding Sources")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "Project Funding Sources";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Funding Sources action.';
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Equipment Specifications";
                    RunPageLink = "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Equipment Specifications action.';

                }
                action("Required Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Required Past Experience";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Required Past Experience action.';

                }

                action("Required Financials")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Financials";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Required Financials action.';

                }
                action("Required Litigation")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Litigation";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Required Litigation action.';

                }
                action("Personnel Specification")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Staff Specifications";
                    RunPageLink = "Project No" = field("Project No"),
                                  "Line No" = field("Entry No");
                    ToolTip = 'Executes the Personnel Specification action.';
                }
                action("SPP Risk Register")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Risk Register";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the SPP Risk Register action.';
                }

                action("Attach Tender Instr.to Bidders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Attach Tender Instr.to Bidders action.';
                }
                action("Attach Project Special Specs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Attach Project Special Specs action.';
                }
                action("Attach Standard Specs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Attach Standard Specs action.';
                }
                action("Attach Contract Conditions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Attach Contract Conditions action.';
                }
                action("Attach Drawings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Attach Drawings action.';
                }
                action("Attach Tender Documents")
                {
                    ApplicationArea = Basic;
                    Image = TestReport;
                    RunObject = Page "WorkPlan Document Attachments";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Budget Entry No" = field("Budget Entry No"),
                                  "Project No" = field("Project No"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                  "Entry No" = field("Entry No");
                    ToolTip = 'Executes the Attach Tender Documents action.';

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadAIEAttchmentDocuments("Road Work Program ID",'Testing',RECORDID,'');
                        //DIALOG.MESSAGE('Attached');
                    end;
                }
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

