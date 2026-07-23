page 58152 "Mpesa Transaction Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Mpesa Transaction";
    Caption = 'Mpesa Transaction';
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(TransId; Rec.TransId) { ApplicationArea = All; Caption = 'Transaction ID'; }
                field(TransactionType; Rec.TransactionType) { ApplicationArea = All; Caption = 'Type'; }
                field(TransAmount; Rec.TransAmount) { ApplicationArea = All; Caption = 'Amount'; }
                field(InWords; Rec.InWords) { ApplicationArea = All; Caption = 'Amount In Words'; }
                field(TransactionTime; Rec.TransactionTime) { ApplicationArea = All; Caption = 'Transaction Time'; }
                field(Created; Rec.Created) { ApplicationArea = All; Caption = 'Created'; }
            }
            group(Customer)
            {
                Caption = 'Customer Details';
                field(FirstName; Rec.FirstName) { ApplicationArea = All; Caption = 'First Name'; }
                field(MiddleName; Rec.MiddleName) { ApplicationArea = All; Caption = 'Middle Name'; }
                field(LastName; Rec.LastName) { ApplicationArea = All; Caption = 'Last Name'; }
                field(PhoneNumber; Rec.PhoneNumber) { ApplicationArea = All; Caption = 'Phone Number'; }
            }
            group(Account)
            {
                Caption = 'Account Details';
                field(BillRefNumber; Rec.BillRefNumber) { ApplicationArea = All; Caption = 'Bill Ref Number'; }
                field(BusinessShortCode; Rec.BusinessShortCode) { ApplicationArea = All; Caption = 'Short Code'; }
                field(OrgAccountBalance; Rec.OrgAccountBalance) { ApplicationArea = All; Caption = 'Org Account Balance'; }
                field(PickedAccount; Rec.PickedAccount) { ApplicationArea = All; Caption = 'Picked Account'; }
                field(InvoiceNumber; Rec.InvoiceNumber) { ApplicationArea = All; Caption = 'Invoice Number'; }
                field(ThirdPartyTransId; Rec.ThirdPartyTransId) { ApplicationArea = All; Caption = 'Third Party Trans ID'; }
                field(IsPicked; Rec.IsPicked) { ApplicationArea = All; Caption = 'Picked'; }
                field(Narrative; Rec.Narrative) { ApplicationArea = All; Caption = 'Narrative'; }
            }
        }
    }
}