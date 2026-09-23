page 58178 "Domain Acct Statistics List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Domain Acct Mgr Statistics";
    SourceTableView = sorting(Year, "Month No.", "Section Code", "Salesperson Code") order(descending);
    Caption = 'Domain Account Manager Statistics';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salesperson Code"; Rec."Salesperson Code") { ApplicationArea = All; ToolTip = 'Specifies the account manager code.'; }
                field(Year; Rec.Year) { ApplicationArea = All; ToolTip = 'Specifies the year.'; }
                field("Month No."; Rec."Month No.") { ApplicationArea = All; ToolTip = 'Specifies the numerical month.'; }
                field("Month Name"; Rec."Month Name") { ApplicationArea = All; ToolTip = 'Specifies the name of the month.'; }
                field("Section Code"; Rec."Section Code") { ApplicationArea = All; ToolTip = 'Specifies Registration, Renewal or Membership.'; }
                field("Section Description"; Rec."Section Description") { ApplicationArea = All; ToolTip = 'Specifies the section description.'; }
                field("Target Qty"; Rec."Target Qty") { ApplicationArea = All; ToolTip = 'Specifies the budgeted target quantity.'; }
                field("Actual Qty"; Rec."Actual Qty") { ApplicationArea = All; ToolTip = 'Specifies the actual quantity achieved.'; }
                field("% Achieved"; Rec."% Achieved") { ApplicationArea = All; ToolTip = 'Specifies Actual as a percentage of Target.'; }
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
                    ReportMgt: Codeunit "Domain Acct Mgr Report Mgt";
                begin
                    ReportMgt.RefreshStatistics('', DMY2Date(1, 1, Date2DMY(Today, 3)), Today);
                    CurrPage.Update(false);
                end;
            }
        }
        area(reporting)
        {
            action(DomainAcctMgrReport)
            {
                Caption = 'Domain Account Manager Report';
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Domain Account Manager Report";
                ToolTip = 'Opens the domain account manager performance report.';
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