page 58118 "Head of E-Board"
{
    ApplicationArea = All;
    Caption = 'Head of E-Board';
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
                    Caption = 'Approved Circular Resolutions';
                    RunObject = page "Posted Circular Resolution";
                }

                action("Cancelled Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Approved Circular Resolutions';
                    RunObject = page "Cancelled Circular Resolution";
                }

                action("Rejected Circular Resolution")
                {
                    ApplicationArea = All;
                    Caption = 'Rejected Circular Resolutions';
                    RunObject = page "Rejected Circular Resolution";
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
            group("Compliance calendar")
            {
                action("Compliance calendar List ")
                {
                    ApplicationArea = All;
                    Caption = 'Compliance calendar';
                    // RunObject = page "Initial Review Case List";
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
    Caption = 'Head of E-Board';
}