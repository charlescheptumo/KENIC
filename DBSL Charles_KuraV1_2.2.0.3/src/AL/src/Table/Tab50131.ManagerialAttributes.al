table 50131 "Managerial Attributes PA"
{
    Caption = 'Managerial Attributes';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Performance Evaluation ID"; Code[100])
        {

            TableRelation = "Perfomance Evaluation".No;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;

        }
        field(3;Description; Text[250])
        {     
        }
        field(4;"Very good";Code[255])
        {
       

        }
         field(10;"Very good1";Boolean)
        {
        trigger OnValidate()
         begin
         ValidateTickOnlyOne(FieldNo("Very good1"));
        end;

        }
        field(5;"Managerial Template ID";Code[100])
        {

        }
         field(6;"Good";Boolean)
        {

        trigger OnValidate()
        begin
         ValidateTickOnlyOne(FieldNo(Good));
        end;

        }
         field(7;"Satifactory";Boolean)
        {
            trigger OnValidate()
           begin
          ValidateTickOnlyOne(FieldNo(Satifactory));
          end;


        }
         field(8;"Fair";Boolean)
        {
             trigger OnValidate()
        begin
         ValidateTickOnlyOne(FieldNo(Fair));
        end;

        }
         field(9;"Poor";Boolean)
        {
             trigger OnValidate()
        begin
        ValidateTickOnlyOne(FieldNo(Poor));
        end;

        }
    }
    keys
    {
        key(PK; "Performance Evaluation ID","Line No","Managerial Template ID")
        {
            Clustered = true;
        }
    }

    procedure ValidateTickOnlyOne(FieldID: Integer)
var
    RecRef: RecordRef;
    FieldRef: FieldRef;
    i: Integer;
begin
    RecRef.GetTable(Rec);
    // loop through the fields
    for i := 1 to RecRef.FieldCount do begin
        FieldRef := RecRef.FieldIndex(i);
        if FieldRef.Number <> FieldID then
            if FieldRef.Type = FieldType::Boolean then
                FieldRef.Value(false);
    end;
    //Save Changes to the record
    RecRef.SetTable(Rec);
end;



}
