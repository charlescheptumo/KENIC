#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 51006 "Bridge Sub Transactions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Bridge Sub Transaction";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TransactionID; Rec.TransactionID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TransactionID field.';
                }
                field(VoucherDate; Rec.VoucherDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VoucherDate field.';
                }
                field(VoucherID; Rec.VoucherID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VoucherID field.';
                }
                field(TRCodeID; Rec.TRCodeID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TRCodeID field.';
                }
                field(TrCode; Rec.TrCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TrCode field.';
                }
                field(TrDescription; Rec.TrDescription)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TrDescription field.';
                }
                field(TxnAmount; Rec.TxnAmount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TxnAmount field.';
                }
                field(TxnDescription; Rec.TxnDescription)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TxnDescription field.';
                }
                field(TxnReference; Rec.TxnReference)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TxnReference field.';
                }
                field(SupplierAccount; Rec.SupplierAccount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SupplierAccount field.';
                }
                field(SupplierName; Rec.SupplierName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SupplierName field.';
                }
                field(BankName; Rec.BankName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankName field.';
                }
                field(BankCode; Rec.BankCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankCode field.';
                }
                field(BankBranchCode; Rec.BankBranchCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankBranchCode field.';
                }
                field(BankBranch; Rec.BankBranch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankBranch field.';
                }
                field(BankAccNum; Rec.BankAccNum)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankAccNum field.';
                }
                field(GLAccount; Rec.GLAccount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLAccount field.';
                }
                field(GLAccountDescription; Rec.GLAccountDescription)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLAccountDescription field.';
                }
                field(GLBankName; Rec.GLBankName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLBankName field.';
                }
                field(GLBankCode; Rec.GLBankCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLBankCode field.';
                }
                field(GLBankAccNo; Rec.GLBankAccNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLBankAccNo field.';
                }
                field(GLBankBranch; Rec.GLBankBranch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLBankBranch field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(GLBankAccountName; Rec.GLBankAccountName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLBankAccountName field.';
                }
            }
        }
    }

    actions
    {
    }
}

