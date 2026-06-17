namespace KICD.KICD;

codeunit 50033 "ReceiptNo.Printed"
{
    TableNo = "Receipts Header1";

    trigger OnRun()
    var
      
    begin
        OnBeforeOnRun(Rec, SuppressCommit);
        Rec.Find();
        Rec."No. Printed" := Rec."No. Printed" + 1;
        OnBeforeModify(Rec);
        Rec.Modify();
        if not SuppressCommit then
            Commit();
        OnAfterOnRun(Rec);  
    end;

     var
        SuppressCommit: Boolean;

    procedure SetSuppressCommit(NewSuppressCommit: Boolean)
    begin
        SuppressCommit := NewSuppressCommit;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnRun(var ReceiptsHeader: Record "Receipts Header1")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeModify(var ReceiptsHeader: Record "Receipts Header1")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnRun(var ReceiptsHeader: Record "Receipts Header1"; var SuppressCommit: Boolean)
    begin
    end;    
}
