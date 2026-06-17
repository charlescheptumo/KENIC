#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69116 "Job Applications List"
{
    CardPageID = "Job Application Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Job Application Table";
    SourceTableView = where(Status = filter(New));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
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
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
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
                field("Ethnic Origin Description"; Rec."Ethnic Origin Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin Description field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
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
                field(Shortlisted; Rec.Shortlisted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortlisted field.';
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
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("Vacancy Requisition No."; Rec."Vacancy Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy Requisition No. field.';
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
                action("Employment History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Employment History";
                    RunPageLink = "Application No" = field("No. Series");
                    ToolTip = 'Executes the Employment History action.';
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
            }
            group(Shortlisting)
            {
                Caption = 'Shortlisting';
                action("Shortlist Based on Criteria")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Shortlist Based on Criteria action.';

                    trigger OnAction()
                    begin
                        BasedOnCriteria(Rec);
                    end;
                }
                action("Shortlist for Oral Interview")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Shortlist for Oral Interview action.';

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyApplicantsTable);
                        if VacancyApplicantsTable.FindSet then begin
                            repeat
                                Rec.Status := Rec.Status::Oral;
                                VacancyApplicantsTable.Modify(true);

                            until VacancyApplicantsTable.Next = 0;
                            Clear(VacancyApplicantsTable);
                        end;
                        Message('Applicants succesfully shortlitsed for Oral Interview');
                    end;
                }
                action("Shortlist for Written Interview")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Shortlist for Written Interview action.';

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyApplicantsTable);
                        if VacancyApplicantsTable.FindSet then begin
                            repeat
                                Rec.Status := Rec.Status::Written;
                                VacancyApplicantsTable.Modify(true);

                            until VacancyApplicantsTable.Next = 0;
                            Clear(VacancyApplicantsTable);
                        end;
                        Message('Applicants succesfully shortlitsed for Written Interview');
                    end;
                }
                action("Shortlist for Aptitude Test")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Shortlist for Aptitude Test action.';

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyApplicantsTable);
                        if VacancyApplicantsTable.FindSet then begin
                            repeat
                                Rec.Status := Rec.Status::Apptitude;
                                VacancyApplicantsTable.Modify(true);

                            until VacancyApplicantsTable.Next = 0;
                            Clear(VacancyApplicantsTable);
                        end;
                        Message('Applicants succesfully shortlitsed for Aptitude Test');
                    end;
                }
            }
        }
    }

    var
        VacancyApplicantsTable: Record "Job Application Table";
        TempVacancy: Record "Job Application Table";
        noFilter: Text;

    local procedure BasedOnCriteria(JobApplicationTable: Record "Job Application Table")
    var
        Application: Record "Job Application Table";
        ShortlistCriteria: Record "Shortlist Criteria";
        CriteriaSetup: Record "Criteria Setup";
    begin
        Application.Reset;
        Application.SetRange("Vacancy Requisition No.", JobApplicationTable."Vacancy Requisition No.");
        if Application.FindSet then begin
            repeat
                //Check individual criteria for the requisition
                ShortlistCriteria.Reset;
                ShortlistCriteria.SetRange("Requisition No.", Application."Vacancy Requisition No.");
                if ShortlistCriteria.FindSet then begin
                    repeat
                        CriteriaSetup.Reset;
                        CriteriaSetup.SetRange(Code, ShortlistCriteria."Shortlist Criteria");
                        if CriteriaSetup.FindSet then begin
                            repeat
                                //check for each criteria in a table
                                Message('%1', CriteriaSetup."Table ID");
                            until CriteriaSetup.Next = 0;
                        end;
                    until ShortlistCriteria.Next = 0;
                end;
            until Application.Next = 0;
        end
    end;
}

