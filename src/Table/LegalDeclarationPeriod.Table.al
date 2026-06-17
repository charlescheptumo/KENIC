#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50038 "Legal Declaration Period"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(5; "Closed By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Closed On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Process Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Wealth Management,Gift Management,Legal Advice,Corruption Prevention Voucher,Lease Agreement,Memorandum of Understanding  ,Conflict of Interest,Gifts Given';
            OptionMembers = " ","Wealth Management","Gift Management","Legal Advice","Corruption Prevention Voucher","Lease Agreement","Memorandum of Understanding  ","Conflict of Interest","Gifts Given";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created On" := CreateDatetime(Today, Time);
        LegalDeclarationPeriod.Reset;
        LegalDeclarationPeriod.SetRange(Closed, false);
        if LegalDeclarationPeriod.FindFirst then
            Error('ERROR! There already exists an open Period');
    end;

    var
        LegalDeclarationPeriod: Record "Legal Declaration Period";
}

