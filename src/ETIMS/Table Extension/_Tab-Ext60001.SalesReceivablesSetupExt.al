tableextension 60001 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {

        field(60000; "Etims Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }


}
