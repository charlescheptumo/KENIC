namespace KENIC.KENIC;

page 50371 "Get Registrants"
{
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Get Registrants';

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
                    ToolTip = 'Specifies whether registrants are retrieved by zone name or client ID.';

                    trigger OnValidate()
                    begin
                        Clear(ZoneName);
                        Clear(ClientClid);
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
                    ToolTip = 'Specifies the client ID, for example ZSL.';
                }
            }
        }
    }

    var
        SearchType: Option "Zone Name","Client ID";
        ZoneName: Text[100];
        ClientClid: Text[50];

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

                    ResultMessage :=
                        IntegrationMgt.GetRegistrantsByZoneName(ZoneName);
                end;

            SearchType::"Client ID":
                begin
                    if ClientClid = '' then
                        Error('Client ID must be provided.');

                    ResultMessage :=
                        IntegrationMgt.GetRegistrantsByClientId(ClientClid);
                end;
        end;

        if ResultMessage <> '' then
            Message(ResultMessage);

        exit(true);
    end;
}
