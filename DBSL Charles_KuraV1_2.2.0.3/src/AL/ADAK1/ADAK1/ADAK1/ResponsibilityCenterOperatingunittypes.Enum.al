/// <summary>
/// Enum Responsibility Center Operating unit types (ID 50000).
/// </summary>
enum 50003 "Responsibility Center Operating unit types"
{
    Caption = 'Responsibility Center Operating unit types';
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Directorate)
    {
        Caption = 'Directorate';
    }
    value(2; "Department/Center")
    {
        // Caption = 'Department/Center';
        Caption = 'Department';
    }
    value(3; "Division/Section")
    // value(3; "Division")
    {
        // Caption = 'Division/Section';
        Caption = 'Division';
    }
    value(4; Region)
    {
        Caption = 'Region';
    }
    value(5; Constituency)
    {
        Caption = 'Constituency';
    }
    value(6; Branch)
    {
        Caption = 'Branch';
    }
    value(7; Board)
    {
        // Caption = 'Board';
        Caption = 'Council';
    }
    value(8; "Company-Level")
    {
        Caption = 'Company-Level';
    }
    value(9; "Duty Station")
    {
        Caption = 'Duty Station';
    }

    value(10; "Towns")
    {
        Caption = 'Town';
    }
    value(11; "Section")
    {
        Caption = 'Section';
    }
}
