table 99225 "Retroactive App Exception"
{
    Caption = 'Retroactive Application Exception';
    DataClassification = CustomerContent;

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
        field(3; Exception; Text[500])
        {
            Caption = 'Exception';
            TableRelation = "Retroactive Exceptions".Exception;
            ValidateTableRelation = false;
        }
        field(4; "Athlete No."; Code[20])
        {

        }
        field(5; Selected; Boolean)
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
        Exception: Record "Retroactive App Exception";
    begin
        Exception.Reset();
        Exception.SetRange("Document No.", Rec."Document No.");
        if Exception.FindLast() then
            Rec."Line No." := Exception."Line No." + 1
        else
            Rec."Line No." := 1;
    end;
}
