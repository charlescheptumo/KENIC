table 50108 "Contract Renewal History"
{
    Caption = 'Contract Renewal History';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; "Contract Start Date"; Date)
        {
            Caption = 'Contract Start Date';
        }
        field(4; "Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
        }
        field(5; Reasons; Text[2048])
        {
            Caption = 'Reasons';
        }
        field(6; "Contract Renewal Date"; Date)
        {
            Caption = 'Contract Renewal Date';
        }
    }
    keys
    {
        key(PK; "Contract No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        RenewalHist.Reset();
        RenewalHist.SetRange("Contract No.", Rec."Contract No.");
        if RenewalHist.FindLast() then
            Rec."Line No." := RenewalHist."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        RenewalHist: Record "Contract Renewal History";
}
