page 58179 "Domain Deletion List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Domain Deletion Statistics";
    SourceTableView = sorting(Year, "Month No.", "Registrar Roid") order(descending);
    Caption = 'Domain Deletion Statistics';
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
                field("Registration Count"; Rec."Registration Count") { ApplicationArea = All; ToolTip = 'Specifies the number of registrations.'; }
                field("Renewal Count"; Rec."Renewal Count") { ApplicationArea = All; ToolTip = 'Specifies the number of renewals.'; }
                field("Deleted Count"; Rec."Deleted Count") { ApplicationArea = All; ToolTip = 'Specifies Registration Count minus Renewal Count.'; }
                field("Last Updated"; Rec."Last Updated") { ApplicationArea = All; ToolTip = 'Specifies the last refresh timestamp.'; }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(DomainDeletionReport)
            {
                Caption = 'Domain Deletion Report';
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Domain Deletion Report";
                ToolTip = 'Opens the domain deletion report.';
            }
        }
    }

    trigger OnOpenPage()
    var
        ReportMgt: Codeunit "Domain Deletion Report Mgt";
        CurrentYear: Integer;
        CurrentMonth: Integer;
    begin
        CurrentYear := Date2DMY(Today, 3);
        CurrentMonth := Date2DMY(Today, 2);
        ReportMgt.RefreshStatistics(DMY2Date(1, 1, CurrentYear), Today);

        Rec.Reset();
        if Rec.FindSet() then
            repeat
                if (Rec.Year < CurrentYear) or ((Rec.Year = CurrentYear) and (Rec."Month No." <= CurrentMonth)) then
                    Rec.Mark(true);
            until Rec.Next() = 0;
        Rec.MarkedOnly(true);
    end;
}