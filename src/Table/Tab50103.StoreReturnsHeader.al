table 50103 "Store Returns Header"
{
    Caption = 'Store Returns Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    ProcSetup.Get;
                    NoSeriesMgt.TestManual(ProcSetup."Return to Store Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Requestor ID"; Code[50])
        {
            Caption = 'Requestor ID';
            TableRelation = User."User Name";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                UserSetup.Reset();
                UserSetup.SetRange("User ID", Rec."Requestor ID");
                if UserSetup.FindFirst() then begin
                    "Requestor No." := UserSetup."Employee No.";
                    Rec.Validate("Requestor No.");
                end;
            end;
        }
        field(3; "Requestor No."; Code[20])
        {
            Caption = 'Requestor No.';
            TableRelation = Employee;
            Editable = false;

            trigger OnValidate()
            begin
                Emp.Reset();
                Emp.SetRange("No.", Rec."Requestor No.");
                if Emp.FindFirst() then begin
                    "Requestor Name" := Emp.FullName();
                    "Department Code" := Emp."Department Code";

                    FA.Reset;
                    FA.SetRange("Responsible Employee", Emp."No.");
                    if FA.FindSet() then
                        repeat
                            StoreReturnLines.Init();
                            StoreReturnLines."Document No." := Rec."No.";
                            StoreReturnLines."Line No." := FnGetLastLineNo;
                            StoreReturnLines."No." := FA."No.";
                            StoreReturnLines.Description := FA.Description;
                            StoreReturnLines."Serial No." := FA."Serial No.";
                            StoreReturnLines.Insert();
                        until FA.Next() = 0;
                end;
            end;
        }
        field(4; "Requestor Name"; Text[250])
        {
            Caption = 'Requestor Name';
            Editable = false;
        }
        field(5; "Department Code"; Code[100])
        {
            Caption = 'Department Code';
            Editable = false;
        }
        field(6; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Department Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Editable = false;
        }
        field(8; "Return Date"; Date)
        {
            Caption = 'Return Date';
        }
        field(9; Description; Text[2048])
        {
            Caption = 'Reason for returning';
        }
        field(10; Recommendations; Option)
        {
            Caption = 'Recommendations By Tech. Unit';
            OptionMembers = ,Dispose,"Re-use",Repair;
            OptionCaption = ',Dispose,Re-use,Repair';
        }
        field(11; Status; Enum "App Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(12; "Item Status"; Text[2048])
        {
            Caption = 'Item Status';
        }
        field(13; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(14; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Last DateTime Modified"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.", "Requestor ID", "Requestor No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            ProcSetup.Get;
            ProcSetup.TestField("Return to Store Nos");
            rec."No." := NoSeriesMgt.GetNextNo(ProcSetup."Return to Store Nos", WorkDate(), true);
        end;

        // "Requestor ID" := UserId;
        "Document Date" := Today;

        // Rec.Validate("Requestor ID");
        // Rec.Validate("Requestor No.");

        SetModifiedDateTime;
    end;

    trigger OnModify()
    begin
        SetModifiedDateTime();
    end;

    trigger OnRename()
    begin
        SetModifiedDateTime();
    end;

    trigger OnDelete()
    begin
        StoreReturnLines.Reset();
        StoreReturnLines.SetRange("Document No.", Rec."No.");
        StoreReturnLines.DeleteAll();
    end;

    var
        Emp: Record Employee;
        UserSetup: Record "User Setup";
        StoreReturnLines: Record "Store Returns Lines";
        ProcSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit "No. Series";
        FA: Record "Fixed Asset";

    local procedure SetModifiedDateTime()
    begin
        "Last Date Modified" := Today;
        "Last DateTime Modified" := CurrentDateTime;
    end;

    local procedure FnGetLastLineNo() LineNumber: Integer
    begin
        StoreReturnLines.Reset;
        if StoreReturnLines.FindLast() then
            LineNumber := StoreReturnLines."Line No." + 1
        else
            LineNumber := 1;
        exit(LineNumber);
    end;
}
