codeunit 50102 "Purch Attach Status Mgt"
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header",
        'OnBeforeTestStatusOpen', '', false, false)]
    local procedure OnBeforeTestStatusOpen(
        var PurchHeader: Record "Purchase Header";
        xPurchHeader: Record "Purchase Header";
        CallingFieldNo: Integer)
    begin
        if CallingFieldNo <> 0 then
            exit;

        if PurchHeader.Status in [
            PurchHeader.Status::Released,
            PurchHeader.Status::"Pending Approval"]
        then
            PurchHeader.SuspendStatusCheck(true);
    end;
    
}