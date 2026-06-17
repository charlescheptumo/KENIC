#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80272 "Plan Task Date Entry"
{

    fields
    {
        field(1; "Performance Mgt Plan ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Management Plan".No;
        }
        field(2; "Department Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get(EntryNo) then begin
                    "Department Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(3; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Performance Plan Task ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Event Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Event Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Event End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Event End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Performance Mgt Plan ID", "Performance Plan Task ID", EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ReviewQuarterlyPeriods: Record "Review Quarterly Periods";
        Category: Record "Task Category";
        ResponsibilityCenter: Record "Responsibility Center";
        PerformancePlanTask: Record "Performance Plan Task";
        Employee: Record Employee;
        PlanTaskEmployees: Record "Plan Task Employees";
        PPlanTask: Record "Performance Plan Task";
}
