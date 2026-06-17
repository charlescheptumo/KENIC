#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50052 "SR Subform"
{
    AutoSplitKey = true;
    Caption = 'SR Lines';
    // Caption = 'Requisition Lines';

    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = filter("Store Requisition"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Category field.';
                    //  Editable = not QtyToIsue;
                }
                field("Service/Item Code"; Rec."Service/Item Code")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                    ToolTip = 'Specifies the value of the Service/Item Code field.';


                    //  Editable = not QtyToIsue;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = not QtyToIsue;
                    ToolTip = 'Specifies the value of the No. field.';

                    trigger OnValidate()
                    VAR
                        ITEM: Record Item;
                        Employee: Record Employee;
                        PurchaseHeader: Record "Purchase Header";
                    begin
                        ITEM.GET(REC."No.");
                        ITEM.CalcFields(Inventory);
                        REC.Description := ITEM.Description;
                        rec."Unit of Measure" := item."Base Unit of Measure";
                        rec.Inventory := item.Inventory;
                        Rec."Gen. Prod. Posting Group" := item."Gen. Prod. Posting Group";
                        Rec."Vat Prod. Posting Group" := item."Vat Prod. Posting Group";
                        Rec."Gen. Bus. Posting Group" := 'DOMESTIC';
                        // PurchaseHeader.Reset();
                        // PurchaseHeader.SetRange("No.", Rec."No.");
                        // if PurchaseHeader.Find('-') then begin
                        //     Employee.Reset();
                        //      Employee.SetRange("No.",PurchaseHeader."Request-By No.");
                        //      if Employee.Find('-') then begin
                        //         Rec."Gen. Bus. Posting Group" := Employee."Employee Posting Group";
                        //     end   
                        // end;
                        //       ShowShortcutDimCode(ShortcutDimCode);

                        NoOnAfterValidate;
                    end;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = not QtyToIsue;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = not QtyToIsue;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    applicationarea = basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Inventory"; rec."Inventory")
                {
                    applicationarea = basic;
                    visible = true;
                    ToolTip = 'Specifies the value of the Inventory field.';
                }

                field("Qty. Requested"; Rec."Qty. Requested")
                {
                    ApplicationArea = Basic;
                    Editable = not QtyToIsue;
                    ToolTip = 'Specifies the value of the Qty. Requested field.';
                }
                field("Qty Approved"; Rec."Qty Approved")
                {
                    ApplicationArea = Basic;
                    Editable = QtyToIsue;
                    Visible = QtyToIsue;
                    ToolTip = 'Specifies the value of the Qty Approved field.';
                }
                field("Quantity To  Issue"; Rec."Quantity To  Issue")
                {
                    ApplicationArea = Basic;
                    Editable = not QtyToIsue;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Quantity To  Issue field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Editable = not QtyToIsue;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    Editable = not QtyToIsue;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
                field("Requisition Status"; Rec."Requisition Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Status field.';
                }
                field("Quantity  issued"; Rec."Quantity  issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity  issued field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';

                    trigger OnValidate()
                    var
                        PurchHeader: Record "Purchase Header";
                    begin
                        if PurchHeader.Get(Rec."Document Type", Rec."Document No.") then begin
                            if Rec."Employee No" <> PurchHeader."Request-By No." then
                                Error('Employee No. on lines must match Request-By No. on header (%1).', PurchHeader."Request-By No.");

                            Rec."Employee Name" := PurchHeader."Request-By Name";
                        end;
                    end;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                    action("Event")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Event';
                        Image = "Event";
                        ToolTip = 'Executes the Event action.';

                        trigger OnAction()
                        begin
                            CurrPage.SaveRecord();
                            Page.Run(Page::"Item Availability by Event", Rec);
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Period';
                        Image = Period;
                        ToolTip = 'Executes the Period action.';

                        trigger OnAction()
                        begin
                            CurrPage.SaveRecord();
                            Page.Run(Page::"Item Availability by Event", Rec);
                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Variant';
                        Image = ItemVariant;
                        ToolTip = 'Executes the Variant action.';

                        trigger OnAction()
                        begin
                            CurrPage.SaveRecord();
                            Page.Run(Page::"Item Availability by Variant", Rec);
                        end;
                    }
                    action(Location)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Location';
                        Image = Warehouse;
                        ToolTip = 'Executes the Location action.';

                        trigger OnAction()
                        begin
                            CurrPage.SaveRecord();
                            Page.Run(Page::"Item Availability by Location", Rec);
                        end;
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = Basic;
                        Caption = 'BOM Level';
                        Image = BOMLevel;
                        ToolTip = 'Executes the BOM Level action.';

                        trigger OnAction()
                        begin
                            CurrPage.SaveRecord();
                            Page.Run(Page::"Item Availability by BOM Level", Rec);
                        end;
                    }
                }
                action("Reservation Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reservation Entries';
                    Image = ReservationLedger;
                    ToolTip = 'Executes the Reservation Entries action.';

                    trigger OnAction()
                    begin
                        Rec.ShowReservationEntries(true);
                    end;
                }
                action("Item Tracking Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';
                    ToolTip = 'Executes the Item &Tracking Lines action.';

                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines;
                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    ToolTip = 'Executes the Co&mments action.';

                    trigger OnAction()
                    begin
                        Rec.ShowLineComments;
                    end;
                }
                action(ItemChargeAssignment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Charge &Assignment';
                    ToolTip = 'Executes the Item Charge &Assignment action.';

                    trigger OnAction()
                    begin
                        Rec.ShowItemChargeAssgnt;
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("E&xplode BOM")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;
                    ToolTip = 'Executes the E&xplode BOM action.';

                    trigger OnAction()
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert Ext. Texts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insert &Ext. Texts';
                    Image = Text;
                    ToolTip = 'Executes the Insert &Ext. Texts action.';

                    trigger OnAction()
                    begin
                        InsertExtendedText(true);
                    end;
                }
                action(Reserve)
                {
                    ApplicationArea = Basic;
                    Caption = '&Reserve';
                    Ellipsis = true;
                    Image = Reserve;
                    ToolTip = 'Executes the &Reserve action.';

                    trigger OnAction()
                    begin
                        Rec.Find;
                        Rec.ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Tracking';
                    Image = OrderTracking;
                    ToolTip = 'Executes the Order &Tracking action.';

                    trigger OnAction()
                    begin
                        ShowTracking;
                    end;
                }
            }
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                group("Dr&op Shipment")
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action("Sales &Order")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales &Order';
                        Image = Document;
                        ToolTip = 'Executes the Sales &Order action.';

                        trigger OnAction()
                        begin
                            OpenSalesOrderForm;
                        end;
                    }
                }
                group("Speci&al Order")
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action1901038504)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales &Order';
                        Image = Document;
                        ToolTip = 'Executes the Sales &Order action.';

                        trigger OnAction()
                        begin
                            OpenSpecOrderSalesOrderForm;
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        FnCOntrolVisibiltyForQtyToRcv;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        FnCOntrolVisibiltyForQtyToRcv;
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
        if (Rec.Quantity <> 0) and Rec.ItemExists(Rec."No.") then begin
            Commit;
            if not ReservePurchLine.DeleteLineConfirm(Rec) then
                exit(false);
            ReservePurchLine.DeleteLine(Rec);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)

    begin
        Rec.InitType;
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin
        FnCOntrolVisibiltyForQtyToRcv;
    end;

    var
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        ShortcutDimCode: array[8] of Code[20];
        UpdateAllowedVar: Boolean;
        Text000: label 'Unable to execute this function while in view only mode.';
        PurchHeader: Record "Purchase Header";
        PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";
        Text001: label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
        QtyToIsue: Boolean;


    procedure ApproveCalcInvDisc()
    begin
        Codeunit.Run(Codeunit::"Purch.-Disc. (Yes/No)", Rec);
    end;


    procedure CalcInvDisc()
    begin
        Codeunit.Run(Codeunit::"Purch.-Calc.Discount", Rec);
    end;


    procedure ExplodeBOM()
    begin
        if Rec."Prepmt. Amt. Inv." <> 0 then
            Error(Text001);
        Codeunit.Run(Codeunit::"Purch.-Explode BOM", Rec);
    end;


    procedure OpenSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField("Sales Order No.");
        SalesHeader.SetRange("No.", Rec."Sales Order No.");
        SalesOrder.SetTableview(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;


    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
        if TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord;
            TransferExtendedText.InsertPurchExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate then
            UpdateForm(true);
    end;


    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
        Rec.OpenItemTrackingLines();
    end;


    procedure OpenSpecOrderSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField("Special Order Sales No.");
        SalesHeader.SetRange("No.", Rec."Special Order Sales No.");
        SalesOrder.SetTableview(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;


    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.Update(SetSaveRecord);
    end;


    procedure SetUpdateAllowed(UpdateAllowed: Boolean)
    begin
        UpdateAllowedVar := UpdateAllowed;
    end;


    procedure UpdateAllowed(): Boolean
    begin
        if UpdateAllowedVar = false then begin
            Message(Text000);
            exit(false);
        end;
        exit(true);
    end;


    procedure ShowPrices()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLinePrice(PurchHeader, Rec);
    end;


    procedure ShowLineDisc()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLineLineDisc(PurchHeader, Rec);
    end;

    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(false);
        if (Rec.Type = Rec.Type::"Charge (Item)") and (Rec."No." <> xRec."No.") and
           (xRec."No." <> '')
        then
            CurrPage.SaveRecord;
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(false);
    end;


    procedure FnCOntrolVisibiltyForQtyToRcv()
    begin
        QtyToIsue := false;
        PurchHeader.Reset;
        PurchHeader.SetRange(PurchHeader."No.", Rec."Document No.");
        if PurchHeader.FindSet then begin
            if PurchHeader.Status = PurchHeader.Status::"Pending Approval" then
                QtyToIsue := true;
        end;
    end;
}

#pragma implicitwith restore



