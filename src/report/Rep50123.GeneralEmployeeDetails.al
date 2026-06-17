namespace KICD.KICD;

using Microsoft.HumanResources.Employee;
using Microsoft.Foundation.Company;

report 50123 "General Employee Details"
{
    ApplicationArea = All;
    Caption = 'Employee BioData Report';
    RDLCLayout = './Layouts/GeneralEmployeeDetails.rdlc';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Ethnic Origin", County, "End Of Probation Date";

            column(Number; RowNo) { }
            column("NamesofStaffMembers"; FullName()) { }
            column("PFNo"; "No.") { }
            column("Designation"; "Job Title") { }
            column("Grade"; "Salary Scale") { }
            column("Gender"; Format(Gender)) { }
            column("EthnicOrigin"; EthnicOriginName) { }
            column("County"; CountyName) { }
            column("DateofBirth"; "Date of Birth") { }
            column("Disabilityifany"; Disabled) { }
            column("DateofFirstAppt"; "Employment Date") { }
            column("DateofCurrentAppt"; "End Of Probation Date") { }
            column(CompanyLogo; CompanyInfo.Picture) { }
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAddress; CompanyInfo.Address) { }
            column(CompanyAddress2; CompanyInfo."Address 2") { }
            column(CompanyPostCode; CompanyInfo."Post Code") { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyPhone; CompanyInfo."Phone No.") { }
            column(CompanyFax; CompanyInfo."Fax No.") { }
            column(CompanyEmail; CompanyInfo."E-Mail") { }
            column(CompanyWebsite; CompanyInfo."Home Page") { }

            trigger OnAfterGetRecord()
            var
                CountyRec: Record County;
                EthnicBg: Record "Ethnic Background";
            begin
                RowNo += 1;
                if CountyRec.Get(Employee.County) then
                    CountyName := CountyRec."County Name"
                else
                    CountyName := '';
                if EthnicBg.Get(Employee."Ethnic Origin") then
                    EthnicOriginName := EthnicBg."Ethnic group"
                else
                    EthnicOriginName := Employee."Ethnic Origin";
            end;

            trigger OnPreDataItem()
            begin
                if EthnicOriginFilter <> '' then
                    Employee.SetFilter("Ethnic Origin", EthnicOriginFilter);
                if CountyFilter <> '' then
                    Employee.SetFilter(County, CountyFilter);
                if DateFilter <> 0D then
                    Employee.SetFilter("End Of Probation Date", Format(DateFilter));
                if CompanyInfo.Get() then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Filters';

                    field("Ethnic Origin Filter"; EthnicOriginFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Ethnic Origin';
                        trigger OnLookup(var Text: Text): Boolean
                        var
                            EthnicRec: Record "Ethnic Background";
                        begin
                            if Page.RunModal(Page::"Ethnic Backgrounds", EthnicRec) = Action::LookupOK then begin
                                EthnicOriginFilter := EthnicRec."Code";
                                EthnicOriginName := EthnicRec."Ethnic group";
                                Text := EthnicRec."Ethnic group";
                                exit(true);
                            end;
                            exit(false);
                        end;
                    }

                    field("County Filter"; CountyFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'County';
                        trigger OnLookup(var Text: Text): Boolean
                        var
                            CountyRec: Record County;
                        begin
                            if Page.RunModal(Page::Counties1, CountyRec) = Action::LookupOK then begin
                                CountyFilter := CountyRec."Code";
                                CountyName := CountyRec."County Name";
                                Text := CountyRec."County Name";
                                exit(true);
                            end;
                            exit(false);
                        end;
                    }

                    field("End Of Probation Date"; DateFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'End Of Probation Date    ';
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        RowNo := 0;
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        RowNo := 0;
    end;

    var
        CompanyInfo: Record "Company Information";
        RowNo: Integer;
        EthnicOriginFilter: Code[10];
        CountyFilter: Code[50];
        DateFilter: Date;
        CountyName: Text[100];
        EthnicOriginName: Text[100];

    local procedure FullName(): Text[100]
    begin
        exit(Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");
    end;
}
