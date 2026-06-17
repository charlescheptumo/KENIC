table 50134 "Fuel TopUp Entries"
{
    Caption = 'Fuel TopUp Entries';
    DataClassification = ToBeClassified;
    DrillDownPageId = Fueltopupentries;
    LookupPageId = Fueltopupentries;
    
    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
        field(2;"Entry No"; Integer)
        {
        AutoIncrement = true;

        }
        field(3;"Posting Date"; Date)
        {

        }
        field(4; "Card No"; Code[100])
        {
           
        }
        field(5; "Vendor No"; Code[30])
        {
        }
        field(6; "Vehicle Registration No."; text[100])
        {
  
        }
        field(7;Amount; Decimal)
        {
            
        }
    }
    keys
    {
        key(PK; "Document No.","Entry No")
        {
            Clustered = true;
        }
    }
}
