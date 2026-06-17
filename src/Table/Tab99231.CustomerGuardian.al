table 99231 "Customer Guardian"
{
    Caption = 'Customer Guardian';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(2; "Guardian Name"; Text[100])
        {
            Caption = 'Guardian Name';
        }
        field(3; Signature; Media)
        {
            Caption = 'Signature';
        }
        field(4; "Phone No."; Code[30])
        {

        }
        field(5; "E-Mail"; Text[100])
        {

        }
    }
    keys
    {
        key(PK; "Customer No.")
        {
            Clustered = true;
        }
    }
    var
    // MailMgt
}
