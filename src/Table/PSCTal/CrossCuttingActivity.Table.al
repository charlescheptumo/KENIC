#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80270 "Cross Cutting Activity"
{
    // DrillDownPageID = 90450;
    // LookupPageID = 90450;

    fields
    {
        field(1; "Entry No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Cross Cutting Item"; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*CrossCuttingSetup.RESET;
                CrossCuttingSetup.SETRANGE(Code,"Cross Cutting Item");
                IF CrossCuttingSetup.FIND('-') THEN BEGIN
                      Description:=CrossCuttingSetup.Name;
                      Division:=CrossCuttingSetup.Division;
                      Department:=CrossCuttingSetup.Department;
                   END;*/

            end;
        }
        field(3; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Division; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(5; Department; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));

            trigger OnValidate()
            begin
                CrossCuttingActivity.Reset;
                CrossCuttingActivity.SetCurrentkey("Entry No", Division, Department, "Cross Cutting Item");
                CrossCuttingActivity.SetRange(Division, Division);
                CrossCuttingActivity.SetRange(Department, Department);
                CrossCuttingActivity.SetAscending("Cross Cutting Item", true);
                if not CrossCuttingActivity.FindLast then begin
                    "Cross Cutting Item" := '01';
                    "Entry No" := Department + '_' + "Cross Cutting Item";
                end else begin
                    "Cross Cutting Item" := IncStr(CrossCuttingActivity."Cross Cutting Item");
                    "Entry No" := CrossCuttingActivity.Department + '_' + "Cross Cutting Item";
                    // VALIDATE("Entry No");
                end;
            end;
        }
        field(6; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Created at"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", Division, Department)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        CrossCuttingActivity: Record "Cross Cutting Activity";
    begin
        "Created at" := Today;
        "Created By" := UserId;
    end;

    var
        CrossCuttingSetup: Record "Cross Cutting Setup";
        CrossCuttingActivity: Record "Cross Cutting Activity";
}
