#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56045 "Visitors Pass"
{

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            var
                CRMSet: Record "Crm General Setup.";
            begin
                if No <> xRec.No then begin
                    CRMSet.Get;
                    NoSeriesMgt.TestManual(CRMSet."Visitor Pass Nos");
                    "No series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            Editable = false;
        }
        field(3; "Created By"; Code[100])
        {
        }
        field(4; "Date Created"; Date)
        {
        }
        field(5; "Time Created"; Time)
        {
        }
        field(6; "Date of visit"; Date)
        {
        }
        field(7; "Time of visit"; Time)
        {
        }
        field(8; "Visitor Name"; Text[250])
        {
        }
        field(9; "ID No"; Code[50])
        {
        }
        field(10; "Mobile No."; Code[50])
        {
        }
        field(11; From; Text[250])
        {
        }
        field(12; "Officer to see No"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Empl.Get("Officer to see No") then begin
                    "Officer to see Name" := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";
                    "Officers User ID" := Empl."User ID";
                end;
            end;
        }
        field(13; "Officer to see Name"; Text[250])
        {
        }
        field(14; Reason; Text[250])
        {
        }
        field(15; "No. Series"; Code[20])
        {
        }
        field(16; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval';
            OptionMembers = Open,Released,"Pending Approval";
        }
        field(17; "Customer From"; Text[100])
        {
        }
        field(18; "Officers Comment"; Text[100])
        {
        }
        field(19; "Last Modified By User ID"; Code[50])
        {
            Caption = 'Last Modified By User ID';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(20; "Officers User ID"; Code[20])
        {
        }
        field(21; "No series"; Code[30])
        {
        }
        field(22; "Time Out"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Remarks; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Visitor Type"; Option)
        {
            OptionMembers = "",Employee,Visitor;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        UserSetup.Get(UserId);
        UserSetup.TestField(Receiptionist, true);
        if No = '' then begin
            CRMSet.Get;
            CRMSet.TestField(CRMSet."Visitor Pass Nos");
       No  := NoSeriesMgt.GetNextNo(CRMSet."Visitor Pass Nos", WorkDate(), true);
        end;

        "Document Date" := Today;
    end;

    trigger OnModify()
    begin
        "Last Modified By User ID" := UserId;
    end;

    var
        Empl: Record Employee;
        NoSetup: Record "No. Series";
        CRMSet: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit "No. Series";
        UserMgt: Codeunit "User Management";
        UserSetup: Record "User Setup";
}

