page 58118 "Head of E-Board"
{
    ApplicationArea = All;
    Caption = 'E-Board Role';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {

        }
    }
    actions
    {
        area(Sections)
        {
            group("Circular Resolutions")
            {
                action("Circular Resolution List")
                {
                    ApplicationArea = All;
                    Caption = 'Pending Circular Resolutions';
                    RunObject = page "Circular Resolution List";
                }

                action("Approved Circular Resolution List")
                {
                    ApplicationArea = All;
                    Caption = 'Approved Circular Resolutions';
                    RunObject = page "Approved Circular Resolution";
                }


                action("Posted Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Circular Resolutions';
                    RunObject = page "Posted Circular Resolution";
                }

                action("Closed Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Closed Circular Resolutions';
                    RunObject = page "Closed Circular Resolution";
                }

                action("Rejected Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Rejected Circular Resolutions';
                    RunObject = page "Rejected Circular Resolution";
                }

                action("Circular Resolution Archive")
                {
                    ApplicationArea = All;
                    Caption = 'Circular Resolution Archive';
                    RunObject = page "Circular Resolution Archive";
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
                Caption = 'Compliance Calendar';

                action("Compliance Categories")
                {
                    ApplicationArea = All;
                    Caption = 'Compliance Categories';
                    RunObject = page "Compliance Categories";
                    ToolTip = 'Manage compliance categories and responsible users.';
                }

                action("Pending Obligations")
                {
                    ApplicationArea = All;
                    Caption = 'Pending Obligations';
                    RunObject = page "Pending Compliance Obligations";
                    ToolTip = 'Manage pending compliance obligations and schedules.';
                }

                  action("Posted Obligations")
                {
                    ApplicationArea = All;
                    Caption = 'Compliance Obligations';
                    RunObject = page "Posted Obligations";
                    ToolTip = 'Manage posted compliance obligations and schedules.';
                }
                  action("Completed Obligations")
                {
                    ApplicationArea = All;
                    Caption = 'Completed Obligations';
                    RunObject = page "Completed Obligations";
                    ToolTip = 'Manage completed compliance obligations and schedules.';
                }
                  action("Overdue Obligations")
                {
                    ApplicationArea = All;
                    Caption = 'Overdue Obligations';
                    RunObject = page "Overdue Obligations";
                    ToolTip = 'Manage overdue compliance obligations and schedules.';
                }
                action("Compliance Obligations")
                {
                    ApplicationArea = All;
                    Caption = 'Archive Obligations';
                    RunObject = page "Compliance Obligations";
                    ToolTip = 'Manage master compliance obligations and schedules.';
                }

                action("Compliance Calendar Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Compliance Calendar Entries';
                    RunObject = page "Compliance Calendar Entries";
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
                    RunObject = page "E-Board Setup";
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
}