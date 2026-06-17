#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69742 "Position Exit Templates"
{

    fields
    {
        field(1; "Postion ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID";
        }
        field(2; "Code"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Directorate");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Directorate Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(8; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Department");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Department Name" := ResponsibilityCenter.Name;
                    "Responsible Employee" := ResponsibilityCenter."Current Head";
                end;
            end;
        }
        field(26; "Primary Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Primary Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Responsible Employee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
    }

    keys
    {
        key(Key1; "Postion ID", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

