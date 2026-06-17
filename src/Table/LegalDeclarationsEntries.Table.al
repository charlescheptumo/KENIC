#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50036 "Legal Declarations Entries"
{

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "PF Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Name of Staff"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                Customers.Reset;
                Customers.SetRange("No.", "Institution Code");
                if Customers.FindSet then begin
                    "Institution Name" := Customers.Name;

                end;
            end;
        }
        field(6; "Institution Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Job Group"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Designation; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Male,Female,Other';
            OptionMembers = Male,Female,Other;
        }
        field(10; "Process Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Wealth Management,Gift Management,Legal Advice,Corruption Prevention Voucher,Lease Agreement,Memorandum of Understanding  ,Conflict of Interest,Gifts Given';
            OptionMembers = " ","Wealth Management","Gift Management","Legal Advice","Corruption Prevention Voucher","Lease Agreement","Memorandum of Understanding  ","Conflict of Interest","Gifts Given";
        }
        field(11; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(12; "Memorandum Categories"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Legal Declarations Categories"."Category Code";
        }
        field(13; "Submission Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Declared,Not Declared';
            OptionMembers = " ",Declared,"Not Declared";
        }
        field(14; "Entity Giving"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Value of Gift"; Decimal)
        {
            Caption = 'Estimated Value';
            DataClassification = ToBeClassified;
        }
        field(16; "Purpose of Gift"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Date of Gift"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Decision; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'For Officer,For Organization,To be Returned';
            OptionMembers = "For Officer","For Organization","To be Returned";

            trigger OnValidate()
            begin
                if Decision = Decision::"For Officer" then begin
                    CrmGeneralSetup1.Get;
                    if "Value of Gift" > CrmGeneralSetup1."Maximum Value of Gift" then begin
                        Error('The value of the gift has exceeded the maximum value allowed of %1', CrmGeneralSetup1."Maximum Value of Gift");
                    end;
                end;
            end;
        }
        field(20; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
        field(21; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(22; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23; Period; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Legal Declaration Period".Code where(Closed = const(false));
        }
        field(24; "Occassion Gift was Offered"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Date of declaration of gift"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Name of officer given the gift"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Designation of the officer"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Nature of Conflict"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(29; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CrmGeneralSetup: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        Customers: Record Customer;
        Employee: Record Employee;
        CrmGeneralSetup1: Record "Crm General Setup.";
}

