#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57014 "Approved Imprest Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Imprest Requisition";
    Editable = true;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released),
                            Posted = const(false),
                            "Send for Posting" = const(false),
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }

                field("Employee Bank Account Name"; Rec."Employee Ban Account Name")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Employee Ban Account Name field.';
                }
                field("Employee Bank Account Code"; Rec."Employee Bank Account Code")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Employee Bank Account Code field.';
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Employee Bank Account Number field.';
                }
                field("Employee Bank Brach Code"; Rec."Employee Bank Brach Code")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Employee Bank Brach Code field.';
                }

                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the JobNo field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(reporting)
        {
        }
        area(navigation)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Banked Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Banked Imprest Requisition action.';

                    trigger OnAction()
                    begin
                        Payments.Reset;
                        Payments.SetRange(Select, true);
                        Payments.SetRange("Payment Type", Payments."payment type"::Imprest);
                        if Payments.Find('-') then begin
                            repeat
                                Payments.banked := true;
                                Payments.Modify;
                            until Payments.Next = 0;
                        end;
                        Message('Banked Successfully');
                    end;
                }
                action("Batch Imprest Posting")
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
                        ImprestLines: Record "Imprest Lines";
                        ImprestAmount: Decimal;
                    begin
                        CashMgt.Get();

                        Payments.Reset;
                        Payments.SetRange(Select, true);
                        Payments.SetRange(Posted, false);
                        Payments.SetRange("Payment Type", Payments."payment type"::Imprest);
                        if Payments.FindSet() then begin

                            // ImprestAmount := 0;
                            // ImprestLines.Reset();
                            // ImprestLines.SetRange(No, Payments."No.");
                            // if ImprestLines.FindSet() then begin
                            //     repeat
                            //         ImprestAmount += ImprestLines.Amount;
                            //     until ImprestLines.Next() = 0;
                            // end;
                            BatchImprestHeader.Init();
                            BatchImprestHeader."Document Type" := BatchImprestHeader."Document Type"::"Batch Imprest";
                            BatchImprestHeader."Payment Type" := BatchImprestHeader."Payment Type"::"Batch Imprest Voucher";
                            BatchImprestHeader."No." := NoSeriesManagement.GetNextNo(CashMgt."Batch Imprest Voucher Nos", WorkDate(), true);
                            BatchImprestHeader."Created By" := UserId;
                            BatchImprestHeader.Date := Today;
                            BatchImprestHeader.Job := Payments.Job;
                            if BatchImprestHeader.Insert(true) then begin
                                DocNo := BatchImprestHeader."No.";
                                repeat
                                    Payments.CalcFields("Imprest Amount");
                                    BatchImprestVoucherLines.Init();
                                    BatchImprestVoucherLines."No." := BatchImprestHeader."No.";
                                    BatchImprestVoucherLines.Reset();
                                    BatchImprestVoucherLines.SetRange("No.", BatchImprestHeader."No.");
                                    if BatchImprestVoucherLines.FindLast() then
                                        BatchImprestVoucherLines."Line No." := BatchImprestVoucherLines."Line No." + 10000
                                    else
                                        BatchImprestVoucherLines."Line No." := 10000;
                                    BatchImprestVoucherLines."Account Type" := Payments."Account Type";
                                    BatchImprestVoucherLines."Account No." := Payments."Account No.";
                                    BatchImprestVoucherLines."Account Name" := Payments."Account Name";
                                    BatchImprestVoucherLines."Imprest Amount" := Payments."Imprest Amount";
                                    BatchImprestVoucherLines.Payee := Payments.Payee;
                                    BatchImprestVoucherLines."Directorate Code" := Payments."Directorate Code";
                                    BatchImprestVoucherLines."Directorate Head" := Payments."Directorate Head";
                                    BatchImprestVoucherLines."Department Code" := Payments."Department Code";
                                    BatchImprestVoucherLines.Division := Payments.Division;
                                    BatchImprestVoucherLines.HOD := Payments.HOD;
                                    BatchImprestVoucherLines."Imprest Req. No." := Payments."No.";
                                    BatchImprestVoucherLines."Reference No." := Payments."Reference No.";
                                    BatchImprestVoucherLines."Employee Mobile No" := Payments."Employee Mobile No";
                                    BatchImprestVoucherLines."Employee Bank Account Code" := Payments."Employee Bank Account Code";
                                    BatchImprestVoucherLines."Employee Ban Account Name" := Payments."Employee Ban Account Name";
                                    BatchImprestVoucherLines."Employee Bank Account Number" := Payments."Employee Bank Account Number";
                                    BatchImprestVoucherLines."Employee Bank Brach Code" := Payments."Employee Bank Brach Code";
                                    BatchImprestVoucherLines."Employee Bank Branch Name" := Payments."Employee Bank Branch Name";
                                    BatchImprestVoucherLines."Shortcut Dimension 1 Code" := Payments."Shortcut Dimension 1 Code";
                                    BatchImprestVoucherLines."Shortcut Dimension 2 Code" := Payments."Shortcut Dimension 2 Code";
                                    BatchImprestVoucherLines."Shortcut Dimension 3 Code" := Payments."Shortcut Dimension 3 Code";
                                    BatchImprestVoucherLines.Insert();
                                until Payments.Next = 0;
                            end;
                            BatchImprestHeader.Reset;
                            BatchImprestHeader.SetRange(BatchImprestHeader."No.", DocNo);
                            BatchImprestHeader.SetRange(BatchImprestHeader."Document Type", BatchImprestHeader."Document Type"::"Batch Imprest");
                            BatchImprestHeader.SetRange(BatchImprestHeader."Payment Type", BatchImprestHeader."Payment Type"::"Batch Imprest Voucher");
                            if BatchImprestHeader.FindFirst() then begin
                                // BatchImprestVoucherCard.SetTableview(BatchImprestHeader);
                                // BatchImprestVoucherCard.Run;
                                PAGE.Run(PAGE::"Batch Imprest Voucher Card", BatchImprestHeader);
                            end;
                        end;
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
                            Payments.Reset;
                            Payments.SetRange("Document Type", Rec."document type"::Imprest);
                            Payments.SetRange("No.", Rec."No.");
                            if Payments.FindFirst then begin
                                repeat
                                    Payments."Archive Document" := true;
                                    Payments.Modify;
                                until Payments.Next = 0;
                            end;
                        end else
                            Error('You don''t have rights to archive finance documents,Contact System administrator');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Post Requisition" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;

        //Fred RC
        if UserSetup.Get(UserId) then begin
            // if not UserSetup."Accounts Administrator" then
            // Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Post Requisition" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;

        //Fred RC
        if UserSetup.Get(UserId) then begin
            // if not UserSetup."Accounts Administrator" then
            // Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Post Requisition" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;

        //Fred RC
        if UserSetup.Get(UserId) then begin
            // if not UserSetup."Accounts Administrator" then
            // Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            if not UserSetup."Accounts User" then
                Error('You do not have the required access rights to use this page. Please contact your system administrator.');
        end;
    end;

    var
        UserSetup: Record "User Setup";
        Payments: Record payments;
        BatchImprestHeader: Record payments;
        BatchImprestVoucherLines: Record "Batch Imprest Voucher Lines";
        BatchImprestVoucherCard: Page "Batch Imprest Voucher Card";
        CashMgt: Record "Cash Management Setup";
        NoSeriesManagement: Codeunit "No. Series";
}

#pragma implicitwith restore

