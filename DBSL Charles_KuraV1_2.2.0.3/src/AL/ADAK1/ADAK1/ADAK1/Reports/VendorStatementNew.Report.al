#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57022 "Vendor Statement New"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './Layouts/Vendor Statement New.rdlc';
    RDLCLayout = './Layouts/Vendor - Statement2.rdlc';
    Caption = 'Account Statement';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

   dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.";
            column(UPPERCASE_COMPANYNAME_; UPPERCASE(COMPANYNAME))
            {
            }
            column(Reg_No; "No.")
            {
            }
            column(Vendor_Name; Name)
            {
            }
            column(progName; progName)
            {
            }
            column(StartBalAdjLCY; StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(CustBalanceLCY; CustBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(Vendor__Debit_Amount_; "Debit Amount")
            {
            }
            column(StartBalanceLCY___StartBalAdjLCY____Cust__Ledger_Entry___Amount__LCY_____Correction___ApplicationRounding; StartBalanceLCY + StartBalAdjLCY + "Vendor Ledger Entry"."Amount (LCY)" + Correction + ApplicationRounding)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(Cust__Ledger_Entry___Amount__LCY_____Correction___ApplicationRounding; "Vendor Ledger Entry"."Amount (LCY)" + Correction + ApplicationRounding)
            {
                AutoFormatType = 1;
            }
            column(StartBalAdjLCY_Control67; StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY___StartBalAdjLCY; StartBalanceLCY + StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(STUDENT_STATEMENT_______Caption; STUDENT_STATEMENT_______CaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Ref_No_Caption; Ref_No_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_DescriptionCaption; "Vendor Ledger Entry".FIELDCAPTION(Description))
            {
            }
            column(Bal__KES__Caption; Bal__KES__CaptionLbl)
            {
            }
            column(Vendor_NAME_Caption; Vendor_NAME_CaptionLbl)
            {
            }
            column(OUR_NO_Caption; OUR_NO_CaptionLbl)
            {
            }
            column(PAYMENT_TODATE_Caption; PAYMENT_TODATE_CaptionLbl)
            {
            }
            column(INVOICED_AMOUNT_Caption; INVOICED_AMOUNT_CaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(TypeCaption; TypeCaptionLbl)
            {
            }
            column(Adj__of_Opening_BalanceCaption; Adj__of_Opening_BalanceCaptionLbl)
            {
            }
            column(Total__LCY__Before_PeriodCaption; Total__LCY__Before_PeriodCaptionLbl)
            {
            }
            column(Total__LCY_Caption; Total__LCY_CaptionLbl)
            {
            }
            column(Vendor_Date_Filter; "Date Filter")
            {
            }
            column(Vendor_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            column(CustBal; Vendor.Balance)
            {
            }
            column(Vendor_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Faculty; Faculty)
            {
            }
            column(Stage; Stage)
            {
            }
            column(Campus; Vendor."Global Dimension 1 Code")
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = FIELD("No."),
                               "Posting Date" = FIELD("Date Filter"),
                               "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                               "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                               "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Vendor No.", "Posting Date");
                RequestFilterFields = "Posting Date";
                column(Cust__Ledger_Entry_Description; Description)
                {
                }
                column(CustBalanceLCY_Control56; CustBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Credit_Amount_; "Credit Amount")
                {
                }
                column(Cust__Ledger_Entry__Debit_Amount_; "Debit Amount")
                {
                }
                column(DebitAmountLCY_VendorLedgerEntry; "Debit Amount (LCY)")
                {
                }
                column(CreditAmountLCY_VendorLedgerEntry; "Credit Amount (LCY)")
                {
                }
                column(Cust__Ledger_Entry_Amount_; Amount)
                {
                }
                column(Currency_Code; "Currency Code")
                {
                }
                column(Cust__Ledger_Entry__External_Document_No__; "External Document No.")
                {
                }
                column(Cust__Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Vendor_No_; "Vendor No.")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Cust__Ledger_Entry_Date_Filter; "Date Filter")
                {
                }
                column(companyName; companyInfo.Name)
                {
                }
                column(companylogo; companyInfo.Picture)
                {
                }
                column(CompanyAddress; companyInfo.Address)
                {
                }
                column(Addresses; 'Telephone: ' + companyInfo."Phone No. 2" + ', Phone: ' + companyInfo."Phone No." + ', Email: ' + companyInfo."E-Mail" + ', Fax: ' + companyInfo."Fax No.")
                {
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Cust. Ledger Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("Cust. Ledger Entry No.", "Entry Type", "Posting Date")
                                        WHERE("Entry Type" = CONST("Correction of Remaining Amount"));

                    trigger OnAfterGetRecord()
                    begin
                        Correction := Correction + "Amount (LCY)";
                        CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";
                    end;

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("Posting Date", CustDateFilter);
                    end;
                }
                dataitem("Detailed Cust. Ledg. Entry2"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Cust. Ledger Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("Cust. Ledger Entry No.", "Entry Type", "Posting Date")
                                        WHERE("Entry Type" = CONST("Appln. Rounding"));

                    trigger OnAfterGetRecord()
                    begin
                        ApplicationRounding := ApplicationRounding + "Amount (LCY)";
                        CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";
                        IF CONFIRM('%1 %2', TRUE, Text001, ApplicationRounding) THEN;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("Posting Date", CustDateFilter);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    CALCFIELDS(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)");

                    CustLedgEntryExists := TRUE;
                    IF PrintAmountsInLCY THEN BEGIN
                        CustAmount := "Amount (LCY)";
                        CustRemainAmount := "Remaining Amt. (LCY)";
                        CustCurrencyCode := '';
                    END ELSE BEGIN
                        CustAmount := Amount;
                        CustRemainAmount := "Remaining Amount";
                        CustCurrencyCode := "Currency Code";
                    END;
                    CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";
                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                        CustEntryDueDate := 0D
                    ELSE
                        CustEntryDueDate := "Due Date";


                    if "Currency Code" = '' then
                        "Currency Code" := 'KES';

                    /*
                    "Cust. Ledger Entry".CALCFIELDS("Cust. Ledger Entry".Amount);
                    clear(totals1);
                    detCustLedEntry.RESET;
                    detCustLedEntry.SETRANGE(detCustLedEntry."Document No.","Cust. Ledger Entry"."Document No.");
                    detCustLedEntry.SETRANGE(detCustLedEntry."Vendor No.","Cust. Ledger Entry"."Vendor No.");
                    detCustLedEntry.SETRANGE(detCustLedEntry."Posting Date","Cust. Ledger Entry"."Posting Date");
                    IF detCustLedEntry.FIND('-') THEN BEGIN
                    IF detCustLedEntry.COUNT<2 THEN BEGIN
                    CALCFIELDS(Amount,"Remaining Amount","Amount (LCY)","Remaining Amt. (LCY)");
                    
                    CustLedgEntryExists := TRUE;
                    IF PrintAmountsInLCY THEN BEGIN
                      CustAmount := "Amount (LCY)";
                      CustRemainAmount := "Remaining Amt. (LCY)";
                      CustCurrencyCode := '';
                    END ELSE BEGIN
                      CustAmount := Amount;
                      CustRemainAmount := "Remaining Amount";
                      CustCurrencyCode := "Currency Code";
                    END;
                    CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";
                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                      CustEntryDueDate := 0D
                    ELSE
                      CustEntryDueDate := "Due Date";
                      END ELSE begin
                        repeat
                        totals1:=totals1+"Amount (LCY)";
                        until detCustLedEntry.next = 0;
                    
                    if totals1=0 THEN
                          CurrReport.SKIP
                    
                          ELSE BEGIN
                    CustLedgEntryExists := TRUE;
                    IF PrintAmountsInLCY THEN BEGIN
                      CustAmount := "Amount (LCY)";
                      CustRemainAmount := "Remaining Amt. (LCY)";
                      CustCurrencyCode := '';
                    END ELSE BEGIN
                      CustAmount := Amount;
                      CustRemainAmount := "Remaining Amount";
                      CustCurrencyCode := "Currency Code";
                    END;
                    CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";
                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                      CustEntryDueDate := 0D
                    ELSE
                      CustEntryDueDate := "Due Date";
                    
                          END;
                      end;
                    END ELSE CurrReport.SKIP;
                    
                    */

                end;

                trigger OnPreDataItem()
                begin
                    CustLedgEntryExists := FALSE;
                    CurrReport.CREATETOTALS(CustAmount, "Amount (LCY)");
                end;
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                column(CustBalanceLCY_Control1102760012; CustBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(USERID; USERID)
                {
                }
                column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
                {
                }
                column(TIME; TIME)
                {
                }
                column(Vendor__Credit_Amount__LCY__; Vendor."Credit Amount (LCY)")
                {
                }
                column(Vendor__Debit_Amount__LCY__; Vendor."Debit Amount (LCY)")
                {
                }
                column(Totals___________________________________________________________Caption; Totals___________________________________________________________CaptionLbl)
                {
                }
                column(Statement_Issued_By_Caption; Statement_Issued_By_CaptionLbl)
                {
                }
                column(On_Caption; On_CaptionLbl)
                {
                }
                column(END_______________________________________________Caption; END_______________________________________________CaptionLbl)
                {
                }
                // column(DataItem1102755005; There_will_be_no_refunds_until_completion_of_your_course_and_classification__Any_queries_to_be_addressed_to_Finance_OfficerCaLbl)
                // {
                // }
                column(Integer_Number; Number)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF NOT CustLedgEntryExists AND ((StartBalanceLCY = 0) OR ExcludeBalanceOnly) THEN BEGIN
                        StartBalanceLCY := 0;
                        CurrReport.SKIP;
                    END;
                    Vendor.CALCFIELDS(Vendor."Credit Amount (LCY)");
                    Vendor.CALCFIELDS(Vendor."Debit Amount (LCY)");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*courseReg.RESET;
                CLEAR(progName);
                courseReg.SETRANGE(courseReg."Student No.",Vendor."No.");
                courseReg.SETFILTER(courseReg.Programme,'<>%1','');
                IF courseReg.FIND('+') THEN BEGIN
                Prog.RESET;
                Prog.SETRANGE(Prog.Code,courseReg.Programme);
                IF Prog.FIND('-') THEN BEGIN
                progName:=Prog.Description;
                END;
                END;
                */

                StartBalanceLCY := 0;
                StartBalAdjLCY := 0;
                IF CustDateFilter <> '' THEN BEGIN
                    IF GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                        SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                        CALCFIELDS("Net Change (LCY)");
                        CALCFIELDS(Balance);
                        StartBalanceLCY := "Net Change (LCY)";
                    END;
                    SETFILTER("Date Filter", CustDateFilter);
                    CALCFIELDS("Net Change (LCY)");
                    CALCFIELDS(Balance);
                    StartBalAdjLCY := "Net Change (LCY)";
                    CustLedgEntry.SETCURRENTKEY("Vendor No.", "Posting Date");
                    CustLedgEntry.SETRANGE("Vendor No.", Vendor."No.");
                    CustLedgEntry.SETFILTER("Posting Date", CustDateFilter);
                    IF CustLedgEntry.FIND('-') THEN
                        REPEAT
                            CustLedgEntry.SETFILTER("Date Filter", CustDateFilter);
                            CustLedgEntry.CALCFIELDS("Amount (LCY)");
                            StartBalAdjLCY := StartBalAdjLCY - CustLedgEntry."Amount (LCY)";
                            "Detailed Cust. Ledg. Entry".SETCURRENTKEY("Cust. Ledger Entry No.", "Entry Type", "Posting Date");
                            "Detailed Cust. Ledg. Entry".SETRANGE("Cust. Ledger Entry No.", CustLedgEntry."Entry No.");
                            "Detailed Cust. Ledg. Entry".SETFILTER("Entry Type", '%1|%2',
                              "Detailed Cust. Ledg. Entry"."Entry Type"::"Correction of Remaining Amount",
                              "Detailed Cust. Ledg. Entry"."Entry Type"::"Appln. Rounding");
                            "Detailed Cust. Ledg. Entry".SETFILTER("Posting Date", CustDateFilter);
                            IF "Detailed Cust. Ledg. Entry".FIND('-') THEN
                                REPEAT
                                    StartBalAdjLCY := StartBalAdjLCY - "Detailed Cust. Ledg. Entry"."Amount (LCY)";
                                UNTIL "Detailed Cust. Ledg. Entry".NEXT = 0;
                            "Detailed Cust. Ledg. Entry".RESET;
                        UNTIL CustLedgEntry.NEXT = 0;
                END;
                //CurrReport.PRINTONLYIFDETAIL := ExcludeBalanceOnly OR (StartBalanceLCY = 0);
                CustBalanceLCY := StartBalanceLCY + StartBalAdjLCY;


                /*CLEAR(Faculty);
                CLEAR(Stage);
                CALCFIELDS("Student Programme");
                Prog.RESET;
                Prog.SETRANGE(Prog.Code,"Student Programme");
                IF Prog.FIND('-') THEN BEGIN
                DimVal.RESET;
                DimVal.SETRANGE(DimVal.Code,Prog."School Code");
                IF DimVal.FIND('-') THEN BEGIN
                Faculty:=UPPERCASE(DimVal.Name);
                END;
                END;
                
                //CALCFIELDS("Current Stage");
                ProgStages.RESET;
                ProgStages.SETRANGE(ProgStages.Code,"Current Semester");
                IF ProgStages.FIND('-') THEN BEGIN
                Stage:=ProgStages.Description;
                END; */

            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                CurrReport.CREATETOTALS("Vendor Ledger Entry"."Amount (LCY)", StartBalanceLCY, StartBalAdjLCY, Correction, ApplicationRounding);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CustFilter := Vendor.GETFILTERS;
        CustDateFilter := Vendor.GETFILTER("Date Filter");
        WITH "Vendor Ledger Entry" DO
            IF PrintAmountsInLCY THEN BEGIN
                AmountCaption := FIELDCAPTION("Amount (LCY)");
                RemainingAmtCaption := FIELDCAPTION("Remaining Amt. (LCY)");
            END ELSE BEGIN
                AmountCaption := FIELDCAPTION(Amount);
                RemainingAmtCaption := FIELDCAPTION("Remaining Amount");
            END;

        companyInfo.RESET;
        IF companyInfo.FIND('-') THEN BEGIN
            companyInfo.CALCFIELDS(companyInfo.Picture);
        END;
    end;

    var
        Text000: Label 'Period: %1';
        progName: Text[250];
        totals1: Decimal;
        CustLedgEntry: Record "Vendor Ledger Entry";
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        ExcludeBalanceOnly: Boolean;
        CustFilter: Text[250];
        CustDateFilter: Text[30];
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        CustAmount: Decimal;
        CustRemainAmount: Decimal;
        CustBalanceLCY: Decimal;
        CustCurrencyCode: Code[10];
        CustEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        StartBalAdjLCY: Decimal;
        Correction: Decimal;
        ApplicationRounding: Decimal;
        CustLedgEntryExists: Boolean;
        Text001: Label 'Appln Rounding:';
        STUDENT_STATEMENT_______CaptionLbl: Label '***** VENDOR STATEMENT*******';
        Date_CaptionLbl: Label 'Date:';
        Ref_No_CaptionLbl: Label 'Ref No.';
        Bal__KES__CaptionLbl: Label 'Bal (USD:)';
        Vendor_NAME_CaptionLbl: Label 'Vendor NAME:';
        OUR_NO_CaptionLbl: Label 'OUR NO:';
        PAYMENT_TODATE_CaptionLbl: Label 'PAYMENT TODATE:';
        INVOICED_AMOUNT_CaptionLbl: Label 'INVOICED AMOUNT:';
        EmptyStringCaptionLbl: Label '_______________________________________________________________________________________________________________________________________________________________';
        TypeCaptionLbl: Label 'Type';
        Adj__of_Opening_BalanceCaptionLbl: Label 'Adj. of Opening Balance';
        Total__LCY__Before_PeriodCaptionLbl: Label 'Total (LCY) Before Period';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';
        Totals___________________________________________________________CaptionLbl: Label 'Totals:**********************************************************';
        Statement_Issued_By_CaptionLbl: Label 'Statement Issued By:';
        On_CaptionLbl: Label 'On:';
        END_______________________________________________CaptionLbl: Label '************************************END***********************************************';
        //There_will_be_no_refunds_until_completion_of_your_course_and_classification__Any_queries_to_be_addressed_to_Finance_OfficerCaLbl: Label 'There will be no refunds until completion of your course and classification. Any queries to be addressed to Finance Officer';
        Faculty: Text[100];
        DimVal: Record "Dimension Value";
        Stage: Code[50];
        detCustLedEntry: Record "Vendor Ledger Entry";
        companyInfo: Record "Company Information";
}


