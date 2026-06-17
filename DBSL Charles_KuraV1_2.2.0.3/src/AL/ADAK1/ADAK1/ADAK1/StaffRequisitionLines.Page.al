#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69114 "Staff Requisition Lines"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Vacancy Requisition Lines";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Type of Contract"; Rec."Type of Contract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Contract field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Planned Qty"; Rec."Planned Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Qty field.';
                }
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Qty field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Applications End Time"; Rec."Applications End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Time field.';
                }
                field("Applications End Date"; Rec."Applications End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Date field.';
                }
                field("Applications Start Date"; Rec."Applications Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications Start Date field.';
                }
                field(Salary; Rec.Salary)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary field.';
                }
                field("Job Function"; Rec."Job Function")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Function field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Vacancy")
            {
                ApplicationArea = Basic;
                Image = CreateSerialNo;
                Visible = false;
                ToolTip = 'Executes the Create Vacancy action.';

                trigger OnAction()
                begin
                    if Confirm(TXT001) = true then begin
                        CurrPage.SetSelectionFilter(VacancyRequisitionLines);
                        VacancyRequisitionLines.Reset;
                        VacancyRequisitionLines.SetRange(Status, VacancyRequisitionLines.Status::Open);
                        if VacancyRequisitionLines.FindSet then begin
                            repeat
                                HRSetup.Get;
                                HRSetup.TestField(HRSetup."Vacancy Nos.");
                                VacancyNo := NoSeriesMgt.GetNextNo(HRSetup."Vacancy Nos.", WorkDate(), true);

                                Vacancies.Init;
                                Vacancies."Requisition No." := VacancyNo;
                                Vacancies."Job Id" := VacancyRequisitionLines."Job Id";
                                Vacancies."Job Description" := VacancyRequisitionLines."Job Description";
                                Vacancies."Planned Start Date" := VacancyRequisitionLines."Planned Start Date";
                                Vacancies."Planned End Date" := VacancyRequisitionLines."Planned End Date";
                                Vacancies."Planned Qty" := VacancyRequisitionLines."Planned Qty";
                                Vacancies.Insert;
                            until VacancyRequisitionLines.Next = 0;
                            Message(TXT002, VacancyNo);
                        end
                    end
                end;
            }
            group(Shortlisting)
            {
                Visible = false;
                action("Shortlisting Criteria")
                {
                    ApplicationArea = Basic;
                    Image = List;
                    RunObject = Page "Shortlisting Criteria";
                    RunPageLink = "Entry No." = field("Line No."),
                                  "Requisition No." = field("Requisition No.");
                    ToolTip = 'Executes the Shortlisting Criteria action.';
                }
                action("Filter Based on Criteria")
                {
                    ApplicationArea = Basic;
                    Image = FilterLines;
                    ToolTip = 'Executes the Filter Based on Criteria action.';

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyRequisitionLines);
                        if VacancyRequisitionLines.FindSet then begin
                            repeat
                            //   ShortlistingCriteria.BasedOnCriteria(VacancyRequisitionLines);
                            until VacancyRequisitionLines.Next = 0;
                            Clear(VacancyRequisitionLines);
                        end;
                    end;
                }
            }
        }
    }

    var
        StatusApproved: Boolean;
        VacancyRequisitionsTable: Record "ManPower Planning Lines";
        Text001: label 'The job position has already been advertised';
        Text002: label 'Are you sure you want to advertise the  position %1';
        JobAdvertHeader: Record "Advertisement Channels";
        JobAdvertLines: Record "Job Advert Lines";
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
        Text003: label 'The Job Advertisement template no, %1, has been created succesfully';
        VacancyRequisitionLines: Record "Vacancy Requisition Lines";
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";
        TXT001: label 'Are you sure you want to create a vacancy for this Position';
        Vacancies: Record Vacancyx;
        VacancyNo: Code[30];
        TXT002: label 'Vacancy %1, has been created succesfully';

    local procedure BasedOnCriteria(JobApplicationTable: Record "Job Application Table")
    var
        Application: Record "Job Application Table";
        ShortlistCriteria: Record "Shortlist Criteria";
        CriteriaSetup: Record "Criteria Setup";
    begin
    end;
}

