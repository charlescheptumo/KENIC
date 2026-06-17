#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57199 "AIE Fund Transfers Released"
{
    ApplicationArea = Basic;
    CardPageID = "AIE Fund Transfer Card";
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Inter Bank Transfer";
    SourceTableView = where("Document Type" = filter("AIE Funds Transfer"),
                            "Approval Status" = filter(Released),
                            "AIE Posted" = filter(false));
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
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Region Trasnsfered To"; Rec."Region Trasnsfered To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Trasnsfered To field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Originating Trans. Voucher No"; Rec."Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AIE Voucher No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount(LCY) field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("From Doc Number"; Rec."From Doc Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the From Doc Number field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Effect Suggestion")
            {
                ApplicationArea = Basic;
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Effect Suggestion action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Document Type", Rec."document type"::"AIE Funds Transfer");
                    Rec.SetRange(Rec."Approval Status", Rec."approval status"::Released);
                    Rec.SetRange(Rec.Suggested, false);
                    SelectedRecords := Rec.Count;
                    Rec.SetRange(Rec.Select, true);
                    if SelectedRecords = 0 then
                        Error(Text0002);
                    if Confirm(Text0001, true, SelectedRecords) then begin
                        TransferFrom.Reset;
                        TransferFrom.SetRange(TransferFrom.Select, true);
                        TransferFrom.SetRange(TransferFrom.Suggested, false);
                        TransferFrom.SetRange(TransferFrom."Document Type", TransferFrom."document type"::"AIE Funds Transfer");
                        TransferFrom.SetRange(TransferFrom."Approval Status", TransferFrom."approval status"::Released);
                        if TransferFrom.Find('-') then begin
                            repeat

                                TransFromLines.Reset;
                                TransFromLines.SetRange(TransFromLines."Document Type", TransferFrom."Document Type");
                                TransFromLines.SetRange(TransFromLines."Document No", TransferFrom."Document No");
                                if TransFromLines.Find('-') then begin
                                    repeat
                                        ;
                                        ObjInterBTLine.Reset;
                                        ObjInterBTLine.SetRange(ObjInterBTLine."Document Type", ObjInterBTLine."document type"::"InterBank Requisition Voucher");
                                        if ObjInterBTLine.FindLast then
                                            LineNo := ObjInterBTLine."Line No" + 1000;
                                        TransferTo.Init;
                                        TransferTo."Line No" := LineNo;
                                        TransferTo."Document Type" := TransferFrom."From Document Type";
                                        TransferTo."Document No" := TransferFrom."From Doc Number";
                                        TransferTo.Amount := TransFromLines.Amount;
                                        TransferTo."Bank Account No" := TransFromLines."Bank Account No";
                                        TransferTo."Bank Account Name" := TransFromLines."Bank Account Name";
                                        TransferTo.Description := TransFromLines.Description;
                                        TransferTo."Dimension Set ID" := TransFromLines."Dimension Set ID";
                                        TransferTo."Amount(LCY)" := TransFromLines."Amount(LCY)";
                                        TransferTo."Activity Description" := TransFromLines."Activity Description";
                                        TransferTo."Shortcut Dimension 3 Code" := TransFromLines."Shortcut Dimension 3 Code";
                                        TransferTo."Shortcut Dimension 1 Code" := TransFromLines."Shortcut Dimension 1 Code";
                                        TransferTo."Shortcut Dimension 2 Code" := TransFromLines."Shortcut Dimension 2 Code";
                                        TransferTo."Responsibility Center" := TransFromLines."Responsibility Center";
                                        TransferTo."Receivable Account(Region)" := TransFromLines."Receivable Account(Region)";
                                        TransferTo."Payment Reference" := TransFromLines."Payment Reference";
                                        TransferTo."Department Code" := TransFromLines."Department Code";
                                        TransferTo.Insert(true);
                                    // END;
                                    until TransFromLines.Next = 0;
                                    TransferFrom.Suggested := true;
                                    TransferFrom.Modify;
                                    Message('Suggestions from %1 Inserted', TransferFrom."Document No");
                                end;
                            until TransferFrom.Next = 0;
                        end;
                        //CurrPage.CLOSE;
                    end;
                end;
            }
            action("AIE Report")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the AIE Report action.';
                // RunObject = Report "AIE Report";
            }
            action("Post AIE")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Post AIE action.';

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Rec."AIE Posted" := true;
                    Rec.Modify(true);
                    Message('AIE %1 has been posted successfully', Rec."Document No");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not the permission to view AIEs');
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not the permission to view AIEs');
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"AIE Funds Transfer";
    end;

    trigger OnOpenPage()
    begin
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not the permission to view AIEs');
        end;
    end;

    var
        UserSetup: Record "User Setup";
        TransferTo: Record "Inter Bank Transfer Line";
        TransferFrom: Record "Inter Bank Transfer";
        Text0001: label 'Are you sure you want to transfer the selected %1  lines to AIE?';
        Text0002: label 'No Record Selected';
        SelectedRecords: Integer;
        TransFromLines: Record "Inter Bank Transfer Line";
        ObjInterBTLine: Record "Inter Bank Transfer Line";
        LineNo: Integer;
}

