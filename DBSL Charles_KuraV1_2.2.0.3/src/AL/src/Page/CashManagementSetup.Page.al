

Page 57008 "Cash Management Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Cash Management Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("PV Journal Template"; Rec."PV Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Journal Template field.';
                }
                field("PV Journal Batch Name"; Rec."PV Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Journal Batch Name field.';
                }
                field("Imprest Journal Template"; Rec."Imprest Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Journal Template field.';
                }
                field("IMPREST Journal Batch Name"; Rec."IMPREST Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IMPREST Journal Batch Name field.';
                }
                field("Imprest Surrender Template"; Rec."Imprest Surrender Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender Template field.';
                }
                field("Petty Cash Surrender Template"; Rec."Petty Cash Surrender Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Surrender Template field.';
                }
                field("IMPREST SUR Journal Batch Name"; Rec."IMPREST SUR Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IMPREST SUR Journal Batch Name field.';
                }
                field("PCASH Journal Template"; Rec."PCASH Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PCASH Journal Template field.';
                }
                field("PCASH Journal Batch Name"; Rec."PCASH Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PCASH Journal Batch Name field.';
                }
                field("Bank TR Journal Template"; Rec."Bank TR Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank TR Journal Template field.';
                }
                field("Bank TR Journal Batch Name"; Rec."Bank TR Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank TR Journal Batch Name field.';
                }
                field("Receipt Template"; Rec."Receipt Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Template field.';
                }
                field("Receipt Batch Name"; Rec."Receipt Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Batch Name field.';
                }
                field("Lock Imprest Application"; Rec."Lock Imprest Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lock Imprest Application field.';
                }
                field("Retention Journal Template"; Rec."Retention Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Journal Template field.';
                }
                field("Retention Journal Batch Name"; Rec."Retention Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Journal Batch Name field.';
                }
                field("Archive Requisitions"; Rec."Archive Requisitions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Archive Requisitions field.';
                }
                field("Days To Archive Requisition"; Rec."Days To Archive Requisition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days To Archive Requisition field.';
                }

                field("Post PV with Taxes"; Rec."Post PV with Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post PV with Taxes field.';
                }
                field("Post VAT"; Rec."Post VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post VAT field.';
                }
                field("Allow Multiple Posting Groups"; Rec."Allow Multiple Posting Groups")
                {
                    ToolTip = 'Specifies the value of the Allow Multiple Posting Groups field.', Comment = '%';
                }
                field("StandingImprest Posting Group"; Rec."StandingImprest Posting Group")
                {
                    ToolTip = 'Specifies the value of the Standing Imprest Posting Group field.', Comment = '%';
                }
                field("Standing Imprest Account No"; Rec."Standing Imprest Account No")
                {
                    ToolTip = 'Specifies the value of the Standing Imprest Account No field.', Comment = '%';
                }
                field("Standing Vendor Check No"; Rec."Standing Vendor Check No")
                {
                    ToolTip = 'Specifies the value of the Standing Vendor Check No field.', Comment = '%';
                }
                field("Rounding Type"; Rec."Rounding Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding Type field.';
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding Precision field.';
                }
                field("Petty Cash Limit"; Rec."Petty Cash Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Limit field.';
                }
                field("Imprest Limit"; Rec."Imprest Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Limit field.';
                }
                field("Imprest Due Date"; Rec."Imprest Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Due Date field.';
                }
                field("Staff Claim Journal Template"; Rec."Staff Claim Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Journal Template field.';
                }
                field("Staff Claim Journal Batch Name"; Rec."Staff Claim Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Journal Batch Name field.';
                }
                field("Staff Claim Nos."; Rec."Staff Claim Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Nos. field.';
                }
                field("EFT Header Nos."; Rec."EFT Header Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EFT Header Nos. field.';
                }
                field("EFT Details Nos."; Rec."EFT Details Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EFT Details Nos. field.';
                }
                field("PV Nos"; Rec."PV Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Nos field.';
                }
                field("Petty Cash Nos"; Rec."Petty Cash Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Nos field.';
                }
                field("Imprest Memo Nos"; Rec."Imprest Memo Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo Nos field.';
                }
                field("Imprest Nos"; Rec."Imprest Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Nos field.';
                }
                field("Imprest Surrender Nos"; Rec."Imprest Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender Nos field.';
                }
                field("Imprest Surr Memo Nos"; Rec."Imprest Surr Memo Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surr Memo Nos field.';
                }
                field("Send Email Notification"; Rec."Send Email Notification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Email Notification field.';
                }
                field("Receipt Nos"; Rec."Receipt Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Nos field.';
                }
                field("Cheque Nos"; Rec."Cheque Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque Nos field.';
                }
                field("Bank Transfer Nos"; Rec."Bank Transfer Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Transfer Nos field.';
                }
                field("Current Financial Year"; Rec."Current Financial Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Financial Year field.';
                }
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget field.';
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget Start Date field.';
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget End Date field.';
                }
                field("Imprest Posting Group"; Rec."Imprest Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Posting Group field.';
                }
                field("General Bus. Posting Group"; Rec."General Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Bus. Posting Group field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("VAT. Prod. Posting Group"; Rec."VAT. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT. Prod. Posting Group field.';
                }
                field("Check for Committment"; Rec."Check for Committment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Check for Committment field.';
                }
                field("Fuel Market Price"; Rec."Fuel Market Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Market Price field.';
                }
                field("Imprest Email"; Rec."Imprest Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Email field.';
                }
                field("Standing Imprest Nos"; Rec."Standing Imprest Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imprest Nos field.';
                }
                field("Standing Imprest Surrender Nos"; Rec."Standing Imprest Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imprest Surrender Nos field.';
                }
                field("Standing Imprest Limit Nos"; Rec."Standing Imprest Limit Nos")
                {
                    ToolTip = 'Specifies the value of the Standing Imprest Limit Nos field.', Comment = '%';
                }
                field("Standing Imp Journal Template"; Rec."Standing Imp Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imp Journal Template field.';
                }
                field("StandingImp Journal Batch Name"; Rec."StandingImp Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the StandingImp Journal Batch Name field.';
                }
                field("Salary Advance Nos"; Rec."Salary Advance Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance Nos field.';
                }
                field("Salary Advance Memo No"; Rec."Salary Advance Memo No")
                {
                    ToolTip = 'Specifies the value of the Salary Advance Memo No field.', Comment = '%';
                    ApplicationArea = Basic;
                }
                field("Salary Adv Journal Template"; Rec."Salary Adv Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Adv Journal Template field.';
                }
                field("Salary Adv Journal Batch Name"; Rec."Salary Adv Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Adv Journal Batch Name field.';
                }
                field("AIE Requisition Nos"; Rec."AIE Requisition Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AIE Requisition Nos field.';
                }
                field("Send AIE e-Notification"; Rec."Send AIE e-Notification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send AIE e-Notification field.';
                }
                field("AIE Inter Fund Bank Account"; Rec."AIE Inter Fund Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AIE Inter Fund Bank Account field.';
                }
                field("AIE Funds Transfer Nos"; Rec."AIE Funds Transfer Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AIE Funds Transfer Nos field.';
                }
                field("Advance Payment G/L Account"; Rec."Advance Payment G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Payment G/L Account field.';
                }
                field("Cash Request Nos."; Rec."Cash Request Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Request Nos. field.';
                }
                field("Retention Account"; Rec."Retention Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Account field.';
                }
                field("Petty Cash Surrender Nos"; Rec."Petty Cash Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Surrender Nos field.';
                }
                field("Batch Imprest Voucher Nos"; Rec."Batch Imprest Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batch Imprest Voucher Nos field.';
                }
                field("Batch Check Voucher Nos"; Rec."Batch Check Voucher Nos")
                {
                    ToolTip = 'Specifies the value of the Batch Check Voucher Nos field.', Comment = '%';
                }
                field("Agency Notice Nos"; Rec."Agency Notice Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agency Notice Nos field.';
                }
                field("Retention Nos"; Rec."Retention Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Nos field.';
                }
            }
            group("Reversal Nos Series")
            {
                Caption = 'Reversal Nos Series';
                field("PV Reversal Nos"; Rec."PV Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Reversal Nos field.';
                }
                field("Petty Cash Reversal Nos"; Rec."Petty Cash Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Reversal Nos field.';
                }
                field("Imprest Reversal Nos"; Rec."Imprest Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Reversal Nos field.';
                }
                field("Bank Transfer Reversal Nos"; Rec."Bank Transfer Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Transfer Reversal Nos field.';
                }
                field("Receipt Reversal Nos"; Rec."Receipt Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Reversal Nos field.';
                }
                field("Imprest Surrender Reversal Nos"; Rec."Imprest Surrender Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender Reversal Nos field.';
                }
                field("Imprest Surr Memo Reversal Nos"; Rec."Imprest Surr Memo Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surr Memo Reversal Nos field.';
                }
                field("Staff Claim Reversal Nos."; Rec."Staff Claim Reversal Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Reversal Nos. field.';
                }
                field("Standing Imprest Reversal Nos"; Rec."Standing Imprest Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imprest Reversal Nos field.';
                }
                field("Salary Advance Reversal Nos"; Rec."Salary Advance Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance Reversal Nos field.';
                }
            }
            group("EDMS Libraries")
            {
                Caption = 'EDMS Libraries';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field("SharePoint Site Link"; Rec."SharePoint Site Link")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site Link field.';
                }
                field("SharePoint Site Main Library"; Rec."SharePoint Site Main Library")
                {
                    ApplicationArea = Basic;
                    Caption = '<SharePoint Site Main Folder>';
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the <SharePoint Site Main Folder> field.';
                }
                field("SharePoint Site Domain Name"; Rec."SharePoint Site Domain Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site Domain Name field.';
                }
                field("SharePoint Site UserName"; Rec."SharePoint Site UserName")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site UserName field.';
                }
                field("SharePoint Site Password"; Rec."SharePoint Site Password")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site Password field.';
                }
                field("SharePoint Document Library"; Rec."SharePoint Document Library")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Document Library field.';
                }
                field("Imprest Memo DMS Link"; Rec."Imprest Memo DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Imprest Memo DMS Link field.';
                }
                field("Imprest Requisition DMS Link"; Rec."Imprest Requisition DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Imprest Requisition DMS Link field.';
                }
                field("Imprest Surrender DMS Link"; Rec."Imprest Surrender DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Imprest Surrender DMS Link field.';
                }
                field("Payment Voucher DMS Link"; Rec."Payment Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Payment Voucher DMS Link field.';
                }
                field("Petty Cash Voucher DMS Link"; Rec."Petty Cash Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Petty Cash Voucher DMS Link field.';
                }
                field("Petty Cash Surrender DMS Link"; Rec."Petty Cash Surrender DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Petty Cash Surrender DMS Link field.';
                }
                field("Inter Bank Transfer DMS Link"; Rec."Inter Bank Transfer DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Inter Bank Transfer DMS Link field.';
                }
                field("Receipts DMS Link"; Rec."Receipts DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Receipts DMS Link field.';
                }
                field("Staff Claims DMS Link"; Rec."Staff Claims DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Staff Claims DMS Link field.';
                }
                field("Inter Fund Transfers DMS Link"; Rec."Inter Fund Transfers DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Inter Fund Transfers DMS Link field.';
                }
                field("Direct Income Voucher DMS Link"; Rec."Direct Income Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Direct Income Voucher DMS Link field.';
                }
                field("AIE EDMS Link"; Rec."AIE EDMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the AIE EDMS Link field.';
                }
                field("ICT Helpdesk Link"; Rec."ICT Helpdesk Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the ICT Helpdesk Link field.';
                }
                field("Fleet Requisition DMS Link"; Rec."Fleet Requisition DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Fleet Requisition DMS Link field.';
                }
                field("Vacancy Announcement  DMS Link"; Rec."Vacancy Announcement  DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy Announcement  DMS Link field.';
                }

            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts User" then
                Error('You do not have the required access rights to use this page. Please contact your system administrator.');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}



