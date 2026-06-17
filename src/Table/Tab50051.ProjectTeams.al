table 50051 "Project Teams"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Team Name"; Text[2048])
        {
        }
        field(4; "Creation Date"; Date)
        {
        }
        field(5; "Created By"; Code[70])
        {
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "Team Member No"; Code[20])
        {
        }
        field(9; Status; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(10; "No of Members"; Integer)
        {
            CalcFormula = count("Project Team Members" where("Code" = field("Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; Department; Code[50])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(12; "Sub Department"; Code[50])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(20; "No Series"; Code[100])
        {

        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";


    trigger OnInsert()
    begin
        HRSet.Get();
        HRSet.TestField("Project Team Nos");
         rec."Code" := NoSeriesMgt.GetNextNo(HRSET."Project Team Nos", WorkDate(), true);

        "Created By" := UserId;
        "Creation Date" := Today;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}