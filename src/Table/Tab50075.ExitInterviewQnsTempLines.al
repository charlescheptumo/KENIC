/// <summary>
/// Table Exit Interview Qns Temp Lines (ID 50075).
/// </summary>
table 50075 "Exit Interview Qns Temp Lines"
{
    Caption = 'Exit Interview Qns Temp Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Question ID"; Code[20])
        {
            Caption = 'Question ID';
        }
        field(4; Description; Text[600])
        {
            Caption = 'Description';
        }
        field(5; "Question Type"; Option)
        {
            Caption = 'Question Type';
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(6; "Closed-ended Question Sub-Type"; Code[30])
        {
            Caption = 'Closed-ended Question Sub-Type';
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
        TempLines.Reset();
        TempLines.SetRange("Document No.", Rec."Document No.");
        if TempLines.FindLast() then begin
            Rec."Line No." := TempLines."Line No." + 1;
        end;
    end;

    var
        TempLines: Record "Exit Interview Qns Temp Lines";
}
