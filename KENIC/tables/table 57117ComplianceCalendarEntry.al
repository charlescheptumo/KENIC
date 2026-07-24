table 57117 "Compliance Calendar Entry"
{
    Caption = 'Compliance Calendar Entry';
    DataClassification = CustomerContent;
    LookupPageId = "Compliance Calendar Entries";
    DrillDownPageId = "Compliance Calendar Entries";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                EBoardSetup: Record "E-Board Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    EBoardSetup.GetRecordOnce();
                    EBoardSetup.TestField("Compliance Entry Nos.");
                    NoSeries.TestManual(EBoardSetup."Compliance Entry Nos.");
                end;
            end;
        }

        field(2; "Obligation No."; Code[20])
        {
            Caption = 'Obligation No.';
            TableRelation = "Compliance Obligation"."No.";

            trigger OnValidate()
            var
                ComplianceObligation: Record "Compliance Obligation";
            begin
                if ComplianceObligation.Get("Obligation No.") then begin
                    "Category Code" := ComplianceObligation."Category Code";
                    Title := ComplianceObligation.Title;
                    Description := ComplianceObligation.Description;

                   
                    if "Assigned Employee No." = '' then
                        "Assigned Employee No." := ComplianceObligation."Primary Employee No.";
                end;
            end;
        }

        field(3; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            TableRelation = "Compliance Category".Code;
        }

        field(4; Title; Text[150])
        {
            Caption = 'Title / Requirement';
        }

        field(5; Description; Text[2048])
        {
            Caption = 'Detailed Description';
        }

        field(6; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }

        field(7; "Assigned Employee No."; Code[20])
        {
            Caption = 'Assigned Employee No.';
            TableRelation = Employee."No.";
        }

        field(8; Status; Enum "Compliance Entry Status")
        {
            Caption = 'Status';

            trigger OnValidate()
            begin
                case Status of
                    Status::Completed:
                        if "Completion Date" = 0D then
                            "Completion Date" := WorkDate();
                    else
                        "Completion Date" := 0D;
                end;
            end;
        }

        field(9; "Completion Date"; Date)
        {
            Caption = 'Completion Date';
        }

        field(10; "Proof Attached"; Boolean)
        {
            Caption = 'Proof Attached';
            Editable = false;
        }

        field(11; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }

        field(12; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
        }

        field(13; "Last Modified By"; Code[50])
        {
            Caption = 'Last Modified By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }

        field(14; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(Key2; "Due Date", Status)
        {
        }

        key(Key3; "Assigned Employee No.", Status)
        {
        }

        key(Key4; "Obligation No.", "Due Date")
        {
        }
    }

    trigger OnInsert()
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            EBoardSetup.GetRecordOnce();
            EBoardSetup.TestField("Compliance Entry Nos.");
            "No." := NoSeries.GetNextNo(EBoardSetup."Compliance Entry Nos.", WorkDate(), true);
        end;

        "Created By" := UserId();
        "Created DateTime" := CurrentDateTime();
    end;

    trigger OnModify()
    begin
        "Last Modified By" := UserId();
        "Last Modified DateTime" := CurrentDateTime();
    end;
}