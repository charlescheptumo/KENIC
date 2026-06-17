tableextension 50169 "GL Entry Backfill Ext" extends "G/L Entry"
{
    fields
    {
    }

    procedure UpdateImprestFields(
        EmployeeNo: Code[20];
        EmployeeName: Text[100];
        PayingBankAccount: Code[20];
        BankName: Text[100];
        DestinationNarration: Text[100];
        IsSurrender: Boolean
    )
    begin
        Rec."Employee No." := EmployeeNo;
        Rec."Employee Name" := EmployeeName;
        if not IsSurrender then begin
            Rec."Paying Bank Account" := PayingBankAccount;
            Rec."Bank Name" := BankName;
            Rec."Destination Narration" := DestinationNarration;
        end;
        Rec.Modify();
    end;
}
