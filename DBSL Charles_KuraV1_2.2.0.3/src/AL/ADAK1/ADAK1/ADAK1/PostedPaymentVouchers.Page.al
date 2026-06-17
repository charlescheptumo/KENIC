#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57005 "Posted Payment Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Payment Voucherss";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(true),
                            Status = const(Released));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.', Comment = '%';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the cheque No./ EFT No. field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Wthheld six % field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Payment Voucher action.';

                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    ResponsibilityCenter: Record "Responsibility Center";
                    PV: Record payments;
                begin
                    PV.Reset();
                    PV.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Payment Voucher", true, true, PV);
                    // if UserSetup.Get(UserId) then begin
                    //     if ResponsibilityCenter.Get(UserSetup."Responsibility Center") then begin
                    //         if ResponsibilityCenter.HQ then begin
                    //              PV.Reset();
                    //             PV.SetRange("No.", Rec."No.");
                    //             Report.Run(Report::"Payment Voucher", true, true, PV)
                    //         end else begin
                    //             PV.Reset();
                    //             PV.SetRange("No.", Rec."No.");
                    //             Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                    //         end;
                    //     end;
                    // end else begin
                    //     if ResponsibilityCenter.Get(Rec."Responsibility Center") then begin
                    //         if ResponsibilityCenter.HQ then begin
                    //             PV.Reset();
                    //             PV.SetRange("No.", Rec."No.");
                    //             Report.Run(Report::"Payment Voucher", true, true, PV)
                    //         end else begin
                    //             PV.Reset();
                    //             PV.SetRange("No.", Rec."No.");
                    //             Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                    //         end;
                    //     end;
                    // end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
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
            // if not UserSetup."Accounts Administrator" then
            //     Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            if not UserSetup."Accounts User" then
                Error('You do not have the required access rights to use this page. Please contact your system administrator.');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

