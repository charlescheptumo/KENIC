pageextension 60004 "Sales Credit Memo" extends "Sales Credit Memo"
{
    layout
    {
        addbefore(Status)
        {
            field("Refund Reason"; Rec."Refund Reason")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Refund Reason field.';
            }
        }
    }
    actions
    {
        modify(Post)
        {
            ApplicationArea = Basic;
            trigger OnBeforeAction()
            var
                compInfo: Record "Company Information";
                count: Integer;
            begin
                Rec.TestField("Refund Reason");
                compInfo.Get();
                compInfo.LockTable();
                count := compInfo."Sales Invoice Number" + 1;
                compInfo."Sales Invoice Number" := count;
                compInfo.Modify();

                Rec."Invoice Number" := count;
                Rec.Modify();
            end;

            trigger OnAfterAction()
            var
                webservice: Codeunit ETimsWebService;
            begin
                webservice.PushCreditNotes2(Rec."No.");
            end;
        }
    }
}
