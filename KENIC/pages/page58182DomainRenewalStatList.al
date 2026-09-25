page 58182 "Domain Renewal Stat List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Domain Renewal Statistics";
    SourceTableView = sorting(Year, "Month No.", "Registrar Name") order(descending);
    Caption = 'Domain Renewal Statistics';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Registrar Roid"; Rec."Registrar Roid") { ApplicationArea = All; ToolTip = 'Specifies the registrar ROID.'; }
                field("Registrar Name"; Rec."Registrar Name") { ApplicationArea = All; ToolTip = 'Specifies the registrar name.'; }
                field(Year; Rec.Year) { ApplicationArea = All; ToolTip = 'Specifies the year.'; }
                field("Month No."; Rec."Month No.") { ApplicationArea = All; ToolTip = 'Specifies the numerical month.'; }
                field("Month Name"; Rec."Month Name") { ApplicationArea = All; ToolTip = 'Specifies the name of the month.'; }
                field("Renewal Count"; Rec."Renewal Count") { ApplicationArea = All; ToolTip = 'Specifies the number of domains renewed.'; }
                field("Last Updated"; Rec."Last Updated") { ApplicationArea = All; ToolTip = 'Specifies the last refresh timestamp.'; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshNow)
            {
                Caption = 'Refresh Now';
                ApplicationArea = All;
                Image = Refresh;

                trigger OnAction()
                var
                    ReportMgt: Codeunit "Domain Renewal Report Mgt";
                begin
                    ReportMgt.RefreshStatistics(DMY2Date(1, 1, Date2DMY(Today, 3)), Today);
                    CurrPage.Update(false);
                end;
            }
        }
        area(reporting)
        {
            action(DomainRenewalsReport)
            {
                Caption = 'Domain Renewals Report';
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Domain Renewals Report";
                ToolTip = 'Opens the domain renewals by registrar report.';
            }
        }
    }

    trigger OnOpenPage()
    var
        CurrentYear: Integer;
        CurrentMonth: Integer;
    begin
        CurrentYear := Date2DMY(Today, 3);
        CurrentMonth := Date2DMY(Today, 2);

        Rec.Reset();
        if Rec.FindSet() then
            repeat
                if (Rec.Year < CurrentYear) or ((Rec.Year = CurrentYear) and (Rec."Month No." <= CurrentMonth)) then
                    Rec.Mark(true);
            until Rec.Next() = 0;
        Rec.MarkedOnly(true);
    end;
}