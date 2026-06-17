page 50039 "Admin Role Center"
{
    Caption = 'Admin Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(RoleCenter)
        {
            part(Headlines; "Headline RC Administrator")
            {
            }
            part(Email; "Email Activities")
            {
            }
            part(Approvals; "Approvals Activities")
            {
            }
            part("Correspondence Cues"; "Correspondence Cues")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group("File Movement Management")
            {
                Visible = false;
                group(Adminstration)
                {
                    action(FileMovementSetup)
                    {
                        ApplicationArea = Basic;
                        Caption = 'File Movement Setup';
                        RunObject = Page "File Movement SetUp";
                        ToolTip = 'Executes the File Movement Setup action.';
                    }
                }
                group("File Creation")
                {
                    action(FileRegistry)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Registry List';
                        RunObject = Page "Registry List";
                        ToolTip = 'Executes the Registry List action.';
                    }
                    action(FileTypes)
                    {
                        ApplicationArea = Basic;
                        Caption = 'File Types';
                        RunObject = Page "File Types";
                        ToolTip = 'Executes the File Types action.';
                    }
                }
                group("File Movement")
                {
                    action(FileRequisitionLists)
                    {
                        ApplicationArea = Basic;
                        Caption = 'File Requisition List';
                        RunObject = Page "File Movement List";
                        ToolTip = 'Executes the File Requisition List action.';
                    }
                    action(PendingFileRequisitionLists)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending File Requisition List';
                        RunObject = Page "Pending File Requisition";
                        ToolTip = 'Executes the Pending File Requisition List action.';
                    }
                    action(ApprovedFileRequisitionLists)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved File Requisition List';
                        RunObject = Page "Approved File Requisition";
                        ToolTip = 'Executes the Approved File Requisition List action.';
                    }
                }
                group("File Dispatch")
                {
                    action("Issued File Requisition List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued File Requisition List';
                        RunObject = Page "Issued File Requisition";
                        ToolTip = 'Executes the Issued File Requisition List action.';
                    }
                    action("Returned File Requisition List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Returned File Requisition List';
                        RunObject = Page "Returned File Requisition";
                        ToolTip = 'Executes the Returned File Requisition List action.';
                    }
                }
            }
            group("Fleet Management")
            {
                action("Fleet Management Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Setup';
                    RunObject = Page "Fleet Management Setup";
                    ToolTip = 'Executes the Setup action.';
                }
                group("Fleet Mgmt.")
                {
                    action("Fleet Vehicles")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Vehicles';
                        RunObject = page "Fleet Vehicles List";
                        ToolTip = 'Executes the Fleet Vehicles action.';
                    }
                    action("Fleet Drivers")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Drivers';
                        RunObject = page "Fleet Drivers List";
                        ToolTip = 'Executes the Fleet Drivers action.';
                    }
                    action("Vehicle Ins.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vehicle Insurances';
                        RunObject = page "Vehicle Insurance List";
                        ToolTip = 'Executes the Vehicle Insurances action.';
                    }
                    action("Vehicle Inspections")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vehicle Inspections';
                        RunObject = page "Vehicle Inspection List";
                        ToolTip = 'Executes the Vehicle Inspections action.';
                    }
                }
                group("Transport Requisition")
                {
                    action("Fleet Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Transport Requisitions';
                        RunObject = page "Fleet Requisition List";
                        ToolTip = 'Executes the Open Transport Requisitions action.';
                    }
                    action("Pending Fleet Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Transport Requisitions';
                        RunObject = page "Pending Fleet Requests List";
                        ToolTip = 'Executes the Pending Transport Requisitions action.';
                    }
                    action("Approved Fleet Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Transport Requisitions';
                        RunObject = page "Approved Fleet Requests List";
                        ToolTip = 'Executes the Approved Transport Requisitions action.';
                    }
                    action("Closed Fleet Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Closed Transport Requisitions';
                        RunObject = page "Closed Fleet Requests List";
                        ToolTip = 'Executes the Closed Transport Requisitions action.';
                    }
                }
                group("Maintenance Req.")
                {
                    action("Open Maintenance Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Maintenance Req.';
                        RunObject = page "Open Maintenance Requests";
                        ToolTip = 'Executes the Open Maintenance Req. action.';
                    }
                    action("Pending Maintenance Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Maintenance Req.';
                        RunObject = page "Pending Maintenance Requests";
                        ToolTip = 'Executes the Pending Maintenance Req. action.';
                    }
                    action("Approved Maintenance Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Maintenance Req.';
                        RunObject = page "Approved Maintenance Requests";
                        ToolTip = 'Executes the Approved Maintenance Req. action.';
                    }
                    action("Closed Maintenance Req.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Closed Maintenance Req.';
                        RunObject = page "Closed Maintenance Requests";
                        ToolTip = 'Executes the Closed Maintenance Req. action.';
                    }
                }
                group("Fuel Req.")
                {
                    action("Fuel Requests List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fuel Management List';
                        RunObject = page "Fuel Requests List";
                        ToolTip = 'Executes the Fuel Requests List action.';
                    }
                    action("Pending Fuel Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Fuel Management Requests';
                        RunObject = page "Pending Fuel Requests";
                        ToolTip = 'Executes the Pending Fuel Requests action.';
                    }
                    action("Approved Fuel Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Fuel Management Requests';
                        RunObject = page "Approved Fuel Requests";
                        ToolTip = 'Executes the Approved Fuel Requests action.';
                    }
                }
                group("Number Plate Req.")
                {
                    visible = false;
                    action("Number Plate Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Number Plate Requests';
                        RunObject = page "Number Plate Requests";
                        ToolTip = 'Executes the Number Plate Requests action.';
                    }
                    action("Pending Number Plate Request")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Number Plate Requests';
                        RunObject = page "Pending Number Plate Requests";
                        ToolTip = 'Executes the Pending Number Plate Requests action.';
                    }
                    action("Approved Number Plate Request")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Number Plate Requests';
                        RunObject = page "Approved Number Plate Requests";
                        ToolTip = 'Executes the Approved Number Plate Requests action.';
                    }
                    action("Submitted Number Plate Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Submitted Number Plate Requests';
                        RunObject = page "Submitted Number Plate Request";
                        ToolTip = 'Executes the Submitted Number Plate Requests action.';
                    }
                }
                group("Fuel Card")
                {
                    // action("Fuel Card Allocations")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Fuel Cards Allocations';
                    //     RunObject = page "Fuel Allocations";
                    // }
                    action("Fuel Cards")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fuel Cards List';
                        RunObject = page "Fuel Card List";
                        ToolTip = 'Executes the Fuel Cards List action.';
                    }
                    action("Fuel TopUp")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fuel Top-Up List';
                        RunObject = page "Fuel Top Up List";
                        ToolTip = 'Executes the Fuel Top-Up List action.';
                    }
                    // action("Pending Fuel TopUp")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Pending Fuel Top-Up Req.';
                    //     RunObject = page "Pending Fuel TopUp Req.";
                    // }
                    // action("Appr. Fuel TopUp")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Approved Fuel Top-Up Req.';
                    //     RunObject = page "Approved Fuel TopUp Req.";
                    // }
                }
                group("Fleet Reports")
                {
                    action("Fuel Consumption")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fuel Consumption';
                        RunObject = Report "Fuel Consumption";
                        ToolTip = 'Executes the Fuel Consumption action.';
                    }
                    // action("Fuel Card Deductions")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Fuel Card Deductions';
                    //     RunObject = Report "Fuel Card Entries";
                    // }
                    action("Fuel Reconciliation")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fuel Reconciliation';
                        RunObject = Report "Fuel Reconciliation";
                        ToolTip = 'Executes the Fuel Reconciliation action.';
                    }
                    // action("Fleet Maintenance Report")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Fleet Maintenance Report';
                    //     RunObject = Report "Vehicle M Requisitions";
                    // }
                    // action("Transport Allocation Report")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Transport Allocation Report';
                    //     RunObject = Report "Transport Allocation";
                    // }
                }
            }
            group(Correspondences)
            {
                Caption = 'Memos';

                action("Memo Nos Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Memo Nos Setup";
                }
                action("Memo Nos Setup II")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Memo Nos Setup II";
                }
                action("Memo Setup Url")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Memo Nos Setup Url";
                }
                 action("File Categories")
                {
                    ApplicationArea = Basic;
                    RunObject = page "File Categories";
                }
                 action("Memo SUbtype Categories")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Subtype Categories";
                }
                group(MemoDepts)
                {
                    action("Memo Departments")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Memo Departments";
                    }
                    action("Admin Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Administration Dept Lookup Lis";
                    }
                    action("Audit Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Audit Dept Lookup List";
                    }
                    action("Corporate Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Corporate Dept Lookup List";
                    }
                    // action("EAP Personnel Buffer")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = page "EAP Personnel Lookup List";
                    // }
                    action("Education Buffer")
                    {
                        Caption = 'Curriculum Research and Consultancy Services ';
                        ApplicationArea = Basic;
                        RunObject = page "Education Dept Lookup List";
                    }
                    action("Finance Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Finance Dept Lookup List";
                    }
                    action("HR Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Human Cap Dept Lookup List";
                    }
                    action("ICT Buffer")
                    {
                        Caption = 'Nacece Resource Center';
                        ApplicationArea = Basic;
                        RunObject = page "ICT Dept Lookup List";
                    }
                    action("Legal Buffer")
                    {
                        Caption = 'Records, Facilities, Projects and Security';
                        ApplicationArea = Basic;
                        RunObject = page "Legal Dept Lookup List";
                    }
                    action("Personnel Buffer")
                    {
                        Caption = 'Education Projects';
                        ApplicationArea = Basic;
                        RunObject = page "Personnel Dept Lookup List";
                    }
                    action("Project Files Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Project Files Lookup List";
                    }
                    action("Standards Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Standards Dept Lookup List";
                    }
                    action("SCM Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "SCM Dept Lookup List";
                    }

                    action("Transport Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Transport Dept Lookup List";
                    }
                    action("ECD Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "ECD Lookup list";
                    }
                    action("Research")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Research";
                    }
                    action("COFS")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "COFS";
                    }
                    action("Tivet")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Tivet";
                    }
                    action("Media and technical services")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Media and technical services ";
                    }
                }
                action("Correspondences Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Correspondences Lists";
                }
                action("Correspondences Pending Approv")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Correspondences Pending Approv";
                }
                action("Approved Correspondences")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Correspondences";
                }
                action("General Correspondences")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "General Correspondences";
                    Caption = 'Memos';
                }
                action("Incoming Correspondence List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Incoming Correspondence List";
                }
                action("Corrective Order Responses")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Corrective Order Responses";
                }
                action("Correspondence Contacts")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Correspondence Contacts";
                }
                action("Incoming Corrs Sources")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Incoming Corrs Sources";
                }
                action("Incoming Correspondences File")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Incoming Correspondences File";
                }
                action("Internal Correspondence - Memo")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Internal Correspondence - Memo";
                }
                action("Correspondence-Internal Letter")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Correspondence-Internal Letter";
                }
                action("Correspondence-External Letter")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Correspondence-External Letter";
                }
                action("Posted Correspondences")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Correspondences";
                }
            }
            group("Occupational Safety & Health")
            {
                Visible = false;
                group("OSH Governance & Planning")
                {
                    group("Lists and Tasks")
                    {
                        action("Board")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Committee';
                            // RunObject = page 80014;
                            RunObject = page 55000;
                            ToolTip = 'Executes the Committee action.';
                        }
                        action("Directorates")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Directorates';
                            RunObject = page 80016;
                            Visible = false;
                            ToolTip = 'Executes the Directorates action.';
                        }
                        action("Sections")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Sections';
                            RunObject = page 80020;
                            Visible = false;
                            ToolTip = 'Executes the Sections action.';
                        }
                        action("OSH Mnagement Roles")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Management Roles';
                            RunObject = page 69496;
                            ToolTip = 'Executes the OSH Management Roles action.';
                        }
                        action("Employees1")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Employees';
                            RunObject = page 5201;
                            Visible = false;
                            ToolTip = 'Executes the Employees action.';
                        }
                        action("Projects")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Projects';
                            RunObject = page 89;
                            Visible = false;
                            ToolTip = 'Executes the Projects action.';
                        }
                        action("OSH Template Category")
                        {
                            ApplicationArea = Basic;
                            RunObject = page "OSH Rule Templates";
                            ToolTip = 'Executes the OSH Template Category action.';
                        }
                        action("OSH Framework")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Framework';
                            RunObject = page 69400;
                            ToolTip = 'Executes the OSH Framework action.';
                        }
                        action("OSH Management Plans")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Management Plans';
                            RunObject = page 69447;
                            ToolTip = 'Executes the OSH Management Plans action.';
                        }
                    }
                    group("Report & Analysis")
                    {
                        action("OSH Framework Summary")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Framework Summary';
                            Visible = false;
                            ToolTip = 'Executes the OSH Framework Summary action.';
                            //  RunObject = report 69450;
                        }
                        action("OSH Mnagement Plan Summary")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Mnagement Plan Summary';
                            Visible = false;
                            ToolTip = 'Executes the OSH Mnagement Plan Summary action.';
                            //  RunObject = report 69451;
                        }
                    }
                    group("Administration")
                    {
                        action("Hazard Types")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Hazard Types';
                            RunObject = page 69401;
                            ToolTip = 'Executes the Hazard Types action.';
                        }
                        action("Hazard Identification Methods")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Hazard Identification Methods';
                            RunObject = page 69427;
                            ToolTip = 'Executes the Hazard Identification Methods action.';
                        }
                        action("Evacuation Events1")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Evacuation Events';
                            RunObject = page "Evacuation Events";
                            ToolTip = 'Executes the Evacuation Events action.';
                        }
                        action("Workplace Prohibited Items")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Workplace Prohibited Items';
                            RunObject = page "Workplace Prohibited Items";
                            ToolTip = 'Executes the Workplace Prohibited Items action.';
                        }
                        action("HSE Equipment Categorxies")
                        {
                            ApplicationArea = Basic;
                            Caption = 'HSE Equipment Categories';
                            // Visible = false;
                            //  RunObject = page 69423;
                            RunObject = page "HSE Equipment Category";
                            ToolTip = 'Executes the HSE Equipment Categories action.';
                        }
                        action("Safe Work Permit Types1")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Safe Work Permit Types';
                            Visible = false;
                            RunObject = page 69413;
                            ToolTip = 'Executes the Safe Work Permit Types action.';
                        }
                        action("Safety Workgroups")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Safety Workgroups';
                            Visible = false;
                            ToolTip = 'Executes the Safety Workgroups action.';
                            //  RunObject = page 69419;
                        }
                        action("Safety Rules & Regulations Templates")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Safety Rules & Regulations Templates';
                            RunObject = page 69432;
                            ToolTip = 'Executes the Safety Rules & Regulations Templates action.';
                        }
                        action("Safety Inspection Templates1")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Safety Inspection Templates';
                            RunObject = page 69439;
                            ToolTip = 'Executes the Safety Inspection Templates action.';
                        }
                        action("OSH Legal Instruments")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Legal Instruments';
                            RunObject = page "OSH Legal Instruments";
                            ToolTip = 'Executes the OSH Legal Instruments action.';
                        }
                        action("Incident Severity Levels1")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Incident Severity Levels';
                            RunObject = page 69490;
                            ToolTip = 'Executes the Incident Severity Levels action.';
                        }
                        action("Incident Party Types1")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Incident Party Levels';
                            RunObject = page 69492;
                            ToolTip = 'Executes the Incident Party Levels action.';
                        }
                    }
                }
                group("OSH Operations")
                {
                    // group("Lists and Tasks1")
                    // {
                    //     caption = 'Lists and Tasks';
                    action("Safety Eequipment Register")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Safety Equipment Register';
                        RunObject = page 69470;
                        ToolTip = 'Executes the Safety Equipment Register action.';
                    }
                    action("OSH Training Register")
                    {
                        ApplicationArea = Basic;
                        Caption = 'OSH Training Register';
                        Visible = false;
                        RunObject = page 69566;
                        ToolTip = 'Executes the OSH Training Register action.';
                    }
                    action("OSH Meeting Register")
                    {
                        ApplicationArea = Basic;
                        Caption = 'OSH Meeting Register';
                        Visible = false;
                        RunObject = page 69565;
                        ToolTip = 'Executes the OSH Meeting Register action.';
                    }
                    action("Hazard Insurance Register")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Hazard Insurance Register';
                        // RunObject = page 69470;
                        RunObject = page "Hazard Insurances";
                        ToolTip = 'Executes the Hazard Insurance Register action.';
                    }
                    action("Safe Work Permit Applications")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Safe Work Permits';
                        Visible = false;
                        RunObject = page 69482;
                        ToolTip = 'Executes the Safe Work Permits action.';
                    }
                    action("Safe Work Completion Reports")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Safe Work Permits COM';
                        Visible = false;
                        RunObject = page 69507;
                        ToolTip = 'Executes the Safe Work Permits COM action.';
                    }
                    action("Emergency Drill Logs")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Drill Reports';
                        RunObject = page "Emergency Drill Logs";
                        ToolTip = 'Executes the Drill Reports action.';
                    }
                    action("Posted Drill Logs")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Drill Reports';
                        RunObject = page "Posted Drill Logs";
                        ToolTip = 'Executes the Posted Drill Reports action.';
                    }
                    action("Risk Incident Reports")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Incident Reports';
                        Visible = true;
                        RunObject = page 95104;
                        ToolTip = 'Executes the Incident Reports action.';
                    }
                    action("OSH Inspection Vouchers")
                    {
                        ApplicationArea = Basic;
                        Caption = 'OSH Inspections';
                        RunObject = page 69532;
                        ToolTip = 'Executes the OSH Inspections action.';
                    }
                    action("OSH Status Reports")
                    {
                        ApplicationArea = Basic;
                        Caption = 'OSH Status Reports';
                        Visible = false;
                        RunObject = page 69439;
                        ToolTip = 'Executes the OSH Status Reports action.';
                    }

                    group("Reports & Analysis")
                    {
                        action("Safety Equipment List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Safety Equipment List';
                            Visible = false;
                            ToolTip = 'Executes the Safety Equipment List action.';
                            //  RunObject = report 69459;
                        }
                        action("OSH Training List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Training List';
                            Visible = false;
                            ToolTip = 'Executes the OSH Training List action.';
                            // RunObject = page 69460;
                        }
                        action("OSH Meeting  List")
                        {
                            ApplicationArea = Basic;
                            Visible = false;
                            Caption = 'OSH Meeting  List';
                            ToolTip = 'Executes the OSH Meeting  List action.';
                            // RunObject = page 69461;
                        }
                        action("Hazard Insurance List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Hazard Insurance List';
                            Visible = false;
                            RunObject = page "Hazard Insurances";
                            ToolTip = 'Executes the Hazard Insurance List action.';
                        }
                        action("Safe Work Permit Application  List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Safe Work Permit Application  List';
                            Visible = false;
                            ToolTip = 'Executes the Safe Work Permit Application  List action.';
                            // RunObject = page 69463;
                        }
                        action("Emergency Drill List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Emergency Drill List';
                            Visible = false;
                            ToolTip = 'Executes the Emergency Drill List action.';
                            // RunObject = page 69464;
                        }
                        action("Risk Incident Log List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Risk Incident Log List';
                            Visible = false;
                            ToolTip = 'Executes the Risk Incident Log List action.';
                            // RunObject = page 69465;
                        }
                        action("OSH Inspection List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'OSH Inspection List';
                            Visible = false;
                            ToolTip = 'Executes the OSH Inspection List action.';
                            // RunObject = page 69466;
                        }
                        group("Archieve")
                        {
                            action("Issued Safe Work Permits")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Issued Safe Work Permits';
                                RunObject = page "Safe Work Permits";
                                Visible = false;
                                ToolTip = 'Executes the Issued Safe Work Permits action.';
                            }
                            action("Denied Safe Work Permits")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Denied Safe Work Permits';
                                RunObject = page "Safe Work Permits";
                                Visible = false;
                                ToolTip = 'Executes the Denied Safe Work Permits action.';
                            }
                            action("Posted Emergency Drills")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Posted Drills';
                                RunObject = page "Emergency Drill Logs";
                                ToolTip = 'Executes the Posted Drills action.';
                            }

                            action("Posted Risk Incident Reports")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Posted Risk Incident Reports';
                                RunObject = page "Risk Incident Logs";
                                ToolTip = 'Executes the Posted Risk Incident Reports action.';
                            }
                            action("Posted OSH Inspection Vouchers")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Posted OSH Inspections';
                                RunObject = page "Inspection Templates";
                                ToolTip = 'Executes the Posted OSH Inspections action.';
                            }
                            // }


                        }
                        group("Administration1")
                        {
                            Caption = 'Administration';
                            Visible = false;
                            action("Safety Equipment Categories")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Safety Equipment Categories';
                                ToolTip = 'Executes the Safety Equipment Categories action.';
                                // RunObject = page "HSE Equipment Categorxies";
                            }
                            action("Hazard Types1")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Hazard Types';
                                RunObject = page 69401;
                                ToolTip = 'Executes the Hazard Types action.';
                            }
                            action("Safe Work Permit Types")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Safe Work Permit Types';
                                RunObject = page "Safe Work Permit Types";
                                ToolTip = 'Executes the Safe Work Permit Types action.';
                            }
                            action("Evacuation Events")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Evacuation Events';
                                RunObject = page "Evacuation Events";
                                ToolTip = 'Executes the Evacuation Events action.';
                            }
                            action("Incident Severity Levels")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Incident Severity Levels';
                                RunObject = page "Incident Severity Levels";
                                ToolTip = 'Executes the Incident Severity Levels action.';
                            }
                            action("Safety Inspection Templates")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Safety Inspection Templates';
                                RunObject = page "Inspection Templates";
                                ToolTip = 'Executes the Safety Inspection Templates action.';
                            }

                        }


                    }
                }
            }
            group("Security Incidences")
            {
                Visible = false;
                action("Incident Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Incident Types';
                    RunObject = Page "Security Incident Types";
                    ToolTip = 'Executes the Incident Types action.';
                }

                action("Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Security Incidences';
                    RunObject = Page "Security Incidence List";
                    ToolTip = 'Executes the Security Incidences action.';
                }
                action("On-Going Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'On-going Security Incidences';
                    RunObject = Page "Ongoing Security Incidences";
                    ToolTip = 'Executes the On-going Security Incidences action.';
                }
                action("Closed Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Closed Security Incidences';
                    RunObject = Page "Closed Security Incidences";
                    ToolTip = 'Executes the Closed Security Incidences action.';
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
            }
        }
    }
}

profile AdminRoleCenter
{
    ProfileDescription = 'Admin Profile';
    RoleCenter = "Admin Role Center";
    Caption = 'Admin Role Center';
}