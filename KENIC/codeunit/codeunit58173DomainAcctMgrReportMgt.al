codeunit 58173 "Domain Acct Mgr Report Mgt"
{
    procedure GetOrderedSectionCodes(var SectionCodes: List of [Code[20]])
    begin
        Clear(SectionCodes);
        SectionCodes.Add('REGISTRATION');
        SectionCodes.Add('RENEWAL');
        SectionCodes.Add('MEMBERSHIP');
    end;

    procedure GetSectionDescription(SectionCode: Code[20]): Text[50]
    begin
        case SectionCode of
            'REGISTRATION':
                exit('Registrations');
            'RENEWAL':
                exit('Renewals');
            'MEMBERSHIP':
                exit('Membership');
            else
                exit(SectionCode);
        end;
    end;

    procedure GetSectionItemFilter(SectionCode: Code[20]): Text
    var
        CashMgtSetup: Record "Cash Management Setup";
        ItemFilter: Text;
    begin
        CashMgtSetup.Get();
        case SectionCode of
            'REGISTRATION':
                begin
                    ItemFilter := AddToFilter(ItemFilter, CashMgtSetup."Domain registration");
                    ItemFilter := AddToFilter(ItemFilter, CashMgtSetup."Domain L2 Registration");
                end;
            'RENEWAL':
                begin
                    ItemFilter := AddToFilter(ItemFilter, CashMgtSetup."Domain Renewal");
                    ItemFilter := AddToFilter(ItemFilter, CashMgtSetup."Domain AutoRenewal");
                    ItemFilter := AddToFilter(ItemFilter, CashMgtSetup."Domain L2 Renewal");
                    ItemFilter := AddToFilter(ItemFilter, CashMgtSetup."Domain L2 Autorenewal");
                end;
            'MEMBERSHIP':
                // No Cash Management Setup field exists for this item yet - hardcoded
                // until one is added (e.g. a new "Domain Membership" setup field).
                ItemFilter := 'REG MEMBERSHIP';
        end;
        exit(ItemFilter);
    end;

    local procedure AddToFilter(ExistingFilter: Text; NewValue: Code[50]): Text
    begin
        if NewValue = '' then
            exit(ExistingFilter);
        if ExistingFilter = '' then
            exit(NewValue);
        exit(ExistingFilter + '|' + NewValue);
    end;

    procedure RefreshStatistics(BudgetNameFilter: Code[10]; StartDate: Date; EndDate: Date)
    var
        SectionCodes: List of [Code[20]];
        SectionCode: Code[20];
        TargetDict: Dictionary of [Text, Decimal];
        ActualDict: Dictionary of [Text, Decimal];
        SalespersonCodes: List of [Code[20]];
        SalespersonCode: Code[20];
        MonthDate: Date;
    begin
        DeleteExistingRows(StartDate, EndDate);

        GetOrderedSectionCodes(SectionCodes);
        foreach SectionCode in SectionCodes do begin
            TallyTarget(SectionCode, BudgetNameFilter, StartDate, EndDate, TargetDict, SalespersonCodes);
            TallyActual(SectionCode, StartDate, EndDate, ActualDict, SalespersonCodes);
        end;

        // Write one row per Salesperson x Section x Month in the requested range,
        // so the matrix has no gaps even where both figures are 0.
        MonthDate := DMY2Date(1, Date2DMY(StartDate, 2), Date2DMY(StartDate, 3));
        while MonthDate <= EndDate do begin
            foreach SectionCode in SectionCodes do
                foreach SalespersonCode in SalespersonCodes do
                    InsertRow(SalespersonCode, SectionCode, Date2DMY(MonthDate, 3), Date2DMY(MonthDate, 2), TargetDict, ActualDict);
            MonthDate := CalcDate('<1M>', MonthDate);
        end;
    end;

    local procedure DeleteExistingRows(StartDate: Date; EndDate: Date)
    var
        DomainAcctMgrStatistics: Record "Domain Acct Mgr Statistics";
        MonthDate: Date;
    begin
        MonthDate := DMY2Date(1, Date2DMY(StartDate, 2), Date2DMY(StartDate, 3));
        while MonthDate <= EndDate do begin
            DomainAcctMgrStatistics.Reset();
            DomainAcctMgrStatistics.SetRange(Year, Date2DMY(MonthDate, 3));
            DomainAcctMgrStatistics.SetRange("Month No.", Date2DMY(MonthDate, 2));
            DomainAcctMgrStatistics.DeleteAll();
            MonthDate := CalcDate('<1M>', MonthDate);
        end;
    end;

    local procedure TallyTarget(SectionCode: Code[20]; BudgetNameFilter: Code[10]; StartDate: Date; EndDate: Date; var TargetDict: Dictionary of [Text, Decimal]; var SalespersonCodes: List of [Code[20]])
    var
        ItemBudgetEntry: Record "Item Budget Entry";
        ItemFilter: Text;
        DictKey: Text;
        SalespersonCode: Code[20];
    begin
        ItemFilter := GetSectionItemFilter(SectionCode);
        if ItemFilter = '' then
            exit;

        ItemBudgetEntry.Reset();
        ItemBudgetEntry.SetFilter("Item No.", ItemFilter);
        ItemBudgetEntry.SetRange(Date, StartDate, EndDate);
        if BudgetNameFilter <> '' then
            ItemBudgetEntry.SetRange("Budget Name", BudgetNameFilter);

        if ItemBudgetEntry.FindSet() then
            repeat
                SalespersonCode := ItemBudgetEntry."Budget Dimension 1 Code";
                if SalespersonCode = '' then
                    SalespersonCode := '(BLANK)';

                if not SalespersonCodes.Contains(SalespersonCode) then
                    SalespersonCodes.Add(SalespersonCode);

                DictKey := BuildKey(SalespersonCode, SectionCode, Date2DMY(ItemBudgetEntry.Date, 3), Date2DMY(ItemBudgetEntry.Date, 2));
                if TargetDict.ContainsKey(DictKey) then
                    TargetDict.Set(DictKey, TargetDict.Get(DictKey) + ItemBudgetEntry.Quantity)
                else
                    TargetDict.Add(DictKey, ItemBudgetEntry.Quantity);
            until ItemBudgetEntry.Next() = 0;
    end;
local procedure TallyActual(SectionCode: Code[20]; StartDate: Date; EndDate: Date; var ActualDict: Dictionary of [Text, Decimal]; var SalespersonCodes: List of [Code[20]])
var
    SalesInvoiceLine: Record "Sales Invoice Line";
    SalesInvoiceHeader: Record "Sales Invoice Header";
    ItemFilter: Text;
    DictKey: Text;
    SalespersonCode: Code[20];
begin
    ItemFilter := GetSectionItemFilter(SectionCode);
    if ItemFilter = '' then
        exit;

    SalesInvoiceLine.Reset();
    SalesInvoiceLine.SetRange(Type, SalesInvoiceLine.Type::Item);
    SalesInvoiceLine.SetFilter("No.", ItemFilter);

    if SalesInvoiceLine.FindSet() then
        repeat
            if SalesInvoiceHeader.Get(SalesInvoiceLine."Document No.") then
                if (SalesInvoiceHeader."Posting Date" >= StartDate) and (SalesInvoiceHeader."Posting Date" <= EndDate) then begin
                    SalespersonCode := SalesInvoiceHeader."Salesperson Code";
                    if SalespersonCode = '' then
                        SalespersonCode := '(UNASSIGNED)';

                    if not SalespersonCodes.Contains(SalespersonCode) then
                        SalespersonCodes.Add(SalespersonCode);

                    DictKey := BuildKey(SalespersonCode, SectionCode, Date2DMY(SalesInvoiceHeader."Posting Date", 3), Date2DMY(SalesInvoiceHeader."Posting Date", 2));
                    if ActualDict.ContainsKey(DictKey) then
                        ActualDict.Set(DictKey, ActualDict.Get(DictKey) + SalesInvoiceLine.Quantity)
                    else
                        ActualDict.Add(DictKey, SalesInvoiceLine.Quantity);
                end;
        until SalesInvoiceLine.Next() = 0;
end;    local procedure BuildKey(SalespersonCode: Code[20]; SectionCode: Code[20]; YearValue: Integer; MonthNo: Integer): Text
    begin
        exit(SalespersonCode + '|' + SectionCode + '|' + Format(YearValue) + '|' + Format(MonthNo));
    end;

    local procedure InsertRow(SalespersonCode: Code[20]; SectionCode: Code[20]; YearValue: Integer; MonthNo: Integer; var TargetDict: Dictionary of [Text, Decimal]; var ActualDict: Dictionary of [Text, Decimal])
    var
        DomainAcctMgrStatistics: Record "Domain Acct Mgr Statistics";
        DictKey: Text;
        TargetQty: Decimal;
        ActualQty: Decimal;
    begin
        DictKey := BuildKey(SalespersonCode, SectionCode, YearValue, MonthNo);
        if TargetDict.ContainsKey(DictKey) then
            TargetQty := TargetDict.Get(DictKey)
        else
            TargetQty := 0;
        if ActualDict.ContainsKey(DictKey) then
            ActualQty := ActualDict.Get(DictKey)
        else
            ActualQty := 0;

        if (TargetQty = 0) and (ActualQty = 0) then
            exit; // Skip fully-empty rows so the table doesn't balloon with zero noise.

        DomainAcctMgrStatistics.Init();
        DomainAcctMgrStatistics."Salesperson Code" := SalespersonCode;
        DomainAcctMgrStatistics.Year := YearValue;
        DomainAcctMgrStatistics."Month No." := MonthNo;
        DomainAcctMgrStatistics."Month Name" := MonthShortName(MonthNo);
        DomainAcctMgrStatistics."Section Code" := SectionCode;
        DomainAcctMgrStatistics."Section Description" := GetSectionDescription(SectionCode);
        DomainAcctMgrStatistics."Target Qty" := TargetQty;
        DomainAcctMgrStatistics."Actual Qty" := ActualQty;
        if TargetQty <> 0 then
            DomainAcctMgrStatistics."% Achieved" := Round(ActualQty / TargetQty * 100, 0.01)
        else
            DomainAcctMgrStatistics."% Achieved" := 0; // Target = 0 but Actual > 0 also lands here - judgment call, revisit if that shows up.
        DomainAcctMgrStatistics."Last Updated" := CurrentDateTime;
        DomainAcctMgrStatistics.Insert();
    end;

    local procedure MonthShortName(MonthNo: Integer): Text[10]
    begin
        case MonthNo of
            1: exit('Jan');
            2: exit('Feb');
            3: exit('Mar');
            4: exit('Apr');
            5: exit('May');
            6: exit('Jun');
            7: exit('Jul');
            8: exit('Aug');
            9: exit('Sep');
            10: exit('Oct');
            11: exit('Nov');
            12: exit('Dec');
        end;
    end;
}