report 50042 "All Purchase Requisitions"
{
    Caption = 'All Purchase Requisitions';
    ApplicationArea = All;
    dataset
    {
        dataitem(Purcheader; "Purchase Header")
        {
            RequestFilterFields = "No.", "Date Filter", Status;
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const("Purchase Requisition"));
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
