#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80490 "Planning &Strategy Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            part(Control10; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control9; "Planning & Strategy Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            // part(Control58;55155)
            // {
            //     AccessByPermission = TableData "Activities Cue"=I;
            //     ApplicationArea = Basic,Suite;
            // }
            part(Control6; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            // part(Control5;"Help And Chart Wrapper")
            // {
            //     AccessByPermission = TableData "Assisted Setup"=I;
            //     ApplicationArea = Basic,Suite;
            //     Caption = '';
            //     ToolTip = 'Specifies the view of your business assistance';
            // }
            // part(Control4; "Power BI Report Spinner Part")
            // {
            //     AccessByPermission = TableData "Power BI User Configuration" = I;
            //     ApplicationArea = Basic, Suite;
            // }
            // part(Control3;"O365 Link to Financials")
            // {
            //     ApplicationArea = Invoicing;
            //     Caption = ' ';
            // }
            part(Control2; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("User Task List")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Tasks';
                RunObject = Page "User Task List";
                ToolTip = 'Executes the Assign Tasks action.';
            }
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action("Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    Image = New;
                    RunObject = Page 57033;
                    RunPageMode = Create;
                    ToolTip = 'Executes the Imprest Memo action.';
                }
                action("Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Requisition';
                    Image = NewDocument;
                    RunObject = Page 57012;
                    RunPageMode = Create;
                    ToolTip = 'Executes the Imprest Requisition action.';
                }
                action("Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    Image = NewDocument;
                    RunObject = Page 57026;
                    RunPageMode = Create;
                    ToolTip = 'Executes the Imprest Surrender action.';
                }
                action("Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Document;
                    RunObject = Page 69207;
                    RunPageMode = Create;
                    ToolTip = 'Executes the Leave Application action.';
                }
                action("Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    Image = Document;
                    RunObject = Page 50071;
                    RunPageMode = Create;
                    ToolTip = 'Executes the Purchase Requisition action.';
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = New;
                action("Funding Agencies")
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Funding Agencies';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    ToolTip = 'Register a new =Funding Agent';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Grants Reports")
                {
                    Caption = 'Grants Reports';
                    Image = ReferenceData;
                }
                group("Self Service Reports")
                {
                    Caption = 'Self Service Reports';
                    Image = ReferenceData;
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
        }
        area(sections)
        {
            group("My Request")
            {
                Caption = 'My Request';
                action("Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memos';
                    RunObject = Page 57032;
                    ToolTip = 'Executes the Imprest Memos action.';
                }
                action("<Page Project Imprest Requisition>")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Requisitions';
                    Image = Quote;
                    RunObject = Page 57011;
                    ToolTip = 'Executes the My Imprest Requisitions action.';
                }
                action("My Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Store Requisitions';
                    Image = Document;
                    RunObject = Page 50075;
                    ToolTip = 'Executes the My Store Requisitions action.';
                }
                action("My Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Surrenders';
                    Image = Document;
                    RunObject = Page 57025;
                    ToolTip = 'Executes the My Imprest Surrenders action.';
                }
                action("My Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Leave Applications';
                    Image = ServiceCode;
                    RunObject = Page 69206;
                    ToolTip = 'Executes the My Leave Applications action.';
                }
                action("ICT Helpdesk Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Helpdesk Request';
                    Enabled = false;
                    Image = SendTo;
                    RunObject = Page 56070;
                    Visible = false;
                    ToolTip = 'Executes the ICT Helpdesk Request action.';
                }
                action("My Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Purchase Requisitions';
                    Image = Loaners;
                    RunObject = Page 50070;
                    ToolTip = 'Executes the My Purchase Requisitions action.';
                }
                action("Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 59013;
                    ToolTip = 'Executes the Fleet Requisition List action.';
                }
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                    ToolTip = 'Executes the Items action.';
                }
            }
            group("My Approved Requests")
            {
                action("My Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 69072;
                    ToolTip = 'Executes the My Approved Leave Applications action.';
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 57038;
                    ToolTip = 'Executes the Approved Imprest Memos action.';
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 57028;
                    ToolTip = 'Executes the Approved Imprest Surrenders action.';
                }
                // action("Approved Purchase Requisition")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page 70061;
                // }
            }
            group("Target Setting")
            {
                Image = Travel;
                action("Functional Annual Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Departmental Annual Workplan';
                    RunObject = Page "Functional Annual Workplans";
                    ToolTip = 'Executes the Draft Departmental Annual Workplan action.';
                }
                action("Annual Strategy Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Corporate Annual Workplan';
                    RunObject = Page "Annual Strategy Workplans";
                    ToolTip = 'Executes the Draft Corporate Annual Workplan action.';
                }
                action("Functional/Operational PCs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Awp Cascading Templates';
                    RunObject = Page "Functional/Operational PCs";
                    ToolTip = 'Executes the Draft Awp Cascading Templates action.';
                }
                action("Directors Perfomance Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'DCS annual Workplan';
                    RunObject = Page "Directors Perfomance Contracts";
                    ToolTip = 'Executes the DCS annual Workplan action.';
                }
                action("Departments\Centers PCs ")
                {
                    ApplicationArea = Basic;
                    Caption = 'HOD Annual Workplans';
                    RunObject = Page "Departments\Centers PCs";
                    ToolTip = 'Executes the HOD Annual Workplans action.';
                }
                action("Individual Scorecards")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Annual workplan';
                    RunObject = Page "Individual Scorecards";
                    ToolTip = 'Executes the Staff Annual workplan action.';
                }
            }
            group("Performance Contracting")
            {
                action("Functional PCs ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Departmental Pcs';
                    RunObject = Page "Functional PCs";
                    ToolTip = 'Executes the Draft Departmental Pcs action.';
                }
                action("Organizational PCs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Organizational PCs';
                    RunObject = Page "Organizational PCs";
                    ToolTip = 'Executes the Draft Organizational PCs action.';
                }
                action("DCS Perfomance Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Divisional Annual Perforance Contracts';
                    RunObject = Page "DCS Perfomance Contracts";
                    ToolTip = 'Executes the Divisional Annual Perforance Contracts action.';
                }
                action("HOD  Perfomance Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Departmental Performance Contracts';
                    RunObject = Page "HOD  Perfomance Contracts";
                    ToolTip = 'Executes the Departmental Performance Contracts action.';
                }
            }
            group("Performance Mornitoring")
            {
                action("Department Performance Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Performance Logs';
                    RunObject = Page "Department Performance Logs";
                    ToolTip = 'Executes the Department Performance Logs action.';
                }
                action("Depart Performance Cont Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Performance Contracting Reporting';
                    RunObject = Page "Depart Performance Cont Logs";
                    ToolTip = 'Executes the Department Performance Contracting Reporting action.';
                }
                action("Performance Diary Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Performance Reporting';
                    RunObject = Page "Performance Diary Logs";
                    ToolTip = 'Executes the Staff Performance Reporting action.';
                }
            }
            group("Corporate Calender")
            {
                action("Functional calendars ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Corporate Calendars';
                    RunObject = Page "Functional calendars";
                    ToolTip = 'Executes the Corporate Calendars action.';
                }
            }
            // group("ISO Audit")
            // {
            //     action("Audit Schedule")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Audit Schedule';
            //         RunObject = Page 95365;
            //     }
            // }
            group("Assigned Tickets")
            {
                // action("My Assigned Tickets")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'My Assigned Tickets';
                //     RunObject = Page 60039;
                // }
                action("My Closed Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Closed Tickets';
                    RunObject = Page 60092;
                    ToolTip = 'Executes the My Closed Tickets action.';
                }
                action("My Resolved Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Resolved Tickets';
                    RunObject = Page 60093;
                    ToolTip = 'Executes the My Resolved Tickets action.';
                }
            }
        }
    }
}
