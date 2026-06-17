namespace KICD.KICD;

using Microsoft.Foundation.Company;
using System.Security.User;

report 50117 CommittmentEntries
{
    ApplicationArea = All;
    Caption = 'Committment Entries';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CommittmentEntries.rdl';
    dataset
    {
        dataitem("Commitment Entries1"; "Commitment Entries")
        {
            RequestFilterFields = "Commitment Type", "Commitment Date", "Global Dimension 1 Code";
            column(CompanyName; CompanyInformation.Name)
            {
            }
            column(CompanyAddress; CompanyInformation.Address)
            {
            }
            column(CompanyAddress1; CompanyInformation."Address 2")
            {
            }
            column(CompanyCity; CompanyInformation.City)
            {
            }
            column(CompanyPhone; CompanyInformation."Phone No.")
            {
            }
            column(CompanyPhone2; CompanyInformation."Phone No. 2")
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {
            }
            column(ComapnyEmail; CompanyInformation."E-Mail")
            {
            }
            column(ComapnyMotto; CompanyInformation.Motto)
            {
            }
            column(ComapnyHomePage; CompanyInformation."Home Page")
            {
            }

            column(Entry_No; "Entry No")
            {
            }
            column(Commitment_Date; "Commitment Date")
            {
            }
            column(Document_No_; "Document No")
            {
            }
            column(Commitment_No; "Commitment No")
            {
            }
            column(Commitment_Type; "Commitment Type")
            {
            }
            column(Amount;  "Committed Amount")
            {
            }
            column(GLAccount; "Account No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(Budget_Year; "Budget Year")
            {
            }
            column(Uncommittment_Date; "Uncommittment Date")
            {
            }
            column(Account_No_; "Account No.")
            {
            }
            column(Account_Name; "Account Name")
            {
            }
            column(Account_Type; "Account Type")
            {
            }
            
            
            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                if "Entry No" = 0 then
                    CurrReport.Skip();
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        CompanyInformation: Record "Company Information";
        UserSetup: Record "User Setup";

}

