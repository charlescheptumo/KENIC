namespace KICD.KICD;

using Microsoft.Purchases.Document;
using System.Security.User;

pageextension 50141 "Purchase Orders Ext" extends "Purchase Order List"
{
    trigger OnOpenPage()
    begin
        if not UserSetup.Get(UserId) then
            Error('User setup not found for user %1.', UserId);
        if not UserSetup."Accounts User" then
            Error('Access denied: You are not authorized to open the Purchase Order List page. Please contact the system administrator.');
    end;
    var
    UserSetup: Record "User Setup";
}
