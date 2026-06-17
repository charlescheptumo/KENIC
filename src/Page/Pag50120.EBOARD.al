page 50120 "EBOARD "
{
    ApplicationArea = All;
    Caption = 'EBOARD ';
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
        area(Sections)
        {
            group("E-Board")
            {
                action("Board Members")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Board Members";
                    ToolTip = 'Executes the Board Members action.';
                }
                action("Board and Committee")
                {
                    ApplicationArea = basic;
                    RunObject = page "Board Committee";
                    ToolTip = 'Executes the Board and Committee action.';
                }


            }

            group(Meetings)
            {
                action("Board meetings")
                {
                    ApplicationArea = basic;
                    RunObject = page "Board Meetings List";
                    ToolTip = 'Executes the Board meetings action.';
                }
                action("Published Meetings")
                {
                    ApplicationArea = basic;
                    RunObject = page "Published Board Meeting List";
                    ToolTip = 'Executes the Published Meetings action.';
                }
                action("Closed Meetings")
                {
                    ApplicationArea = basic;
                    RunObject = page "Closed Board Meetings List";
                    ToolTip = 'Executes the Closed Meetings action.';
                }

            }

            group("Director Payments")
            {
                action("Earnings")
                {
                    ApplicationArea = basic;
                    RunObject = page "Directors Earnings";
                    ToolTip = 'Executes the Earnings action.';
                }

                action("Deductions")
                {
                    ApplicationArea = basic;
                    RunObject = page "Director Deduction";
                    ToolTip = 'Executes the Deductions action.';
                }
            }

        }
    }
}
