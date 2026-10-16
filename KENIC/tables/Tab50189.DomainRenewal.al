table 50189 "Domain Renewal"
{
    Caption = 'Domain Renewal';
    DataClassification = CustomerContent;

    fields
    {
        field(1; LedgerId; BigInteger)
        {
            Caption = 'Ledger ID';
        }
        field(2; DomainName; Text[253])
        {
            Caption = 'Domain Name';
        }
        field(3; ClientRoid; Code[50])
        {
            Caption = 'Client ROID';
        }
        field(4; Description; Text[2048])
        {
            Caption = 'Description';
        }
        field(5; TransType; Text[100])
        {
            Caption = 'Transaction Type';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 2 : 5;
        }
        field(7; Total; Decimal)
        {
            Caption = 'Total Including VAT';
            DecimalPlaces = 2 : 5;
        }
        field(8; Created; DateTime)
        {
            Caption = 'Created';
        }
        field(9; PreviousExpiryDate; DateTime)
        {
            Caption = 'Previous Expiry Date';
        }
        field(10; ExDate; DateTime)
        {
            Caption = 'Expiry Date';
        }
        field(11; State; Text[30])
        {
            Caption = 'Reversal State';
        }
        field(12; EligibleUntil; DateTime)
        {
            Caption = 'Eligible Until';
        }
        field(13; WithinWindow; Boolean)
        {
            Caption = 'Within Window';
        }
        field(14; CanReverse; Boolean)
        {
            Caption = 'Can Reverse';
        }
        field(15; BlockReason; Text[2048])
        {
            Caption = 'Block Reason';
        }
        field(16; CreditNoteId; BigInteger)
        {
            Caption = 'Credit Note ID';
        }
        field(17; HasCreditNoteId; Boolean)
        {
            Caption = 'Has Credit Note ID';
        }
        field(18; RawJsonPayload; Blob)
        {
            Caption = 'Raw JSON Payload';
            SubType = Memo;
        }
        field(19; LastUpdatedAt; DateTime)
        {
            Caption = 'Last Updated At';
        }
        field(20; LastUpdatedBy; Code[50])
        {
            Caption = 'Last Updated By';
        }
    }

    keys
    {
        key(PK; LedgerId)
        {
            Clustered = true;
        }
        key(CreatedKey; Created, LedgerId)
        {
        }
        key(DomainKey; DomainName, Created)
        {
        }
        key(ClientKey; ClientRoid, Created)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; LedgerId, DomainName, ClientRoid, Created)
        {
        }
    }
}
