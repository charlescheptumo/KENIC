/// <summary>
/// Stores taxpayer/customer registry data (TIN, taxpayer name/status, province/district/sector, location description) retrieved from eTIMS for customer lookups.
/// </summary>
table 50205 "ETIMS Customer"
{
    fields
    {
        field(1; "TIN"; Code[20]) { }
        field(2; "Taxpayer Name"; Text[100]) { }
        field(3; "Taxpayer Status"; Code[10]) { }
        field(4; "Province Name"; Text[50]) { }
        field(5; "District Name"; Text[50]) { }
        field(6; "Sector Name"; Text[50]) { }
        field(7; "Location Description"; Text[100]) { }
    }

    keys
    {
        key(PK; "TIN")
        {
            Clustered = true;
        }
    }
}
