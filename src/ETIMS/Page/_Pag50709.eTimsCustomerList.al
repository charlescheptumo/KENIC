/// <summary>
/// Read-only list of customer/taxpayer records pulled down from KRA eTIMS (TIN, taxpayer name/status, location), used to review data synced from the eTIMS middleware.
/// </summary>
page 50709 "eTims-Customer List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Customer List';
    PageType = List;
    SourceTable = "ETIMS Customer";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("TIN"; Rec."TIN") { }
                field("Taxpayer Name"; Rec."Taxpayer Name") { }
                field("Taxpayer Status"; Rec."Taxpayer Status") { }
                field("Province Name"; Rec."Province Name") { }
                field("District Name"; Rec."District Name") { }
                field("Sector Name"; Rec."Sector Name") { }
                field("Location Description"; Rec."Location Description") { }
            }
        }
    }
}
