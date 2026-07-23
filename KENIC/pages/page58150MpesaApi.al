page 58150 "Mpesa Transactions API"
{
    PageType = API;
    APIPublisher = 'kenic';
    APIGroup = 'mpesa';
    APIVersion = 'v1.0';
    EntityName = 'mpesaTransaction';
    EntitySetName = 'mpesaTransactions';
    SourceTable = "Mpesa Transaction";
    DelayedInsert = true;
    ODataKeyFields = MpesaApiId;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(mpesaApiId; Rec.MpesaApiId) { }
                field(transId; Rec.TransId) { }
                field(transactionType; Rec.TransactionType) { }
                field(transAmount; Rec.TransAmount) { }
                field(transactionTime; Rec.TransactionTime) { }
                field(created; Rec.Created) { }
                field(transTime; Rec.TransTime) { }
                field(billRefNumber; Rec.BillRefNumber) { }
                field(firstName; Rec.FirstName) { }
                field(middleName; Rec.MiddleName) { }
                field(lastName; Rec.LastName) { }
                field(phoneNumber; Rec.PhoneNumber) { }
                field(businessShortCode; Rec.BusinessShortCode) { }
                field(orgAccountBalance; Rec.OrgAccountBalance) { }
                field(invoiceNumber; Rec.InvoiceNumber) { }
                field(thirdPartyTransId; Rec.ThirdPartyTransId) { }
                field(inWords; Rec.InWords) { }
                field(pickedAccount; Rec.PickedAccount) { }
                field(narrative; Rec.Narrative) { }
                field(isPicked; Rec.IsPicked) { }
            }
        }
    }
}