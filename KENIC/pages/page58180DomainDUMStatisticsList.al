page 58180 "Domain DUM Statistics List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Domain DUM Statistics";
    SourceTableView = sorting("As Of Date", "Registrar Name") order(descending);
    Caption = 'Domain DUM Statistics';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("As Of Date"; Rec."As Of Date") { ApplicationArea = All; ToolTip = 'Specifies the snapshot date.'; }
                field("Registrar Roid"; Rec."Registrar Roid") { ApplicationArea = All; ToolTip = 'Specifies the registrar ROID.'; }
                field("Registrar Name"; Rec."Registrar Name") { ApplicationArea = All; ToolTip = 'Specifies the registrar name.'; }
                field("DUM Count"; Rec."DUM Count") { ApplicationArea = All; ToolTip = 'Specifies the number of active domains currently under this registrar.'; }
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
                    ReportMgt: Codeunit "Domain DUM Report Mgt";
                begin
                    ReportMgt.RefreshStatistics(Today, '');
                    CurrPage.Update(false);
                end;
            }
        }
        area(reporting)
        {
            action(DomainDUMReport)
            {
                Caption = 'Domain DUM Report';
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Domain DUM Report";
                ToolTip = 'Opens the Domains Under Management report.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("As Of Date", Today);
    end;
}