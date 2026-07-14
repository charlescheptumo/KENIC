page 51199 "EstablishmentStatsFactBox"
{
    PageType = CardPart;
    SourceTable = "Company Information";
    Caption = 'Company Profile & Statistics';

    layout
    {
        area(content)
        {
            group("Contact Information")
            {
                Caption = 'Contacts';

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the primary phone number.';
                }
                field("Mobile Phone No."; Rec."Phone No. 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the mobile phone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the company email address.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = All;
                    Caption = 'Website';
                    ToolTip = 'Specifies the company website URL.';
                }
                field(PostalAddressField; PostalAddress)
                {
                    ApplicationArea = All;
                    Caption = 'Postal Address';
                    Editable = false;
                    ToolTip = 'Specifies the formatted postal address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Physical Address';
                    ToolTip = 'Specifies the physical location or building details.';
                }
            }

            group("Establishment Statistics")
            {
                Caption = 'Establishment (Statistics / Summary)';

                // Headcount Fields
                field(TotalEmployeesField; TotalEmployees)
                {
                    ApplicationArea = All;
                    Caption = 'Total Employees (Active)';
                    Editable = false;
                    ToolTip = 'Specifies the overall number of active employees.';
                }
                field(MaleEmployeesField; MaleEmployees)
                {
                    ApplicationArea = All;
                    Caption = 'Male Employees';
                    Editable = false;
                    ToolTip = 'Specifies the number of active male employees.';
                }
                field(FemaleEmployeesField; FemaleEmployees)
                {
                    ApplicationArea = All;
                    Caption = 'Female Employees';
                    Editable = false;
                    ToolTip = 'Specifies the number of active female employees.';
                }

                // Department Field
                field(TotalDepartmentsField; TotalDepartments)
                {
                    ApplicationArea = All;
                    Caption = 'Total Departments';
                    Editable = false;
                    ToolTip = 'Specifies the total number of departments configured in responsibility centers.';
                }

                // Existing Fields
                field("Active Staff Count"; Rec."Active Staff Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of currently active employees.';
                    Importance = Promoted;
                }
                field("Established Positions"; Rec."Established Positions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of non-blocked established positions.';
                    Importance = Promoted;
                }
                field("Total Job Grades"; Rec."Total Job Grades")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of salary scales configured.';
                    Importance = Promoted;
                }
                field("Approved Duty Stations"; Rec."Approved Duty Stations")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of active, approved duty stations.';
                    Importance = Promoted;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        FormatPostalAddress();
        CalculateEmployeeMetrics();
        CalculateDepartmentMetrics();
    end;

    var
        PostalAddress: Text[150];
        TotalEmployees: Integer;
        MaleEmployees: Integer;
        FemaleEmployees: Integer;
        TotalDepartments: Integer;

    local procedure CalculateEmployeeMetrics()
    var
        Employee: Record "Employee";
    begin
        TotalEmployees := 0;
        MaleEmployees := 0;
        FemaleEmployees := 0;

        Employee.Reset();
        Employee.SetRange(Status, Employee.Status::Active);
        TotalEmployees := Employee.Count();

        Employee.SetRange(Gender, Employee.Gender::Male);
        MaleEmployees := Employee.Count();

        Employee.Reset();
        Employee.SetRange(Status, Employee.Status::Active);
        Employee.SetRange(Gender, Employee.Gender::Female);
        FemaleEmployees := Employee.Count();
    end;

    local procedure CalculateDepartmentMetrics()
    var
        RespCenter: Record "Responsibility Center";
    begin
        TotalDepartments := 0;

        RespCenter.Reset();
        
        RespCenter.SetRange("Operating Unit Type", RespCenter."Operating Unit Type"::"Department/Center");
        TotalDepartments := RespCenter.Count();
    end;

    local procedure FormatPostalAddress()
    var
        AddressParts: List of [Text];
        ZipAndCity: Text;
    begin
        PostalAddress := '';
        Clear(AddressParts);

        if Rec.Address <> '' then
            AddressParts.Add(Rec.Address);

        if (Rec."Post Code" <> '') or (Rec.City <> '') then begin
            ZipAndCity := DelChr(Rec."Post Code" + ' ' + Rec.City, '<>', ' ');
            if ZipAndCity <> '' then
                AddressParts.Add(ZipAndCity);
        end;

        if AddressParts.Count() > 0 then
            PostalAddress := StringJoin(' - ', AddressParts);
    end;

    local procedure StringJoin(Separator: Text; InputList: List of [Text]): Text
    var
        Result: Text;
        i: Integer;
    begin
        for i := 1 to InputList.Count() do begin
            if i > 1 then
                Result += Separator;
            Result += InputList.Get(i);
        end;
        exit(Result);
    end;
}