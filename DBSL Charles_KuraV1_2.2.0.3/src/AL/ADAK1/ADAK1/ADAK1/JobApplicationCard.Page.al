#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69117 "Job Application Card"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Job Application Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group("Personal Details")
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = basic;
                    VISIBLE = FALSE;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field(Salutation; Rec.Salutation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salutation field.';
                }
                field("ID/Passport"; Rec."ID/Passport")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID/Passport field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin field.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applied For field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Communication Details")
            {
                field("Home Phone No."; Rec."Home Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Phone No. field.';
                }
                field("Work Phone No."; Rec."Work Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Phone No. field.';
                }
                field("Postal Code."; Rec."Postal Code.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Code. field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Residential Address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country Code field.';
                }
                field("Country Name"; Rec."Country Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country Name field.';
                }
            }
            group("Other Details")
            {
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Disability Grade"; Rec."Disability Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Grade field.';
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Description field.';
                }
                field("Driving Licence"; Rec."Driving Licence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driving Licence field.';
                }
                field(Convicted; Rec.Convicted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convicted field.';
                }
                field("Highest academic qualification"; Rec."Highest academic qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest academic qualification field.';
                }
                field("Current Job Position"; Rec."Current Job Position")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Job Position field.';
                }
                field("Current Duties and Responsibil"; Rec."Current Duties and Responsibil")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Duties and Responsibil field.';
                }
                field(Hobbies; Rec.Hobbies)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hobbies field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Application Details")
            {
                action("Education Background")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Education Background";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                    ToolTip = 'Executes the Education Background action.';
                }
                action("Professional Qualifications")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Professional Qualifications";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                    ToolTip = 'Executes the Professional Qualifications action.';
                }
                action("Trainings Attended")
                {
                    ApplicationArea = Basic;
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Trainings Attended";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                    ToolTip = 'Executes the Trainings Attended action.';
                }
                action("Professional Bodies")
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Professional Bodies";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                    ToolTip = 'Executes the Professional Bodies action.';
                }
                action("Applicant Accomplishments")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Applicant Accomplishments";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                    ToolTip = 'Executes the Applicant Accomplishments action.';
                }
                action(Referees)
                {
                    ApplicationArea = Basic;
                    Image = Users;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Applicant Referees";
                    RunPageLink = "Job Application No" = field("Application No");
                    ToolTip = 'Executes the Referees action.';
                }
                action("Employment History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Employment History";
                    RunPageLink = "Application No" = field("Application No");
                    ToolTip = 'Executes the Employment History action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

