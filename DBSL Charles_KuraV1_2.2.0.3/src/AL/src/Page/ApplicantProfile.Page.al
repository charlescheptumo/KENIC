#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69329 "Applicant Profile"
{
    PageType = Card;
    SourceTable = "Applicant Profile";
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
                field("Applicant Type"; Rec."Applicant Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Type field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("National ID"; Rec."National ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the National ID field.';
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
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Social Security No. field.';
                }
                field("County of Birth"; Rec."County of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("P.I.N No"; Rec."P.I.N No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the P.I.N No field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Disability Certificate No"; Rec."Disability Certificate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Certificate No field.';
                }
                field("Disability Summary"; Rec."Disability Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Summary field.';
                }
                field("Residence County"; Rec."Residence County")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
            }
            group("Communication Details")
            {
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
            }
            systempart(Control34; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Applicant")
            {
                Caption = '&Applicant';
                Image = Customer;
                action("Academic History")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Academic History";
                    RunPageLink = "Applicant ID" = field("No.");
                    ToolTip = 'Executes the Academic History action.';
                }
                action("Professional Profile")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Professional Profile";
                    RunPageLink = "Applicant ID" = field("No.");
                    ToolTip = 'Executes the Professional Profile action.';
                }
                action("Applicant Achievements")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Applicant Accomplishment";
                    RunPageLink = "Applicant ID" = field("No.");
                    ToolTip = 'Executes the Applicant Achievements action.';
                }
                action("Applicant Hobbies")
                {
                    ApplicationArea = Basic;
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Applicant Hobbies";
                    RunPageLink = "Applicant ID" = field("No.");
                    ToolTip = 'Executes the Applicant Hobbies action.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                group("Issued Documents")
                {
                    Caption = 'Issued Documents';
                    Image = Documents;
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
            }
        }
        area(creation)
        {
        }
    }
}

