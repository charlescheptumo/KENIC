/// <summary>
/// Table Exit Interview Qns Templates (ID 50074).
/// </summary>
table 50074 "Exit Interview Qns Templates"
{
    Caption = 'Exit Interview Qns Templates';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
        field(2; Description; Text[550])
        {
            Caption = 'Description';
        }
        field(3; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Last DateTime Modified"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            Editable = false;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "User ID" := UserId;
        SetLastModifiedDateTime();
    end;

    trigger OnModify()
    begin
        SetLastModifiedDateTime();
    end;

    trigger OnRename()
    begin
        SetLastModifiedDateTime();
    end;

    trigger OnDelete()
    begin
        TempLines.Reset();
        TempLines.SetRange("Document No.", Rec."Document No.");
        TempLines.DeleteAll();
    end;

    var
        TempLines: Record "Exit Interview Qns Temp Lines";

    local procedure SetLastModifiedDateTime()
    begin
        "Last Date Modified" := Today;
        "Last DateTime Modified" := CurrentDateTime;
    end;
}
