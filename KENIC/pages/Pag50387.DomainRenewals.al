namespace KENIC.KENIC;

page 50387 "Domain Renewals"
{
    ApplicationArea = All;
    Caption = 'Domain Renewals';
    PageType = List;
    SourceTable = "Domain Renewal";
    SourceTableView = sorting(Created, LedgerId) order(descending);
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
                field(LedgerId; Rec.LedgerId)
                {
                    ApplicationArea = All;
                }
                field(DomainName; Rec.DomainName)
                {
                    ApplicationArea = All;
                }
                field(ClientRoid; Rec.ClientRoid)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(TransType; Rec.TransType)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = All;
                }
                field(PreviousExpiryDate; Rec.PreviousExpiryDate)
                {
                    ApplicationArea = All;
                }
                field(ExDate; Rec.ExDate)
                {
                    ApplicationArea = All;
                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                }
                field(EligibleUntil; Rec.EligibleUntil)
                {
                    ApplicationArea = All;
                }
                field(WithinWindow; Rec.WithinWindow)
                {
                    ApplicationArea = All;
                }
                field(CanReverse; Rec.CanReverse)
                {
                    ApplicationArea = All;
                }
                field(BlockReason; Rec.BlockReason)
                {
                    ApplicationArea = All;
                }
                field(CreditNoteId; Rec.CreditNoteId)
                {
                    ApplicationArea = All;
                }
                field(HasCreditNoteId; Rec.HasCreditNoteId)
                {
                    ApplicationArea = All;
                }
                field(LastUpdatedAt; Rec.LastUpdatedAt)
                {
                    ApplicationArea = All;
                }
                field(LastUpdatedBy; Rec.LastUpdatedBy)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetRenewals)
            {
                ApplicationArea = All;
                Caption = 'Get Renewals';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    GetDialog: Page "Get Domain Renewals";
                begin
                    GetDialog.RunModal();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
