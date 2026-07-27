namespace KENIC.KENIC;

page 50120 "Get Domain Ledger"
{
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Get Domain Ledger';
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(DomainName; DomainName)
                {
                    ApplicationArea = All;
                    Caption = 'Domain Name';
                    ToolTip = 'Enter the domain name whose ledger entries you want to retrieve.';
                }
            }
        }
    }

    var
        DomainName: Text[100];

    procedure SetDefaultDomain(DefaultDomain: Text)
    begin
        DomainName := DefaultDomain;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        KenicMgt: Codeunit COCCAIntegration;
        Response: Text;
    begin
        if CloseAction = Action::OK then begin
            if DomainName = '' then
                Error('Domain Name is required.');

            Response := KenicMgt.GetDomainLedger(DomainName);

            Message('%1', Response);
        end;

        exit(true);
    end;
}
