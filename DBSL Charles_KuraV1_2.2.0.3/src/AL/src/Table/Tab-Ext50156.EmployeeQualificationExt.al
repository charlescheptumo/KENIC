namespace KICD.KICD;

using Microsoft.HumanResources.Employee;
using Microsoft.HumanResources.Setup;

tableextension 50156 EmployeeQualificationExt extends "Employee Qualification"
{
    fields
    {
        field(50003; "Qualification Code 2"; Code[100])
        {
            Caption = 'Qualification Code';
            TableRelation = Qualification;

            trigger OnValidate()
            VAR
                Qualification: RECORD Qualification;
            begin
                Qualification.Get("Qualification Code");
                Description := Qualification.Description;
            end;
        }
    }
}
