report 99108 "TUE form"
{
    ApplicationArea = All;
    Caption = 'TUE form';
    UsageCategory = ReportsAndAnalysis;
    // RDLCLayout = './Layouts/TUEForm.rdl';
    WordLayout = './Layouts/TUEForm.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem(TUEApplicationHeader; "TUE Application Header")
        {
            DataItemTableView = where("Approval Status" = const(Approved));
            column(No; "No.")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(MedicalPractitionerName; "Medical Practitioner Name")
            {
            }
            column(Medical_Specialty; "Medical Specialty")
            {
            }
            column(License_Body; "License Body")
            {
            }
            column(License_Number; "License Number")
            {
            }
            column(MP_Declaration_Date; format("MP Declaration Date", 0, 4))
            {
            }
            column(MP_Address; "MP Address")
            {
            }
            column(MP_City; "MP City")
            {
            }
            column(MP_Country; "MP Country")
            {
            }
            column(MP_E_Mail; "MP E-Mail")
            {
            }
            column(MP_Post_Code; "MP Post Code")
            {
            }
            column(ApprovalDate; format("Approval Date", 0, 4))
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(Address; Address)
            {
            }
            column(AthleteDeclarationDate; format("Athlete Declaration Date", 0, 4))
            {
            }
            column(City; City)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(DateOfBirth; format("Date Of Birth", 0, 4))
            {
            }
            column(Discipline; Discipline)
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(Gender; Gender)
            {
            }
            column(LicenseBody; "License Body")
            {
            }
            column(LicenseNumber; "License Number")
            {
            }
            column(MPAddress; "MP Address")
            {
            }
            column(MPCity; "MP City")
            {
            }
            column(PreviousApplication; format("Previous Application?"))
            {
            }
            column(RetroActiveApplication; format("RetroActive Application?"))
            {
            }
            column(RetroActiveStartDate; "RetroActive Start Date")
            {
            }
            column(Sport; Sport)
            {
            }
            column(Telephone; Telephone)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(Female; format(Female))
            {

            }
            column(Male; Format(Male))
            {
            }
            column(PreviousApplications; Format(PreviousApplications))
            {
            }
            dataitem(Resource; Resource)
            {
                DataItemLinkReference = TUEApplicationHeader;
                DataItemLink = "No." = field(Physician);
                column(Signature; Signature)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    //CalcFields(Signature);
                end;
            }
            dataitem(Diagnosis; Diagnosis)
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = TUEApplicationHeader;
                column(dDiagnosis; Diagnosis)
                {

                }
            }
            dataitem("Retroactive App Exception"; "Retroactive App Exception")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = TUEApplicationHeader;
                column(RetroactiveException; Exception)
                {
                }
            }
            dataitem("TUE Medication Details"; "TUE Medication Details")
            {
                DataItemLink = "Document No." = field("No."), "Athlete No." = field("Customer No.");
                DataItemLinkReference = TUEApplicationHeader;
                Column(Prohibited_Substance; "Prohibited Substance")
                {
                }
                Column(Substance_Description; "Substance Description")
                {
                }
                column(Approved; format(Approved))
                {

                }
            }
            dataitem("Previous Application?"; "TUE Medication Details")
            {
                DataItemLink = "Athlete No." = field("Customer No.");
                DataItemLinkReference = TUEApplicationHeader;
                Column(PrevProhibited_Substance; "Prohibited Substance")
                {
                }
                Column(PrevSubstance_Description; "Substance Description")
                {
                }
                column(PrevApproved; format(Approved))
                {

                }
                trigger OnPreDataItem()
                begin
                    Setfilter("Document No.", '<>%1', TUEApplicationHeader."No.");
                    SetRange(Approved, true);
                end;
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInfo.get();
                CompanyInfo.calcfields(Picture);
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                CalcFields(gender, "First Name", "Last Name", "Date Of Birth", Address, City, "Country/Region Code", "Post Code", "MP Address", "MP Post Code", "MP City", "MP Country");
                if Gender = gender::Female then
                    Female := true
                else
                    if Gender = gender::Male then
                        Male := true;
                PreviousApplications := PreviousApplication("No.");
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        CompanyInfo: Record "Company Information";
        FileMangement: Codeunit "File Management";
        DummyCompanyInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        Female: Boolean;
        Male: Boolean;
        PreviousApplications: Boolean;

}
