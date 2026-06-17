namespace KICD.KICD;

using Microsoft.Bank.BankAccount;
using System.Security.User;

pageextension 50134 "Bank Account List Ext" extends "Bank Account List"
{

     trigger OnOpenPage()
    // //>>>> ORIGINAL CODE:
    begin
    
    if not UserSetup.Get(UserId) then
    Error('User setup not found for user %1.', UserId);
     if not UserSetup."Accounts User" then
         Error('Access denied: You are not authorized to open the Bank Account List page. Please contact the system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}
