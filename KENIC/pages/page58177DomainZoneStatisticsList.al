page 58177 "Domain Zone Statistics List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Domain Zone Statistics";
    Caption = 'Domain Zone Statistics';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Year; Rec.Year) { ApplicationArea = All; }
                field("Month Name"; Rec."Month Name") { ApplicationArea = All; }
                field("Zone Code"; Rec."Zone Code") { ApplicationArea = All; }
                field("Zone Description"; Rec."Zone Description") { ApplicationArea = All; }
                field("Domain Count"; Rec."Domain Count") { ApplicationArea = All; }
                field(Percentage; Rec.Percentage) { ApplicationArea = All; }
                field("Last Updated"; Rec."Last Updated") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshCurrentYear)
            {
                Caption = 'Refresh Current Year';
                ApplicationArea = All;
                Image = Refresh;

                trigger OnAction()
                var
                    DomainZoneClassificationMgt: Codeunit "Domain Zone Classification Mgt";
                begin
                    DomainZoneClassificationMgt.RefreshStatistics(Date2DMY(Today, 3));
                    CurrPage.Update(false);
                end;
            }
        }
        area(reporting)
        {
            action(DomainZoneReport)
            {
                Caption = 'Domain Zone Report';
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Domain Zone Report";
            }
        }
    }
}