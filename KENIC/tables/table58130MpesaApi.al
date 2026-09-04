table 58130 "Mpesa Transaction"
{
    Caption = 'Mpesa Transaction';
    DataClassification = CustomerContent;

    fields
    {
        field(1; MpesaApiId; Integer)
        {
            Caption = 'Mpesa Api Id';
            DataClassification = CustomerContent;
        }
        field(2; TransId; Code[50])
        {
            Caption = 'Trans Id';
            DataClassification = CustomerContent;
        }
        field(3; TransactionType; Text[50])
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(4; TransAmount; Decimal)
        {
            Caption = 'Trans Amount';
            DataClassification = CustomerContent;
        }
        field(5; TransactionTime; DateTime)
        {
            Caption = 'Transaction Time';
            DataClassification = CustomerContent;
        }
        field(6; Created; DateTime)
        {
            Caption = 'Created';
            DataClassification = CustomerContent;
        }
        field(7; TransTime; Text[20])
        {
            Caption = 'Trans Time';
            DataClassification = CustomerContent;
        }
        field(8; BillRefNumber; Text[50])
        {
            Caption = 'Bill Ref Number';
            DataClassification = CustomerContent;
        }
        field(9; FirstName; Text[50])
        {
            Caption = 'First Name';
            DataClassification = CustomerContent;
        }
        field(10; MiddleName; Text[50])
        {
            Caption = 'Middle Name';
            DataClassification = CustomerContent;
        }
        field(11; LastName; Text[50])
        {
            Caption = 'Last Name';
            DataClassification = CustomerContent;
        }
        field(12; PhoneNumber; Text[250])
        {
            Caption = 'Phone Number';
            DataClassification = CustomerContent;
        }
        field(13; BusinessShortCode; Text[20])
        {
            Caption = 'Business Short Code';
            DataClassification = CustomerContent;
        }
        field(14; OrgAccountBalance; Decimal)
        {
            Caption = 'Org Account Balance';
            DataClassification = CustomerContent;
        }
        field(15; InvoiceNumber; Text[50])
        {
            Caption = 'Invoice Number';
            DataClassification = CustomerContent;
        }
        field(16; ThirdPartyTransId; Text[50])
        {
            Caption = 'Third Party Trans Id';
            DataClassification = CustomerContent;
        }
        field(17; InWords; Text[100])
        {
            Caption = 'In Words';
            DataClassification = CustomerContent;
        }
        field(18; PickedAccount; Text[50])
        {
            Caption = 'Picked Account';
            DataClassification = CustomerContent;
        }
        field(19; Narrative; Text[250])
        {
            Caption = 'Narrative';
            DataClassification = CustomerContent;
        }
        field(20; IsPicked; Boolean)
        {
            Caption = 'Is Picked';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; MpesaApiId)
        {
            Clustered = true;
        }
        key(TransIdKey; TransId) { }
    }

    trigger OnInsert()
    var
        ExistingRec: Record "Mpesa Transaction";
    begin
        if ExistingRec.Get(Rec.MpesaApiId) then
            Error('Mpesa transaction %1 already exists in Business Central.', Rec.MpesaApiId);
    end;
}