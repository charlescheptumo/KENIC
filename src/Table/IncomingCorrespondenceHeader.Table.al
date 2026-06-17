#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50082 "Incoming Correspondence Header"
{
    Caption = 'Incoming Correspondence Header';

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "External Reference No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Internal Reference No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Project Correspondence?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Project No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Get("Project No");
                "Project Name" := ObjJob.Description;
            end;
        }
        field(10; "Project Name"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Correspondence Source"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incoming Correspondence Source".Code;

            trigger OnValidate()
            begin
                IncomingCorrespondenceSource.Get("Correspondence Source");
                "Correspondence Source Name" := IncomingCorrespondenceSource.Name;
            end;
        }
        field(12; "Sender No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Correspondence Contact".No;

            trigger OnValidate()
            begin
                if CorrespondenceContact.Type = CorrespondenceContact.Type::Company then begin
                    CorrespondenceContact.Reset;
                    CorrespondenceContact.SetRange(CorrespondenceContact.No, "Sender No");
                    if CorrespondenceContact.FindSet then begin
                        "Sender Type" := CorrespondenceContact.Type;
                        "Sender Contact Person Title" := CorrespondenceContact."Contact PersonTitle";
                        "Sender Contact Person Name" := CorrespondenceContact."Contact Person Name";
                        "Sender Name" := CorrespondenceContact."Company Name";
                        "Sender Address" := CorrespondenceContact.Address;
                        "Sender Address 2" := CorrespondenceContact."Address 2";
                        "Sender Email" := CorrespondenceContact."E-mail";
                        "Sender Phone No" := CorrespondenceContact."Phone No";
                    end;
                end else begin
                    CorrespondenceContact.Reset;
                    CorrespondenceContact.SetRange(CorrespondenceContact.No, "Sender No");
                    if CorrespondenceContact.FindSet then begin
                        "Sender Type" := CorrespondenceContact.Type;
                        "Sender Name" := CorrespondenceContact."Company Name";
                        "Sender Address" := CorrespondenceContact.Address;
                        "Sender Address 2" := CorrespondenceContact."Address 2";
                        "Sender Email" := CorrespondenceContact."E-mail";
                        "Sender Phone No" := CorrespondenceContact."Phone No";
                    end;
                end;
            end;
        }
        field(13; "Sender Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Sender Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Sender Address"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Sender Address 2"; Code[500])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Sender Phone No"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
        field(19; "Communication Summary"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Correspondence Source Name"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Sender Contact Person Title"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Sender Contact Person Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Sender Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Individual,Company';
            OptionMembers = Individual,Company;
        }
        field(24; "Notifications Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Notification DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Response Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Response DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Response No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Assign To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(31; "Assignment Remarks"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Current Recipient"; Code[100])
        {
            FieldClass = Normal;
        }
        field(33; "Urgency Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Normal,Urgent';
            OptionMembers = Normal,Urgent;

            trigger OnLookup()
            var
                IncomingCorrespondence: Record "Detail Self Inspection Result";
            begin
            end;
        }
        field(34; "Assigned By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Correspondence File Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Correspondence File SubType"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Status := Status::Draft;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);

        if "Document No" = '' then begin
            HumanResourcesSetup.Get();
            HumanResourcesSetup.TestField("Incoming Correspondence Nos");
            "Document No" := NoSeriesManagement.GetNextNo(HumanResourcesSetup."Incoming Correspondence Nos", WorkDate(), true);
            //  NoSeriesManagement.InitSeries(HumanResourcesSetup."Incoming Correspondence Nos", xRec."No. Series", Today, "Document No", "No. Series");
        end;
        UserSetup.Get("Created By");
        "Region Code" := UserSetup."Region Code";
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        ObjJob: Record Job;
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit "No. Series";
        InternalProjectResource: Record "Internal Project Resource";
        UserSetup: Record "User Setup";
        Positions: Record Positions;
        GeneralCorrespondenceLine: Record "General Correspondence Line";
        IncomingCorrespondenceSource: Record "Incoming Correspondence Source";
        CorrespondenceContact: Record "Correspondence Contact";

    procedure AssistEdit(OldIncomingCorrespondence: Record "Incoming Correspondence Header"): Boolean
    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        HRSetup.Get();
        HRSetup.TestField("Incoming Correspondence Nos");
        begin
            // Generate the next number from the selected series
            Rec."Document No" := NoSeriesMgt.GetNextNo(
                Rec."No. Series",
                WorkDate(),
                true
            );

            Rec.Validate("No. Series", Rec."No. Series");
            exit(true);
        end;

        exit(false);
    end;
}

