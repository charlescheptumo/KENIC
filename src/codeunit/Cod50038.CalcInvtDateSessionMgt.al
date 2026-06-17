namespace MyCompany.PhysInventoryDateFix;

using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Item;
using Microsoft.Warehouse.Ledger;
using Microsoft.Inventory.Counting.Journal;
codeunit 50201 "Calc Invt Date Session Mgt"
{
    SingleInstance = true;

    var
        EffectiveDate: Date;
        IsInitialized: Boolean;

    procedure SetPostingDate(NewDate: Date)
    begin
        EffectiveDate := NewDate;
        IsInitialized := true;
    end;

    procedure GetPostingDate(): Date
    begin
        if IsInitialized then
            exit(EffectiveDate);
        exit(0D);
    end;

    procedure Reset()
    begin
        EffectiveDate := 0D;
        IsInitialized := false;
    end;
}
codeunit 50202 "Calc Invt By Date Subscribers"
{
    [EventSubscriber(ObjectType::Report, Report::"Calculate Inventory", 'OnBeforeOnPreReport', '', false, false)]
    local procedure OnBeforeOnPreReport_CaptureDate(var ItemJournalLine: Record "Item Journal Line";var PostingDate: Date)
    var
        SessionMgt: Codeunit "Calc Invt Date Session Mgt";
    begin
        SessionMgt.SetPostingDate(PostingDate);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Calculate Inventory", 'OnItemLedgerEntryOnAfterPreDataItem', '', false, false)]
    local procedure OnILEAfterPreDataItem_FilterByDate(var ItemLedgerEntry: Record "Item Ledger Entry";var Item: Record Item)
    var
        SessionMgt: Codeunit "Calc Invt Date Session Mgt";
        EffDate: Date;
    begin
        EffDate := SessionMgt.GetPostingDate();
        if EffDate = 0D then
            exit;
        ItemLedgerEntry.SetFilter("Posting Date", '..%1', EffDate);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Calculate Inventory", 'OnCalcWhseQtyOnAfterWhseEntrySetFilters', '', false, false)]
    local procedure OnCalcWhseQtyAfterFilters_FilterByDate(var WarehouseEntry: Record "Warehouse Entry")
    var
        SessionMgt: Codeunit "Calc Invt Date Session Mgt";
        EffDate: Date;
    begin
        EffDate := SessionMgt.GetPostingDate();
        if EffDate = 0D then
            exit;
        WarehouseEntry.SetFilter("Registering Date", '..%1', EffDate);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Calculate Inventory", 'OnCalcWhseQtyOnAfterLotRequiredWhseEntrySetFilters', '', false, false)]
    local procedure OnCalcWhseQtyAfterLotFilters_ReassertDate(var WarehouseEntry: Record "Warehouse Entry")
    var
        SessionMgt: Codeunit "Calc Invt Date Session Mgt";
        EffDate: Date;
    begin
        EffDate := SessionMgt.GetPostingDate();
        if EffDate = 0D then
            exit;
        WarehouseEntry.SetFilter("Registering Date", '..%1', EffDate);
    end;
}
codeunit 50203 "Calc Invt Date UX Guard"
{
    [EventSubscriber(ObjectType::Report, Report::"Calculate Inventory", 'OnBeforeOnPreReport', '', false, false)]
    local procedure OnBeforeOnPreReport_WarnHistoricalDate(var ItemJournalLine: Record "Item Journal Line";var PostingDate: Date)
    var
        HistoricalDateQst: Label 'Posting Date %1 is before today''s working date. Qty. (Calculated) will reflect inventory as at that historical date only.\\ Do you want to continue?',
            Comment = '%1 = posting date chosen on the request page';
    begin
        if PostingDate = 0D then
            exit;
        if PostingDate >= WorkDate() then
            exit;
        if not Confirm(HistoricalDateQst, true, PostingDate) then
            Error('');
    end;
}
