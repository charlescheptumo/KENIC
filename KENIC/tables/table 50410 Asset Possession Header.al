/// <summary>
/// Table Asset Possession Header (ID 50410).
/// Part I (Staff Details) and Part VI (Declaration) of the Asset Possession Form.
/// </summary>
table 50410 "Asset Possession Header"
{
    Caption = 'Asset Possession Form';
    DataClassification = CustomerContent;
    LookupPageId = "Asset Possession List";
    DrillDownPageId = "Asset Possession List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Asset Possession Nos");
                    "No. Series" := '';
                end;
            end;
        }
        // ---------- PART I: STAFF DETAILS ----------
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Staff Number';
            TableRelation = Employee;

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if "Employee No." = '' then begin
                    "Staff Name" := '';
                    "Date Engaged" := 0D;
                    "End Date" := 0D;
                    "Department Name" := '';
                    Position := '';
                    exit;
                end;

                Employee.Get("Employee No.");
                "Staff Name" := CopyStr(Employee.FullName(), 1, MaxStrLen("Staff Name"));
                "Date Engaged" := Employee."Employment Date";
                "End Date" := Employee."Date Of Leaving";
                "Department Name" := Employee."Department Name";
                Position := Employee."Job Title";
            end;
        }
        field(3; "Staff Name"; Text[100])
        {
            Caption = 'Staff Name';
            Editable = false;
        }
        field(4; "Staff Type"; Enum "Staff Engagement Type")
        {
            Caption = 'Staff Type';
        }
        field(5; "Date Engaged"; Date)
        {
            Caption = 'Date Engaged';
        }
        field(6; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(7; "Department Name"; Text[100])
        {
            Caption = 'Department';
        }
        field(8; Position; Text[100])
        {
            Caption = 'Position';
        }
        // ---------- DOCUMENT ----------
        field(9; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Editable = false;
        }
        field(10; Status; Enum "Asset Possession Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        // ---------- PART VI: DECLARATION ----------
        field(20; "Declaration Accepted"; Boolean)
        {
            Caption = 'Declaration Accepted';
        }
        field(21; "Received By Name"; Text[100])
        {
            Caption = 'Received By - Name';
        }
        field(22; "Received By Date"; Date)
        {
            Caption = 'Received By - Date';
        }
        field(23; "Received By Remark"; Text[250])
        {
            Caption = 'Received By - Remark';
        }
        field(24; "Issued By User ID"; Code[50])
        {
            Caption = 'Issued By - User ID';
            Editable = false;
            TableRelation = User."User Name";
        }
        field(25; "Issued By Name"; Text[100])
        {
            Caption = 'Issued By - Name';
        }
        field(26; "Issued By Date"; Date)
        {
            Caption = 'Issued By - Date';
        }
        field(27; "Issued By Remark"; Text[250])
        {
            Caption = 'Issued By - Remark';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Employee; "Employee No.")
        {
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Asset Possession Nos");
            Rec."No." := NoSeriesMgt.GetNextNo(HRSetup."Asset Possession Nos", WorkDate(), true);
        end;

        "Document Date" := Today;
        "Issued By User ID" := CopyStr(UserId(), 1, MaxStrLen("Issued By User ID"));
        "Issued By Name" := CopyStr(UserId(), 1, MaxStrLen("Issued By Name"));

        PopulateLinesFromSetup();
    end;

    trigger OnDelete()
    var
        AssetLine: Record "Asset Possession Line";
    begin
        TestField(Status, Status::Open);

        AssetLine.SetRange("Document No.", "No.");
        AssetLine.DeleteAll(false);
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";

    procedure PopulateLinesFromSetup()
    var
        AssetItem: Record "Asset Possession Item";
        AssetLine: Record "Asset Possession Line";
        LineNo: Integer;
    begin
        AssetLine.SetRange("Document No.", "No.");
        if not AssetLine.IsEmpty() then
            exit;

        if AssetItem.FindSet() then
            repeat
                LineNo += 10000;
                AssetLine.Init();
                AssetLine."Document No." := "No.";
                AssetLine."Line No." := LineNo;
                AssetLine."Line Type" := AssetItem."Line Type";
                AssetLine."Item Code" := AssetItem.Code;
                AssetLine.Description := AssetItem.Description;
                AssetLine."Track By Quantity" := AssetItem."Track By Quantity";
                AssetLine."Details Required" := AssetItem."Details Required";
                AssetLine.Insert(true);
            until AssetItem.Next() = 0;
    end;

    procedure IssueDocument()
    var
        AssetLine: Record "Asset Possession Line";
        NothingIssuedErr: Label 'Tick at least one item (equipment, furniture, key or phone) before issuing the form.';
    begin
        TestField(Status, Status::Open);
        TestField("Employee No.");
        TestField("Staff Type");
        TestField("Declaration Accepted", true);
        TestField("Received By Name");
        TestField("Issued By Name");

        AssetLine.SetRange("Document No.", "No.");
        AssetLine.SetRange(Issued, true);
        if AssetLine.IsEmpty() then
            Error(NothingIssuedErr);

        if AssetLine.FindSet() then
            repeat
                AssetLine.CheckLineBeforeIssue();
            until AssetLine.Next() = 0;

        if "Received By Date" = 0D then
            "Received By Date" := Today;
        if "Issued By Date" = 0D then
            "Issued By Date" := Today;

        Status := Status::Issued;
        Modify(true);
    end;

    procedure ReopenDocument()
    begin
        TestField(Status, Status::Issued);
        Status := Status::Open;
        Modify(true);
    end;
}
