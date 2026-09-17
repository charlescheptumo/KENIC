page 58176 "Domain Zone Statistics API"
{
    PageType = API;
    Caption = 'domainZoneStatistics';
    APIPublisher = 'kenic';
    APIGroup = 'domains';
    APIVersion = 'v1.0';
    EntityName = 'domainZoneStatistic';
    EntitySetName = 'domainZoneStatistics';
    SourceTable = "Domain Zone Statistics";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId) { Caption = 'Id'; }
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; }
                field(year; Rec.Year) { Caption = 'Year'; }
                field(monthNo; Rec."Month No.") { Caption = 'Month No.'; }
                field(monthName; Rec."Month Name") { Caption = 'Month Name'; }
                field(zoneCode; Rec."Zone Code") { Caption = 'Zone Code'; }
                field(zoneDescription; Rec."Zone Description") { Caption = 'Zone Description'; }
                field(domainCount; Rec."Domain Count") { Caption = 'Domain Count'; }
                field(percentage; Rec.Percentage) { Caption = 'Percentage'; }
                field(lastUpdated; Rec."Last Updated") { Caption = 'Last Updated'; }
            }
        }
    }
}