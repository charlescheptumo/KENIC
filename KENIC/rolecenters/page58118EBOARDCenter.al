page 58118 "Head of E-Board"
{
    ApplicationArea = All;
    Caption = 'E-Board Role';
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
                    ApplicationArea = Basic;
                    RunObject = Page "Board Committee";
                    ToolTip = 'Executes the Board and Committee action.';
                }
            }

            group(Meetings)
            {
                action("Board meetings")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Board Meetings List";
                    ToolTip = 'Executes the Board meetings action.';
                }
                action("Published Meetings")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Published Board Meeting List";
                    ToolTip = 'Executes the Published Meetings action.';
                }
                action("Closed Meetings")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Closed Board Meetings List";
                    ToolTip = 'Executes the Closed Meetings action.';
                }
            }

            group("Director Payments")
            {
                action("Earnings")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Directors Earnings";
                    ToolTip = 'Executes the Earnings action.';
                }

                action("Deductions")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Director Deduction";
                    ToolTip = 'Executes the Deductions action.';
                }
            }

            group("Circular Resolutions")
            {
                action("Circular Resolution List")
                {
                    ApplicationArea = All;
                    Caption = 'Pending Circular Resolutions';
                    RunObject = Page "Circular Resolution List";
                }

                action("Approved Circular Resolution List")
                {
                    ApplicationArea = All;
                    Caption = 'Approved Circular Resolutions';
                    RunObject = Page "Approved Circular Resolution";
                }

                action("Posted Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Circular Resolutions';
                    RunObject = Page "Posted Circular Resolution";
                }

                action("Closed Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Closed Circular Resolutions';
                    RunObject = Page "Closed Circular Resolution";
                }

                action("Rejected Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Rejected Circular Resolutions';
                    RunObject = Page "Rejected Circular Resolution";
                }

                action("Circular Resolution Archive")
                {
                    ApplicationArea = All;
                    Caption = 'Circular Resolution Archive';
                    RunObject = Page "Circular Resolution Archive";
                }
            }

            group("E-signing")
            {
                action("E-signing List")
                {
                    ApplicationArea = All;
                    Caption = 'E-signing';
                    // RunObject = page "Intelligence Entry List";
                }
            }

            group("Compliance Management")
            {
                Caption = 'Compliance';

                group("Categories & Legislation")
                {
                    Caption = 'Categories & Legislation';

                    action("Compliance Categories")
                    {
                        ApplicationArea = All;
                        Caption = 'Compliance Categories';
                        RunObject = Page "Compliance Categories";
                        ToolTip = 'Manage compliance categories and responsible users.';
                    }

                    action("Compliance Legislation List")
                    {
                        ApplicationArea = All;
                        Caption = 'Compliance Legislation';
                        RunObject = Page "Compliance Legislation List";
                        ToolTip = 'Manage compliance legislation list.';
                    }
                }

                group("Obligations Breakdown")
                {
                    Caption = 'Obligations';

                    action("Pending Obligations")
                    {
                        ApplicationArea = All;
                        Caption = 'Pending Obligations';
                        RunObject = Page "Pending Compliance Obligations";
                        ToolTip = 'Manage pending compliance obligations and schedules.';
                    }

                    action("Posted Obligations")
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Obligations';
                        RunObject = Page "Posted Obligations";
                        ToolTip = 'Manage posted compliance obligations and schedules.';
                    }

                    action("Completed Obligations")
                    {
                        ApplicationArea = All;
                        Caption = 'Completed Obligations';
                        RunObject = Page "Completed Obligations";
                        ToolTip = 'Manage completed compliance obligations and schedules.';
                    }

                    action("Overdue Obligations")
                    {
                        ApplicationArea = All;
                        Caption = 'Overdue Obligations';
                        RunObject = Page "Overdue Obligations";
                        ToolTip = 'Manage overdue compliance obligations and schedules.';
                    }

                    action("Compliance Obligations")
                    {
                        ApplicationArea = All;
                        Caption = 'Archive Obligations';
                        RunObject = Page "Compliance Obligations";
                        ToolTip = 'Manage master compliance obligations and schedules.';
                    }
                }

                action("Compliance Calendar Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Compliance Calendar Entries';
                    RunObject = Page "Compliance Calendar Entries";
                    ToolTip = 'View and track recurring compliance execution tasks.';
                }
            }

            group(Reports)
            {
                action("E-Board Report")
                {
                    ApplicationArea = All;
                    Caption = 'E-Board Reports';
                    // RunObject = report "Intelligence Report";
                }
            }

            group(Setup)
            {
                action("E-Board Setup")
                {
                    ApplicationArea = All;
                    Caption = 'E-Board Setup';
                    RunObject = Page "E-Board Setup";
                }
            }
        }
    }
}

profile "Head of E-Board"
{
    ProfileDescription = 'Head of E-Board';
    RoleCenter = "Head of E-Board";
    Caption = 'E-Board Role';
    // Enabled = true;
    // Promoted = true;
}