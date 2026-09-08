table 58162 "Registrar Domain Count Buffer"
{
    Caption = 'Registrar Domain Count Buffer';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; "Registrar Roid"; Code[50])
        {
            Caption = 'Registrar ROID';
        }
        field(2; "Registrar Name"; Text[150])
        {
            Caption = 'Registrar Name';
        }
        field(3; Jan; Integer) { Caption = 'Jan'; }
        field(4; Feb; Integer) { Caption = 'Feb'; }
        field(5; Mar; Integer) { Caption = 'Mar'; }
        field(6; Apr; Integer) { Caption = 'Apr'; }
        field(7; May; Integer) { Caption = 'May'; }
        field(8; Jun; Integer) { Caption = 'Jun'; }
        field(9; Jul; Integer) { Caption = 'Jul'; }
        field(10; Aug; Integer) { Caption = 'Aug'; }
        field(11; Sep; Integer) { Caption = 'Sep'; }
        field(12; Oct; Integer) { Caption = 'Oct'; }
        field(13; Nov; Integer) { Caption = 'Nov'; }
        field(14; Dec; Integer) { Caption = 'Dec'; }
        field(15; Total; Integer) { Caption = 'Total'; }
        
        
        field(16; Year_Jan; Integer) { Caption = 'Year Jan'; }
        field(17; Year_Feb; Integer) { Caption = 'Year Feb'; }
        field(18; Year_Mar; Integer) { Caption = 'Year Mar'; }
        field(19; Year_Apr; Integer) { Caption = 'Year Apr'; }
        field(20; Year_May; Integer) { Caption = 'Year May'; }
        field(21; Year_Jun; Integer) { Caption = 'Year Jun'; }
        field(22; Year_Jul; Integer) { Caption = 'Year Jul'; }
        field(23; Year_Aug; Integer) { Caption = 'Year Aug'; }
        field(24; Year_Sep; Integer) { Caption = 'Year Sep'; }
        field(25; Year_Oct; Integer) { Caption = 'Year Oct'; }
        field(26; Year_Nov; Integer) { Caption = 'Year Nov'; }
        field(27; Year_Dec; Integer) { Caption = 'Year Dec'; }
    }

    keys
    {
        key(PK; "Registrar Roid")
        {
            Clustered = true;
        }
        key(Name; "Registrar Name")
        {
        }
    }
}