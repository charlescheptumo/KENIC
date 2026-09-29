#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
report 50136 "Training Evaluation Report"
{
    ApplicationArea = All;
    Caption = 'Training Evaluation Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/TrainingEvaluation.rdlc';

    dataset
    {
        dataitem("Training Evaluation Header"; "Training Evaluation Header")
        {
            RequestFilterFields = "No", Status;

            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCountyCode; CompanyInfo.County)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyVATRegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(EvalNo; "No")
            {
            }
            column(ApplicationCode; "Application Code")
            {
            }
            column(EmployeeNo; EmployeeNo)
            {
            }
            column(EmployeeName; EmployeeName)
            {
            }
            column(EmployeeDepartment; EmployeeDepartment)
            {
            }
            column(EmployeeJobTitle; EmployeeJobTitle)
            {
            }
            column(CourseTitle; "Course Title")
            {
            }
            column(CourseMethodology; CourseMethodologyText)
            {
            }
            column(StartDateTime; "Start DateTime")
            {
            }
            column(EndDateTime; "End DateTime")
            {
            }
            column(Venue; Venue)
            {
            }
            column(CourseJustification; "Course Justification")
            {
            }
            column(NoOfParticipants; "No. of Participants")
            {
            }
            column(Facilitators; Facilitators)
            {
            }
            column(CommentOnRelevanceOfCourse; "Comment on Relevance of Course")
            {
            }
            column(Status_; Status)
            {
            }
            column(StatusText; Format(Status))
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(AreasAddressedText; AreasAddressedText)
            {
            }
            column(OtherAreasText; OtherAreasText)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Clear(TrainingRequests);
                Clear(Employee);
                Clear(EmployeeNo);
                Clear(EmployeeName);
                Clear(EmployeeDepartment);
                Clear(EmployeeJobTitle);
                Clear(CourseMethodologyText);

                if TrainingRequests.Get("Application Code") then begin
                    EmployeeNo := TrainingRequests."Employee No.";
                    EmployeeName := TrainingRequests."Employee Name";

                    if Employee.Get(TrainingRequests."Employee No.") then begin
                        EmployeeName := Employee.FullName();
                        Employee.CalcFields("Department Name");
                        EmployeeDepartment := Employee."Department Name";
                        EmployeeJobTitle := Employee."Job Title";
                    end;
                end;

                CourseMethodologyText := "Course Methodology";
                if (CourseMethodologyText = '') and (TrainingRequests.Code <> '') then
                    CourseMethodologyText := Format(TrainingRequests."Training Type");

                AreasAddressedText := BuildAreasAddressedText("No");
                OtherAreasText := BuildOtherAreasText("No");
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);

        CRLF[1] := 13;
        CRLF[2] := 10;
    end;

    var
        CompanyInfo: Record "Company Information";
        Employee: Record Employee;
        TrainingRequests: Record "Training Requests";
        EmployeeNo: Code[20];
        EmployeeName: Text[100];
        EmployeeDepartment: Text[100];
        EmployeeJobTitle: Text[100];
        CourseMethodologyText: Text[100];
        AreasAddressedText: Text;
        OtherAreasText: Text;
        CRLF: Text[2];

    local procedure BuildAreasAddressedText(TrainingHeaderNo: Code[20]): Text
    var
        AreasAddressed: Record "Trng Eval Areas Addressed";
        ResultText: Text;
    begin
        AreasAddressed.SetRange("Training Header No", TrainingHeaderNo);
        if AreasAddressed.FindSet() then
            repeat
                if AreasAddressed."Comment on Relevance of Course" <> '' then begin
                    if ResultText <> '' then
                        ResultText += CRLF;
                    ResultText += AreasAddressed."Comment on Relevance of Course";
                end;
            until AreasAddressed.Next() = 0;
        exit(ResultText);
    end;

    local procedure BuildOtherAreasText(TrainingHeaderNo: Code[20]): Text
    var
        OtherAreas: Record "Trng Eval Other Areas";
        ResultText: Text;
    begin
        OtherAreas.SetRange("Training Header No", TrainingHeaderNo);
        if OtherAreas.FindSet() then
            repeat
                if OtherAreas."Comment on Relevance of Course" <> '' then begin
                    if ResultText <> '' then
                        ResultText += CRLF;
                    ResultText += OtherAreas."Comment on Relevance of Course";
                end;
            until OtherAreas.Next() = 0;
        exit(ResultText);
    end;
}
