table 50055 "Fuel Pool"
{
    Caption = 'Fuel Pool';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[100])
        {
        }
        field(20; "No Series"; Code[50])
        {

        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        FltMgtSetup.Get();
        FltMgtSetup.TestField("Fuel Pool Nos");
        if No = '' then begin
            rec."No" := NoSeriesMgt.GetNextNo(FltMgtSetup."Fuel Pool Nos", WorkDate(), true);
        end;
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Vehicles: Record "Fleet Vehicles.";
        AllocatedAmount: Record "Limit Types";
        LimitType: Record "Limit Types";
}
