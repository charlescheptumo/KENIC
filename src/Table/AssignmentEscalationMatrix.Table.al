#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60026 "Assignment Escalation Matrix"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Complaints,Complements,Feedback,Enquiries,Whistle';
            OptionMembers = " ",Complaints,Complements,Feedback,Enquiries,Whistle;
        }
        field(3; "Assigned Officer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                /*IF UserSetup.GET("Assigned Officer No.") THEN BEGIN
                  "Assigned Officer Email" := UserSetup."E-Mail";
                  "Assigned Officer Name" := UserSetup."Employee Name";
                END;
                */
                if Employee.Get("Assigned Officer No.") then begin
                    "Assigned Officer Email" := Employee."E-Mail";
                    if Employee."E-Mail" = '' then
                        "Assigned Officer Email" := Employee."Company E-Mail";
                    "Assigned Officer Name" := Employee.FullName;
                end;

            end;
        }
        field(4; "Assigned Officer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Assigned Officer Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Level; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(8; Comment; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Assigned By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Assigned At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(12; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(44; "Assign To"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '....,Staff,HOD,CEO';
            OptionMembers = "....",Staff,HOD,CEO;
        }
        field(45; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", "Document Type", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimMgt: Codeunit DimensionManagement;
        Employee: Record Employee;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Assignment Escalation Matrix", "No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;
}

