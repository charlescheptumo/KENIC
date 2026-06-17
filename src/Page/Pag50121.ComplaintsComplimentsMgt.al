page 50121 "Complaints & Compliments Mgt"
{
    ApplicationArea = All;
    Caption = 'Complaints & Compliments Management';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part("Headline RC Administrator"; "Headline RC Administrator")
            {
                ApplicationArea = Basic;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Basic;
            }
            part("Complaints Cues"; "Complaints Cues")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group(Tickets)
            {
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
                action("My Assigned Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Assigned Enquiries List";
                    ToolTip = 'Executes the My Assigned Tickets action.';
                }
                action("My Closed Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "My Closed Tickets";
                    ToolTip = 'Executes the My Closed Tickets action.';
                }
                action("My Resolved Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "My Resolved Tickets";
                    ToolTip = 'Executes the My Resolved Tickets action.';
                }
                action("Lodge Modes")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Lodge Modes";
                    ToolTip = 'Executes the Lodge Modes action.';
                }
                action("Sought Service")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Sought Service";
                    ToolTip = 'Executes the Sought Service action.';
                }
                group("Complaints Reports")
                {
                    Visible = false;
                    action("Complaints Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "Complaints Report";
                        ToolTip = 'Executes the Complaints Report action.';
                    }
                    action("Ombudsman Reporting Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "Ombudsman Reporting Template";
                        ToolTip = 'Executes the Ombudsman Reporting Template action.';
                    }
                    action("CRM Enquiry Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM ENQUIRY REPORT";
                        ToolTip = 'Executes the CRM Enquiry Report action.';
                    }
                    action("CRM Feedback Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM Feedback REPORT";
                        ToolTip = 'Executes the CRM Feedback Report action.';
                    }
                    action("CRM Complements Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM Complements REPORT";
                        ToolTip = 'Executes the CRM Complements Report action.';
                    }
                    action("CRM Whistleblowing Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM Whistleblowing REPORT";
                        ToolTip = 'Executes the CRM Whistleblowing Report action.';
                    }
                }
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
                action("My CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My CEO Appointments";
                    ToolTip = 'Executes the My CEO Appointments action.';
                }
                action("My Accepted CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Accepted CEO Appointments";
                    ToolTip = 'Executes the My Accepted CEO Appointments action.';
                }
                action("My CEO Assigned Tasks")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Assigned Tasks by CEO";
                    ToolTip = 'Executes the My CEO Assigned Tasks action.';
                }
                action("My Completed Tasks Assigned")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Completed Tasks Assigned";
                    ToolTip = 'Executes the My Completed Tasks Assigned action.';
                }
                action("Suggestions Box")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Suggestions Box";
                    ToolTip = 'Executes the Suggestions Box action.';
                }
                action("Reservation Request List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Reservation Request List";
                    ToolTip = 'Executes the Reservation Request List action.';
                }
                action("Approved Reservation Request")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Reservation Request";
                    ToolTip = 'Executes the Approved Reservation Request action.';
                }
            }
        }
    }


}
profile ComplaintsCompliments
{
    ProfileDescription = 'Complaints & Compliments';
    Caption = 'Complaints & Compliments Role Center';
    RoleCenter = "Complaints & Compliments Mgt";
}
