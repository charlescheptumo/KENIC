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
            
            // System Auditing Metadata
            column(CreatedBy; UserId) { }
            column(CreatedDate; CurrentDateTime) { }

            
            dataitem(BoardAndCEO; "Responsibility Center")
            {
                
                DataItemTableView = sorting(Code) where("Operating Unit Type" = filter("Company-Level" | Board ));
                
                column(L12_Code; Code) { }
                column(L12_Name; Name) { }
                column(L12_Level; "Hierarchical  Level ID") { }
                column(L12_Overview; Mission) { } 
                column(L12_HeadTitle; "Headed By (Title)") { }
                column(L12_HeadName; "Current Head Name") { }
                column(L12_StaffCount; L12_StaffCount) { }

                trigger OnAfterGetRecord()
                begin
                    L12_StaffCount := CalculateStaffCount(Code);
                end;
            }

           
            dataitem(Directorates; "Responsibility Center")
            {
                DataItemTableView = sorting(Code) where("Operating Unit Type" = const(Directorate));
                
                column(L3_Code; Code) { }
                column(L3_Name; Name) { }
                column(L3_Overview; Mission) { }
                column(L3_HeadName; "Current Head Name") { }
                column(L3_LinkedUnits; L3_LinkedUnits) { }

                trigger OnAfterGetRecord()
                begin
                    L3_LinkedUnits := CalculateLinkedUnits(Code);
                end;
            }

            
            dataitem(Departments; "Responsibility Center")
            {
                DataItemTableView = sorting(Code) where("Operating Unit Type" = const("Department/Center"));
                
                column(L4_Code; Code) { }
                column(L4_Name; Name) { }
                column(L4_ReportingLine; "Direct Reports To") { }
                column(L4_HeadName; "Current Head Name") { }
                column(L4_StaffCount; L4_StaffCount) { }

                trigger OnAfterGetRecord()
                begin
                    L4_StaffCount := CalculateStaffCount(Code);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields(Picture);
            end;
        }
    }

    var
        L12_StaffCount: Integer;
        L3_LinkedUnits: Integer;
        L4_StaffCount: Integer;

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