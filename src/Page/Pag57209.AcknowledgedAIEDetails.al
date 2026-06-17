#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57209 "Acknowledged AIE Details"
{
    ApplicationArea = Basic;
    Caption = 'AIE Lines';
    Editable = false;
    PageType = Document;
    SourceTable = "Inter Bank Transfer Line";
    SourceTableView = where(Acknowledged = filter(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Code';
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Acknowledged By"; Rec."Acknowledged By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acknowledged By field.';
                }
                field("Acknowledgement Datetime"; Rec."Acknowledgement Datetime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acknowledgement Datetime field.';
                }
                field(Acknowledged; Rec.Acknowledged)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acknowledged field.';
                }
                field("Bank Account No"; Rec."Bank Account No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer To';
                    ToolTip = 'Specifies the value of the Transfer To field.';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer To Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transfer To Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Receivable Account(Region)"; Rec."Receivable Account(Region)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receivable Account(Region) field.';
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount(LCY) field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDimensions;
                end;
            }
            action(Acknowledge)
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Acknowledge action.';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(InterBankTransferLine);
                    if InterBankTransferLine.FindSet then begin
                        repeat
                            Rec."Acknowledged By" := UserId;
                            Rec."Acknowledgement Datetime" := CurrentDatetime;
                            InterBankTransferLine.Modify(true);

                        until InterBankTransferLine.Next = 0;
                        Clear(InterBankTransferLine);
                    end;
                    Message('Acknowledgements done');

                    /*
                    RESET;
                    SETRANGE("Document No","Document No");
                    SETRANGE("Document Type","Document Type");
                    IF FINDSET THEN BEGIN
                      "Acknowledged By":=USERID;
                      "Acknowledgement Datetime":=CREATEDATETIME(TODAY,TIME);
                      MODIFY(TRUE);
                      END;
                      RESET;
                    */

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PostPrint;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("Document No", Rec."Document No");
                    Rec.SetFilter("Responsibility Center", Rec."Responsibility Center");
                    if Rec.FindSet then
                        Report.Run(57094, true, false, Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Shortcut Dimension 1 Code", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Shortcut Dimension 1 Code", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Shortcut Dimension 1 Code", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
        UserSetup: Record "User Setup";
        InterBankTransferLine: Record "Inter Bank Transfer Line";
}

