/// <summary>
/// Card view of a single KRA eTIMS branch registration, with the full set of actions to initialize the branch's device and pull/push all eTIMS reference and master data (codes, item classes, customers, notices, items, import items, purchases, stock, users, GL accounts).
/// </summary>
page 50718 "eTims-Branch Card"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Branch Card';
    PageType = Card;
    SourceTable = "eTims-Branch";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Branch Id"; Rec."Branch Id")
                {
                    ToolTip = 'Specifies the value of the Branch ID field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Device Serial Number"; Rec."Device Serial Number")
                {
                    ToolTip = 'Specifies the value of the Device Serial Number field.';
                }
                field("Branch Status Code"; Rec."Branch Status Code")
                {
                    ToolTip = 'Specifies the value of the Branch Status Code field.';
                }
                field(Headquater; Rec.Headquater)
                {
                    ToolTip = 'Specifies the value of the Headquater field.';
                }
                field("Manager Email"; Rec."Manager Email")
                {
                    ToolTip = 'Specifies the value of the Manager Email field.';
                }
                field("Manager Name"; Rec."Manager Name")
                {
                    ToolTip = 'Specifies the value of the Manager Name field.';
                }
                field("Manager Phone"; Rec."Manager Phone")
                {
                    ToolTip = 'Specifies the value of the Manager Phone field.';
                }
                field("Manual Entry"; Rec."Manual Entry")
                {
                    ToolTip = 'Specifies the value of the Manual Entry field.';
                }
                field("Province Name"; Rec."Province Name")
                {
                    ToolTip = 'Specifies the value of the Province Name field.';
                }
                field("Tax Locality"; Rec."Tax Locality")
                {
                    ToolTip = 'Specifies the value of the Tax Locality field.';
                }
                field(Tin; Rec.Tin)
                {
                    ToolTip = 'Specifies the value of the Tin field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Initialize)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Initialization';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    mymsg.Message(webservice.InitializeNew(rec."Branch Id", rec."Device Serial Number"));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }

            action(getCodes)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get Codes';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    mymsg.Message(webserviceETIMSCodes.selectETIMSCodes());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }

            action(getItemClass)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get Item Classes';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /* mymsg.Message(ETimsProces.CallService('selectItemsClass'));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send(); */

                    mymsg.Message(webservice.SelectItemsClassifications());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(getETIMSCustomers)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get ETIMS Customers';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /* mymsg.Message(ETimsProces.CallService('selectItemsClass'));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send(); */

                    mymsg.Message(webserviceETIMSGets.SelectETIMSCustomers());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(getETIMSNotices)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get ETIMS Notices';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /* mymsg.Message(ETimsProces.CallService('selectItemsClass'));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send(); */

                    mymsg.Message(webserviceETIMSGets.SelectETIMSNotices());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(getETIMSItems)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get ETIMS ItemClasses';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /* mymsg.Message(ETimsProces.CallService('selectItemsClass'));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send(); */

                    mymsg.Message(webserviceETIMSGets.SelectETIMSItems());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(selectBranches)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get Branches';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    mymsg.Message(webservice.selectBranches());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(getETIMSImportItemItems)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get ETIMS Import Items';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /* mymsg.Message(ETimsProces.CallService('selectItemsClass'));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send(); */

                    mymsg.Message(webserviceETIMSGets.SelectETIMSImportItems());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(getETIMSPurchases)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get ETIMS Purchases';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /* mymsg.Message(ETimsProces.CallService('selectItemsClass'));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send(); */

                    mymsg.Message(webserviceETIMSGets.SelectETIMSPurchases());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(getETIMSStock)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Get ETIMS Stock';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /* mymsg.Message(ETimsProces.CallService('selectItemsClass'));
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send(); */

                    mymsg.Message(webserviceETIMSGets.SelectETIMSStock());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(saveBranchCustomers)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Save Customers';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    mymsg.Message(webservice.SaveBulkBranchCustomers());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }

            action(saveBrancheUsers)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Save Users';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    mymsg.Message(webservice.SaveBranchUsers());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(saveGlAccounts)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Save GLAccounts';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    mymsg.Message(webservice.saveGlAccounts());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
            action(saveItems)
            {
                ApplicationArea = Basic;
                Caption = 'eTims Items';
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    mymsg.Message(webservice.SaveBulkItems());
                    mymsg.Scope := NotificationScope::LocalScope;
                    mymsg.Send();
                end;
            }
        }
    }
    var
        mymsg: Notification;
        webservice: Codeunit ETimsWebService;
        webserviceETIMSCodes: Codeunit ETIMSCodes;
        webserviceETIMSGets: Codeunit ETIMSgets;
}
