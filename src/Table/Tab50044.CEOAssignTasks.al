table 50044 "CEO Assign Tasks"
{
    Caption = 'CEO Assign Tasks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[100])
        {
        }
        field(2; "Assign to Employee No"; Code[250])
        {
            TableRelation = Employee."No." where(HOD = const(true));

            trigger OnValidate()
            begin
                Emp.reset();
                Emp.SetRange("No.", Rec."Assign to Employee No");
                if Emp.Find('-') then begin
                    "Assign to Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Assigned to Employee UserID" := Emp."User ID";
                end;
            end;
        }
        field(3; "Assign to Employee Name"; Text[1000])
        {

        }
        field(4; "Created By"; Code[1000])
        {

        }
        field(5; "Created On"; DateTime)
        {

        }
        field(6; Completed; Boolean)
        {

        }
        field(7; "To be Completed On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "CEO No"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(CEO = const(true));

            trigger OnValidate()
            begin
                Emp.Reset();
                Emp.SetRange("No.", "CEO No");
                if Emp.Find('-') then begin
                    "CEO Email" := Emp."E-Mail";
                end
            end;
        }
        field(9; "CEO Email"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Date of Completion"; Date)
        {

        }
        field(12; "CEO Remark"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "CEO Remark2"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Assigned to Employee UserID"; Code[100])
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
        key(PK; "No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if Rec.No = '' then begin
            HRSet.Get();
            HRSet.TestField("CEO Task Assignment Nos");
            rec."No" := NoSeriesMgt.GetNextNo(HRSET."CEO Task Assignment Nos", WorkDate(), true);
        end
    end;


    var
        Emp: Record Employee;
        HRSet: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit "No. Series";
}
