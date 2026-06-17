// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 "CustomerListExt" extends "Customer List"
{
   
    actions
    {
      addlast(Navigation)
      {
        action(DeleteAllCustomers)
            {
                Caption = 'Customers';
                Image = Delete;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
               
                trigger OnAction()
                var
                    CustomerRec: Record Customer;
                    IsConfirmed: Boolean;
                begin
                    IsConfirmed := Confirm('Are you sure you want to delete all Customers?');
                    if not IsConfirmed then
                        exit;
                    CustomerReC.DeleteAll();

                    Message('All Customers have been deleted.');
                end;
            }
      }
    }
    trigger OnOpenPage()
    begin
        if not UserSetup.Get(UserId) then
            Error('User setup not found for user %1.', UserId);
        if not UserSetup."Accounts User" then
            Error('Access denied: You are not authorized to open the Customer List page. Please contact the system administrator.');
    end;

    var
    UserSetup: Record "User Setup";
}