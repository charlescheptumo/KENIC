page 50038 "Case Management"
{
    ApplicationArea = All;
    Caption = 'Case Management';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Control76; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
        }

    }
    actions
    {
        area(Embedding)
        {
            // action("Log List")
            // {
            //     RunObject = page;
            // }
            // action("Complaints List")
            // {
            //     RunObject = page;
            // }
            // action(Enquiries)
            // {
            //     RunObject = page;
            // }
            action("Case Assigned List")
            {
                RunObject = page "Safe Work Permits COM";
                ToolTip = 'Executes the Case Assigned List action.';
            }
            // action("Cases Report")
            // {
            //     RunObject = report;
            // }
            // action("Case Assigned Solved")
            // {
            //     RunObject = page "Safe Work Permit Completion";
            // }
        }
    }
}
