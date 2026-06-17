#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57002 "Approved Payment Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Payment Voucher";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Status = const(Released),
                            Posted = const(false),
                            banked = const(false),
                            "Archive Document" = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Pay Mode field.', Comment = '%';
                }
                field("Cheque No/Reference No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the cheque No./ EFT No. field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                }
                FIELD("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                 field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the VAT Wthheld six % field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Petty Cash Amount field.';
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the JobNo field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Banked Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Banked Payment Voucher action.';

                trigger OnAction()
                begin
                    Payments.Reset;
                    Payments.SetRange(Select, true);
                    Payments.SetRange("Payment Type", Payments."payment type"::"Payment Voucher");
                    if Payments.Find('-') then begin
                        repeat
                            Payments.banked := true;
                            Payments.Modify;
                        until Payments.Next = 0;
                    end;
                    Message('Banked Successfully');
                end;
            }
            action("Clear Selection")
            {
                ApplicationArea = Basic;
                trigger OnAction()
                begin
                    Rec.CopyFilters(Rec);
                    Rec.SetRange(Select, true);
                    Rec.ModifyAll(Select, false);
                    Message('Selection cleared.');
                end;
            }
            action("Batch Check")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Transfer to Batch Imprest Posting action.';

                trigger OnAction()
                var
                    DocNo: Code[100];
                    PVLines: Record "PV Lines";
                    Payments: Record Payments;
                    CashMgt: Record "Cash Management Setup";
                    BatchCheckHeader: Record "Batch Check Voucher";
                    BatchCheckLines: Record "Batch Check Lines";
                    NoSeriesManagement: Codeunit "No. Series";
                    VendorNo: Code[100];
                    FirstVendor: Boolean;
                    LineNo: Integer;
                begin
                    CashMgt.Get();
                    Payments.CopyFilters(Rec);
                    Payments.SetRange(Select, true);
                    if Payments.IsEmpty() then
                        Error('No Payment Voucher has been selected.');
                    // Create Header
                    BatchCheckHeader.Init();
                    BatchCheckHeader."No." := NoSeriesManagement.GetNextNo(CashMgt."Batch Check Voucher Nos", WorkDate(), true);
                    BatchCheckHeader."Created By" := UserId;
                    BatchCheckHeader.Date := Today;
                    BatchCheckHeader."Pay Mode" := 'CHEQUE';
                    BatchCheckHeader.Insert(true);
                    DocNo := BatchCheckHeader."No.";
                    LineNo := 10000;
                    if Payments.FindSet() then
                        repeat
                            Payments.CalcFields("Total Net Amount");
                            PVLines.Reset();
                            PVLines.SetRange(No, Payments."No.");
                            if not PVLines.FindFirst() then
                                Error('Payment Voucher %1 has no lines.', Payments."No.");
                            BatchCheckLines.Init();
                            BatchCheckLines."Document No" := DocNo;
                            BatchCheckLines."Line No" := LineNo;
                            BatchCheckLines."Vendor No" := PVLines."Account No";
                            BatchCheckLines.Validate("Vendor No");
                            BatchCheckLines."PV No" := Payments."No.";
                            BatchCheckLines."Net Amount" := Payments."Total Net Amount";
                            BatchCheckLines.Insert();
                            LineNo += 10000;
                        until Payments.Next() = 0;
                    Payments.ModifyAll(Select, false);
                    PAGE.Run(PAGE::"Batch Check Voucher", BatchCheckHeader);
                end;

            }

            action("Archive Document")
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Archive Document action.';

                trigger OnAction()
                begin
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    UserSetup.SetRange("Archive Document", true);
                    if UserSetup.Find('-') then begin
                        Rec.SetRange("No.", Rec."No.");
                        Rec."Archive Document" := true;
                        Rec.Modify;
                    end else
                        Error('You don''t have rights to archive finance documents,Contact System administrator');
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then begin
            // if not UserSetup."Accounts Administrator" then
            //     Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            // if not UserSetup."Accounts Administrator" then
            //     Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                Error('You do not have permision to view Payment Vouchers');
        end;

        //Fred RC
        if UserSetup.Get(UserId) then begin
            // if not UserSetup."Accounts Administrator" then
            //     Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    var
        UserSetup: Record "User Setup";
        Payments: Record payments;
        PaymentVoucher: Page "Payment Voucher";
}

#pragma implicitwith restore

