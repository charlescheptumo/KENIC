tableextension 60007 "Sales Header" extends "Sales Header"
{
    fields
    {
        field(60500; "Sales Type Code"; Code[20])
        {
            TableRelation = "Sales Type Code".Code;
        }
        field(60501; "Invoice Status Code"; Code[30])
        {
            TableRelation = "Invoice Status Code".Code;
        }
        field(60502; "Invoice Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(60512; "Refund Reason"; Code[5])
        {
            TableRelation = "eTims-Refund Reasons".Code;
        }
    }
}



