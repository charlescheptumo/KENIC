namespace KENIC.KENIC;

page 50386 "Get Domain Adjustments"
{
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Get Domain Adjustments';
    layout
    {
        area(Content)
        {
            group(Filters)
            {
                field(StartDate; StartDate) { ApplicationArea = All; Caption = 'Start Date'; }
                field(EndDate; EndDate) { ApplicationArea = All; Caption = 'End Date'; }
                field(PageSize; PageSize)
                {
                    ApplicationArea = All;
                    Caption = 'Page Size';
                    MinValue = 1;
                    MaxValue = 500;
                    ToolTip = 'Number of records per request. All pages are retrieved automatically.';
                }
            }
        }
    }
    var
        StartDate: Date;
        EndDate: Date;
        PageSize: Integer;

    trigger OnOpenPage()
    begin
        EndDate := Today();
        StartDate := CalcDate('<-CM>', EndDate);
        PageSize := 100;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        IntegrationMgt: Codeunit COCCAIntegration;
    begin
        if CloseAction <> Action::OK then
            exit(true);
        Message(IntegrationMgt.GetAdjustmentsByDateRange(StartDate, EndDate, PageSize));
        exit(true);
    end;
}
