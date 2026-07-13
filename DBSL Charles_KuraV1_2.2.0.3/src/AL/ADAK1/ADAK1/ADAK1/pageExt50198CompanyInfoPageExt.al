pageextension 50198 "CompanyInfoPageExt" extends "Company Information"
{
    layout
    {
        addfirst(factboxes)
        {
            part(EstablishmentStats; "EstablishmentStatsFactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Primary Key" = field("Primary Key");
            }
        }
    }
}