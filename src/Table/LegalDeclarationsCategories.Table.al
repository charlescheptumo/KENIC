#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50037 "Legal Declarations Categories"
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
        field(3; "Process Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Wealth Management,Gift Management,Legal Advice,Corruption Prevention Voucher,Lease Agreement,Memorandum of Understanding  ,Conflict of Interest,Gifts Given';
            OptionMembers = " ","Wealth Management","Gift Management","Legal Advice","Corruption Prevention Voucher","Lease Agreement","Memorandum of Understanding  ","Conflict of Interest","Gifts Given";
        }
        field(4; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Category Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "MOU  Categories Setup"."Category Code";

            trigger OnValidate()
            begin
                MOUCategoriesSetup.Reset;
                MOUCategoriesSetup.SetRange("Category Code", "Category Code");
                if MOUCategoriesSetup.FindSet then
                    Description := MOUCategoriesSetup.Description;
            end;
        }
    }

    keys
    {
        key(Key1; No, "Line No", "Category Code")
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
        MOUCategoriesSetup: Record "MOU  Categories Setup";
}

