table 57118 "Compliance Obligation"
{
    Caption = 'Compliance Obligation';
    DataClassification = CustomerContent;
    //LookupPageId = "Compliance Obligations";
   // DrillDownPageId = "Compliance Obligations";

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
                if Rec."No." <> xRec."No." then begin
                    EBoardSetup.GetRecordOnce();
                    EBoardSetup.TestField("Compliance Obligation Nos.");
                    NoSeries.TestManual(EBoardSetup."Compliance Obligation Nos.");
                end;
            end;
        }

        field(2; Title; Text[150])
        {
            Caption = 'Title';

            trigger OnValidate()
            begin
                Title := DelChr(Title, '<>');
            end;
        }

        field(3; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            TableRelation = "Compliance Category".Code where(Active = const(true));

            trigger OnValidate()
            var
                ComplianceCategory: Record "Compliance Category";
            begin
                if ComplianceCategory.Get("Category Code") then
                    if "Assigned User ID" = '' then
                        "Assigned User ID" := ComplianceCategory."Responsible User ID";
            end;
        }

        field(4; Frequency; Enum "Compliance Frequency")
        {
            Caption = 'Frequency';
        }

        field(5; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User';
            TableRelation = "User Setup"."User ID";
            ToolTip = 'Specifies the user responsible for this compliance obligation.';
        }

        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }

        field(7; "Next Due Date"; Date)
        {
            Caption = 'Next Due Date';

            trigger OnValidate()
            begin
                if ("Start Date" <> 0D) and
                   ("Next Due Date" < "Start Date") then
                    Error('Next Due Date cannot be earlier than the Start Date.');
            end;
        }

        field(8; "Reminder Days"; Integer)
        {
            Caption = 'Reminder Days';
            InitValue = 7;
            MinValue = 0;
            ToolTip = 'Specifies how many days before the due date reminder notifications are sent.';
        }

        field(9; Priority; Enum "Compliance Priority")
        {
            Caption = 'Priority';
        }

        field(10; "Evidence Required"; Boolean)
        {
            Caption = 'Evidence Required';
            ToolTip = 'Specifies whether supporting evidence must be attached when completing this obligation.';
        }

        field(11; Active; Boolean)
        {
            Caption = 'Active';
            InitValue = true;
        }

        field(12; Description; Text[2048])
        {
            Caption = 'Description';
        }

        field(13; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }

        field(14; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }

        field(15; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
        }

        field(16; "Last Modified By"; Code[50])
        {
            Caption = 'Last Modified By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }

        field(17; "Last Modified DateTime"; DateTime)
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

        key(Category; "Category Code", Active)
        {
        }

        key(UserDueDate; "Assigned User ID", "Next Due Date")
        {
        }
    }

    trigger OnInsert()
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Rec."No." = '' then begin
            EBoardSetup.GetRecordOnce();
            EBoardSetup.TestField("Compliance Obligation Nos.");
            Rec."No." := NoSeries.GetNextNo(EBoardSetup."Compliance Obligation Nos.", WorkDate(), true);
        end;

        Rec.TestField(Title);
        Rec.TestField("Category Code");
        Rec.TestField("Assigned User ID");
        Rec.TestField("Next Due Date");

        Rec."Created By" := UserId();
        Rec."Created DateTime" := CurrentDateTime();
    end;

    trigger OnModify()
    begin
        Rec.TestField(Title);
        Rec.TestField("Category Code");
        Rec.TestField("Assigned User ID");
        Rec.TestField("Next Due Date");

        Rec."Last Modified By" := UserId();
        Rec."Last Modified DateTime" := CurrentDateTime();
    end;

    trigger OnDelete()
    var
        ComplianceEntry: Record "Compliance Calendar Entry";
    begin
        ComplianceEntry.SetRange("Obligation No.", Rec."No.");

        if not ComplianceEntry.IsEmpty() then
            Error(
                'Compliance Obligation %1 cannot be deleted because compliance calendar entries already exist for it.',
                Rec."No.");
    end;
}