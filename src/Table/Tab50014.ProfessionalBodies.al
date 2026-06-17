/// <summary>
/// Table Professional Bodies (ID 50014).
/// </summary>
table 50014 "Professional Bodies"
{
    Caption = 'Professional Bodies';
    DataClassification = ToBeClassified;
    LookupPageId = "Professional Bodies List";
    DrillDownPageId = "Professional Bodies List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SubscriptionSetup.Get();
                    NoSeriesMgt.TestManual(SubscriptionSetup."Professional Body No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(3; "Name 2"; Text[250])
        {
            Caption = 'Name 2';
        }
        field(4; "No. of Members"; Integer)
        {
            Caption = 'No. of Members';
            FieldClass = FlowField;
            CalcFormula = count(ProfessionalBodyMembers where("Document No." = field("No.")));
            Editable = false;
        }
        field(5; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(6; Comments; Boolean)
        {
            Caption = 'Comments';
        }
        field(7; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        if "No." = '' then begin
            SubscriptionSetup.Get();
            SubscriptionSetup.TestField("Professional Body No.");
           rec."No." := NoSeriesMgt.GetNextNo(SubscriptionSetup."Professional Body No.", WorkDate(), true);
        end;

        SetLastModifiedDateTime();
    end;

    trigger OnModify()
    begin
        SetLastModifiedDateTime();
    end;

    var
        SubscriptionSetup: Record SubscriptionSetup;
        NoSeriesMgt: Codeunit "No. Series";

    protected procedure SetLastModifiedDateTime()
    begin
        "Last Modified Date Time" := CurrentDateTime();
        "Last Date Modified" := Today();
        OnAfterSetLastModifiedDateTime(Rec);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetLastModifiedDateTime(var ProfessionalBodies: Record "Professional Bodies")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var ProfessionalBodies: Record "Professional Bodies"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(var ProfessionalBodies: Record "Professional Bodies"; var IsHandled: Boolean)
    begin
    end;
}
