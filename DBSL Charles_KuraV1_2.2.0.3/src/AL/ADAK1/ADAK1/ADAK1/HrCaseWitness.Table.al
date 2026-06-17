#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69199 "Hr Case Witness"
{
    DrillDownPageID = "Hr Case Witness";
    LookupPageID = "Hr Case Witness";

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(2; "Case Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Witness Number"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Witness is Staff" = const(true)) Employee."No.";

            trigger OnValidate()
            begin
                if "Witness is Staff" = true then begin
                    Emp.Reset;
                    Emp.SetRange("No.", "Witness Number");
                    if Emp.FindSet then begin
                        "Witness Name" := Emp."First Name" + ' ' + Emp."Last Name";
                    end;
                end;


                //Validate Not  To Have 2 same witnesses
            end;
        }
        field(4; "Witness Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Witness Statement"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Witness is Staff"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Witness,Parties Involved';
            OptionMembers = Witness,"Parties Involved";
        }
        field(9; "Action Taken"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Prosecuted,Convicted,Referred For Administrative Action';
            OptionMembers = " ",Prosecuted,Convicted,"Referred For Administrative Action";
        }
        field(10; "Value of Assets/Money Taken"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Value of Assets/Money Recoved"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Email; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Contacts; Code[10])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
        }
        field(14; "Alternative Email"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Address; Text[250])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Employee No", "Case Number", "Witness Number")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
}

