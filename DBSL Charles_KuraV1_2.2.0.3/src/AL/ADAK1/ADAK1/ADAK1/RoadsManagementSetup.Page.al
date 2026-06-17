//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72028 "Roads Management Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = 72102;
    UsageCategory = Administration;
    Caption = 'Contracts Management Setup';
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Visible = false;
                field("Current Road Authority Code"; Rec."Current Road Authority Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Road Authority Code field.';
                }
            }
            group("No. Series")
            {
                field("Primary Legislation ID"; Rec."Primary Legislation ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Legislation ID field.';
                }
                field("RICS Existing Link No"; Rec."RICS Existing Link No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS Existing Link No field.';
                    Visible = false;
                }
                field("RICS New Link No"; Rec."RICS New Link No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS New Link No field.';
                    Visible = false;
                }
                field("Road Work Plan Nos(Maintenanc)"; Rec."Road Work Plan Nos(Maintenanc)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Plan Nos(Maintenanc) field.';
                    Visible = false;
                }
                field("Staff Appointment Voucher Nos"; Rec."Staff Appointment Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Appointment Voucher Nos field.';
                    Visible = false;
                }
                field("Measurement Sheet Nos"; Rec."Measurement Sheet Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Measurement Sheet Nos field.';
                    Visible = false;
                }
                field("Inspection Nos"; Rec."Inspection Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Nos field.';
                }
                field("Payment Certificate Nos"; Rec."Payment Certificate Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Certificate Nos field.';
                }
                field("Commencement Order Nos"; Rec."Commencement Order Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order Nos field.';
                }
                field("Work Execution Plan  Nos"; Rec."Work Execution Plan  Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan  Nos field.';
                }
                field("Notice Of Completed Works Nos"; Rec."Notice Of Completed Works Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Of Completed Works Nos field.';
                }
                field("Contractor Payment Request Nos"; Rec."Contractor Payment Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Payment Request Nos field.';
                }
                field("Road Budget  Nos(Maintenance)"; Rec."Road Budget  Nos(Maintenance)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Budget  Nos(Maintenance) field.';
                    Visible = false;
                }
                field("Road Budget  Nos(Development)"; Rec."Road Budget  Nos(Development)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Budget  Nos(Development) field.';
                    Visible = false;
                }
                field("Road Work Plan Nos(Constructi)"; Rec."Road Work Plan Nos(Constructi)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Plan Nos(Constructi) field.';
                    Visible = false;
                }
                field("Road Budget Nos(Study/Survey)"; Rec."Road Budget Nos(Study/Survey)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Budget Nos(Study/Survey) field.';
                    Visible = false;
                }
                field("Bill-To Customer No"; Rec."Bill-To Customer No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-To Customer No field.';
                }
                field("RICS Project Based Nos"; Rec."RICS Project Based Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS Project Based Nos field.';
                    Visible = false;
                }
                field("Facility Nos(Structure)"; Rec."Facility Nos(Structure)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Nos(Structure) field.';
                }
                field("Facility Nos(Furniture)"; Rec."Facility Nos(Furniture)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Nos(Furniture) field.';
                }
                field("Multi Year Projects No"; Rec."Multi Year Projects No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Multi Year Projects No field.';
                }
                field("Road Environs Nos"; Rec."Road Environs Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Environs Nos field.';
                    Visible = false;
                }
                field("Road Reserve Nos"; Rec."Road Reserve Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Reserve Nos field.';
                    Visible = false;
                }
                field("Project Checklist Nos"; Rec."Project Checklist Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Checklist Nos field.';
                }
                field("Meeting Register Nos"; Rec."Meeting Register Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Register Nos field.';
                }
                field("Material Test Template Nos"; Rec."Material Test Template Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Test Template Nos field.';
                }
                field("Project Photo Record Nos"; Rec."Project Photo Record Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Photo Record Nos field.';
                }
                field("Daily Work Record Nos"; Rec."Daily Work Record Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Work Record Nos field.';
                }
                field("Material Test Record Nos"; Rec."Material Test Record Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Test Record Nos field.';
                }
                field("EOT Request Nos"; Rec."EOT Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EOT Request Nos field.';
                }
                field("Contractor Variation Req Nos"; Rec."Contractor Variation Req Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Variation Req Nos field.';
                }
                field("Project Variation Order Nos"; Rec."Project Variation Order Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Variation Order Nos field.';
                }
                field("Budget Reallocation Nos"; Rec."Budget Reallocation Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Reallocation Nos field.';
                }
                field("New Job Vouche Nos"; Rec."New Job Vouche Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Job Vouche Nos field.';
                }
                field("Quality Management Plan Nos"; Rec."Quality Management Plan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quality Management Plan Nos field.';
                }
                field("Vehicle Temp SuperV Nos"; Rec."Vehicle Temp SuperV Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supervision Requirements Nos';
                    ToolTip = 'Specifies the value of the Supervision Requirements Nos field.';
                }
                field("Corrective Order Nos"; Rec."Corrective Order Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrective Order Nos field.';
                }
                field("Quality Inspection Nos"; Rec."Quality Inspection Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quality Inspection Nos field.';
                }
                field("Corrective Order Response Nos"; Rec."Corrective Order Response Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrective Order Response Nos field.';
                }
                field("Request for Close-Out Nos"; Rec."Request for Close-Out Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request for Close-Out Nos field.';
                }
                field("TakeOver Inspection Nos"; Rec."TakeOver Inspection Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TakeOver Inspection Nos field.';
                }
                field("Request for Post DLP Nos"; Rec."Request for Post DLP Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request for Post DLP Nos field.';
                }
                field("Post DLP Inspection Nos"; Rec."Post DLP Inspection Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post DLP Inspection Nos field.';
                }
                field("Subcontractor Nos"; Rec."Subcontractor Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subcontractor Nos field.';
                }
                field("Engineer Variation Request Nos"; Rec."Engineer Variation Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Variation Request Nos field.';
                }
                field("Project Material Template Nos"; Rec."Project Material Template Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Material Template Nos field.';
                }
                field("Final Account Nos"; Rec."Final Account Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Account Nos field.';
                }
                field("Moblization Checklist Nos"; Rec."Moblization Checklist Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Moblization Checklist Nos field.';
                }
                field("Mobllization Checklist Status"; Rec."Mobllization Checklist Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobllization Checklist Status field.';
                }
                field("Insurance Of Works Nos"; Rec."Insurance Of Works Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Of Works Nos field.';
                }
                field("Advance Guarantee Nos"; Rec."Advance Guarantee Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Guarantee Nos field.';
                }
                field("Communication Plan Nos"; Rec."Communication Plan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Plan Nos field.';
                }
                field("Meeting In Attendance Nos"; Rec."Meeting In Attendance Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting In Attendance Nos field.';
                }
                field("Daily WorkPlan Nos"; Rec."Daily WorkPlan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily WorkPlan Nos field.';
                }
                field("Weekly Workplan Nos"; Rec."Weekly Workplan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weekly Workplan Nos field.';
                }
                field("Monthly Workplan Nos"; Rec."Monthly Workplan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Workplan Nos field.';
                }
                field("Daily Test Request Nos"; Rec."Daily Test Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Test Request Nos field.';
                }
                field("Weekly Test Request Nos"; Rec."Weekly Test Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weekly Test Request Nos field.';
                }
                field("Monthly Test Request Nos"; Rec."Monthly Test Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Test Request Nos field.';
                }
                field("Default Subcontracting Templat"; Rec."Default Subcontracting Templat")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Subcontracting Template field.';
                }
                field("Meeting In Attendance Nos."; Rec."Meeting In Attendance Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting In Attendance Nos. field.';
                }
                field("KeRRA Road Code Nos"; Rec."KeRRA Road Code Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'ADAK Road Code Nos';
                    ToolTip = 'Specifies the value of the ADAK Road Code Nos field.';
                    Visible = false;
                }
                field("Project Evaluation Report Nos"; Rec."Project Evaluation Report Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Evaluation Report Nos field.';
                }
                field("Project Opinion Nos"; Rec."Project Opinion Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Professional Opinion Nos';
                    ToolTip = 'Specifies the value of the Project Professional Opinion Nos field.';
                }
                field("Performance Guarantee Nos"; Rec."Performance Guarantee Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Guarantee Nos field.';
                }
                field("Survey Quality Checks Nos"; Rec."Survey Quality Checks Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Quality Checks Nos field.';
                }
                field("RE Payment Schedule Nos"; Rec."RE Payment Schedule Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RE Payment Schedule Nos field.';
                }
                field("Contractor Staff Disengagement"; Rec."Contractor Staff Disengagement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Staff Disengagement field.';
                }
                field("Site Instructions Nos"; Rec."Site Instructions Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Site Instructions Nos field.';
                }
                field("Project Transition Nos"; Rec."Project Transition Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Transition Nos field.';
                }
                field("Cost Claim Nos"; Rec."Cost Claim Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Claim Nos field.';
                }
                field("Pavement Test Nos"; Rec."Pavement Test Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Test Nos field.';
                }
                field("PC Targets&Output Nos"; Rec."PC Targets&Output Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PC Targets&Output Nos field.';
                }
                field("Workplan Nos(Studies/Surveys)"; Rec."Workplan Nos(Studies/Surveys)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Nos(Studies/Surveys) field.';
                }
                field("Road Camps Nos"; Rec."Road Camps Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Camps Nos field.';
                    Visible = false;
                }
                field("Professional Indemnity Nos"; Rec."Professional Indemnity Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Indemnity Nos field.';
                }
                field("Survey Request Nos"; Rec."Survey Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Request Nos field.';
                }
                field("Report Submission Nos"; Rec."Report Submission Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Report Submission Nos field.';
                }
                field("Fee Note Nos"; Rec."Fee Note Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fee Note Nos field.';
                }
                field("Project Approval Template Nos"; Rec."Project Approval Template Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Approval Template Nos field.';
                }
                field("Material Test Certificate Nos"; Rec."Material Test Certificate Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Test Certificate Nos field.';
                }
                field("Site Agent Appointment Nos"; Rec."Site Agent Appointment Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Site Agent Appointment Nos field.';
                }
                field("Contractor Personnel App Nos"; Rec."Contractor Personnel App Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Personnel App Nos field.';
                }
                field("Contractor Equipment Reg Nos"; Rec."Contractor Equipment Reg Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Equipment Reg Nos field.';
                }
                field("RAM Workplan Nos(Regional)"; Rec."RAM Workplan Nos(Regional)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RAM Workplan Nos(Regional) field.';
                    Visible = false;
                }
                field("RAM Workplan Nos(Towns)"; Rec."RAM Workplan Nos(Towns)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RAM Workplan Nos(Towns) field.';
                    Visible = false;
                }

                field("RAM Workplan Nos(Consolidated)"; Rec."RAM Workplan Nos(Consolidated)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RAM Workplan Nos(Consolidated) field.';
                }
            }
            group("Default Templates")
            {
                Caption = 'Default Templates';
                field("Default Dimension 3"; Rec."Default Dimension 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Department Code field.';
                }
                field("Default Dimension 5"; Rec."Default Dimension 5")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Default Town Code field.';
                }
                field("Default Dimension 4"; Rec."Default Dimension 4")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Default Project Code field.';
                }
                field("Deafult Checklist Template No"; Rec."Deafult Checklist Template No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Default Checklist Template No';
                    ToolTip = 'Specifies the value of the Default Checklist Template No field.';
                }
                field("Workplan Recall Expiry Period"; Rec."Workplan Recall Expiry Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Recall Expiry Period field.';
                }
                field("Gen. Prod Posting Group"; Rec."Gen. Prod Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Product Posting Group field.';
                }
                field("Financier's Posting Group"; Rec."Financier's Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financier''s Posting Group field.';
                }
            }
            group("Notifications Setup")
            {
                Caption = 'Notifications Setup';
                field("PCO Notification Enabled"; Rec."PCO Notification Enabled")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Order to Commence Notification?';
                    ToolTip = 'Specifies the value of the Send Order to Commence Notification? field.';
                }
                field("Send Site Instruction Not"; Rec."Send Site Instruction Not")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Site Instruction Notification field.';
                }
                field("Contractor Variation Notify"; Rec."Contractor Variation Notify")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Variation Notify field.';
                }
                field("e-Notify Project Staff Termina"; Rec."e-Notify Project Staff Termina")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the e-Notify Project Staff Termina field.';
                }
                field("Use Default Project Template"; Rec."Use Default Project Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Use Default Project Template field.';
                }
                field("Order to Commence(RoadWorks)"; Rec."Order to Commence(RoadWorks)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify Order to Commence(RoadWorks)';
                    ToolTip = 'Specifies the value of the Notify Order to Commence(RoadWorks) field.';
                }
                field("Order to Commence(Consultancy)"; Rec."Order to Commence(Consultancy)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify Order to Commence(Consultancy)';
                    ToolTip = 'Specifies the value of the Notify Order to Commence(Consultancy) field.';
                }
                field("RAM Directorate Office Email"; Rec."RAM Directorate Office Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RAM Directorate Office Email field.';
                }

            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup26)
            {
                action("Core Mandate Legislations")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOrder;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Core Mandate Legislations";
                    ToolTip = 'Executes the Core Mandate Legislations action.';
                }
                action(Constituencies)
                {
                    ApplicationArea = Basic;
                    Image = CoupledOpportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page Constituencies;
                    ToolTip = 'Executes the Constituencies action.';
                }
                action(Counties)
                {
                    ApplicationArea = Basic;
                    Image = CountryRegion;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page Counties;
                    ToolTip = 'Executes the Counties action.';
                }
                action("Regional Offices")
                {
                    ApplicationArea = Basic;
                    Image = CountryRegion;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Regions List";
                    ToolTip = 'Executes the Regional Offices action.';
                    Visible = false;
                }
                action("Road Authorities")
                {
                    ApplicationArea = Basic;
                    Image = CompanyInformation;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Authorities";
                    ToolTip = 'Executes the Road Authorities action.';
                    Visible = false;
                }
                action("Road Classes")
                {
                    ApplicationArea = Basic;
                    Image = AddContacts;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Classes";
                    ToolTip = 'Executes the Road Classes action.';
                    Visible = false;
                }
                action("Pavement Surface Types")
                {
                    ApplicationArea = Basic;
                    Image = Trendscape;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Pavement Surface Types";
                    ToolTip = 'Executes the Pavement Surface Types action.';
                }
                action("Road Facility Type")
                {
                    ApplicationArea = Basic;
                    Image = Flow;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Facility Item";
                    ToolTip = 'Executes the Road Facility Type action.';
                    Visible = false;
                }
                action("Road Environ Categories")
                {
                    ApplicationArea = Basic;
                    Image = Category;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Environ Categories";
                    ToolTip = 'Executes the Road Environ Categories action.';
                    Visible = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

#pragma implicitwith restore

