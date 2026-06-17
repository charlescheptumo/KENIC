/// <summary>
/// Page All Job Applications (ID 50172).
/// </summary>
page 50172 "All Job Applications"
{
    ApplicationArea = All;
    Caption = 'All Job Applications';
    PageType = List;
    SourceTable = "Job Applications";
    UsageCategory = Lists;
    CardPageId = "Job Application";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Vacancy Id"; Rec."Vacancy Id")
                {
                    ToolTip = 'Specifies the value of the Vacancy Id field.', Comment = '%';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("Full Names"; Rec."Full Names")
                {
                    ToolTip = 'Specifies the value of the Initials field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ToolTip = 'Specifies the value of the Passport No. field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Application Status"; Rec."Application Status")
                {
                    ToolTip = 'Specifies the value of the Application Status field.', Comment = '%';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ToolTip = 'Specifies the value of the Birth Date field.', Comment = '%';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.', Comment = '%';
                }
                field("Work Experience (Years)"; Rec."Work Experience (Years)")
                {
                    ToolTip = 'Specifies the value of the Work Experience (Years) field.', Comment = '%';
                }
                field("Specialization Area"; Rec."Specialization Area")
                {
                    ToolTip = 'Specifies the value of the Specialization Area field.', Comment = '%';
                }
                field("Terms of Service Code"; Rec."Terms of Service Code")
                {
                    ToolTip = 'Specifies the value of the Terms of Service Code field.', Comment = '%';
                }
                field("Management Experience (Years)"; Rec."Management Experience (Years)")
                {
                    ToolTip = 'Specifies the value of the Management Experience (Years) field.', Comment = '%';
                }
            }
        }
    }
}
