table 57116 "Compliance Category"
{
    Caption = 'Compliance Category';
    DataClassification = CustomerContent;
   LookupPageId = "Compliance Categories";
    DrillDownPageId = "Compliance Categories";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';

            trigger OnValidate()
            var
                EBoardSetup: Record "E-Board Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if Code <> xRec.Code then begin
                    EBoardSetup.GetRecordOnce();
                    EBoardSetup.TestField("Compliance Category Nos.");
                    NoSeries.TestManual(EBoardSetup."Compliance Category Nos.");
                end;
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Responsible User ID"; Code[50])
        {
            Caption = 'Responsible User';
            TableRelation = "User Setup"."User ID";
            ToolTip = 'Default user ID responsible for oversight of this category.';
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
            InitValue = true;
        }
        field(5; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(6; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }
        field(7; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
        }
        field(8; "Last Modified By"; Code[50])
        {
            Caption = 'Last Modified By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }
        field(9; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
            Editable = false;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Code = '' then begin
            EBoardSetup.GetRecordOnce();
            EBoardSetup.TestField("Compliance Category Nos.");
            Code := NoSeries.GetNextNo(EBoardSetup."Compliance Category Nos.", WorkDate(), true);
        end;

        "Created By" := UserId();
        "Created DateTime" := CurrentDateTime();
    end;

    trigger OnModify()
    begin
        "Last Modified By" := UserId();
        "Last Modified DateTime" := CurrentDateTime();
    end;

    trigger OnDelete()
    var
        ComplianceObligation: Record "Compliance Obligation";
    begin
        ComplianceObligation.SetRange("Category Code", Code);
        if not ComplianceObligation.IsEmpty() then
            Error('You cannot delete category %1 because it is referenced by one or more compliance obligations.', Code);
    end;
}