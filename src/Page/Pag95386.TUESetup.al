page 95386 "TUE Setup"
{
    Caption = 'Therapeutic Use Exemption Setup';
    PageType = Card;
    SourceTable = "TUE Setup";
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Athlete Posting Group"; Rec."Default Athlete Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Athlete Posting Group field.';
                }
                field("DefaultAthlete Gen.Bus. PGroup"; Rec."DefaultAthlete Gen.Bus. PGroup")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Athlete Gen Bus.  Posting Group field.';
                }
                field("Athlete VAT Posting group"; Rec."Athlete VAT Posting group")
                {
                    ApplicationArea = aLL;
                    ToolTip = 'Specifies the value of the Default Athelete VAT posting Group field.';
                }
                field(MedicalPractitonerPostingGroup; Rec.MedicalPractitonerPostingGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Physician Posting Group field.';
                }
                field(DefaultPractitionerGenBusPGrp; Rec.DefaultPractitionerGenBusPGrp)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Medical Practitioner Gen Bus. Posting Group field.';
                }

                field("MedicalP VAT Posting Group"; Rec."MedicalP VAT Posting Group")
                {
                    ApplicationArea = aLL;
                    ToolTip = 'Specifies the value of the Default Physician VAT posting Group field.';
                }
                field("WHO ICD API Url"; Rec."WHO ICD API Url")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WHO ICD API Url field.';
                }
                field("WHO ICD API Client ID"; Rec."WHO ICD API Client ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WHO ICD API Client ID field.';

                }
                field("WHO ICD API Client Secret"; Rec."WHO ICD API Client Secret")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WHO ICD API Client Secret field.';
                }

            }
            group(Numbering)
            {
                field("Medical Practitioner's Nos"; Rec."Physician Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medical Practitioner''s Nos field.';
                }
                field("Athlete Nos"; Rec."Athlete Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Athlete Nos field.';
                }
                field("TUE Application Nos"; Rec."TUE Application Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Therapeutic Use Exemption Application Nos field.';
                }
            }
        }
    }
}
