namespace KENIC.KENIC;

page 50371 "Get Registrants"
{
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Get Registrars';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Search Criteria';

                field(SearchType; SearchType)
                {
                    ApplicationArea = All;
                    Caption = 'Search Type';
                    OptionCaption = 'Zone Name,Client ID,Date Range';
                    ToolTip = 'Specifies whether registrars are retrieved by zone name, client ID, or creation date range.';

                    trigger OnValidate()
                    begin
                        Clear(ZoneName);
                        Clear(ClientClid);
                        Clear(StartDate);
                        Clear(EndDate);
                        CurrPage.Update(false);
                    end;
                }
                field(ZoneName; ZoneName)
                {
                    ApplicationArea = All;
                    Caption = 'Zone Name';
                    Enabled = SearchType = SearchType::"Zone Name";
                    ToolTip = 'Specifies the zone name, for example sc.ke.';
                }
                field(ClientClid; ClientClid)
                {
                    ApplicationArea = All;
                    Caption = 'Client ID';
                    Enabled = SearchType = SearchType::"Client ID";
                    ToolTip = 'Specifies the client ID, for example EIL.';
                }
                field(StartDate; StartDate)
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    Enabled = SearchType = SearchType::"Date Range";
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                    Enabled = SearchType = SearchType::"Date Range";
                }
            }
        }
    }

    var
        SearchType: Option "Zone Name","Client ID","Date Range";
        ZoneName: Text[100];
        ClientClid: Text[50];
        StartDate: Date;
        EndDate: Date;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        IntegrationMgt: Codeunit COCCAIntegration;
        ResultMessage: Text;
    begin
        if CloseAction <> Action::OK then
            exit(true);

        case SearchType of
            SearchType::"Zone Name":
                begin
                    if ZoneName = '' then
                        Error('Zone Name must be provided.');
                    ResultMessage := IntegrationMgt.GetRegistrantsByZoneName(ZoneName);
                end;
            SearchType::"Client ID":
                begin
                    if ClientClid = '' then
                        Error('Client ID must be provided.');
                    ResultMessage := IntegrationMgt.GetRegistrantsByClientId(ClientClid);
                end;
            SearchType::"Date Range":
                begin
                    if StartDate = 0D then
                        Error('Start Date must be provided.');
                    if EndDate = 0D then
                        Error('End Date must be provided.');
                    if StartDate > EndDate then
                        Error('Start Date cannot be later than End Date.');
                    ResultMessage := IntegrationMgt.GetRegistrantsByDateRange(StartDate, EndDate);
                end;
        end;

        if ResultMessage <> '' then
            Message(ResultMessage);
        exit(true);
    end;
}
