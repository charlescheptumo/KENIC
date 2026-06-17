table 99220 "TUE Medication Details"
{
    Caption = 'TUE Medication Details';


    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            trigger OnValidate()
            var
                TUEHeader: Record "TUE Application Header";
            begin
                /*TUEHeader.Reset();
                TUEHeader.SetRange("No.", Rec."Document No.");
                if TUEHeader.FindFirst() then
                    Rec."Athlete No." := TUEHeader."Customer No.";*/
            end;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Prohibited Substance"; Code[70])
        {
            Caption = 'Prohibited Substance/Method';
            TableRelation = if (Type = const(Substance)) "Prohibited Substances"."Substance Code"
            else
            if (Type = const(Method)) "Prohibited Methods".Method;
            trigger onValidate()
            begin
                if (Type = Type::Substance) then begin
                    ProhibitedSubstance.Reset();
                    ProhibitedSubstance.SetRange("Substance Code", Rec."Prohibited Substance");
                    if ProhibitedSubstance.FindFirst() then begin
                        "Substance Description" := ProhibitedSubstance."Substance Description";
                        Category := ProhibitedSubstance.Category;
                        "Sub Category" := ProhibitedSubstance."Sub Category";
                    end;
                end else
                    if (Type = Type::Method) then begin
                        ProhibitedMethod.Reset();
                        ProhibitedMethod.SetRange(Method, Rec."Prohibited Substance");
                        if ProhibitedMethod.FindFirst() then begin
                            "Substance Description" := ProhibitedMethod.Description;
                            Category := ProhibitedMethod.Category;
                            "Sub Category" := ProhibitedMethod."Sub Category"
                        end;
                    end;
            end;
        }
        field(4; "Substance Description"; Text[200])
        {
            Caption = 'Prohibited Substance/Method Description';
            Editable = false;
        }
        field(5; Dosage; Decimal)
        {
            Caption = 'Dosage';
        }
        field(6; "Route Of Administration"; Code[100])
        {
            Caption = 'Route Of Administration';
            TableRelation = "Routes of Administration"."Route of Administration";
        }
        field(7; Frequency; Code[50])
        {
            Caption = 'Frequency';
        }
        field(8; "Duration of Treatment"; Duration)
        {
            Caption = 'Duration of Treatment';
        }
        field(9; Type; Enum "Prohibition Type")
        {

        }
        field(10; "Athlete No."; Code[20])
        {

        }
        field(11; Approved; Boolean)
        {

        }
        field(12; Category; Code[150])
        {

        }
        field(13; "Sub Category"; Code[150])
        {

        }
        field(14; "Medical Practitioner"; Code[20])
        {

        }
    }
    keys
    {
        key(PK; "Document No.", "Prohibited Substance", "Athlete No.", "Medical Practitioner")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Diagnos: Record Diagnosis;
    begin
        Diagnos.Reset();
        Diagnos.SetRange("Document No.", Rec."Document No.");
        if Diagnos.FindLast() then
            Rec."Line No." := Diagnos."Line No." + 1
        else
            Rec."Line No." := 0;
    end;

    var
        ProhibitedSubstance: Record "Prohibited Substances";
        ProhibitedMethod: Record "Prohibited Methods";
}
