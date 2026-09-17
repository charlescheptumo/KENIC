page 58177 "Domain Zone Statistics List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Domain Zone Statistics";
    SourceTableView = sorting(Year, "Month No.", "Zone Code") order(descending);
    Caption = 'Domain Zone Statistics';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the registration year.';
                }
                field("Month No."; Rec."Month No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the numerical month.';
                }
                field("Month Name"; Rec."Month Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the month.';
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the zone classification code.';
                }
                field("Zone Description"; Rec."Zone Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the domain zone.';
                }
                field("Domain Count"; Rec."Domain Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of domain registrations for the zone.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the percentage share of total monthly domain registrations.';
                }
                field("Last Updated"; Rec."Last Updated")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last system update timestamp.';
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(DomainZoneReport)
            {
                Caption = 'Domain Zone Report';
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Domain Zone Report";
                ToolTip = 'Opens the domain zone registration report.';
            }
        }
    }

    trigger OnOpenPage()
    var
        DomainZoneClassificationMgt: Codeunit "Domain Zone Classification Mgt";
    begin
        DomainZoneClassificationMgt.RefreshStatistics(Date2DMY(Today, 3));

    end;
}