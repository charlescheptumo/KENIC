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
        dataitem(CompanyInfoLoop; "Integer")
        {
            DataItemTableView = sorting(Number);
            MaxIteration = 1;

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

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;
        }

        dataitem("Training Evaluation Header"; "Training Evaluation Header")
        {
            RequestFilterFields = "No", Status;

            column(EvalNo; "No")
            {
            }
            column(ApplicationCode; "Application Code")
            {
            }
            column(EmployeeNo; "No")
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
            column(CourseMethodology; "Course Methodology")
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
            // Aggregated text, one line per child record, for use in the flat
            // "Areas Addressed by Training" / "Other Areas" cells.
            column(AreasAddressedText; AreasAddressedText)
            {
            }
            column(OtherAreasText; OtherAreasText)
            {
            }

            dataitem("Trng Eval Areas Addressed"; "Trng Eval Areas Addressed")
            {
                DataItemLink = "Training Header No" = field("No");
                DataItemTableView = sorting("Training Header No", "Line No");

                column(AreaLineNo; "Line No")
                {
                }
                column(AreaComment; "Comment on Relevance of Course")
                {
                }
                column(AreaCourseTitle; "Course Title")
                {
                }
                column(AreaCourseMethodology; "Course Methodology")
                {
                }
            }

            dataitem("Trng Eval Other Areas"; "Trng Eval Other Areas")
            {
                DataItemLink = "Training Header No" = field("No");
                DataItemTableView = sorting("Training Header No", "Line No");

                column(OtherAreaLineNo; "Line No")
                {
                }
                column(OtherAreaComment; "Comment on Relevance of Course")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Clear(EmployeeName);
                Clear(EmployeeDepartment);
                Clear(EmployeeJobTitle);

                if Employee.Get("No") then begin
                    EmployeeName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    Employee.CalcFields("Department Name");
                    EmployeeDepartment := Employee."Department Name";
                    EmployeeJobTitle := Employee."Job Title";
                end;

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

    var
        CompanyInfo: Record "Company Information";
        Employee: Record Employee;
        EmployeeName: Text[100];
        EmployeeDepartment: Text[100];
        EmployeeJobTitle: Text[100];
        AreasAddressedText: Text;
        OtherAreasText: Text;

    local procedure BuildAreasAddressedText(TrainingHeaderNo: Code[30]): Text
    var
        AreasAddressed: Record "Trng Eval Areas Addressed";
        ResultText: Text;
    begin
        AreasAddressed.SetRange("Training Header No", TrainingHeaderNo);
        if AreasAddressed.FindSet() then
            repeat
                if AreasAddressed."Comment on Relevance of Course" <> '' then begin
                    if ResultText <> '' then
                        ResultText += '\';
                    ResultText += AreasAddressed."Comment on Relevance of Course";
                end;
            until AreasAddressed.Next() = 0;
        exit(ResultText);
    end;

    local procedure BuildOtherAreasText(TrainingHeaderNo: Code[30]): Text
    var
        OtherAreas: Record "Trng Eval Other Areas";
        ResultText: Text;
    begin
        OtherAreas.SetRange("Training Header No", TrainingHeaderNo);
        if OtherAreas.FindSet() then
            repeat
                if OtherAreas."Comment on Relevance of Course" <> '' then begin
                    if ResultText <> '' then
                        ResultText += '\';
                    ResultText += OtherAreas."Comment on Relevance of Course";
                end;
            until OtherAreas.Next() = 0;
        exit(ResultText);
    end;
}
