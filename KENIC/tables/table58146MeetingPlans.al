#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58146 "Meeting Plans"
{
    Caption = 'Meeting Plans';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Code[20])
        {
            Caption = 'Id';
            DataClassification = ToBeClassified;
        }
        field(2; "Committee Id"; Code[20])
        {
            Caption = 'Committee Id';
            DataClassification = ToBeClassified;
            TableRelation = "Board Committees".Code;

            trigger OnValidate()
            begin
                CalcFields("Committee Description");
            end;
        }
        field(3; "Committee Description"; Text[200])
        {
            Caption = 'Committee Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Committees".Description where(Code = field("Committee Id")));
            Editable = false;
        }
        field(4; "Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = ToBeClassified;
        }
        field(5; "Quarter"; Option)
        {
            Caption = 'Quarter';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Q1,Q2,Q3,Q4';
            OptionMembers = " ",Q1,Q2,Q3,Q4;
        }
        field(6; "Title"; Text[250])
        {
            Caption = 'Title';
            DataClassification = ToBeClassified;
        }
        field(7; "Description"; Text[2048])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(8; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Approved,Cancelled,Completed';
            OptionMembers = Draft,Approved,Cancelled,Completed;
        }
        field(9; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = User."User Name";
        }
        field(10; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Id", "Title", "Committee Id", "Year", "Quarter")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Id" = '' then begin
            HRSet.Get();
            HRSet.TestField("Meeting Plan Nos.");
            "Id" := NoSeriesMgt.GetNextNo(HRSet."Meeting Plan Nos.", WorkDate(), true);
        end;

        "Created By" := CopyStr(UserId(), 1, MaxStrLen("Created By"));
        "Created At" := CurrentDateTime();
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
}