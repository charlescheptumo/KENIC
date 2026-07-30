report 59000 "Board Declaration Report"
{
    Caption = 'Board Member Annual Declaration';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = './layout/Rep59000BoardDeclaration.rdlc';
    RDLCLayout = './KENIC/layout/Rep59000BoardDeclaration.rdlc';

    dataset
    {
        dataitem(Header; "Board Declaration Header")
        {
            RequestFilterFields = "No.", "Board Member No.", "Declaration Year", "Declaration Status";

            // Company Information
            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            // Header Fields
            column(No_; "No.") { }
            column(Board_Member_No_; "Board Member No.") { }
            column(Board_Member_Name; "Board Member Name") { }
            column(Declaration_Type; "Declaration Type") { }
            column(Declaration_Date; Format("Declaration Date", 0, '<Day,2>/<Month,2>/<Year4>')) { }
            column(Declaration_Year; "Declaration Year") { }
            column(Declaration_Status; "Declaration Status") { }
            column(Created_By; "Created By") { }
            column(Submitted_DateTime; Format("Submitted DateTime", 0, '<Day,2>/<Month,2>/<Year4> <Hours24>:<Minutes,2>')) { }
            column(Reviewed_By; "Reviewed By") { }
            column(Reviewed_DateTime; Format("Reviewed DateTime", 0, '<Day,2>/<Month,2>/<Year4> <Hours24>:<Minutes,2>')) { }

            // Questionnaire / Disclosures
            column(Convicted_of_Crime; "Convicted of Crime") { }
            column(Conviction_Details; "Conviction Details") { }
            column(Bankrupt_or_Insolvent; "Bankrupt or Insolvent") { }
            column(Bankruptcy_Details; "Bankruptcy Details") { }
            column(Involved_in_Litigation; "Involved in Litigation") { }
            column(Litigation_Details; "Litigation Details") { }
            column(Received_Gifts_Hospitality; "Received Gifts/Hospitality") { }
            column(Gifts_Details; "Gifts Details") { }
            column(Family_Employed_in_Org; "Family Employed in Org") { }
            column(Family_Details; "Family Details") { }
            column(Other_Conflict_Matter; "Other Conflict Matter") { }
            column(Other_Conflict_Details; "Other Conflict Details") { }
            column(Declaration_Statement_Accepted; "Declaration Statement Accepted") { }
            column(Electronic_Signature; "Electronic Signature") { }

            dataitem(Line; "Board Declaration Line")
            {
                DataItemLink = "Declaration No." = field("No.");
                DataItemTableView = sorting("Declaration No.", "Line No.");

                column(Line_No_; "Line No.") { }
                column(Interest_Type; "Interest Type Description") { }
                column(Organization; Organization) { }
                column(Description; Description) { }
                column(Percentage; Percentage) { }
                column(Active; Active) { }
                column(Start_Date; Format("Start Date", 0, '<Day,2>/<Month,2>/<Year4>')) { }
                column(End_Date; Format("End Date", 0, '<Day,2>/<Month,2>/<Year4>')) { }
                column(Potential_Conflict; "Potential Conflict") { }
                column(Comments; Comments) { }
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields("Board Member Name");
            end;
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}