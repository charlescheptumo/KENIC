page 58151 "Mpesa Transaction List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mpesa Transaction";
    Caption = 'Mpesa Transactions';
    Editable = false;
    CardPageId = "Mpesa Transaction Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(TransId; Rec.TransId)
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                }
                field(TransactionType; Rec.TransactionType)
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }
                field(TransAmount; Rec.TransAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                }
                field(TransactionTime; Rec.TransactionTime)
                {
                    ApplicationArea = All;
                    Caption = 'Transaction Time';
                }
                field(FirstName; Rec.FirstName)
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                }
                field(LastName; Rec.LastName)
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                }
                field(PhoneNumber; Rec.PhoneNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Phone Number';
                }
                field(BillRefNumber; Rec.BillRefNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Bill Ref Number';
                }
                field(BusinessShortCode; Rec.BusinessShortCode)
                {
                    ApplicationArea = All;
                    Caption = 'Short Code';
                }
                field(OrgAccountBalance; Rec.OrgAccountBalance)
                {
                    ApplicationArea = All;
                    Caption = 'Org Account Balance';
                }
                field(IsPicked; Rec.IsPicked)
                {
                    ApplicationArea = All;
                    Caption = 'Picked';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Refresh)
            {
                ApplicationArea = All;
                Caption = 'Refresh';
                Image = Refresh;
                trigger OnAction()
                begin
                    CurrPage.Update(false);
                end;
            }
        }
    }
}