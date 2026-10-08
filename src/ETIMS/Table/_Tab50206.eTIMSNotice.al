/// <summary>
/// Stores notices/announcements retrieved from eTIMS (notice number, title, content, detail URL, registration info).
/// </summary>
table 50206 "ETIMS Notice"
{
    fields
    {
        field(1; "Notice No"; Integer) { }
        field(2; Title; Text[150]) { }
        field(3; Content; Text[250]) { }
        field(4; "Detail URL"; Text[250]) { }
        field(5; "Registered By"; Text[50]) { }
        field(6; "Register Date"; Text[20]) { }
    }

    keys
    {
        key(PK; "Notice No")
        {
            Clustered = true;
        }
    }
}
