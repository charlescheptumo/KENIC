report 56004 "Trial Balance Total"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Trial Balance Total.rdlc';
    Caption = 'Trial Balance';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.") where("Account Type" = const(Posting), "Balance at Date" = filter(<> 0));
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(STRSUBSTNO_Text000_PeriodText_; StrSubstNo(Text000, PeriodText))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            // column(COMPANYNAME; CompanyName)
            // {
            // }
            column(COMPANYNAME; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(G_L_Account__TABLECAPTION__________GLFilter; TableCaption + ': ' + GLFilter)
            {
            }
            column(GLFilter; GLFilter)
            {
            }
            column(G_L_Account_No_; "No.")
            {
            }
            column(Trial_BalanceCaption; Trial_BalanceCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Net_ChangeCaption; Net_ChangeCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(G_L_Account___No__Caption; FieldCaption("No."))
            {
            }
            column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaption; PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl)
            {
            }
            column(G_L_Account___Net_Change_Caption; G_L_Account___Net_Change_CaptionLbl)
            {
            }
            column(G_L_Account___Net_Change__Control22Caption; G_L_Account___Net_Change__Control22CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date_Caption; G_L_Account___Balance_at_Date_CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date__Control24Caption; G_L_Account___Balance_at_Date__Control24CaptionLbl)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(G_L_Account__Account_Type_; "G/L Account"."Account Type")
                {
                }
                column(G_L_Account___No__; "G/L Account"."No.")
                {
                }
                column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__Name; PadStr('', "G/L Account".Indentation * 2) + "G/L Account".Name)
                {
                }
                column(G_L_Account___Net_Change_; "G/L Account"."Net Change")
                {
                }
                column(G_L_Account___Net_Change__Control22; -"G/L Account"."Net Change")
                {
                    AutoFormatType = 1;
                }
                column(G_L_Account___Balance_at_Date_; "G/L Account"."Balance at Date")
                {
                }
                column(G_L_Account___Balance_at_Date__Control24; -"G/L Account"."Balance at Date")
                {
                    AutoFormatType = 1;
                }
                column(G_L_Account___Account_Type_; Format("G/L Account"."Account Type", 0, 2))
                {
                }
                column(No__of_Blank_Lines; "G/L Account"."No. of Blank Lines")
                {
                }
                column(DebTotal; DebTotal)
                {
                }
                column(CredTotal; CredTotal)
                {
                }
                column(TotalDebit; TotalDebit)
                {
                }
                column(TotalCredit; TotalCredit)
                {
                }
                dataitem(BlankLineRepeater; "Integer")
                {
                    column(BlankLineNo; BlankLineNo)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if BlankLineNo = 0 then
                            CurrReport.Break;

                        BlankLineNo -= 1;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    BlankLineNo := "G/L Account"."No. of Blank Lines" + 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                // if "G/L Account".Name = 'Eco Bank KES BANK' then begin
                //     BankAcc.Init;
                //     Clear(GLAccount."Balance at Date");
                //     GLAccount."Balance at Date" := BankAcc.Balance;
                // end;


                CalcFields("Net Change", "Balance at Date");

                GLAccount.Reset();
                GLAccount.SetRange("No.", "G/L Account"."No.");
                GLAccount.SetRange(GLAccount."Date Filter", MinDate, MaxDate);
                GLAccount.SetFilter(GLAccount."Global Dimension 1 Filter", GlobDim1);
                GLAccount.SetFilter(GLAccount."Global Dimension 2 Filter", GlobDim2);

                GLAccount.SetRange("Account Type", GLAccount."Account Type"::Posting);
                if GLAccount.FindSet() then begin
                    repeat
                        // GLAccount.CalcFields("Balance at Date");
                        // if "G/L Account".Name = 'Eco Bank KES BANK' then begin
                        //     BankAcc.Init;
                        //     BankAcc.SetRange("No.", 'BANK0004');
                        //     Clear(GLAccount."Balance at Date");
                        //     BankAcc.CalcFields(Balance);
                        //     GLAccount."Balance at Date" := BankAcc.Balance;

                        //     if GLAccount."Balance at Date" > 0 then begin
                        //         DebTotal := DebTotal + GLAccount."Balance at Date";
                        //     end
                        //     else if GLAccount."Balance at Date" < 0 then begin
                        //         CredTotal := CredTotal + Abs(GLAccount."Balance at Date");
                        //     end;
                        // end else begin
                        //     if GLAccount."Balance at Date" <> 0 then begin
                        //         if GLAccount."Balance at Date" > 0 then begin
                        //             DebTotal := DebTotal + GLAccount."Balance at Date";
                        //         end
                        //         else if GLAccount."Balance at Date" < 0 then begin
                        //             CredTotal := CredTotal + Abs(GLAccount."Balance at Date");
                        //         end;
                        //     end;
                        // end;
                        GLAccount.CalcFields("Balance at Date");
                        if GLAccount."Balance at Date" <> 0 then begin
                            if GLAccount."Balance at Date" > 0 then begin
                                DebTotal := DebTotal + GLAccount."Balance at Date";
                            end
                            else if GLAccount."Balance at Date" < 0 then begin
                                CredTotal := CredTotal + Abs(GLAccount."Balance at Date");
                            end;
                        end;
                    until GLAccount.Next = 0;

                    TotalDebit := DebTotal;
                    TotalCredit := CredTotal;

                end;


                if ChangeGroupNo then begin
                    PageGroupNo += 1;
                    ChangeGroupNo := false;
                end;

                ChangeGroupNo := "New Page";



            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 0;
                ChangeGroupNo := false;

                MinDate := "G/L Account".GetRangeMin("Date Filter");
                MaxDate := "G/L Account".GetRangeMax("Date Filter");
                GlobDim1 := "G/L Account".GetFilter("Global Dimension 1 Filter");
                GlobDim2 := "G/L Account".GetFilter("Global Dimension 2 Filter");
            end;

            // trigger OnPostDataItem()
            // begin
            //     Message('Test');
            //     // TotalDebit := DebTotal;
            //     Message('Total Debit is %1', TotalDebit);
            //     // TotalCredit := CredTotal;
            //     Message('Total Credit is %1', TotalCredit);
            // end;
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

    trigger OnInitReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;


    trigger OnPreReport()
    begin
        GLFilter := "G/L Account".GetFilters;
        PeriodText := "G/L Account".GetFilter("Date Filter");
        MinDate := "G/L Account".GetRangeMin("Date Filter");
        MaxDate := "G/L Account".GetRangeMax("Date Filter");
        GlobDim1 := "G/L Account".GetFilter("Global Dimension 1 Filter");
        GlobDim2 := "G/L Account".GetFilter("Global Dimension 2 Filter");

        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        Text000: Label 'Period: %1';
        GLFilter: Text;
        PeriodText: Text[30];
        Trial_BalanceCaptionLbl: Label 'Trial Balance';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Net_ChangeCaptionLbl: Label 'Net Change';
        BalanceCaptionLbl: Label 'Balance (USD)';
        PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl: Label 'Name';
        G_L_Account___Net_Change_CaptionLbl: Label 'Debit';
        G_L_Account___Net_Change__Control22CaptionLbl: Label 'Credit';
        G_L_Account___Balance_at_Date_CaptionLbl: Label 'Debit (USD)';
        G_L_Account___Balance_at_Date__Control24CaptionLbl: Label 'Credit (USD)';
        PageGroupNo: Integer;
        AccountName: Code[500];
        Acc: Code[500];
        ChangeGroupNo: Boolean;
        BlankLineNo: Integer;
        DebTotal: Decimal;
        CredTotal: Decimal;
        GLAccount: Record "G/L Account";
        GLEntry: Record "G/L Entry";
        TotalDebit: Decimal;
        TotalCredit: Decimal;
        CompanyInfo: Record "Company Information";
        MinDate: Date;
        MaxDate: Date;
        GlobDim1: Code[100];
        GlobDim2: Code[100];
        GlobDim3: Code[100];
        BankAcc: Record "Bank Account";
}

