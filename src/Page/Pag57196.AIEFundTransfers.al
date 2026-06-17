#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57196 "AIE Fund Transfers"
{
    ApplicationArea = Basic;
    Caption = 'AIE Fund Transfers';
    CardPageID = "AIE Fund Transfer Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Inter Bank Transfer";
    SourceTableView = where("Document Type" = filter("AIE Funds Transfer"),
                            "Approval Status" = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
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
                field("Destination Bank Account No"; Rec."Destination Bank Account No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Bank Account No field.';
                }
                field("Destination Bank Name"; Rec."Destination Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Bank Name field.';
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
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Originating Trans. Voucher No"; Rec."Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the AIE Voucher No field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
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
                    Editable = true;
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
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not have permision to view AIE');
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not have permision to view AIE');
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."document type"::"AIE Funds Transfer";
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
                Error('You do not have permision to view AIE');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

