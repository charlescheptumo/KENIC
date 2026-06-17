/// <summary>
/// Table Professional Body Lines (ID 50027).
/// </summary>
table 50027 "Professional Body Lines"
{
    Caption = 'Professional Body Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Professional Body No."; Code[20])
        {
            Caption = 'Professional Body No.';
        }
        field(4; "Professional Body Name"; Text[250])
        {
            Caption = 'Professional Body Name';
        }
        field(5; "Amount (Fees)"; Decimal)
        {
            Caption = 'Amount (Fees)';
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
    var
        ProfBodyLines: Record "Professional Body Lines";
    begin
        ProfBodyLines.Reset();
        ProfBodyLines.SetRange("Document No.", Rec."Document No.");
        if ProfBodyLines.FindSet() then
            "Line No." := ProfBodyLines."Line No." + 1;
    end;
}
