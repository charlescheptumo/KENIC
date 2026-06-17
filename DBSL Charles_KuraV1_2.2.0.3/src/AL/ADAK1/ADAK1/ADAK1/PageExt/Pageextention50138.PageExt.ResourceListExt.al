namespace KICD.KICD;

using Microsoft.Projects.Resources.Resource;
using System.Security.User;

pageextension 50138 "Resource List Ext" extends "Resource List"
{
        trigger OnOpenPage()
        begin
            if not UserSetup.Get(UserId) then
                Error('User setup not found for user %1.', UserId);
            if not UserSetup."Accounts User" then
                Error('Access denied: You are not authorized to open the Resource List page. Please contact the system administrator.');
        end;
    
        var
        UserSetup: Record "User Setup";
}
