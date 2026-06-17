table 99230 "TUE Diagnosis"
{
    Caption = 'TUE Diagnosis';
    DataClassification = CustomerContent;
    LookupPageId = "TUE Diagnosis";
    DrillDownPageId = "TUE Diagnosis";
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Athlete No."; Code[20])
        {
            Caption = 'Athlete No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Diagnosis; Text[400])
        {
            Caption = 'Diagnosis';
        }
        field(5; "Medical Practitioner"; Code[20])
        {

        }
    }
    keys
    {
        key(PK; "Document No.", "Medical Practitioner", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Diagnosis: Record "TUE Diagnosis";
    begin
        Diagnosis.Reset();
        Diagnosis.SetRange("Document No.", Rec."Document No.");
        if Diagnosis.FindLast() then
            Rec."Line No." := Diagnosis."Line No." + 1
        else
            Rec."Line No." := 1;
    end;
}
