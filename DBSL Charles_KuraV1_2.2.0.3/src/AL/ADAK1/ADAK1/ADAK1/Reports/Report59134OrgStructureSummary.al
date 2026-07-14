namespace Microsoft.Inventory.Location;

using Microsoft.Foundation.Company;
using Microsoft.HumanResources.Employee;
using System.Text;

report 59134 "Org. Structure Summary"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Organization Structure Summary';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './ADAK PHASE 2/Layouts/Organization Structure Summary.rdlc';

    dataset
    {
       
        dataitem(CompanyInfo; "Company Information")
        {
            DataItemTableView = sorting("Primary Key");
            
            column(CompanyName; Name) { }
            column(CompanyAddress; Address) { }
            column(CompanyAddress2; "Address 2") { }
            column(CompanyLogo; Picture) { }
            column(CompanyMotto; Motto) { }
            column(CompanyEmail; "E-Mail") { }
            column(CompanyHomePage; "Home Page") { }
            column(CompanyPhone; "Phone No.") { }
            
            column(CreatedBy; UserId) { }
            column(CreatedDate; CurrentDateTime) { }

            trigger OnAfterGetRecord()
            begin
                CalcFields(Picture);
            end;
        }

      
        dataitem(ResponsibilityCenter; "Responsibility Center")
        {
            DataItemTableView = sorting("Hierarchical  Level ID", Code);
            
            column(RC_Code; Code) { }
            column(RC_Name; Name) { }
            column(RC_Level; "Hierarchical  Level ID") { }
            column(RC_Overview; Mission) { } 
            column(RC_HeadTitle; "Headed By (Title)") { }
            column(RC_HeadName; "Current Head Name") { }
            column(RC_ReportingLine; "Direct Reports To") { }
            column(RC_StaffCount; StaffCount) { }
            column(RC_LinkedUnits; LinkedUnits) { }

            trigger OnAfterGetRecord()
            begin
                StaffCount := CalculateStaffCount(Code);
                LinkedUnits := CalculateLinkedUnits(Code);
            end;
        }
    }

    var
        StaffCount: Integer;
        LinkedUnits: Integer;

    local procedure CalculateStaffCount(RCCode: Code[50]): Integer
    var
        Employee: Record Employee;
    begin
        Employee.Reset();
        Employee.SetRange("Responsibility Center", RCCode);
        Employee.SetRange(Status, Employee.Status::Active);
        exit(Employee.Count());
    end;

    local procedure CalculateLinkedUnits(ParentRCCode: Code[50]): Integer
    var
        SubUnits: Record "Responsibility Center";
    begin
        SubUnits.Reset();
        SubUnits.SetRange("Direct Reports To", ParentRCCode);
        exit(SubUnits.Count());
    end;
}