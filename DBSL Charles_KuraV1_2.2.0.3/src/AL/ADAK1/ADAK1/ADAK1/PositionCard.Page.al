#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69601 "Position Card"
{
    PageType = Card;
    SourceTable = "Company Positions";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hierarchically (Directly) Reports To field.';
                }
                field("Directly Reports des"; Rec."Directly Reports des")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directly Reports des field.';
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functionally (Indirectly) Reports To field.';
                }
                field("Executive Summary/Job Purpose"; Rec."Executive Summary/Job Purpose")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary/Job Purpose field.';
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation Group field.';
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Appointment Authority field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Default Terms of Service"; Rec."Default Terms of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Terms of Service field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Chief Executive Officer';
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Chief Executive Officer field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Caption = 'Divison/Unit';
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Divison/Unit field.';
                }
                field("Approved Establishment"; Rec."Approved Establishment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Establishment field.', Comment = '%';
                }
                field("Minimum Academic Qualification"; Rec."Minimum Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Academic Qualification field.';
                }
                field("Academic Hierarchy Code"; Rec."Academic Hierarchy Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Academic Hierarchy Code field.';
                }
                field("Minimum Work Experience"; Rec."Minimum Work Experience")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Minimum Work Experience field.';
                }
                field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Minimum Management Experience field.';
                }
                field("Default Duty Station"; Rec."Default Duty Station")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Default Duty Station field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Direct Hire Unit Cost"; Rec."Direct Hire Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Hire Unit Cost field.';
                }
                field("Average Monthly Salary (LCY)"; Rec."Average Monthly Salary (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Average Monthly Salary (LCY) field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control50; "Position Responsibilities")
            {
                SubPageLink = "Position ID" = field("Position ID"),
                              Type = const(Responsibility);
            }
            part(Control46; "Position Responsibilities")
            {
                Caption = 'Job Dimensions';
                SubPageLink = "Position ID" = field("Position ID"),
                              Type = const("Job Dimensions");
                Visible = false;
            }
            part(Control45; "General Work Conditions")
            {
                SubPageLink = "Position ID" = field("Position ID");
            }
            group("Special Work Conditions")
            {
                field("Travel Frequency"; Rec."Travel Frequency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Travel Frequency field.';
                }
                field("Default Work Shift"; Rec."Default Work Shift")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Work Shift field.';
                }
                field("Work Shift Description"; Rec."Work Shift Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Shift Description field.';
                }
                field("Additional Responsibilities"; Rec."Additional Responsibilities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Responsibilities may be added field.';
                }
                field("Loc Relocation/Transfers"; Rec."Loc Relocation/Transfers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Local Relocation/Transfers Apply field.';
                }
                field("Int Relocation/Transfers"; Rec."Int Relocation/Transfers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the International Relocation/Transfers Apply field.';
                }
                field("Qualifies for Overtime"; Rec."Qualifies for Overtime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualifies for Overtime field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control21; "Position Factbox")
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Academic Qualifications")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Academic Qualifications";
                RunPageLink = "Position ID" = field("Position ID");
                ToolTip = 'Executes the Academic Qualifications action.';
            }
            action("Professional Qualifications")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Professional Qualificationss";
                RunPageLink = "Position ID" = field("Position ID");
                ToolTip = 'Executes the Professional Qualifications action.';
            }
            action("Skills & Competencies")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Skills & Competencies";
                RunPageLink = "Position ID" = field("Position ID");
                ToolTip = 'Executes the Skills & Competencies action.';
            }
            action(Experience)
            {
                ApplicationArea = Basic;
                Image = UserCertificate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page Experience;
                RunPageLink = "Position ID" = field("Position ID");
                ToolTip = 'Executes the Experience action.';
            }
            action("Ethics & Integrity")
            {
                ApplicationArea = Basic;
                Image = InteractionLog;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Ethics & Integrity";
                RunPageLink = "Position ID" = field("Position ID");
                ToolTip = 'Executes the Ethics & Integrity action.';
            }
            action("Physical Attributes")
            {
                ApplicationArea = Basic;
                Image = PhysicalInventory;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Physical Attributes";
                RunPageLink = "Position ID" = field("Position ID");
                ToolTip = 'Executes the Physical Attributes action.';
            }
            action("Position Work Condition")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "General Work Conditions";
                RunPageLink = "Position ID" = field("Position ID");
                Visible = false;
                ToolTip = 'Executes the Position Work Condition action.';
            }
        }
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SetRange("Position ID", Rec."Position ID");
                    Report.Run(69602, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Image = Dimensions;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                // //PromotedIsBig = true;
                // RunObject = Page "Default Dimensions";
                //RunPageLink = "Table ID"=const(27),
                //              "No."=field("No. of Terminated Contracts");
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
            }
        }
    }
}

#pragma implicitwith restore

