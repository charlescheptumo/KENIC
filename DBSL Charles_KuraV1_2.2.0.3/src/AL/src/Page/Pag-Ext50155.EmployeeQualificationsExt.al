namespace KICD.KICD;

using Microsoft.HumanResources.Employee;

pageextension 50155 EmployeeQualificationsExt extends "Employee Qualifications"
{
    layout
    {

        addafter("Qualification Code")
        {
            field("Qualification Code 2"; Rec."Qualification Code 2")
            {
                caption = 'Long Qualification Code';
                applicationarea = basic;
            }
        }
    }
}
