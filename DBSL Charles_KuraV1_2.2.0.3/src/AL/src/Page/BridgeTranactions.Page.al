#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 51005 "Bridge Tranactions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Bridge Transaction";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field(TxnModule; Rec.TxnModule)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TxnModule field.';
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
                field(ProjectID; Rec.ProjectID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ProjectID field.';
                }
                field(ProjectCode; Rec.ProjectCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ProjectCode field.';
                }
                field(ProjectName; Rec.ProjectName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ProjectName field.';
                }
                field(ProjectDescription; Rec.ProjectDescription)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ProjectDescription field.';
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
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
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
                field(SourceBankAccount; Rec.SourceBankAccount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SourceBankAccount field.';
                }
                field(SourceBankAccountDescription; Rec.SourceBankAccountDescription)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SourceBankAccountDescription field.';
                }
                field(SourceBankName; Rec.SourceBankName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SourceBankName field.';
                }
                field(SourceBankCode; Rec.SourceBankCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SourceBankCode field.';
                }
                field(SourceBankBranch; Rec.SourceBankBranch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SourceBankBranch field.';
                }
                field(SourceBankAccountName; Rec.SourceBankAccountName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SourceBankAccountName field.';
                }
                field(Withheld; Rec.Withheld)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withheld field.';
                }
                field(Retained; Rec.Retained)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retained field.';
                }
                field(VoucherIDNo; Rec.VoucherIDNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VoucherIDNo field.';
                }
                field(Flagged; Rec.Flagged)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flagged field.';
                }
                field(IsAIE; Rec.IsAIE)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IsAIE field.';
                }
                field(TransactionID; Rec.TransactionID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TransactionID field.';
                }
            }
        }
    }

    actions
    {
    }
}

