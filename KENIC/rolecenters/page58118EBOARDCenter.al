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
            group("Board Administration")
            {
                Caption = 'Board Administration';

                group("Board Setup & Members")
                {
                    Caption = 'Members & Committees';

                    action("Board Members")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Board Members';
                        RunObject = Page "Board Members";
                        ToolTip = 'Manage registered board members.';
                    }
                    action("Board and Committee")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Board Committees';
                        RunObject = Page "Board Committee";
                        ToolTip = 'Manage board committees and memberships.';
                    }
                }

                group("Declarations Group")
                {
                    Caption = 'Conflict Declarations';

                    action("Board Declarations")
                    {
                        ApplicationArea = All;
                        Caption = 'Board Declarations';
                        RunObject = Page "Board Declarations";
                        ToolTip = 'View and manage board member conflict of interest declarations.';
                    }
                    action("Declaration Interest Types")
                    {
                        ApplicationArea = All;
                        Caption = 'Declaration Interest Types';
                        RunObject = Page "Declaration Interest Types";
                        ToolTip = 'Manage declaration interest type categories.';
                    }
                }
            }

            group(Meetings)
            {
                Caption = 'Meetings';
                action("Meeting Plan List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Meeting Plan';
                    RunObject = Page "Meeting Plan List";
                    ToolTip = 'Manage meeting plans.';
                }

                action("Board meetings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Meetings';
                    RunObject = Page "Board Meetings List";
                    ToolTip = 'Manage active board meetings.';
                }
                action("Published Meetings")//page 58158 "Meeting Plan List"
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Published Meetings';
                    RunObject = Page "Published Board Meeting List";
                    ToolTip = 'View published board meetings.';
                }
                action("Closed Meetings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Closed Meetings';
                    RunObject = Page "Closed Board Meetings List";
                    ToolTip = 'View archived/closed board meetings.';
                }
            }

            group("Director Payments")
            {
                Caption = 'Director Payments';

                action("Earnings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Earnings';
                    RunObject = Page "Directors Earnings";
                    ToolTip = 'Manage director earnings setup and transactions.';
                }
                action("Deductions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Deductions';
                    RunObject = Page "Director Deduction";
                    ToolTip = 'Manage director deductions.';
                }
            }

            group("Circular Resolutions")
            {
                Caption = 'Circular Resolutions';

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
                        Caption = 'Open Obligations';
                        RunObject = Page "Pending Compliance Obligations";
                        ToolTip = 'Manage open compliance obligations and schedules.';
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

            group("ESign Documents")
            {
                Caption = 'E-Sign Documents';

                group("E-Sign Documents")
                {
                    Caption = 'ESign Documents';

                    action("Esign Members")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Open E-sign Docs';
                        RunObject = Page "ESign Documents";
                        ToolTip = 'Manage board documents.';
                    }
                    // action("Board and Committee")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Board Committees';
                    //     RunObject = Page "Board Committee";
                    //     ToolTip = 'Manage board committees and memberships.';
                    // }
                }
            }

            group(Reports)
            {
                Caption = 'Reports';

                action("Board Declaration Report")
                {
                    ApplicationArea = All;
                    Caption = 'Board Declaration Report';
                    Image = Report;
                    RunObject = report "Board Declaration Report";
                    ToolTip = 'Print or export board member conflict of interest declarations.';
                }
            }
            group(Setup)
            {
                Caption = 'Setup';

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
    Enabled = true;
}