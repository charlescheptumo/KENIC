table 58121 "Board Declaration Header"
{
    Caption = 'Board Declaration Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "Board Member No."; Code[20])
        {
            Caption = 'Board Member No.';
            DataClassification = CustomerContent;
            TableRelation = "Board Members"."Personal No";
        }

        field(3; "Board Member Name"; Text[250])
        {
            Caption = 'Board Member Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Members"."First Name" where("Personal No" = field("Board Member No.")));
            Editable = false;
        }

        field(4; "Declaration Type"; Enum "Declaration Type")
        {
            Caption = 'Declaration Type';
            DataClassification = CustomerContent;
            InitValue = Annual;

            // trigger OnValidate()
            // begin

            //     if "Declaration Type" = "Declaration Type"::Annual then
            //         "Meeting No." := '';
            //     "Agenda No." := '';
            // end;
        }

        // field(5; "Meeting No."; Code[20])
        // {
        //     Caption = 'Meeting No.';
        //     DataClassification = CustomerContent;
        //     TableRelation = if ("Declaration Type" = const(Meeting)) "Board Meetings"."No";

        //     trigger OnValidate()
        //     begin

        //         if "Meeting No." <> xRec."Meeting No." then
        //             "Agenda No." := '';
        //     end;
        // }
        field(6; "Declaration Date"; Date)
        {
            Caption = 'Declaration Date';
            DataClassification = CustomerContent;
        }

        field(7; "Financial Interests"; Blob)
        {
            Caption = 'Financial Interests';
            DataClassification = CustomerContent;
        }

        field(8; "Directorships"; Blob)
        {
            Caption = 'Directorships';
            DataClassification = CustomerContent;
        }

        field(9; "Employment"; Blob)
        {
            Caption = 'Employment';
            DataClassification = CustomerContent;
        }

        field(10; "Relationships"; Blob)
        {
            Caption = 'Relationships';
            DataClassification = CustomerContent;
        }

        field(11; "Other Interests"; Blob)
        {
            Caption = 'Other Interests';
            DataClassification = CustomerContent;
        }

        field(12; "Declaration Status"; Enum "Declaration Status")
        {
            Caption = 'Declaration Status';
            DataClassification = CustomerContent;
            InitValue = Open;

            trigger OnValidate()
            begin
                // Automatically stamp submitted/reviewed metadata when status changes
                if "Declaration Status" = "Declaration Status"::Submitted then begin
                    "Declaration Date" := WorkDate();
                    "Submitted DateTime" := CurrentDateTime();
                end;

                if "Declaration Status" = "Declaration Status"::Approved then begin
                    "Reviewed By" := UserSecurityId();
                    "Reviewed DateTime" := CurrentDateTime();
                end;
            end;
        }

        field(13; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            Editable = false;
        }

        field(14; "Submitted DateTime"; DateTime)
        {
            Caption = 'Submitted DateTime';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(15; "Reviewed By"; Code[50])
        {
            Caption = 'Reviewed By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            Editable = false;
        }

        field(16; "Reviewed DateTime"; DateTime)
        {
            Caption = 'Reviewed DateTime';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(17; "Declaration Year"; Integer)
        {
            Caption = 'Declaration Year';
             Editable = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if ("Declaration Year" <> 0) and (("Declaration Year" < 2000) or ("Declaration Year" > 2100)) then
                    Error('The Declaration Year must be a 4-digit year between 2000 and 2100.');
            end;
        }

        // field(17; "Agenda No."; Code[20])
        // {
        //     Caption = 'Agenda No.';
        //     DataClassification = CustomerContent;

        //     TableRelation = if ("Declaration Type" = const(Meeting)) "Board Meeting Agenda"."Agenda No." where("Meeting No." = field("Meeting No."));

        //     trigger OnValidate()
        //     begin

        //         if ("Agenda No." <> '') and ("Meeting No." = '') then
        //             Error('You must select a Meeting No. before choosing an Agenda Item.');
        //     end;
        // }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            EBoardSetup.GetRecordOnce();
            EBoardSetup.TestField("Declaration Nos.");
            "No." := NoSeries.GetNextNo(EBoardSetup."Declaration Nos.", WorkDate(), true);
        end;

        if "Declaration Year" = 0 then
            "Declaration Year" := Date2DMY(WorkDate(), 3);
        "Created By" := UserId();

        // if "Declaration Date" = 0D then
        //     "Declaration Date" := WorkDate();

    end;
}