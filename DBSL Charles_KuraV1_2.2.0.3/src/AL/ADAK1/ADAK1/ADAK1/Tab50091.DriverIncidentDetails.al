/// <summary>
/// Table Driver Incident Details (ID 50091).
/// </summary>
table 50091 "Driver Incident Details"
{
    Caption = 'Driver Incident Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Driver';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; "Incident Type"; Code[100])
        {
            Caption = 'Incident Type';
            TableRelation = "Driver Incident Types";

            trigger OnValidate()
            begin
                if "Incident Type" <> '' then begin
                    DriverIncidentType.Get("Incident Type");
                    "Incident Description" := DriverIncidentType.Description;
                end else begin
                    "Incident Description" := '';
                end;
            end;
        }
        field(4; "Driver Name"; Text[250])
        {
            Caption = 'Driver Name';
        }
        field(5; "Incident Description"; Text[500])
        {
            Caption = 'Incident Description ';
        }
        field(6; "Incident Date"; Date)
        {
            Caption = 'Incident Date';
        }
        field(7; "Police Abstract"; Boolean)
        {
            Caption = 'Police Abstract';
        }
        field(8; "Police Abstract No."; Code[20])
        {
            Caption = 'Police Abstract No.';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        DriverIncidentDetails.Reset();
        DriverIncidentDetails.SetRange("Document No.", Rec."Document No.");
        if DriverIncidentDetails.FindLast() then begin
            Rec."Line No." := DriverIncidentDetails."Line No." + 1;
        end;
    end;

    var
        DriverIncidentDetails: Record "Driver Incident Details";
        DriverIncidentType: Record "Driver Incident Types";
}
