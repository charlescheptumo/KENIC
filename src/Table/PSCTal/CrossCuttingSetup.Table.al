#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80269 "Cross Cutting Setup"
{
    // DrillDownPageID = 90449;
    // LookupPageID = 90449;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Division; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(4; Department; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        CrossCuttingSetup.Reset;
        CrossCuttingSetup.SetRange(Code, Code);
        if CrossCuttingSetup.FindLast then
            // Code:='01'
            //ELSE
            Code := IncStr(CrossCuttingSetup.Code);
        Validate(Code);
    end;

    var
        CrossCuttingSetup: Record "Cross Cutting Setup";
}
