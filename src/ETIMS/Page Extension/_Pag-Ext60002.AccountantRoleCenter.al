pageextension 60002 "Accountant Role Center" extends "Accountant Role Center"
{
    layout
    { }
    actions
    {
        addafter("Posted Documents")
        {
            group(ETIMS)
            {
                Caption = 'ETIMS Configs';
                action("Branch")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Branch List";
                    Caption = 'Branch';
                }
                action("Taxation type")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Taxation Type List";
                    Caption = 'Taxation Type';
                }
                action("Item Class")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Item Class List";
                    Caption = 'Item Class';
                }
                action("Product type")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Product Type List";
                    Caption = 'Product type';
                }
                action("Country Codes")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Country Codes List";
                    Caption = 'Country Codes';
                }
                action("Packaging Unit")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Packaging Unit List";
                    Caption = 'Packaging Unit';
                }
                action("Quantity Unit Code")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Quantity Unit Code List";
                    Caption = 'Quantity Unit Code';
                }
                action("Refund Reasons")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Refund Reasons List";
                    Caption = 'Refund Reasons';
                }
                action("Payment Methods_")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Payment Methods List";
                    Caption = 'Etims Payment Methods';
                    Visible = false;
                }
                action("Stock In Out")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Stock In Out List";
                    Caption = 'Stock In Out';
                    Visible = false;
                }
                action("eTims-Banks")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Banks List";
                    Caption = 'Etims Banks';
                }
                action("eTims-Locale")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-Locale";
                    Caption = 'Etims Locale';
                }
                action("eTims-User")
                {
                    ApplicationArea = Basic;
                    RunObject = page "eTims-User List";
                    Caption = 'Etims Branch Users';
                    Visible = false;
                }
                action("ManualPush")
                {
                    ApplicationArea = Basic;
                    RunObject = page eTimsPushCredit;
                    Caption = 'ETims Push Credit Note';
                    Visible = false;
                }
                action("Pushdata")
                {
                    ApplicationArea = Basic;
                    RunObject = page eTimsPushCredit;
                    Caption = 'ETims Data';
                    Visible = false;
                }
            }
        }
    }
}
