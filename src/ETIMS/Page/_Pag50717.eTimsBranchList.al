/// <summary>
/// List of KRA eTIMS branch registrations with actions to trigger the main eTIMS sync operations (initialize device, pull codes/item classes/branches, push customers/users/GL accounts/items to eTIMS).
/// </summary>
page 50717 "eTims-Branch List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Branch List';
    PageType = List;
    SourceTable = "eTims-Branch";
    UsageCategory = Administration;
    CardPageId = "eTims-Branch Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Branch Id"; Rec."Branch Id")
                {
                    ToolTip = 'Specifies the value of the Branch ID field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ToolTip = 'Specifies the value of the Branch Name field.';
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
                    mymsg.Message(webservice.Initialize());
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
                Caption = 'eTims Get Item Class';
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
}
