namespace KICD.KICD;

using Microsoft.Purchases.Payables;
codeunit 50040 "VLE Tax Code Cleaner"
{
    procedure ProcessEntries(
        FromDate: Date;
        ToDate: Date;
        VendorNo: Code[20];
        DocumentNo: Code[20];
        PreviewMode: Boolean;
        var ResultMsg: Text)
    var
        VLE: Record "Vendor Ledger Entry";
        ProcessedCount: Integer;
        ChangedCount: Integer;
        LogText: Text;
        NewWHT: Code[10];
        NewVATW: Code[10];
        NewPPRA: Code[10];
        NewRet: Code[10];
        NewPAYE: Code[10];
    begin
        VLE.Reset();
        if FromDate <> 0D then
            VLE.SetRange("Posting Date", FromDate, ToDate);
        if VendorNo <> '' then
            VLE.SetRange("Vendor No.", VendorNo);
        if DocumentNo <> '' then
            VLE.SetRange("Document No.", DocumentNo);

        if not VLE.FindSet(true) then begin
            ResultMsg := 'No Vendor Ledger Entries found matching the filters.';
            exit;
        end;

        LogText := '';
        ProcessedCount := 0;
        ChangedCount := 0;

        repeat
            ProcessedCount += 1;

            ResolveCodesFromDescription(
                VLE.Description,
                VLE.WHT,
                VLE."VAT Witheld",
                VLE.PPRA,
                VLE.Retention,
                VLE.PAYE,
                NewWHT,
                NewVATW,
                NewPPRA,
                NewRet,
                NewPAYE);

            if (NewWHT <> VLE.WHT) or
               (NewVATW <> VLE."VAT Witheld") or
               (NewPPRA <> VLE.PPRA) or
               (NewRet <> VLE.Retention) or
               (NewPAYE <> VLE.PAYE) then begin

                ChangedCount += 1;

                LogText += 'EntryNo: ' + Format(VLE."Entry No.") +
                           ' | Vendor: ' + VLE."Vendor No." +
                           ' | Doc: ' + VLE."Document No." +
                           ' | Desc: ' + VLE.Description + '\';
                LogText += '  WHT:     [' + VLE.WHT + '] -> [' + NewWHT + ']\';
                LogText += '  VATWH:   [' + VLE."VAT Witheld" + '] -> [' + NewVATW + ']\';
                LogText += '  PPRA:    [' + VLE.PPRA + '] -> [' + NewPPRA + ']\';
                LogText += '  RET:     [' + VLE.Retention + '] -> [' + NewRet + ']\';
                LogText += '  PAYE:    [' + VLE.PAYE + '] -> [' + NewPAYE + ']\';
                LogText += '--------------------------------\';

                if not PreviewMode then begin
                    VLE.WHT := NewWHT;
                    VLE."VAT Witheld" := NewVATW;
                    VLE.PPRA := NewPPRA;
                    VLE.Retention := NewRet;
                    VLE.PAYE := NewPAYE;
                    VLE.Modify();
                end;
            end;

        until VLE.Next() = 0;

        ResultMsg := '================================\';
        if PreviewMode then
            ResultMsg += 'PREVIEW MODE - NO CHANGES SAVED\\'
        else
            ResultMsg += 'CHANGES APPLIED TO DATABASE\';
        ResultMsg += '================================\';
        ResultMsg += 'Total Entries Scanned : ' + Format(ProcessedCount) + '\';
        ResultMsg += 'Entries To Be Changed : ' + Format(ChangedCount) + '\';
        ResultMsg += '================================\';
        if LogText <> '' then
            ResultMsg += LogText
        else
            ResultMsg += 'No entries required changes.\';
    end;

    local procedure ResolveCodesFromDescription(
        Description: Text[100];
        OldWHT: Code[10];
        OldVATW: Code[10];
        OldPPRA: Code[10];
        OldRet: Code[10];
        OldPAYE: Code[10];
        var NewWHT: Code[10];
        var NewVATW: Code[10];
        var NewPPRA: Code[10];
        var NewRet: Code[10];
        var NewPAYE: Code[10])
    var
        UpperDesc: Text[100];
    begin
        UpperDesc := UpperCase(Description);

        NewWHT := '';
        NewVATW := '';
        NewPPRA := '';
        NewRet := '';
        NewPAYE := '';

        if StrPos(UpperDesc, 'PCBL CHARGE') > 0 then begin
            NewPPRA := OldPPRA;
            exit;
        end;

        if (StrPos(UpperDesc, 'WHOLDINGTAX') > 0) or
           (StrPos(UpperDesc, 'WITHHOLDING TAX') > 0) or
           (StrPos(UpperDesc, 'OBLIGATION WHT') > 0) or
           (StrPos(UpperDesc, 'OBLIGATION INCOME TAX') > 0) then begin
            NewWHT := OldWHT;
            exit;
        end;

        if (StrPos(UpperDesc, 'VAT WITHHELD') > 0) or
           (StrPos(UpperDesc, 'OBLIGATION VAT') > 0) then begin
            NewVATW := OldVATW;
            exit;
        end;

        if StrPos(UpperDesc, 'PAYE') > 0 then begin
            NewPAYE := OldPAYE;
            exit;
        end;

        if (StrPos(UpperDesc, 'AMOUNT RETAINED') > 0) or
           (StrPos(UpperDesc, 'AMOUNT RETAINED:') > 0) then begin
            NewRet := OldRet;
            exit;
        end;
    end;
}