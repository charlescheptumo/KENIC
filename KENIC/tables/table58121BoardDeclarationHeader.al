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
            Editable = false;
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
            Editable = false;
        }

        // field(7; "Financial Interests"; Blob)
        // {
        //     Caption = 'Financial Interests';
        //     DataClassification = CustomerContent;
        // }

        // field(8; "Directorships"; Blob)
        // {
        //     Caption = 'Directorships';
        //     DataClassification = CustomerContent;
        // }

        // field(9; "Employment"; Blob)
        // {
        //     Caption = 'Employment';
        //     DataClassification = CustomerContent;
        // }

        // field(10; "Relationships"; Blob)
        // {
        //     Caption = 'Relationships';
        //     DataClassification = CustomerContent;
        // }

        // field(11; "Other Interests"; Blob)
        // {
        //     Caption = 'Other Interests';
        //     DataClassification = CustomerContent;
        // }

        field(12; "Declaration Status"; Enum "Declaration Status")
        {
            Caption = 'Declaration Status';
            DataClassification = CustomerContent;
            InitValue = Open;

            trigger OnValidate()
            begin

                if "Declaration Status" = "Declaration Status"::Submitted then begin
                    "Declaration Date" := Today();
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

        field(18; "Convicted of Crime"; Boolean)
        {
            Caption = 'Have you ever been convicted of a criminal offence?';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if not "Convicted of Crime" then
                    "Conviction Details" := '';
            end;
        }

        field(19; "Conviction Details"; Text[250])
        {
            Caption = 'Conviction Details';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(20; "Bankrupt or Insolvent"; Boolean)
        {
            Caption = 'Have you ever been declared bankrupt or insolvent?';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if not "Bankrupt or Insolvent" then
                    "Bankruptcy Details" := '';
            end;
        }

        field(21; "Bankruptcy Details"; Text[250])
        {
            Caption = 'Bankruptcy Details';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(22; "Involved in Litigation"; Boolean)
        {
            Caption = 'Are you currently involved in litigation affecting your duties?';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if not "Involved in Litigation" then
                    "Litigation Details" := '';
            end;
        }

        field(23; "Litigation Details"; Text[250])
        {
            Caption = 'Litigation Details';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(24; "Received Gifts/Hospitality"; Boolean)
        {
            Caption = 'Have you received gifts or hospitality influencing independence?';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if not "Received Gifts/Hospitality" then
                    "Gifts Details" := '';
            end;
        }

        field(25; "Gifts Details"; Text[250])
        {
            Caption = 'Gifts/Hospitality Details';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(26; "Family Employed in Org"; Boolean)
        {
            Caption = 'Do you have close family employed by or doing business with the organization?';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if not "Family Employed in Org" then
                    "Family Details" := '';
            end;
        }

        field(27; "Family Details"; Text[250])
        {
            Caption = 'Family Member Details';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(28; "Other Conflict Matter"; Boolean)
        {
            Caption = 'Aware of any other matter that could cause a conflict?';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if not "Other Conflict Matter" then
                    "Other Conflict Details" := '';
            end;
        }

        field(29; "Other Conflict Details"; Text[250])
        {
            Caption = 'Other Conflict Details';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(30; "Declaration Statement Accepted"; Boolean)
        {
            Caption = 'I declare that the provided information is true, complete and accurate.';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(31; "Electronic Signature"; Text[100])
        {
            Caption = 'Electronic Signature (Full Name)';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }

        field(32; "Published"; Boolean)
        {
            Caption = 'Published';
            DataClassification = CustomerContent;
            Editable = false;

            // trigger OnValidate()
            // begin
              
            //     if Published then
            //         TestField("Declaration Status", "Declaration Status"::Draft);
            // end;
        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        TestField("Declaration Status", "Declaration Status"::Open);
    end;

    trigger OnInsert()
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            EBoardSetup.GetRecordOnce();
            EBoardSetup.TestField("Declaration Nos.");
            "No." := NoSeries.GetNextNo(EBoardSetup."Declaration Nos.", Today(), true);
        end;

        if "Declaration Year" = 0 then
            "Declaration Year" := Date2DMY(Today(), 3);
        "Created By" := UserId();

        // if "Declaration Date" = 0D then
        //     "Declaration Date" := WorkDate();

    end;
}