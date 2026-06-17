table 99224 Diagnosis
{
    Caption = 'Diagnosis';


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
        field(3; Diagnosis; Text[400])
        {
            Caption = 'Diagnosis';
        }
        field(4; "ICD 11 Code"; Code[100])
        {

        }
        field(5; "ICD 11 Title"; Text[200])
        {

        }
        field(6; "ICD 11 Definition"; Text[200])
        {

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
        Diagnos: Record Diagnosis;
    begin
        Diagnos.Reset();
        Diagnos.SetRange("Document No.", Rec."Document No.");
        if Diagnos.FindLast() then
            Rec."Line No." := Diagnos."Line No." + 1
        else
            Rec."Line No." := 0;
    end;
}
