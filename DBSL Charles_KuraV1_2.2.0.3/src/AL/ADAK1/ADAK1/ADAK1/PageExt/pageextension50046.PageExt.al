#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50046 "pageextension50046" extends "Bank Acc. Reconciliation"
{

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Bank Acc. Reconciliation"(Page 379)".

    layout
    {

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter(StatementEndingBalance)
        {
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Approval Status field.';
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "ImportBankStatement(Action 3)".


        //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 17)".


        //Unsupported feature: Property Modification (PromotedCategory) on "PostAndPrint(Action 9)".



        //Unsupported feature: Code Insertion on "Post(Action 17)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //begin
        /*
        TESTFIELD("Approval Status","Approval Status"::Released);
        */
        //end;


        //Unsupported feature: Code Insertion on "PostAndPrint(Action 9)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //begin
        /*
        TESTFIELD("Approval Status","Approval Status"::Released)
        */
        //end;
        addfirst("F&unctions")
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                begin
                    //   if ApprovalsMgmt.CheckBankRecReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendBankRecReqForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelBankRecReqApprovalRequest(Rec);
                end;
            }
        }
        addafter(SuggestLines)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
        addfirst("Ba&nk")
        {
            action("Import Bank Statement")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Import Bank Statement action.';

                trigger OnAction()
                begin
                    ImportFromIMTransactions(Rec);
                end;
            }
        }
    }

    local procedure ImportFromIMTransactions(var BankAccRecon: Record "Bank Acc. Reconciliation")
    var
        IMTransaction: Record "I&M Transaction";
        BankAccReconLine: Record "Bank Acc. Reconciliation Line";
        UpperDate: Date;
        NextLineNo: Integer;
        ImportedCount: Integer;
    begin
        BankAccRecon.TestField("Statement Date");
        UpperDate := CalcDate('-1D', BankAccRecon."Statement Date");

        BankAccReconLine.Reset();
        BankAccReconLine.SetRange("Bank Account No.", BankAccRecon."Bank Account No.");
        BankAccReconLine.SetRange("Statement No.", BankAccRecon."Statement No.");
        if BankAccReconLine.FindLast() then
            NextLineNo := BankAccReconLine."Statement Line No." + 10000
        else
            NextLineNo := 10000;

        IMTransaction.Reset();
        IMTransaction.SetFilter(TransactionDate, '<=%1', CreateDateTime(UpperDate, 235959T));
        IMTransaction.SetFilter(Status, '<>%1', 'IMPORTED');
        if IMTransaction.FindSet() then
            repeat
                BankAccReconLine.Init();
                BankAccReconLine."Bank Account No." := BankAccRecon."Bank Account No.";
                BankAccReconLine."Statement No." := BankAccRecon."Statement No.";
                BankAccReconLine."Statement Line No." := NextLineNo;
                BankAccReconLine."Transaction Date" := DT2Date(IMTransaction.TransactionDate);
                BankAccReconLine.Validate("Transaction Date");
                BankAccReconLine."Document No." := IMTransaction.TransactionReference;
                if IMTransaction.PayerName <> '' then
                    BankAccReconLine.Description := CopyStr(IMTransaction.PayerName, 1, MaxStrLen(BankAccReconLine.Description))
                else
                    BankAccReconLine.Description := CopyStr(IMTransaction.Narration, 1, MaxStrLen(BankAccReconLine.Description));
                BankAccReconLine."Statement Amount" := IMTransaction.Amount;
                BankAccReconLine.Insert(true);

                NextLineNo += 10000;
                ImportedCount += 1;

                IMTransaction.Status := 'IMPORTED';
                IMTransaction.Modify();
            until IMTransaction.Next() = 0;

        if ImportedCount = 0 then
            Message('No I&M Transactions found dated before %1.', BankAccRecon."Statement Date")
        else
            Message('%1 transaction(s) imported into the bank statement lines.', ImportedCount);
    end;

    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
