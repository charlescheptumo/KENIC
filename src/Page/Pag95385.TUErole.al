page 95385 "TUE role"
{
    Caption = 'Therapeutic Use Exemption role';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(RoleCenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
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
            group(Setups)
            {
                action(TUESetup)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Therapeutic Use Exemption Setup';
                    Image = Setup;
                    RunObject = page "TUE Setup";
                    ToolTip = 'Executes the Therapeutic Use Exemption Setup action.';
                }
                action(MedicalSpecialties)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Medical Specialties';
                    Image = Setup;
                    RunObject = page "Medical Specialties";
                    ToolTip = 'Executes the Medical Specialties action.';
                }
                action("Practitioner Categories")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Practitioner Categories';
                    Image = Setup;
                    RunObject = page MedicalPractitionersCategories;
                    ToolTip = 'Executes the Practitioner Categories action.';
                }
                action("Licensing Bodies")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Licensing Bodies';
                    Image = Setup;
                    RunObject = page "Licensing Bodies";
                    ToolTip = 'Executes the Licensing Bodies action.';
                }
                action("Sports Disciplines")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sports Disciplines';
                    Image = Setup;
                    RunObject = page "Sport Disciplines";
                    ToolTip = 'Executes the Sports Disciplines action.';
                }
                action(Sports)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sports';
                    Image = Setup;
                    RunObject = page Sports;
                    ToolTip = 'Executes the Sports action.';
                }
                action(TUECodeunit)
                {
                    Visible = false;
                    ApplicationArea = All;
                    RunObject = codeunit "TUE Exemption";
                    ToolTip = 'Executes the TUECodeunit action.';
                }
                action("RetroActive Exceptions")
                {
                    ApplicationArea = all;
                    RunObject = Page "Retroactive Exceptions";
                    ToolTip = 'Executes the RetroActive Exceptions action.';
                }
                action("Prohibited substance Categories")
                {
                    ApplicationArea = All;
                    RunObject = Page "Prohibited SubstanceCategories";
                    ToolTip = 'Executes the Prohibited substance Categories action.';
                }
                action("Prohibited Substances")
                {
                    ApplicationArea = All;
                    RunObject = Page "Prohibited Substances";
                    ToolTip = 'Executes the Prohibited Substances action.';
                }
                action("Prohibited Methods Categories")
                {
                    ApplicationArea = All;
                    RunObject = Page "Prohibited Methods Categories";
                    ToolTip = 'Executes the Prohibited Methods Categories action.';
                }
                action("Prohibited Methods")
                {
                    ApplicationArea = All;
                    RunObject = Page "Prohibited Methods";
                    ToolTip = 'Executes the Prohibited Methods action.';
                }

            }
            group(Exemption)
            {
                action("Application Forms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Application Forms';
                    Image = Setup;
                    RunObject = page "TUE Application List";
                    ToolTip = 'Executes the Application Forms action.';
                }
                action("Approved Application Forms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Application Forms';
                    Image = Setup;
                    RunObject = page "Approved TUE list";
                    ToolTip = 'Executes the Approved Application Forms action.';
                }
            }
            group(Memos)
            {
                action("Imprest Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Memos';
                    RunObject = Page "Imprest Memos";
                    ToolTip = 'Imprest Memos.';
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Imprest Memos';
                    RunObject = Page "Approved Imprest Memos";
                    ToolTip = 'Approved Imprest Memos';
                }
                action("Imprest Requisition")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Requisitions';
                    RunObject = Page "Imprest Requisitions";
                    ToolTip = 'Imprest Requisition.';
                }
                action("Approved Imprest Requisitions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Imprest Requisitions ';
                    RunObject = Page "Approved Imprest Requisitions";
                    ToolTip = 'Approved Imprest Requisitions.';
                }
                action("Posted Imprest Requisitions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest Requisitions';
                    Image = BankAccountRec;
                    RunObject = Page "Posted Imprest Requisitions";
                    ToolTip = 'Posted Imprest Requisitions.';
                }
            }
            group(Surrenders)
            {
                action("Imprest Surrenders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Surrenders';
                    Image = BankAccountRec;
                    RunObject = Page "Imprest Surrenders";
                    ToolTip = 'Imprest Surrenders.';
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Imprest Surrenders';
                    Image = BankAccountRec;
                    RunObject = Page "Approved Imprest Surrenders";
                    ToolTip = 'Approved Imprest Surrenders.';
                }
                action("Posted Imprest Surrenders ")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest Surrenders ';
                    Image = BankAccountRec;
                    RunObject = Page "Posted Imprest Surrenders";
                    ToolTip = 'Posted Imprest Surrenders .';
                }
            }
        }
        area(Reporting)
        {

        }
        area(Embedding)
        {
            action("Medical Practitioners")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Medical Practitioners';
                Image = Resource;
                RunObject = page "Medical Practitioners";
                ToolTip = 'Executes the Medical Practitioners action.';

            }
            action(Athletes)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Athletes';
                Image = Vendor;
                RunObject = page "Athletes List";
                ToolTip = 'Executes the Athletes action.';
            }
        }
    }
}

// profile TUERole
// {
//     Caption = 'Therapeutic Use Exemption RC';
//     RoleCenter = "TUE role";
//     ProfileDescription = 'Therapeutic Use Exemption RC';
// }