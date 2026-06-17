page 50037 "CEO Office"
{
    ApplicationArea = All;
    Caption = 'CEO Office';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
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
            part("CEO Cues"; "CEO Cues")
            {
                ApplicationArea = Basic;
            }

        }
    }
    actions
    {
        area(Sections)
        {
            group(Appointments)
            {
                action("My CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = page "My CEO Appointments";
                    Visible = false;
                    ToolTip = 'Executes the My CEO Appointments action.';
                }
                action("CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = page "CEO Appointments";
                    ToolTip = 'Executes the CEO Appointments action.';
                }
                action("Accepted CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Accepted CEO Appointments";
                    ToolTip = 'Executes the Accepted CEO Appointments action.';
                }
                action("My Accepted CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = page "My Accepted CEO Appointments";
                    Visible = false;
                    ToolTip = 'Executes the My Accepted CEO Appointments action.';
                }
                action("CEO Assign Tasks")
                {
                    ApplicationArea = Basic;
                    RunObject = page "CEO Assign Tasks";
                    ToolTip = 'Executes the CEO Assign Tasks action.';
                    Visible = False;
                }
                action("Assigned Tasks by CEO")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Assigned Tasks by CEO";
                    Visible = false;
                    ToolTip = 'Executes the Assigned Tasks by CEO action.';
                }
                action("My Completed Tasks Assigned")
                {
                    ApplicationArea = Basic;
                    RunObject = page "My Completed Tasks Assigned";
                    Visible = false;
                    ToolTip = 'Executes the My Completed Tasks Assigned action.';
                }
            }
            group(Tickets)
            {
                Visible = false;
                action("Open Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Open Tickets List";
                    ToolTip = 'Executes the Open Tickets Lists action.';
                }
                action("Assigned General Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Assigned General List";
                    ToolTip = 'Executes the Assigned General Lists action.';
                }
                action("HOD Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "HOD Tickets List";
                    ToolTip = 'Executes the HOD Tickets Lists action.';
                }
                action("CEO Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "CEO Tickets List";
                    ToolTip = 'Executes the CEO Tickets Lists action.';
                }
                action("Resolved Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Resolved Tickets Lists";
                    ToolTip = 'Executes the Resolved Tickets Lists action.';
                }
                action("Escalated Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Escalated Tickets List";
                    ToolTip = 'Executes the Escalated Tickets Lists action.';
                }
                action("Legal Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Legal Tickets";
                    ToolTip = 'Executes the Legal Tickets action.';
                }
                action("Closed Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Closed Tickets";
                    ToolTip = 'Executes the Closed Tickets action.';
                }
            }
            group("Front Office Management")
            {
                action("CRM Setup List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "CRM Setup List";
                    Caption = 'Setup';
                    ToolTip = 'Executes the Setup action.';
                }
                action("Visitors List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Visitor Pass List";
                    ToolTip = 'Executes the Visitors List action.';
                }
                action("Posted Visitor Pass List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Visitor Pass List";
                    Caption = 'Visitors Entries';
                    ToolTip = 'Executes the Visitors Entries action.';
                }
                action("Visitor Types")
                {
                    ApplicationArea = Basic;
                    RunObject = Page Defendants;
                    Caption = 'Visitor Types';
                    Visible = false;
                    ToolTip = 'Executes the Visitor Types action.';
                }
            }
            group("OutLook Setups")
            {
                Visible = false;
                action("OutLook Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = page "OutLook Integrations to BC";
                    ToolTip = 'Executes the OutLook Setup action.';
                }
            }
            group("Vehicles and Visitors Management")
            {
                Visible = false;
                action("Employees Vehicles List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Employees Vehicles List";
                    ToolTip = 'Executes the Employees Vehicles List action.';
                }
                action("Fleet Vehicles List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Fleet Vehicles List";
                    ToolTip = 'Executes the Fleet Vehicles List action.';
                }
                action("Visitors Vehicle List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Visitors Vehicle List";
                    ToolTip = 'Executes the Visitors Vehicle List action.';
                }
                action("Posted Visitors Vehicle List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Visitors Vehicle List";
                    ToolTip = 'Executes the Posted Visitors Vehicle List action.';
                }
                action("Walkin Visitors Management")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Walkin Visitors Management";
                    ToolTip = 'Executes the Walkin Visitors Management action.';
                }
                action("Visitors Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Visitors List";
                    ToolTip = 'Executes the Visitors Lists action.';
                }
            }
            group("Performance Evaluation")
            {
                Caption = 'Performance Management';
                group(PSetups)
                {
                    Caption = 'Setups';
                    Visible = false;
                    action("Appraisal Periods")
                    {
                        ApplicationArea = BasicHr;
                        Caption = 'Appraisal Periods';
                        Runobject = Page "Appraisal Periods";
                        ToolTip = 'Executes the Appraisal Periods action.';
                    }
                    action("Departmental Objectives")
                    {
                        ApplicationArea = BasicHr;
                        //RunObject = Page "Departments Objectives";
                        RunObject = Page "Functional Annual Workplans";
                        Caption = 'Departmental Objectives';
                        ToolTip = 'Executes the Departmental Objectives action.';

                    }
                    action(SPMGeneralSetup)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Performance Management General Setup';
                        RunObject = Page "Strategy General Setup";
                        ToolTip = 'Executes the Performance Management General Setup action.';
                    }
                    action("All Performance Contracts")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = Page "All Performance Contracts";
                        ToolTip = 'Executes the All Performance Contracts action.';
                    }
                }
                group("Standard Appraisal")
                {
                    action(StandardPerformanceAppraisal)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Standard Performance Appraisal';
                        RunObject = Page "Standard Perfomance Appraisal";
                        ToolTip = 'Executes the Standard Performance Appraisal action.';
                    }
                    action("Standard Appraisal Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Standard Appraisal Evaluation';
                        RunObject = Page "Standard Appraisal-Evaluation";
                        ToolTip = 'Executes the Standard Appraisal Evaluation action.';
                    }
                    action("Submitted Standard Appraisal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Standard Appraisal';
                        RunObject = Page "Standard Appraisal-Submitted";
                        ToolTip = 'Executes the Submitted Standard Appraisal action.';
                    }
                    action("Closed Standard Appraisal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Standard Appraisal';
                        RunObject = Page "Standard Appraisal-Closed";
                        ToolTip = 'Executes the Closed Standard Appraisal action.';
                    }
                }
                group("Employee-Supervisor Appraisal")
                {
                    action("Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Self-Supervisor Appraisals';
                        RunObject = Page "Self-Supervisor Appraisals";
                        ToolTip = 'Executes the Self-Supervisor Appraisals action.';
                    }
                    action("Self Supervisor Appraisals Under Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Self Supervisor Appraisals Under Evaluation';
                        RunObject = Page "Self-Supervisor Appraisals-E";
                        ToolTip = 'Executes the Self Supervisor Appraisals Under Evaluation action.';
                    }
                    action("Submitted Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Self-Supervisor Appraisals';
                        RunObject = Page "Self-Supervisor Appraisals-Sub";
                        ToolTip = 'Executes the Submitted Self-Supervisor Appraisals action.';
                    }
                    action("Closed Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Self-Supervisor Appraisals';
                        RunObject = Page "SelfSupervisorAppraisal-Closed";
                        ToolTip = 'Executes the Closed Self-Supervisor Appraisals action.';
                    }
                }
                group("360 Degree-Appraisal")
                {
                    action("360 Degree Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = '360 Degree Appraisals';
                        RunObject = Page "Group Appraisals";
                        ToolTip = 'Executes the 360 Degree Appraisals action.';
                    }
                    action("Group Appraisals Under Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Group Appraisals Under Evaluation';
                        RunObject = Page "Group Appraisal-Evaluations";
                        ToolTip = 'Executes the Group Appraisals Under Evaluation action.';
                    }
                    action("Submitted Group Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Group Appraisals';
                        RunObject = Page "Group Appraisal-Submitted";
                        ToolTip = 'Executes the Submitted Group Appraisals action.';
                    }

                }
                group(AppraisalReports)
                {
                    Caption = 'Reports';
                    Visible = false;
                }
            }
            group("My Tickets")
            {
                Visible = false;
                // action("My Assigned Tickets")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = page "Assigned Enquiries List";
                // }
                // action("My Closed Tickets")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = page "My Closed Tickets ";
                // }
                // action("My Resolved Tickets")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = page "My Resolved Tickets ";
                // }
            }
            group("Self Service")
            {
                Caption = 'Self Service';
                Image = Travel;
                action("Imprest Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    RunObject = Page "Imprest Memos";
                    ToolTip = 'Executes the Imprest Memo action.';
                }
                action(Action105)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Requisitions";
                    ToolTip = 'Executes the Imprest Request action.';
                }
                action("Imprest Surrenderss")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    RunObject = Page "Imprest Surrenders";
                    ToolTip = 'Executes the Imprest Surrender action.';
                }
                action("Claims Refund")
                {
                    ApplicationArea = Basic;
                    Caption = 'Claims Refund';
                    RunObject = Page "Staff Claims";
                    ToolTip = 'Executes the Claims Refund action.';
                }
                action("Departmental Procurement Plan")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Departmental Procurement Plan";
                    ToolTip = 'Executes the Departmental Procurement Plan action.';
                }
                action("Approved Departmental Procurement Plan")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Department PC List";
                    ToolTip = 'Executes the Approved Departmental Procurement Plan action.';
                }
                action("Purchase Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    RunObject = Page "Purchase Requisitions List";
                    ToolTip = 'Executes the Purchase Requisition action.';
                }
                action("Store Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisition';
                    Image = Vendor;
                    RunObject = Page "Store Requisitions";
                    ToolTip = 'Executes the Store Requisition action.';
                }
                action("Leave Application ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Balance;
                    RunObject = Page "Leave Applications List";
                    ToolTip = 'Executes the Leave Application action.';
                }
                action("Fleet Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Requisition';
                    Image = Documents;
                    RunObject = Page "Fleet Requisition List";
                    ToolTip = 'Executes the Fleet Requisition action.';
                }
                action("ICT Help Desk")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Help Desk';
                    RunObject = Page "ICT Helpdesk Request List";
                    ToolTip = 'Executes the ICT Help Desk action.';
                }
                action("Suggestions Box")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Suggestions Box";
                    ToolTip = 'Executes the Suggestions Box action.';
                }
            }
        }
    }
}

profile CEOOffice
{
    ProfileDescription = 'CEOs Office';
    RoleCenter = "CEO Office";
    Caption = 'CEOs Office';
}
