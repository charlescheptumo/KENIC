namespace KENIC.KENIC;

using Microsoft.Bank.BankAccount;
using Microsoft.Purchases.Vendor;
using System.IO;

// Exports a Batch EFT Voucher as an Excel workbook with the same layout as the
// I&M "Supplier Batch" template (Aug 2 Suppliers Template.xlsm), sheet "Template":
//
//   C3 File Name ............ D3        F3 Currency ....... G3
//   C4 Account to Debit ..... D4        F4 Total Amount ... G4
//   C5 Execution Date ....... D5        F5 No. of Records . G5
//   C6 Account to Pay Charges D6
//   Row 8  : column headers (A..H)
//   Row 9+ : one row per payment
//
// Account numbers are written as text, so leading zeros are kept.
codeunit 50045 "Batch EFT Excel Export"
{
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        BatchEFTVoucher: Record "Batch EFT Voucher";
        BatchName: Text;
        AccountToDebit: Text;
        AccountToPayCharges: Text;
        CurrencyCode: Text;
        ExecutionDate: Date;
        TotalAmount: Decimal;
        RecordCount: Integer;
        FirstDataRow: Integer;
        SheetNameTok: Label 'Template', Locked = true;
        LocalCurrencyTok: Label 'KES', Locked = true;
        OwnBankCodeTok: Label '57', Locked = true, Comment = 'I&M Bank code - payments to I&M accounts go "Within I&M"';
        EFTModeTok: Label 'EFT', Locked = true;
        RTGSModeTok: Label 'RTGS', Locked = true;
        WithinBankModeTok: Label 'Within I&M', Locked = true;
        TextFormatTok: Label '@', Locked = true;
        AmountFormatTok: Label '#,##0.00', Locked = true;
        DateFormatTok: Label 'dd-mmm-yyyy', Locked = true;
        DefaultDescriptionTxt: Label 'Payment %1', Comment = '%1 = PV No.';
        NoDebitAccountErr: Label 'Bank Account %1 has no Bank Account No. The bank file needs the real account number to debit.', Comment = '%1 = bank account code';
        NoLinesErr: Label 'Batch EFT Voucher %1 has no lines with an amount greater than zero.', Comment = '%1 = batch no.';
        LineIssuesErr: Label 'The bank file cannot be created. Fix these lines first:\%1', Comment = '%1 = list of problems';
        MissingAccountTxt: Label 'no vendor bank account number';
        NoVendorBankAccountTxt: Label 'vendor %1 has no Vendor Bank Account with Bank Account No. %2 (Vendor card > Bank Accounts)', Comment = '%1 = vendor no, %2 = account no';
        MissingBankCodeTxt: Label 'no bank code on Vendor Bank Account %1 (set Name like "EQUITY BANK - 68" or Bank Branch No. to the 5-digit sort code, e.g. 68152)', Comment = '%1 = vendor bank account code';
        MissingBranchTxt: Label 'no branch on Vendor Bank Account %1, which EFT payments need (fill Bank Branch No.)', Comment = '%1 = vendor bank account code';
        MinimumAmountTxt: Label 'amount %1 is below the bank minimum of 10.00 KES', Comment = '%1 = amount';
        IssueLineTxt: Label '%1 %2: %3', Comment = '%1 = PV No, %2 = vendor name, %3 = problem';

    procedure Export(NewBatchEFTVoucher: Record "Batch EFT Voucher")
    var
        Line: Record "Batch EFT Lines";
        RowNo: Integer;
    begin
        BatchEFTVoucher := NewBatchEFTVoucher;
        FirstDataRow := 9;

        PrepareHeader();
        CheckLinesAndCalcTotals();

        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();

        WriteHeaderBlock();
        WriteColumnHeaders();

        RowNo := FirstDataRow - 1;
        Line.SetRange("Document No", BatchEFTVoucher."No.");
        if Line.FindSet() then
            repeat
                if IncludeLine(Line) then begin
                    RowNo += 1;
                    WriteLine(RowNo, Line);
                end;
            until Line.Next() = 0;

        TempExcelBuffer.CreateNewBook(SheetNameTok);
        TempExcelBuffer.WriteSheet('', CompanyName(), UserId());
        SetColumnWidths();
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(BatchName);
        TempExcelBuffer.OpenExcel();
    end;

    // ---------------------------------------------------------------- layout

    local procedure WriteHeaderBlock()
    begin
        EnterText(3, 2, 'Supplier Batch', true, '');

        EnterText(3, 3, 'File Name', true, '');
        EnterText(3, 4, BatchName, false, TextFormatTok);
        EnterText(3, 6, 'Currency', true, '');
        EnterText(3, 7, CurrencyCode, false, TextFormatTok);

        EnterText(4, 3, 'Account to Debit', true, '');
        EnterText(4, 4, AccountToDebit, false, TextFormatTok);
        EnterText(4, 6, 'Total Amount', true, '');
        EnterNumber(4, 7, TotalAmount, false, AmountFormatTok);

        EnterText(5, 3, 'Execution Date', true, '');
        EnterDate(5, 4, ExecutionDate);
        EnterText(5, 6, 'No. of Records', true, '');
        EnterNumber(5, 7, RecordCount, false, '0');

        EnterText(6, 3, 'Account to Pay Charges', true, '');
        EnterText(6, 4, AccountToPayCharges, false, TextFormatTok);
    end;

    local procedure WriteColumnHeaders()
    begin
        EnterText(8, 1, 'Invoice Number', true, '');
        EnterText(8, 2, 'Supplier Name', true, '');
        EnterText(8, 3, 'Account Number', true, '');
        EnterText(8, 4, 'Bank Name or Bank Code', true, '');
        EnterText(8, 5, 'Amount', true, '');
        EnterText(8, 6, 'Payment Description (Max 50 characters)', true, '');
        EnterText(8, 7, 'Payment Mode', true, '');
        EnterText(8, 8, 'Branch Name or Code', true, '');
    end;

    local procedure WriteLine(RowNo: Integer; Line: Record "Batch EFT Lines")
    var
        VendorBankAccount: Record "Vendor Bank Account";
        LineBankCode: Text;
        LineBranchCode: Text;
        LineMode: Text;
        BranchText: Text;
    begin
        GetBankDetails(Line, VendorBankAccount, LineBankCode, LineBranchCode);
        LineMode := GetPaymentMode(LineBankCode, Line."Net Amount");

        if LineMode = EFTModeTok then
            BranchText := GetBranchText(VendorBankAccount, LineBranchCode);

        EnterText(RowNo, 1, Line."PV No", false, TextFormatTok);
        EnterText(RowNo, 2, Line."Vendor Name", false, '');
        EnterText(RowNo, 3, DelChr(Line."Vendor Bank Account No.", '=', ' -'), false, TextFormatTok);
        EnterText(RowNo, 4, GetTemplateBankName(LineBankCode), false, '');
        EnterNumber(RowNo, 5, Round(Line."Net Amount", 0.01), false, AmountFormatTok);
        EnterText(RowNo, 6, CopyStr(DelChr(GetLineDescription(Line), '<>', ' '), 1, 50), false, '');
        EnterText(RowNo, 7, LineMode, false, '');
        EnterText(RowNo, 8, BranchText, false, TextFormatTok);
    end;

    local procedure SetColumnWidths()
    begin
        TempExcelBuffer.SetColumnWidth('A', 16);
        TempExcelBuffer.SetColumnWidth('B', 38);
        TempExcelBuffer.SetColumnWidth('C', 22);
        TempExcelBuffer.SetColumnWidth('D', 32);
        TempExcelBuffer.SetColumnWidth('E', 16);
        TempExcelBuffer.SetColumnWidth('F', 50);
        TempExcelBuffer.SetColumnWidth('G', 16);
        TempExcelBuffer.SetColumnWidth('H', 30);
    end;

    local procedure EnterText(RowNo: Integer; ColNo: Integer; Value: Text; IsBold: Boolean; NumFormat: Text[30])
    begin
        TempExcelBuffer.SetCurrent(RowNo, ColNo - 1);
        TempExcelBuffer.AddColumn(Value, false, '', IsBold, false, false, NumFormat, TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure EnterNumber(RowNo: Integer; ColNo: Integer; Value: Decimal; IsBold: Boolean; NumFormat: Text[30])
    begin
        TempExcelBuffer.SetCurrent(RowNo, ColNo - 1);
        TempExcelBuffer.AddColumn(Value, false, '', IsBold, false, false, NumFormat, TempExcelBuffer."Cell Type"::Number);
    end;

    local procedure EnterDate(RowNo: Integer; ColNo: Integer; Value: Date)
    begin
        TempExcelBuffer.SetCurrent(RowNo, ColNo - 1);
        TempExcelBuffer.AddColumn(Value, false, '', false, false, false, DateFormatTok, TempExcelBuffer."Cell Type"::Date);
    end;

    // ---------------------------------------------------------------- header values

    local procedure PrepareHeader()
    var
        BankAccount: Record "Bank Account";
    begin
        BankAccount.Get(BatchEFTVoucher."Paying Bank Account");

        AccountToDebit := DigitsOnly(BankAccount."Bank Account No.");
        if AccountToDebit = '' then
            Error(NoDebitAccountErr, BankAccount."No.");
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

        BatchName := CleanBatchName(BatchEFTVoucher."No.");
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
                    if NeedsBranch and (GetBranchText(VendorBankAccount, LineBranchCode) = '') then
                        Problem := StrSubstNo(MissingBranchTxt, VendorBankAccount.Code)
                    else
                        if (CurrencyCode = LocalCurrencyTok) and (Line."Net Amount" < 10) then
                            Problem := StrSubstNo(MinimumAmountTxt, Line."Net Amount");
        end;

        if Problem <> '' then
            Issues.AppendLine(StrSubstNo(IssueLineTxt, Line."PV No", Line."Vendor Name", Problem));
    end;

    local procedure IncludeLine(Line: Record "Batch EFT Lines"): Boolean
    begin
        exit(Line."Net Amount" > 0);
    end;

    // ---------------------------------------------------------------- bank, branch, mode

    // Finds the Vendor Bank Account whose Bank Account No. matches the line and works out:
    // Bank code  : " - NN" suffix of the line's Vendor Bank Name, else of the Vendor Bank Account Name,
    //              else the first 2 digits of a 5-digit sort code in Bank Branch No.
    // Branch code: last 3 digits of that sort code, or Bank Branch No. padded to 3 digits.
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

    // The template's Validate button only accepts branches exactly as they appear in its drop-down,
    // e.g. "Harambee Avenue - 019". Store that text in Vendor Bank Account "Name 2" to get it here;
    // otherwise the 3-digit branch code is written.
    local procedure GetBranchText(VendorBankAccount: Record "Vendor Bank Account"; LineBranchCode: Text): Text
    begin
        if StrPos(VendorBankAccount."Name 2", ' - ') > 0 then
            exit(DelChr(VendorBankAccount."Name 2", '<>', ' '));
        exit(LineBranchCode);
    end;

    local procedure GetPaymentMode(LineBankCode: Text; Amount: Decimal): Text
    begin
        if LineBankCode = OwnBankCodeTok then
            exit(WithinBankModeTok);
        // Foreign-currency payments to other banks only allow RTGS in the template;
        // EFT is limited to amounts below 1,000,000 KES.
        if (CurrencyCode <> LocalCurrencyTok) or (Amount >= 1000000) then
            exit(RTGSModeTok);
        exit(EFTModeTok);
    end;

    // Bank names exactly as in the template's "Bank Name or Bank Code" drop-down
    local procedure GetTemplateBankName(BankCode: Text): Text
    begin
        case BankCode of
            '01':
                exit('KENYA COMMERCIAL BANK - 01');
            '02':
                exit('STANDARD CHARTERED BANK - 02');
            '03':
                exit('ABSA BANK KENYA PLC - 03');
            '05':
                exit('BANK OF INDIA - 05');
            '06':
                exit('BANK OF BARODA - 06');
            '07':
                exit('NCBA BANK KENYA PLC - 07');
            '10':
                exit('PRIME BANK - 10');
            '11':
                exit('COOPERATIVE BANK OF KENYA - 11');
            '12':
                exit('NATIONAL BANK OF KENYA - 12');
            '14':
                exit('M-ORIENTAL COMMERCIAL - 14');
            '16':
                exit('CITIBANK KENYA - 16');
            '17':
                exit('HABIB BANK AG ZURICH - 17');
            '18':
                exit('MIDDLE EAST BANK - 18');
            '19':
                exit('BANK OF AFRICA - 19');
            '23':
                exit('CONSOLIDATED BANK - 23');
            '25':
                exit('CREDIT BANK - 25');
            '26':
                exit('Access Bank Kenya PLC - 26');
            '31':
                exit('STANBIC BANK - 31');
            '35':
                exit('AFRICAN BANKING CORPORATION - 35');
            '43':
                exit('ECOBANK - 43');
            '49':
                exit('SPIRE COMMERCIAL BANK - 49');
            '50':
                exit('PARAMOUNT BANK - 50');
            '51':
                exit('Kingdom Bank Limited - 51');
            '53':
                exit('GUARANTY TRUST BANK - 53');
            '54':
                exit('VICTORIA COMMERCIAL - 54');
            '55':
                exit('GUARDIAN BANK - 55');
            '57':
                exit('I & M BANK LTD - 57');
            '59':
                exit('DEVELOPMENT BANK - 59');
            '60':
                exit('SBM BANK KENYA - 60');
            '61':
                exit('HOUSING FINANCE - 61');
            '62':
                exit('KENYA POST OFFICE SAVNGS BANK - 62');
            '63':
                exit('DIAMOND TRUST BANK - 63');
            '65':
                exit('Commercial International Bank (CIB) Kenya - 65');
            '66':
                exit('SIDIAN BANK - 66');
            '68':
                exit('EQUITY BANK - 68');
            '70':
                exit('FAMILY BANK - 70');
            '72':
                exit('GULF AFRICAN BANK - 72');
            '74':
                exit('FIRST COMMUNITY BANK LIMITED - 74');
            '75':
                exit('DUBAI ISLAMIC BANK KENYA LTD - 75');
            '76':
                exit('United Bank for Africa - 76');
            '78':
                exit('KENYA WOMEN FINANCE TRUST - 78');
            '79':
                exit('FAULU MICROFINANCE BANK - 79');
            '80':
                exit('Caritas Microfinance Bank Ltd - 80');
            '81':
                exit('Salaam Microfinance Bank Ltd - 81');
        end;
        exit(BankCode);
    end;

    // ---------------------------------------------------------------- text helpers

    local procedure GetLineDescription(Line: Record "Batch EFT Lines"): Text
    var
        Payments: Record Payments;
    begin
        // Use the payment voucher's narration (e.g. "Purchase of Computer Equipment")
        Payments.SetRange("No.", Line."PV No");
        if Payments.FindFirst() then
            if Payments."Payment Narration" <> '' then
                exit(Payments."Payment Narration");

        if BatchEFTVoucher.Payee <> '' then
            exit(BatchEFTVoucher.Payee);
        exit(StrSubstNo(DefaultDescriptionTxt, Line."PV No"));
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

    // Same rule as the template's batch-name cleaning: letters, digits, spaces and '.', max 30 characters
    local procedure CleanBatchName(Input: Text) Result: Text
    var
        Ch: Text[1];
        i: Integer;
    begin
        for i := 1 to StrLen(Input) do begin
            Ch := CopyStr(Input, i, 1);
            if StrPos('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .', Ch) > 0 then
                Result += Ch;
        end;
        Result := CopyStr(DelChr(Result, '<>', ' '), 1, 30);
    end;

    local procedure DigitsOnly(Input: Text): Text
    begin
        exit(DelChr(Input, '=', DelChr(Input, '=', '0123456789')));
    end;
}
