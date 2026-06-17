table 50090 "Board Members"
{
    Caption = 'Board Members';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Personal No"; code[50])
        {
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; Initials; Text[30])
        {
            Caption = 'Initials';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(6; "Search Name"; Code[250])
        {
            Caption = 'Search Name';

            trigger OnValidate()
            begin
                if "Search Name" = '' then
                    "Search Name" := SetSearchNameToFullnameAndInitials();
            end;
        }
        field(7; "Posting Group"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Employee Posting GroupX";
        }
        field(8; "Bank Account Number"; Code[100])
        {
        }
        field(9; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch");
                if EmployeeBank.FindSet() then begin
                    "Bank Branch Name" := EmployeeBank."Branch Name";
                end;
            end;
        }
        field(10; "Employee's Bank 2"; Code[80])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank 2");
                if EmployeeBank.FindSet() then begin
                    "Bank Name 2" := EmployeeBank."Bank Name";
                    "Bank Branch Name 2" := EmployeeBank."Branch Name";
                    "Bank Branch 2" := EmployeeBank."Bank Branch No.";
                end;
            end;
        }
        field(11; "Bank Branch 2"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch 2");
                if EmployeeBank.FindSet() then begin
                    "Bank Branch Name 2" := EmployeeBank."Branch Name";
                end;
            end;
        }
        field(12; "Bank Account No. 2"; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = ToBeClassified;
        }
        field(13; "Bank Name 2"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Bank Branch Name 2"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Employee's Bank"; Code[80])
        {
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank");
                if EmployeeBank.FindSet() then begin
                    "Bank Name" := EmployeeBank."Bank Name";
                    "Bank Branch Name" := EmployeeBank."Branch Name";
                    "Bank Branch" := EmployeeBank."Bank Branch No.";
                end;
            end;
        }
        field(16; "Bank Name"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Bank Branch Name"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "ID Number"; Text[30])
        {
        }
        field(19; "N.H.I.F No"; Code[20])
        {
        }
        field(20; "P.I.N"; Code[20])
        {
        }
        field(21; "Pay Mode"; Option)
        {
            OptionMembers = Bank,Cash,Cheque,"Bank Transfer";
        }
        field(22; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(23; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(24; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(25; "Company E-Mail"; Text[80])
        {
            Caption = 'Company Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("Company E-Mail");
            end;
        }
        field(26; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(27; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(28; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';
        }
        field(29; "No Series"; Code[250])
        {

        }
        field(30; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(32; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Designation/Role"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Personal No", "First Name", "Middle Name", "Last Name")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        HRSet.Get;
        HRSet.TestField("Board Member Nos");
        if "Personal No" = '' then
           "Personal No" := NoSeriesManagement.GetNextNo(HRSet."Board Member Nos", WorkDate(), true);
         //   NoSeriesManagement.InitSeries(HRSet."Board Member Nos", xRec."No Series", 0D, "Personal No", "No Series");
    end;

    trigger OnRename()
    begin
        "Last Modified Date Time" := CurrentDateTime;
        "Last Date Modified" := Today;
        UpdateSearchName();
    end;

    var
        EmployeeBank: Record "Employee Bank AccountX";
        NoSeriesManagement: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";

    local procedure UpdateSearchName()
    var
        PrevSearchName: Code[250];
    begin
        PrevSearchName := xRec.FullName() + ' ' + xRec.Initials;
        if ((("First Name" <> xRec."First Name") or ("Middle Name" <> xRec."Middle Name") or ("Last Name" <> xRec."Last Name") or
             (Initials <> xRec.Initials)) and ("Search Name" = PrevSearchName))
        then
            "Search Name" := SetSearchNameToFullnameAndInitials();
    end;

    local procedure SetSearchNameToFullnameAndInitials(): Code[250]
    begin
        exit(FullName() + ' ' + Initials);
    end;

    procedure FullName(): Text[100]
    var
        NewFullName: Text[100];
        Handled: Boolean;
    begin
        OnBeforeGetFullName(Rec, NewFullName, Handled);
        if Handled then
            exit(NewFullName);

        if "Middle Name" = '' then
            exit("First Name" + ' ' + "Last Name");

        exit("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetFullName(BoardMembers: Record "Board Members"; var NewFullName: Text[100]; var Handled: Boolean)
    begin
    end;
}
