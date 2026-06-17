table 50045 "CEO Assign Tasks List"
{
    Caption = 'CEO Assign Tasks List';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[100])
        {
            TableRelation = "CEO Assign Tasks".No;
        }
        field(2; "Task No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(4; Tasks; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Completed; Boolean)
        {
        }
        field(6; "Completion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "No Series"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No", "Task No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "Task No" = '' then begin
            HRSet.Get();
            HRSet.TestField("CEO Task Assignment Line Nos");
            rec."Task No" := NoSeriesMgt.GetNextNo(HRSET."CEO Task Assignment Line Nos", WorkDate(), true);
        end;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";

}
