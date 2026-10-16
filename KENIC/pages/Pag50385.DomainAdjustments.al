namespace KENIC.KENIC;

page 50385 "Domain Adjustments"
{
   ApplicationArea = All;
    Caption = 'Domain Adjustments';
    PageType = List;
    SourceTable = "Domain Adjustment";
    SourceTableView = sorting(AdjustmentDate, AdjustmentId) order(descending);
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(AdjustmentId; Rec.AdjustmentId) { ApplicationArea = All; }
                field(Roid; Rec.Roid) { ApplicationArea = All; }
                field(LedgerId; Rec.LedgerId) { ApplicationArea = All; }
                field(AdjustmentDate; Rec.AdjustmentDate) { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field(TransactionId; Rec.TransactionId) { ApplicationArea = All; }
                field(Narration; Rec.Narration) { ApplicationArea = All; }
                field(LastUpdatedAt; Rec.LastUpdatedAt) { ApplicationArea = All; }
                field(LastUpdatedBy; Rec.LastUpdatedBy) { ApplicationArea = All; }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetAdjustments)
            {
                ApplicationArea = All;
                Caption = 'Get Adjustments';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Dialog: Page "Get Domain Adjustments";
                begin
                    Dialog.RunModal();
                    CurrPage.Update(false);
                end;
            }
            action(ViewDetails)
            {
                ApplicationArea = All;
                Caption = 'View Details';
                Image = View;
                trigger OnAction()
                var
                    Input: InStream;
                    DetailsText: Text;
                begin
                    Rec.CalcFields(Details);
                    if not Rec.Details.HasValue() then begin
                        Message('No details available.');
                        exit;
                    end;
                    Rec.Details.CreateInStream(Input, TextEncoding::UTF8);
                    Input.ReadText(DetailsText);
                    Message('%1', DetailsText);
                end;
            }
        }
    }
}
