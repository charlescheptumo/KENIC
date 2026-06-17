tableextension 50153 "Misc. Article Information Ext" extends "Misc. Article Information"
{
    fields
    {
        field(50000; No; Code[250])
        {
            TableRelation = IF (Type = CONST(Asset)) "Fixed Asset"."No.";
        }
        field(50001; Type; Option)
        {
            OptionMembers = Asset,Item,File,Other;
            OptionCaption = 'Asset,Item,File,Other';
        }
        field(50002; "Primary Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Primary Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Primary Department"; Code[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(Code, "Primary Department");
                IF ResponsibilityCenter.FIND('-') THEN BEGIN
                    "Primary Department Name" := ResponsibilityCenter.Name;
                    //"Responsible Employee":=ResponsibilityCenter."Current Head";
                END;
            end;
        }
        field(50005; "Primary Directorate"; Code[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(Code, "Primary Directorate");
                IF ResponsibilityCenter.FIND('-') THEN BEGIN
                    "Primary Directorate Name" := ResponsibilityCenter.Name;
                END;
            end;
        }
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";

}
