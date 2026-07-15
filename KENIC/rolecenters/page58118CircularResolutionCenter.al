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
                    Caption = 'Circular Resolutions';
                    RunObject = page "Circular Resolution List";
                }
            }
            group("Intelligence And Investigations")
            {
                action("Intelligence Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Intelligence Entry List';
                    // RunObject = page "Intelligence Entry List";
                }
         
            }
            group("Initial Review")
            {
                action("Initial Review Case List ")
                {
                    ApplicationArea = All;
                    Caption = 'Initial Review Case List';
                    // RunObject = page "Initial Review Case List";
                }

            }
            group(Reports)
            {
                action("Intelligence Report")
                {
                    ApplicationArea = All;
                    Caption = 'Intelligence Report';
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