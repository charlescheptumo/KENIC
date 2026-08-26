#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58147 "Meeting Date Options"
{
    Caption = 'Meeting Date Options';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Integer)
        {
            Caption = 'Id';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Plan Id"; Code[20])
        {
            Caption = 'Meeting Plan Id';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Plans".Id;
        }
        field(3; "Proposed Date"; Date)
        {
            Caption = 'Proposed Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Start Time"; Time)
        {
            Caption = 'Start Time';
            DataClassification = ToBeClassified;
        }
        field(5; "End Time"; Time)
        {
            Caption = 'End Time';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if ("Start Time" <> 0T) and ("End Time" <> 0T) then
                    if "End Time" <= "Start Time" then
                        Error('End Time must be later than Start Time.');
            end;
        }
        field(6; "Venue"; Text[250])
        {
            Caption = 'Venue';
            DataClassification = ToBeClassified;
        }
        field(7; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Vote Count"; Integer)
        {
            Caption = 'Vote Count';
            FieldClass = FlowField;
            CalcFormula = count("Meeting Date Polls" where("Meeting Date Option Id" = field("Id")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
        key(FK_Plan; "Meeting Plan Id")
        {
        }
    }

    trigger OnInsert()
    begin
        "Created At" := CurrentDateTime();
    end;
}