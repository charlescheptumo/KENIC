table 58144 "ESign Header"
{
    DataClassification = CustomerContent;
    Caption = 'ESign Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            var
                EBoardSetup: Record "E-Board Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    EBoardSetup.GetRecordOnce();
                    NoSeries.TestManual(EBoardSetup."E-Signing Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Title; Text[100])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Pending,Approved,Posted,Completed,Rejected,Cancelled;
            OptionCaption = 'Open,Pending,Approved,Posted,Completed,Rejected,Cancelled';
            InitValue = Open;
            DataClassification = CustomerContent;
        }
        field(5; "Document URL"; Text[2048])
        {
            Caption = 'Original Document URL';
            DataClassification = CustomerContent;
            ExtendedDatatype = URL;
        }
        field(6; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
        }
        field(7; "Created Date"; DateTime)
        {
            Caption = 'Created Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Approval Status"; Option)
        {
            Caption = 'Approval Status';
            OptionMembers = Open,"Pending Approval",Rejected,Released;
            OptionCaption = 'Open,Pending Approval,Rejected, Released';
            InitValue = Open;
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(11; "Signed Document URL"; Text[2048])
        {
            Caption = 'Signed Document URL';
            DataClassification = CustomerContent;
            ExtendedDatatype = URL;
        }
        field(12; "Initiator Name"; Text[100])
        {
            Caption = 'Initiator Name';
            Editable = true;
        }

        field(13; "Board Member Code"; Code[100])
        {
            Caption = 'Initiator Name';
            Editable = true;
        }

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
            EBoardSetup.TestField("E-Signing Nos.");
            "No. Series" := EBoardSetup."E-Signing Nos.";
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series", Today(), true);
        end;

        "Created By" := UserId();
        "Created Date" := CurrentDateTime();
    end;


    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

        TestField(Status, Status::Open);
        TestField("Approval Status", "Approval Status"::Open);
    end;

    procedure CheckIfEditable()
    begin
        if (Rec.Status <> Rec.Status::Open) or (Rec."Approval Status" <> Rec."Approval Status"::Open) then
            Error('Modification is only allowed when the document status is Open.');
    end;
}