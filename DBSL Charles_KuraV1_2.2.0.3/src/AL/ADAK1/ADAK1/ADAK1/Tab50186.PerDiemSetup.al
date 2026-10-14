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
            Caption = 'Staff Per Diem Taxable Earning (no longer used)';
            TableRelation = EarningsX;
        }
        field(6; "PD Advance Deduction"; Code[20])
        {
            Caption = 'Staff Per Diem Paid in Advance Deduction';
            TableRelation = DeductionsX;

            trigger OnValidate()
            begin
                CheckDifferentDeductions();
            end;
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
        field(13; "PD Tax Deduction"; Code[20])
        {
            Caption = 'Staff Per Diem Tax Deduction';
            TableRelation = DeductionsX;

            trigger OnValidate()
            begin
                CheckDifferentDeductions();
            end;
        }
        field(14; "PD Tax %"; Decimal)
        {
            Caption = 'Per Diem Tax % (above daily limit)';
            InitValue = 30;
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        SameDeductionErr: Label 'The tax deduction and the paid-in-advance deduction must be different codes. Create a separate deduction (for example PD-REC) for per diems paid in advance.';

    local procedure CheckDifferentDeductions()
    begin
        if ("PD Tax Deduction" <> '') and ("PD Tax Deduction" = "PD Advance Deduction") then
            Error(SameDeductionErr);
    end;
}
