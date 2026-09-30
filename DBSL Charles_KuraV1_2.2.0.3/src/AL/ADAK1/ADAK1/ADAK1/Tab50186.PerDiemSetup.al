table 50650 "Per Diem Setup"
{
    Caption = 'Per Diem Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Daily Tax-Free Limit"; Decimal)
        {
            Caption = 'Daily Tax-Free Limit';
            InitValue = 10000;
            MinValue = 0;
        }
        field(3; "Accommodation %"; Decimal)
        {
            Caption = 'Accommodation % of Imprest Amount';
            InitValue = 40;
            MinValue = 0;
            MaxValue = 100;
        }
        field(4; "PD Non-Taxable Earning"; Code[20])
        {
            Caption = 'Staff Per Diem Non-Taxable Earning';
            TableRelation = EarningsX;
        }
        field(5; "PD Taxable Earning"; Code[20])
        {
            Caption = 'Staff Per Diem Taxable Earning';
            TableRelation = EarningsX;
        }
        field(6; "PD Advance Deduction"; Code[20])
        {
            Caption = 'Staff Per Diem Paid in Advance Deduction';
            TableRelation = DeductionsX;
        }
        field(7; "Dir. PD Non-Taxable Earning"; Code[20])
        {
            Caption = 'Board Per Diem Non-Taxable Earning';
            TableRelation = "Directors Earnings";
        }
        field(8; "Dir. PD Taxable Earning"; Code[20])
        {
            Caption = 'Board Per Diem Taxable Earning';
            TableRelation = "Directors Earnings";
        }
        field(9; "Dir. PD Advance Deduction"; Code[20])
        {
            Caption = 'Board Per Diem Paid in Advance Deduction';
            TableRelation = "Director Deductions";
        }
        field(10; "Per Diem Clearing Account"; Code[20])
        {
            Caption = 'Per Diem Clearing G/L Account';
            TableRelation = "G/L Account" where("Account Type" = const(Posting));
        }
        field(11; "Director Per Diem Work Type"; Code[10])
        {
            Caption = 'Board Per Diem Work Type';
            TableRelation = "Work Type";
        }
        field(12; "Director Per Diem G/L Account"; Code[20])
        {
            Caption = 'Board Per Diem Vote G/L Account';
            TableRelation = "G/L Account" where("Account Type" = const(Posting));
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
