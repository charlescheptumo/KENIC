#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69743 "Employee Exit Header"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var

            begin
                if "Document No." <> xRec."Document No." then begin
                    if ("Document Type" = "document type"::"Exit Voucher") then begin
                        HRSetup.Get;
                        NoSeriesMgt.TestManual(HRSetup."Exit voucher Nos");
                        "No. Series" := '';
                    end;
                    if ("Document Type" = "document type"::"Hand Over Voucher") then begin
                        HRSetup.Get;
                        NoSeriesMgt.TestManual(HRSetup."Exit HandOver Nos");
                        "No. Series" := '';
                    end;
                    if ("Document Type" = "document type"::"Final Dues Voucher") then begin
                        HRSetup.Get;
                        NoSeriesMgt.TestManual(HRSetup."Final Interview  Nos.");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Exit Voucher,Hand Over Voucher,Final Dues Voucher';
            OptionMembers = " ","Exit Voucher","Hand Over Voucher","Final Dues Voucher";
        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindFirst then begin
                    "Employee Names" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Date of Join" := Employee."Date Of Join";
                    "Position Id" := Employee."Current Position ID";
                    Validate("Position Id");
                end;
            end;
        }
        field(5; "Employee Names"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Exit Method"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exit Methods".Code;
        }
        field(7; "Position Id"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                PositionExitTemplates.Reset;
                PositionExitTemplates.SetRange("Postion ID", "Position Id");
                if PositionExitTemplates.FindSet then begin
                    repeat
                        ExitPlanLines.Init;
                        ExitPlanLines."Exit Header No" := "Document No.";
                        ExitPlanLines."Document Type" := "Document Type";
                        ExitPlanLines."Line No" := PositionExitTemplates.Code;
                        ExitPlanLines."Primary Directorate" := PositionExitTemplates."Primary Directorate";
                        ExitPlanLines."Primary Directorate Name" := PositionExitTemplates."Primary Directorate Name";
                        ExitPlanLines."Primary Department" := PositionExitTemplates."Primary Department";
                        ExitPlanLines."Primary Department Name" := PositionExitTemplates."Primary Department Name";
                        ExitPlanLines.Insert;
                    until PositionExitTemplates.Next = 0;
                end;
            end;
        }
        field(8; "Reasons Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reasons for Exit".Code;
        }
        field(9; "Date of Join"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Last working Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Notice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Employee Exit Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "No of Hand Over Notes"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "No of Open Hand Over Notes"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "No of Open Hand Cleared Notes"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Hand Over Process';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(23; "Primary Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Hand Over Process';
        }
        field(24; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Hand Over Process';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(25; "Primary Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Hand Over Process';
        }
        field(26; "Responsible Employee"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Hand Over Process';
            TableRelation = Employee."No.";
        }
        field(27; "Planned Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Hand Over Process';
        }
        field(28; "Actual Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Hand Over Process';
        }
        field(29; "Approval Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved;
            OptionCaption = 'Open,Pending Approval,Approved';
        }
        field(30; "Requires Exit Interview"; Boolean)
        {
            Caption = 'Requires Exit Interview';
        }
        field(31; "Requires Clearance"; Boolean)
        {
            Caption = 'Requires Clearance';
        }
        field(32; "Requires Notice"; Boolean)
        {
            Caption = 'Requires Notice';
        }
        field(33; "Has Terminal Benefits"; Boolean)
        {
            Caption = 'Has Terminal Benefits';
        }
        field(34; "Has Termination Grounds"; Boolean)
        {
            Caption = 'Requires Termination Grounds';
        }
        field(35; "Use Leave Days"; Boolean)
        {

        }
        field(36; "No of Leave Days to Use"; Decimal)
        {

        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.Get();
        if ("Document Type" = "document type"::"Exit Voucher") then begin
            HRSetup.TestField("Exit voucher Nos");
            if "Document No." = '' then
                "Document No." := NoSeriesMgt.GetNextNo(HRSetup."Exit Voucher Nos", WorkDate(), true);
        end;
        if ("Document Type" = "document type"::"Hand Over Voucher") then begin
            HRSetup.TestField("Exit HandOver Nos");
            if "Document No." = '' then
                "Document No." := NoSeriesMgt.GetNextNo(HRSetup."Exit HandOver Nos", WorkDate(), true);
        end;
        if ("Document Type" = "document type"::"Final Dues Voucher") then begin
            HRSetup.TestField("Exit Final Dues Nos");
            if "Document No." = '' then
                "Document No." := NoSeriesMgt.GetNextNo(HRSetup."Exit Final Dues Nos", WorkDate(), true);

        end;
        "Created By" := UserId;
        "Created On" := Today;
        "Document Date" := Today;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
        Employee: Record Employee;
        ExitPlanLines: Record "Exit Plan Lines";
        PositionExitTemplates: Record "Position Exit Templates";
}

