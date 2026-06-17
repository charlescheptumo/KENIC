#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50123 "tableextension50123" extends "Employee Ledger Entry"
{
    LookupPageID = "Employee Ledger Entries";
    DrillDownPageID = "Employee Ledger Entries";
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".


        //Unsupported feature: Property Modification (Editable) on ""Remaining Amount"(Field 14)".


        //Unsupported feature: Property Deletion (Editable) on "Amount(Field 13)".
        field(50000; "Imprest Document Type"; Option)
        {
           OptionMembers = " ","Standing Imprest", "Standing Imprest Surrender";
           DataClassification = ToBeClassified;
        }
        field(50001; "Financial Year"; Code[20])
        {
            TableRelation = "Financial Year Code";
            DataClassification = ToBeClassified;

        }
        field(50002;"EXternal Document No."; code[50])
        {
            DataClassification = ToBeClassified;
        }
      field(50003;"Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }
}

