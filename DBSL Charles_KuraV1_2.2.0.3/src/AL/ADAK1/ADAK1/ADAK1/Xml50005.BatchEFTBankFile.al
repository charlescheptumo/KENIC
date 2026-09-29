namespace KENIC.KENIC;

using Microsoft.Bank.BankAccount;
using Microsoft.Purchases.Vendor;
using System.Utilities;

// <summary>
// Exports a posted Batch EFT Voucher in the I&M Bank "Supplier Batch" upload format.
// The layout reproduces the CSV that the bank's Excel template (Aug_2_Suppliers_Template.xlsm)
// creates when you click Validate:
// 
// Row 1   SUPPLIER,1
// Row 2   <<BB_HEADER>>,BatchName,SUPPLIER,AccountToDebit,d/m/yyyy,Currency,TotalAmount,NoOfRecords,,AccountToPayCharges
// Row 3+  Invoice,SupplierName,AccountNo,BankName,BankCode,Currency,Amount,Description(50),PaymentMode,BranchCode
// 
// Every row is padded to 10 columns, the same way Excel pads rows when it saves the sheet as CSV.
// </summary>
xmlport 50005 "Batch EFT Bank File"
{
    Caption = 'Batch EFT Bank File';
    Direction = Export;
    Format = VariableText;
    FieldSeparator = ',';
    FieldDelimiter = '<None>';
    RecordSeparator = '<NewLine>';
    TextEncoding = WINDOWS;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            // Row 1: payment type and batch number
            tableelement(TypeRow; Integer)
            {
                SourceTableView = sorting(Number) where(Number = const(1));
                textelement(T01) { }
                textelement(T02) { }
                textelement(T03) { }
                textelement(T04) { }
                textelement(T05) { }
                textelement(T06) { }
                textelement(T07) { }
                textelement(T08) { }
                textelement(T09) { }
                textelement(T10) { }

                trigger OnAfterGetRecord()
                begin
                    T01 := PaymentTypeTok;
                    T02 := '1';
                end;
            }

            // Row 2: batch header
            tableelement(HeaderRow; Integer)
            {
                SourceTableView = sorting(Number) where(Number = const(1));
                textelement(H01) { }
                textelement(H02) { }
                textelement(H03) { }
                textelement(H04) { }
                textelement(H05) { }
                textelement(H06) { }
                textelement(H07) { }
                textelement(H08) { }
                textelement(H09) { }
                textelement(H10) { }

                trigger OnAfterGetRecord()
                begin
                    H01 := HeaderTagTok;
                    H02 := BatchName;
                    H03 := PaymentTypeTok;
                    H04 := AccountToDebit;
                    H05 := Format(ExecutionDate, 0, '<Day>/<Month>/<Year4>');
                    H06 := CurrencyCode;
                    H07 := Format(TotalAmount, 0, 9);
                    H08 := Format(RecordCount);
                    H09 := '';
                    H10 := AccountToPayCharges;
                end;
            }

            // Row 3+: one row per payment line
            tableelement(EFTLine; "Batch EFT Lines")
            {
                textelement(InvoiceNumber) { }
                textelement(SupplierName) { }
                textelement(AccountNumber) { }
                textelement(BankName) { }
                textelement(BankCode) { }
                textelement(LineCurrency) { }
                textelement(LineAmount) { }
                textelement(PaymentDescription) { }
                textelement(PaymentMode) { }
                textelement(BranchCode) { }

                trigger OnPreXmlItem()
                begin
                    EFTLine.SetRange("Document No", BatchEFTVoucher."No.");
                end;

                trigger OnAfterGetRecord()
                var
                    VendorBankAccount: Record "Vendor Bank Account";
                    LineBankCode: Text;
                    LineBranchCode: Text;
                    LineMode: Text;
                begin
                    if not IncludeLine(EFTLine) then
                        currXMLport.Skip();

                    GetBankDetails(EFTLine, VendorBankAccount, LineBankCode, LineBranchCode);
                    LineMode := GetPaymentMode(LineBankCode, EFTLine."Net Amount");

                    InvoiceNumber := CleanText(EFTLine."PV No", 0, false);
                    SupplierName := CleanText(EFTLine."Vendor Name", 0, false);
                    AccountNumber := DelChr(EFTLine."Vendor Bank Account No.", '=', ' -,');
                    BankName := DelChr(EFTLine."Vendor Bank Name", '<>', ' ');
                    if BankName = '' then
                        BankName := DelChr(VendorBankAccount.Name, '<>', ' ');
                    BankName := BankName.Replace(',', ' ');
                    BankCode := LineBankCode;
                    LineCurrency := CurrencyCode;
                    LineAmount := Format(Round(EFTLine."Net Amount", 0.01), 0, 9);
                    PaymentDescription := CleanText(GetLineDescription(EFTLine), 50, false);
                    PaymentMode := LineMode;
                    if LineMode = EFTModeTok then
                        BranchCode := LineBranchCode
                    else
                        BranchCode := '';
                end;
            }
        }
    }

    trigger OnPreXmlPort()
    begin
        if BatchEFTVoucher."No." = '' then
            Error(NoBatchErr);

        PrepareHeader();
        CheckLinesAndCalcTotals();
    end;

    var
        BatchEFTVoucher: Record "Batch EFT Voucher";
        BatchName: Text;
        AccountToDebit: Text;
        AccountToPayCharges: Text;
        CurrencyCode: Text;
        ExecutionDate: Date;
        TotalAmount: Decimal;
        RecordCount: Integer;
        EFTLimit: Decimal;
        PaymentTypeTok: Label 'SUPPLIER', Locked = true;
        HeaderTagTok: Label '<<BB_HEADER>>', Locked = true;
        LocalCurrencyTok: Label 'KES', Locked = true;
        OwnBankCodeTok: Label '57', Locked = true, Comment = 'I&M Bank code - payments to I&M accounts go "Within I&M"';
        EFTModeTok: Label 'EFT', Locked = true;
        RTGSModeTok: Label 'RTGS', Locked = true;
        WithinBankModeTok: Label 'Within I&M', Locked = true;
        AllowedCharsTok: Label 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ', Locked = true;
        AccentedCharsTok: Label 'àáâãäåèéêëìíîïòóôõöùúûüçñÀÁÂÃÄÅÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÇÑ', Locked = true;
        PlainCharsTok: Label 'aaaaaaeeeeiiiiooooouuuucnAAAAAAEEEEIIIIOOOOOUUUUCN', Locked = true;
        DefaultDescriptionTxt: Label 'Payment %1', Comment = '%1 = PV No.';
        NoBatchErr: Label 'Call SetBatch before exporting the Batch EFT bank file.';
        NoDebitAccountErr: Label 'Bank Account %1 has no Bank Account No. The bank file needs the real account number to debit.', Comment = '%1 = bank account code';
        DebitAccountFormatQst: Label 'Account to debit %1 is not 14 digits starting with 0, which the I&M template requires. Continue anyway?', Comment = '%1 = account number';
        NoLinesErr: Label 'Batch EFT Voucher %1 has no lines with an amount greater than zero.', Comment = '%1 = batch no.';
        LineIssuesErr: Label 'The bank file cannot be created. Fix these lines first:\%1', Comment = '%1 = list of problems';
        MissingAccountTxt: Label 'no vendor bank account number';
        NoVendorBankAccountTxt: Label 'vendor %1 has no Vendor Bank Account with Bank Account No. %2 (Vendor card > Bank Accounts)', Comment = '%1 = vendor no, %2 = account no';
        MissingBankCodeTxt: Label 'no bank code on Vendor Bank Account %1 (set Name like "EQUITY BANK - 68" or Bank Branch No. to the 5-digit sort code, e.g. 68152)', Comment = '%1 = vendor bank account code';
        MissingBranchTxt: Label 'no branch code on Vendor Bank Account %1, which EFT payments need (fill Bank Branch No.)', Comment = '%1 = vendor bank account code';
        IssueLineTxt: Label '%1 %2: %3', Comment = '%1 = PV No, %2 = vendor name, %3 = problem';

    /// <summary>Set the Batch EFT Voucher to export. Call before Export().</summary>
    procedure SetBatch(NewBatchEFTVoucher: Record "Batch EFT Voucher")
    begin
        BatchEFTVoucher := NewBatchEFTVoucher;
    end;

    /// <summary>File name the bank template would use: cleaned batch name + .csv</summary>
    procedure GetFileName(): Text
    begin
        if BatchName = '' then
            BatchName := CleanText(BatchEFTVoucher."No.", 30, true);
        exit(BatchName + '.csv');
    end;

    local procedure PrepareHeader()
    var
        BankAccount: Record "Bank Account";
    begin
        BankAccount.Get(BatchEFTVoucher."Paying Bank Account");

        AccountToDebit := DigitsOnly(BankAccount."Bank Account No.");
        if AccountToDebit = '' then
            Error(NoDebitAccountErr, BankAccount."No.");
        if (StrLen(AccountToDebit) <> 14) or (CopyStr(AccountToDebit, 1, 1) <> '0') then
            if GuiAllowed() then
                if not Confirm(DebitAccountFormatQst, false, AccountToDebit) then
                    Error('');
        AccountToPayCharges := AccountToDebit;

        CurrencyCode := BankAccount."Currency Code";
        if CurrencyCode = '' then
            CurrencyCode := LocalCurrencyTok;

        ExecutionDate := BatchEFTVoucher."Value Date";
        if ExecutionDate = 0D then
            ExecutionDate := BatchEFTVoucher."Posting Date";
        if ExecutionDate = 0D then
            ExecutionDate := BatchEFTVoucher."Date";
        // The bank rejects back-dated execution dates
        if ExecutionDate < Today() then
            ExecutionDate := Today();

        BatchName := CleanText(BatchEFTVoucher."No.", 30, true);

        // Above this amount a KES payment to another bank goes by RTGS instead of EFT.
        // Confirm the current limit with your bank.
        EFTLimit := 999999.99;
    end;

    local procedure CheckLinesAndCalcTotals()
    var
        Line: Record "Batch EFT Lines";
        Issues: TextBuilder;
    begin
        TotalAmount := 0;
        RecordCount := 0;

        Line.SetRange("Document No", BatchEFTVoucher."No.");
        if Line.FindSet() then
            repeat
                if IncludeLine(Line) then begin
                    CheckLine(Line, Issues);
                    TotalAmount += Round(Line."Net Amount", 0.01);
                    RecordCount += 1;
                end;
            until Line.Next() = 0;

        if RecordCount = 0 then
            Error(NoLinesErr, BatchEFTVoucher."No.");
        if Issues.Length() > 0 then
            Error(LineIssuesErr, Issues.ToText());
    end;

    local procedure CheckLine(Line: Record "Batch EFT Lines"; var Issues: TextBuilder)
    var
        VendorBankAccount: Record "Vendor Bank Account";
        LineBankCode: Text;
        LineBranchCode: Text;
        Problem: Text;
        Found: Boolean;
        NeedsBranch: Boolean;
    begin
        if DelChr(Line."Vendor Bank Account No.", '=', ' ') = '' then
            Problem := MissingAccountTxt
        else begin
            Found := GetBankDetails(Line, VendorBankAccount, LineBankCode, LineBranchCode);
            NeedsBranch := (LineBankCode <> '') and (GetPaymentMode(LineBankCode, Line."Net Amount") = EFTModeTok);

            if not Found and ((LineBankCode = '') or NeedsBranch) then
                Problem := StrSubstNo(NoVendorBankAccountTxt, Line."Vendor No", Line."Vendor Bank Account No.")
            else
                if LineBankCode = '' then
                    Problem := StrSubstNo(MissingBankCodeTxt, VendorBankAccount.Code)
                else
                    if NeedsBranch and (LineBranchCode = '') then
                        Problem := StrSubstNo(MissingBranchTxt, VendorBankAccount.Code);
        end;

        if Problem <> '' then
            Issues.AppendLine(StrSubstNo(IssueLineTxt, Line."PV No", Line."Vendor Name", Problem));
    end;

    local procedure IncludeLine(Line: Record "Batch EFT Lines"): Boolean
    begin
        exit(Line."Net Amount" > 0);
    end;

    /// <summary>
    /// Finds the Vendor Bank Account whose Bank Account No. matches the line, and works out the codes:
    /// Bank code: " - NN" suffix of the line's Vendor Bank Name, else of the Vendor Bank Account Name
    ///            (template style, e.g. "EQUITY BANK - 68"), else the first 2 digits of a 5-digit
    ///            Kenyan sort code in Bank Branch No.
    /// Branch code: last 3 digits of that sort code, or Bank Branch No. padded to 3 digits.
    /// Returns false when no matching Vendor Bank Account exists.
    /// </summary>
    local procedure GetBankDetails(Line: Record "Batch EFT Lines"; var VendorBankAccount: Record "Vendor Bank Account"; var BankCodeOut: Text; var BranchCodeOut: Text): Boolean
    var
        SortCode: Text;
        Found: Boolean;
    begin
        Clear(VendorBankAccount);
        BranchCodeOut := '';
        BankCodeOut := BankCodeFromName(Line."Vendor Bank Name");

        VendorBankAccount.SetRange("Vendor No.", Line."Vendor No");
        VendorBankAccount.SetRange("Bank Account No.", Line."Vendor Bank Account No.");
        Found := VendorBankAccount.FindFirst();
        if Found then begin
            if BankCodeOut = '' then
                BankCodeOut := BankCodeFromName(VendorBankAccount.Name);

            SortCode := DigitsOnly(VendorBankAccount."Bank Branch No.");
            case StrLen(SortCode) of
                5:
                    begin
                        if BankCodeOut = '' then
                            BankCodeOut := CopyStr(SortCode, 1, 2);
                        BranchCodeOut := CopyStr(SortCode, 3, 3);
                    end;
                1 .. 3:
                    BranchCodeOut := PadStr('', 3 - StrLen(SortCode), '0') + SortCode;
            end;
        end;

        if StrLen(BankCodeOut) = 1 then
            BankCodeOut := '0' + BankCodeOut;
        exit(Found);
    end;

    local procedure BankCodeFromName(Name: Text): Text
    var
        Pos: Integer;
    begin
        Pos := Name.LastIndexOf(' - ');
        if Pos = 0 then
            exit('');
        exit(DigitsOnly(CopyStr(Name, Pos + 3)));
    end;

    local procedure GetPaymentMode(LineBankCode: Text; Amount: Decimal): Text
    begin
        if LineBankCode = OwnBankCodeTok then
            exit(WithinBankModeTok);
        // Foreign-currency payments to other banks only allow RTGS in the template
        if (CurrencyCode <> LocalCurrencyTok) or (Amount > EFTLimit) then
            exit(RTGSModeTok);
        exit(EFTModeTok);
    end;

    local procedure GetLineDescription(Line: Record "Batch EFT Lines"): Text
    begin
        // Swap this for a line-level description field if your lines table has one
        if BatchEFTVoucher.Payee <> '' then
            exit(BatchEFTVoucher.Payee);
        exit(StrSubstNo(DefaultDescriptionTxt, Line."PV No"));
    end;

    /// <summary>Same rule as the template's RemoveSpecialCharactersFromText macro: keep letters, digits and spaces.</summary>
    local procedure CleanText(Input: Text; MaxLength: Integer; AllowPeriod: Boolean) Result: Text
    var
        Ch: Text[1];
        i: Integer;
    begin
        Input := ConvertStr(Input, AccentedCharsTok, PlainCharsTok);
        for i := 1 to StrLen(Input) do begin
            Ch := CopyStr(Input, i, 1);
            if (StrPos(AllowedCharsTok, Ch) > 0) or (AllowPeriod and (Ch = '.')) then
                Result += Ch;
        end;
        Result := DelChr(Result, '<>', ' ');
        if (MaxLength > 0) and (StrLen(Result) > MaxLength) then
            Result := CopyStr(Result, 1, MaxLength);
    end;

    local procedure DigitsOnly(Input: Text): Text
    begin
        exit(DelChr(Input, '=', DelChr(Input, '=', '0123456789')));
    end;
}
