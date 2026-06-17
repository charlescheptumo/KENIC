query 50032 "Salary Advance Memo"
{
    Caption = 'Salary Advance Memo';
    QueryType = Normal;

    elements
    {
        dataitem(Payments; Payments)
        {
            column(No; "No.")
            {
            }
            column("Date"; "Date")
            {
            }
            column(AccountType; "Account Type")
            {
            }
            column(AccountNo; "Account No.")
            {
            }
            column(AccountName; "Account Name")
            {
            }
            column(SalaryAdvance; "Salary Advance")
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(Status; Status)
            {
            }
            column(CreatedBy; "Created By")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
