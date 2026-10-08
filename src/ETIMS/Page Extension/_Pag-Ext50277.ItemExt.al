pageextension 50277 ItemExt extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group(ETIMS)
            {
                Visible = yesno;
                field("Country of Origin"; Rec."Country of Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country of Origin field.';
                }
                field("Product Type"; Rec."Service Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Product Type field.';
                }
                field("Packaging Unit code"; Rec."Packaging Unit code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Packaging Unit code field.';
                }
                field("Quantity Unit Code"; Rec."Quantity Unit Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Unit Code field.';
                }
                field("Item Code"; Rec."Etims Item Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Etims Item Code field.';
                    Caption = 'Etims Item Code';
                    Editable = true;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Item Class"; Rec."Item Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Class field.';
                }
                field("Tax Type"; Rec."Tax Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Type field.';
                }
                field("Insuarance Applicable"; Rec."Insuarance Applicable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insuarance Applicable field.';
                    Visible = false;
                }

            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(GenerateETIMSCodes)
            {
                ApplicationArea = Basic;
                Caption = 'Generate ETIMS Item Details';
                Image = Calculate;

                trigger OnAction()
                begin
                    if Rec.Blocked then
                        Error('This item is blocked and cannot be sent to ETIMS.');

                    Rec.GenerateItemCode();
                    CurrPage.Update(true);
                end;
            }
            action(SendItemToETIMS)
            {
                ApplicationArea = Basic;
                Caption = 'Register Item To ETIMS';
                Image = Calculate;

                trigger OnAction()
                begin
                    if Rec.Blocked then
                        Error('This item is blocked and cannot be sent to ETIMS.');

                    webservice.SaveSingleItem(Rec."No.");
                    CurrPage.Update(true);
                end;
            }
            action(SaveStockMasterToETIMS)
            {
                ApplicationArea = Basic;
                Caption = 'Save Stock master To ETIMS';
                Image = Calculate;

                trigger OnAction()
                begin
                    if Rec.Blocked then
                        Error('This item is blocked and cannot be sent to ETIMS.');

                    webservice.SaveItemStockMaster(Rec."No.");
                    CurrPage.Update(true);
                end;
            }
        }

        addlast(Category_Process)
        {
            actionref(GenerateETIMSCodes_Promoted; GenerateETIMSCodes)
            {
            }
            actionref(SendItemToETIMS_Promoted; SendItemToETIMS)
            {
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        yesno := not Rec.Blocked;
        // if (Rec.Blocked = false) then begin
        //     Rec.generateItemCode();
        //     yesno := true;
        // end;
    end;

    var
        yesno: Boolean;
        webservice: Codeunit ETimsWebService;
}
