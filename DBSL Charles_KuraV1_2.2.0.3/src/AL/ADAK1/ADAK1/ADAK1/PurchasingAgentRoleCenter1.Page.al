#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99119 "Purchasing Agent Role Center11"
{
    Caption = 'Supply Chain Management Role';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1907662708; "Purchase Agent Activities")
                {
                }
            }
            group(Control1900724708)
            {
                systempart(Control43; MyNotes)
                {
                }
                part(Control25; "Purchase Performance")
                {
                }
                part(Control37; "Purchase Performance")
                {
                    Visible = false;
                }
                part(Control21; "Inventory Performance")
                {
                }
                part(Control44; "Inventory Performance")
                {
                    Visible = false;
                }
                part(Control35; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                }
                part(Control1905989608; "My Items")
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Vendor - T&op 10 List")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - T&op 10 List';
                Image = "Report";
                RunObject = Report "Vendor - Top 10 List";
                ToolTip = 'Executes the Vendor - T&op 10 List action.';
            }
            action("Vendor/&Item Purchases")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor/&Item Purchases';
                Image = "Report";
                RunObject = Report "Vendor/Item Purchases";
                ToolTip = 'Executes the Vendor/&Item Purchases action.';
            }
            separator(Action28)
            {
            }
            action("Inventory - &Availability Plan")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - &Availability Plan';
                Image = ItemAvailability;
                RunObject = Report "Inventory - Availability Plan";
                ToolTip = 'Executes the Inventory - &Availability Plan action.';
            }
            // action("Purchase Order Report")
            // {
            //     ApplicationArea = Basic;
            //     RunObject = Report UnknownReport51511169;
            // }
            action("Inventory &Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory &Purchase Orders';
                Image = "Report";
                RunObject = Report "Inventory Purchase Orders";
                ToolTip = 'Executes the Inventory &Purchase Orders action.';
            }
            action("Inventory - &Vendor Purchases")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - &Vendor Purchases';
                Image = "Report";
                RunObject = Report "Inventory - Vendor Purchases";
                ToolTip = 'Executes the Inventory - &Vendor Purchases action.';
            }
            action("Inventory &Cost and Price List")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory &Cost and Price List';
                Image = "Report";
                RunObject = Report "Inventory Cost and Price List";
                ToolTip = 'Executes the Inventory &Cost and Price List action.';
            }
            separator(Action53)
            {
            }
            // action("Requisition by Item")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Requisition by Item';
            //     Image = Aging;
            //     RunObject = Report UnknownReport51511437;
            // }
            // action("Requisition by Date")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Requisition by Date';
            //     Image = Alerts;
            //     RunObject = Report UnknownReport51511441;
            // }
            // action("Purchase Order Analysis ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Order Analysis ';
            //     RunObject = Report UnknownReport51511473;
            // }
        }
        area(embedding)
        {
            // action("Purchase Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Orders';
            //     RunObject = Page "Purchase Order List";
            // }
            action("Procurement Plan")
            {
                ApplicationArea = Basic;
                RunObject = Page "Procurement Plans List";
                ToolTip = 'Executes the Procurement Plan action.';
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
                RunObject = Page "Approved Dept Procurement Plan";
                ToolTip = 'Executes the Approved Departmental Procurement Plan action.';
            }
            action("Consolidated Procurement Plan")
            {
                ApplicationArea = Basic;
                RunObject = Page 75009;
                ToolTip = 'Executes the Consolidated Procurement Plan action.';
            }
            // action("Open Orders ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Open Orders ';
            //     RunObject = Page "Purchase Order List";
            //     RunPageView = where(Status=filter(Open));
            // }
            // action("Pending Approval ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Pending Approval ';
            //     RunObject = Page "Purchase Order List";
            //     RunPageView = where(Status=filter("Pending Approval"));
            // }
            // action("Approved Purchase Orders ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Approved Purchase Orders ';
            //     RunObject = Page "Purchase Order List";
            //     RunPageView = where(Status=filter(Released));
            // }
            // action("Purchase Quotes")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Quotes';
            //     RunObject = Page "Purchase Quotes";
            // }
            // action("Blanket Purchase Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Blanket Purchase Orders';
            //     RunObject = Page "Blanket Purchase Orders";
            // }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Executes the Purchase Invoices action.';
            }
            // action("Purchase Return Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Return Orders';
            //     RunObject = Page "Purchase Return Order List";
            // }
            action("Purchase Credit Memos")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Credit Memos';
                RunObject = Page "Purchase Credit Memos";
                ToolTip = 'Executes the Purchase Credit Memos action.';
            }
            action("Assembly Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Assembly Orders';
                RunObject = Page "Assembly Orders";
                ToolTip = 'Executes the Assembly Orders action.';
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Executes the Sales Orders action.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                RunPageMode = View;
                RunPageView = where("Vendor Type" = const(Trade));
                ToolTip = 'Executes the Vendors action.';
            }
            action(Items)
            {
                ApplicationArea = Basic;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'Executes the Items action.';
            }
            action("Nonstock Items")
            {
                ApplicationArea = Basic;
                Caption = 'Nonstock Items';
                Image = NonStockItem;
                RunObject = Page "Catalog Item List";
                ToolTip = 'Executes the Nonstock Items action.';
            }
            action("Stockkeeping Units")
            {
                ApplicationArea = Basic;
                Caption = 'Stockkeeping Units';
                Image = SKU;
                RunObject = Page "Stockkeeping Unit List";
                ToolTip = 'Executes the Stockkeeping Units action.';
            }
            action("Purchase Analysis Reports")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Analysis Reports';
                RunObject = Page "Analysis Report Purchase";
                RunPageView = where("Analysis Area" = filter(Purchase));
                ToolTip = 'Executes the Purchase Analysis Reports action.';
            }
            action("Inventory Analysis Reports")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory Analysis Reports';
                RunObject = Page "Analysis Report Inventory";
                RunPageView = where("Analysis Area" = filter(Inventory));
                ToolTip = 'Executes the Inventory Analysis Reports action.';
            }
            action("Item Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = where("Template Type" = const(Item),
                                    Recurring = const(false));
                ToolTip = 'Executes the Item Journals action.';
            }
            action("Purchase Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Purchases),
                                    Recurring = const(false));
                ToolTip = 'Executes the Purchase Journals action.';
            }
            action("Requisition Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("Req."),
                                    Recurring = const(false));
                ToolTip = 'Executes the Requisition Worksheets action.';
            }
            action("Subcontracting Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Subcontracting Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("For. Labor"),
                                    Recurring = const(false));
                ToolTip = 'Executes the Subcontracting Worksheets action.';
            }
            action("Standard Cost Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Standard Cost Worksheets';
                RunObject = Page "Standard Cost Worksheet Names";
                ToolTip = 'Executes the Standard Cost Worksheets action.';
            }
            action("Config. Packages")
            {
                ApplicationArea = Basic;
                Caption = 'Config. Packages';
                RunObject = Page "Config. Packages";
                ToolTip = 'Executes the Config. Packages action.';
            }
        }
        area(sections)
        {
            group("Procurement Planning")
            {
                action("Procurement Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Procurement Setup";
                    ToolTip = 'Executes the Procurement Setup action.';
                }
                action("Procurement Types")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Procurement Types";
                    ToolTip = 'Executes the Procurement Types action.';
                }
                action("Procurement Officers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Procurement Officers";
                    ToolTip = 'Executes the Procurement Officers action.';
                }
                action("Procurement Activity Code")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Procurement Activity Code";
                    ToolTip = 'Executes the Procurement Activity Code action.';
                }
                action("Solicitation Type")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Solicitation Type";
                    ToolTip = 'Executes the Solicitation Type action.';
                }
                action("Procurement Categories")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Procurement Categories";
                    ToolTip = 'Executes the Procurement Categories action.';
                }
            }
            group("Store Requisitions")
            {
                Caption = 'Store Requisitions';
                Image = LotInfo;
                action("Store Requisitions List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions List';
                    RunObject = Page "Store Requisitions";
                    ToolTip = 'Executes the Store Requisitions List action.';
                }
                action("Approved Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Store Requisitions';
                    RunObject = Page 50053;
                    ToolTip = 'Executes the Approved Store Requisitions action.';
                }
                action("Store Requisitions Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions Posted';
                    RunObject = Page "Posted Store Requisitions";
                    ToolTip = 'Executes the Store Requisitions Posted action.';
                }
            }
            group("Purchase Requisitions ")
            {
                Caption = 'Purchase Requisitions ';
                Image = LotInfo;
                action("Purchase Requisitions List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisitions List';
                    RunObject = Page "Open Purchase Requisitions";
                    ToolTip = 'Executes the Purchase Requisitions List action.';
                }
                action("Approved Purchase Requsitions ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Purchase Requsitions ';
                    RunObject = Page "Approved PRN";
                    ToolTip = 'Executes the Approved Purchase Requsitions  action.';
                }
                action("Unassigned Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Unasssigned PRNs";
                    ToolTip = 'Executes the Unassigned Purchase Requisitions action.';
                }
                action("Assigned Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Assigned PRNs";
                    ToolTip = 'Executes the Assigned Purchase Requisitions action.';
                }
            }
            group("Sourcing Process")
            {
                Caption = 'Sourcing Process';
                Image = LotInfo;
                action("Works Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Works Purchase Requisitions";
                    ToolTip = 'Executes the Works Purchase Requisition action.';
                }
                action("Approved Purchase Requisition ")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved PRN";
                    ToolTip = 'Executes the Approved Purchase Requisition  action.';
                }
                action("Draft Invitation for Supply")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Draft Invitation For Supply";
                    ToolTip = 'Executes the Draft Invitation for Supply action.';
                }
                action("Approved Invitation for Supply")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Invitation For Supply";
                    ToolTip = 'Executes the Approved Invitation for Supply action.';
                }
                action("Published Invitation for Supply")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Publishe Invitation For Supply";
                    ToolTip = 'Executes the Published Invitation for Supply action.';
                }
                action("Request for Quoatation(RFQ)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotation List';
                    RunObject = Page "Request For Quotations (RFQ)";
                    ToolTip = 'Executes the Request for Quotation List action.';
                }
                action("Approved Quotation(RFQ)")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Quotations(RFQ)";
                    ToolTip = 'Executes the Approved Quotation(RFQ) action.';
                }
                action("Tender Addendum Notice")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Tender Addendum Notice";
                    ToolTip = 'Executes the Tender Addendum Notice action.';
                }
                action("Prebid Meeting Register")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFS Prebid Register";
                    ToolTip = 'Executes the Prebid Meeting Register action.';
                }
                action("IFS Committee2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Standing Committees';
                    RunObject = Page "Clustered IFS Tender Committee";
                    ToolTip = 'Executes the Standing Committees action.';
                }
                action("IFS Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Committees';
                    RunObject = Page "IFS Tender Committee";
                    ToolTip = 'Executes the Tender Committees action.';
                }
            }
            group("Supplier Prequalification")
            {
                Caption = 'Supplier Registration.';
                Image = LotInfo;

                //Reinventment
                action("Registered Suppliers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Vendor Registration";
                    ToolTip = 'Executes the Registered Suppliers action.';
                }
                // action("Invitation for Registration")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Invitation For Prequalificatio";
                // }
                action("Invitation for Registration")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Invitation For Registration";
                    ToolTip = 'Executes the Invitation for Registration action.';
                }
                action("Published Invitation for Registration")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "pubInvitation For Registration";
                    ToolTip = 'Executes the Published Invitation for Registration action.';
                }
                action("IFR Tender Committe")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFP Tender Committee";
                    ToolTip = 'Executes the IFR Tender Committe action.';
                }
                action("IFR Response List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFR Response List";
                    ToolTip = 'Executes the IFR Response List action.';
                }
                action("IFP Opening Register")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFP Opening Register";
                    ToolTip = 'Executes the IFP Opening Register action.';
                }
                action("Final Evaluation Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFRPrequalification Evaluation";
                    ToolTip = 'Executes the Final Evaluation Vouchers action.';
                }
                action("IFR Evaluation Report")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFR Evaluation  Report List";
                    ToolTip = 'Executes the IFR Evaluation Report action.';
                }
                action("IFR Proffessional Opinion")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFR Proffession Opinion list";
                    ToolTip = 'Executes the IFR Proffessional Opinion action.';
                }
                action("IFR Notice Of Award")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFR Notice of Award list";
                    ToolTip = 'Executes the IFR Notice Of Award action.';
                }



                action("Registration Responses")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "RFI Response List";
                    ToolTip = 'Executes the Registration Responses action.';
                }
                // action("Registration Evaluation Vouchers")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Prequalification Score Header";
                // }

                // action("Published Registrations")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Published Prequalification Not";
                // }
                // action("Closed Prequalifications")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Closed Prequalification Notice";
                // }
                // action("Evaluated Registrations")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Evaluated Prequalification Not";
                // }
                // action("Registration  Entries")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Vendor Prequalification Entry";
                // }
                action("Appraisal Periods")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Vendor Appraisal Periods";
                    ToolTip = 'Executes the Appraisal Periods action.';
                }
                action("Supplier Appraisal")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Vendor Appraisal Vouchers";
                    ToolTip = 'Executes the Supplier Appraisal action.';
                }
                action("Appraisal Report")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Consolidated Vendor Appraissal";
                    ToolTip = 'Executes the Appraisal Report action.';
                }
                //Reinventment
                // action("Registered Suppliers")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Vendor Registration";
                // }
                // action("Invitation for Registration")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Invitation For Prequalificatio";
                // }
                // action("Published Registrations")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Published Prequalification Not";
                // }
                // action("Registration Responses")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page 75171;
                // }

                // action("Closed Prequalifications")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Closed Prequalification Notice";
                // }
                // action("Registration Evaluation Vouchers")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page 75186;
                // }

                // action("Evaluated Registrations")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Evaluated Prequalification Not";
                // }
                // action("Registration  Entries")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Vendor Prequalification Entry";
                // }
                // action("Appraisal Periods")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Vendor Appraisal Periods";
                // }
                // action("Supplier Appraisal")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Vendor Appraisal Vouchers";
                // }
                // action("Appraisal Report")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Report "Consolidated Vendor Appraissal";
                // }
            }
            group("Bid Response Evaluation")
            {
                Caption = 'Bid Response Evaluation and Award';
                action("Bid Response List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Response List";
                    ToolTip = 'Executes the Bid Response List action.';
                }
                action("Evaluation Templates")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Evaluation Template";
                    ToolTip = 'Executes the Evaluation Templates action.';
                }
                action("Standing Committees")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Clustered IFS Tender Committee";
                    ToolTip = 'Executes the Standing Committees action.';
                }
                action("Technical Bid Opening Register")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Opening Register";
                    ToolTip = 'Executes the Technical Bid Opening Register action.';
                }
                action("Individual Preliminary Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual Preliminary Evaluation';
                    RunObject = Page "Individual Preliminary Evaluat";
                    ToolTip = 'Executes the Individual Preliminary Evaluation action.';
                }
                action("Final preliminary Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final preliminary Evaluation';
                    RunObject = Page "Bid Evaluation Register";
                    ToolTip = 'Executes the Final preliminary Evaluation action.';
                }
                action("Individual Technical Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual Technical Evaluation';
                    RunObject = Page "Individual Technical Bid Eval";
                    ToolTip = 'Executes the Individual Technical Evaluation action.';
                }
                action("Final Technical Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final Technical Evaluation';
                    RunObject = Page "Technical Bid Evaluation list";
                    ToolTip = 'Executes the Final Technical Evaluation action.';
                }
                action("Financial Opening Register")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Finance Opening Register";
                    ToolTip = 'Executes the Financial Opening Register action.';
                }
                action("Individual financial Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual financial Evaluation';
                    RunObject = Page "Individual Financial Bid Eval";
                    ToolTip = 'Executes the Individual financial Evaluation action.';
                }
                action("Final Financial Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final Financial Evaluation';
                    RunObject = Page "Financial Bid Evaluation list";
                    ToolTip = 'Executes the Final Financial Evaluation action.';
                }
                action("Approved Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Evaluation Reports';
                    RunObject = Page "Approved Invitation For Supply";
                    ToolTip = 'Executes the Approved Evaluation Reports action.';
                }
                action("Vendor Due-Diligence")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Vendor Due-Diligence";
                    ToolTip = 'Executes the Vendor Due-Diligence action.';
                }
                action("Final Evaluation Report")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Final Evaluation  Report";
                    ToolTip = 'Executes the Final Evaluation Report action.';
                }
                action("Professional Opinion")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Proffession Opinion list";
                    ToolTip = 'Executes the Professional Opinion action.';
                }
                action("Notification of Award")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Notice of Award list";
                    ToolTip = 'Executes the Notification of Award action.';
                }
            }
            ///////cc
            //cs
            group("Asset Management")
            {
                Caption = 'Asset Management';
                Image = LotInfo;
                group("Asset Register")
                {
                    Caption = 'Asset Register';

                    action("Fixed Assets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fixed ASSETS';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Fixed ASSETS action.';
                    }
                    action("Insurance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Insurance';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Insurance action.';
                    }
                    action("Asset Transfer List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Asset Transfer List';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Asset Transfer List action.';
                    }

                }
                group("History")
                {
                    Caption = 'History';
                    action("FA REGISTERS")
                    {
                        ApplicationArea = Basic;
                        Caption = 'FA Registers';
                        RunObject = Page "FA Registers";
                        ToolTip = 'Executes the FA Registers action.';
                    }
                    action("Navigate3")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Navigate';
                        RunObject = Page "Navigate";
                        ToolTip = 'Executes the Navigate action.';
                    }

                }
                group("Reports&Analysis")
                {
                    Caption = 'Reports&Analysis';
                    action("FA Analysis")
                    {
                        ApplicationArea = Basic;
                        Caption = 'FA Aalysis';
                        RunObject = Page "FA Allocations";
                        ToolTip = 'Executes the FA Aalysis action.';
                    }
                    action("Navigate")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Navigate';
                        RunObject = Page "Navigate";
                        ToolTip = 'Executes the Navigate action.';
                    }

                }
                group("Planning")
                {
                    Caption = 'Planning';

                    action("Fixed Assets2")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fixed ASSETS';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Fixed ASSETS action.';
                    }
                    action("Functional Disposal plans")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Functional Disposal plans';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Functional Disposal plans action.';
                    }
                    action("Submitted Functional Disposal plans")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Submitted Functional Disposal plans';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Submitted Functional Disposal plans action.';
                    }
                    action("Consolidated Disposal plan")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Consolidated Disposal plan';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Consolidated Disposal plan action.';
                    }
                    action("Disposal Committee Appointment")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Disposal Committee Appointment';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Disposal Committee Appointment action.';
                    }
                }

                group("Requisition")
                {
                    Caption = 'Requisition';

                    action("Asset Disposal Requisition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Asset Disposal Requisition';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Asset Disposal Requisition action.';
                    }
                    action("Approved Disposal Requisition List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Disposal Requisition List';
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Approved Disposal Requisition List action.';
                    }

                }
                group("Disposal Methods")
                {
                    caption = 'Disposal Methods';
                    group("Transfer to Public Entity")
                    {
                        Caption = 'Transfer to Public Entity';

                        action("Asset Transfer Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Transfer Vouchers';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Asset Transfer Vouchers action.';
                        }
                        action("Approved Asset Transfer Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Transfer Vouchers';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Approved Asset Transfer Vouchers action.';
                        }
                    }

                    group("Sale by Public Tender")
                    {
                        Caption = 'Sale by Public Tender';

                        action("Disposal Quotes")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Disposal Quotes';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Disposal Quotes action.';
                        }
                        action("Invitation to Tender Notices")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Invitation to Tender Notices';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Invitation to Tender Notices action.';
                        }
                        action("Approved Disposal Invitations")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Invitation to Tender Notices';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Invitation to Tender Notices action.';
                        }
                    }
                    group("Sale by Public Auction")
                    {
                        Caption = 'Sale by Public Auction';

                        action("Asset Auction Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Auction Vouchers';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Asset Auction Vouchers action.';
                        }
                        action("Approved Asset Auction Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Auction Vouchers';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Approved Asset Auction Vouchers action.';
                        }
                    }
                    group("Trade-in")
                    {
                        Caption = 'Trade-in';

                        action("Asset Trade-in Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Trade-in Vouchers';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Asset Trade-in Vouchers action.';
                        }
                        action("Approved Asset Trade-in Voucher")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Trade-in Voucher';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Approved Asset Trade-in Voucher action.';
                        }
                    }
                    group("Waste Disposal Management")
                    {
                        Caption = 'Waste Disposal Management';

                        action("Asset Disposal Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Disposal Vouchers';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Asset Disposal Vouchers action.';
                        }
                        action("Approved Asset Disposal Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Disposal Vouchers';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Approved Asset Disposal Vouchers action.';
                        }
                    }
                    group("Setup")
                    {
                        Caption = 'Setup';

                        action("Procurement Committee Types")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Procurement Committee Types';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Procurement Committee Types action.';
                        }
                        action("Disposal Types")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Disposal Types';
                            RunObject = Page "Fixed Asset List";
                            ToolTip = 'Executes the Disposal Types action.';
                        }
                    }
                    group("Disposal Contract Management")
                    {
                        Caption = 'Disposal Contract Management';

                        action("Sales Orders12")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Sales Orders';
                            RunObject = Page "Sales Order List";
                            ToolTip = 'Executes the Sales Orders action.';
                        }
                        action("Posted Sales Invoices")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Posted Sales Invoices';
                            RunObject = Page "Posted Sales Invoices";
                            ToolTip = 'Executes the Posted Sales Invoices action.';
                        }
                    }


                }



            }

            group("Contract Administration")
            {
                Caption = 'Contract Administration';
                Image = LotInfo;
                action("Standard Contract List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Standard Contract List';
                    RunObject = Page "Contract List";
                    ToolTip = 'Executes the Standard Contract List action.';
                }
                action("Framework Agreements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Framework Agreements';
                    RunObject = Page "Framework Agreement Invitation";
                    ToolTip = 'Executes the Framework Agreements action.';
                }
                // action("Purchase Orders")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Purchase Orders';
                //     RunObject = Page "Purchase Order List";
                // }
                action("Inspection and Acceptance Comm")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inspection and Acceptance Committee';
                    RunObject = Page "Inspection Committee Appointme";
                    ToolTip = 'Executes the Inspection and Acceptance Committee action.';
                }
                action("Clustered IAC")
                {
                    ApplicationArea = Basic;
                    Caption = 'Standing Inspection and Acceptance Committee';
                    RunObject = Page "Clustered IFS Tender Committee";
                    ToolTip = 'Executes the Standing Inspection and Acceptance Committee action.';
                }
                action("Inspection List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Inspections List";
                    ToolTip = 'Executes the Inspection List action.';
                }
            }
            group("Self Service")
            {
                Caption = 'Self Service';
                Image = Travel;
                action("Imprest Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Memos";
                    ToolTip = 'Executes the Imprest Request action.';
                }
                action(Action105)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Requisitions";
                    ToolTip = 'Executes the Imprest Request action.';
                }
                action("Imprest Surrender")
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
                action("Purchase Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition ';
                    RunObject = Page "Purchase Requisitions List";
                    ToolTip = 'Executes the Purchase Requisition  action.';
                }
                action("Store Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisition ';
                    Image = Vendor;
                    RunObject = Page "Store Requisitions";
                    ToolTip = 'Executes the Store Requisition  action.';
                }
                action("Leave Application ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application ';
                    Image = Balance;
                    RunObject = Page "Leave Applications List";
                    ToolTip = 'Executes the Leave Application  action.';
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
            }
            group("Approvals ")
            {
                Caption = 'Approvals ';
                Image = Purchasing;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = Currency;
                    RunObject = Page "Approval Entries";
                    ToolTip = 'Executes the Approval Entries action.';
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Request Entries';
                    Image = AccountingPeriods;
                    RunObject = Page "Approval Request Entries";
                    ToolTip = 'Executes the Approval Request Entries action.';
                }
            }
            group("Posted Documents & History ")
            {
                Caption = 'Posted Documents & History ';
                Image = FiledPosted;
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Executes the Posted Purchase Receipts action.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Executes the Posted Purchase Invoices action.';
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Executes the Posted Return Shipments action.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Executes the Posted Purchase Credit Memos action.';
                }
                action("Posted Assembly Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Assembly Orders';
                    RunObject = Page "Posted Assembly Orders";
                    ToolTip = 'Executes the Posted Assembly Orders action.';
                }
                action("Purchase Order Archives")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Order Archives';
                    RunObject = Page "Purchase Order Archives";
                    ToolTip = 'Executes the Purchase Order Archives action.';
                }
            }
        }
        area(creation)
        {
            action("Purchase &Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Order';
                Image = Document;

                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Executes the Purchase &Order action.';
            }
            action("Purchase &Return Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Return Order';
                Image = ReturnOrder;
                RunObject = Page "Purchase Return Order";
                RunPageMode = Create;
                ToolTip = 'Executes the Purchase &Return Order action.';
            }
        }
        area(processing)
        {
            separator(Action24)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Location List ")
            {
                ApplicationArea = Basic;
                Image = Job;
                RunObject = Page "Location List";
                ToolTip = 'Executes the Location List  action.';
            }
            action("Item &Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Item &Journal';
                Image = Journals;
                RunObject = Page "Item Journal";
                ToolTip = 'Executes the Item &Journal action.';
            }
            action("Physical Inventory Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Physical Inventory Journal';
                Image = Addresses;
                RunObject = Page "Phys. Inventory Journal";
                ToolTip = 'Executes the Physical Inventory Journal action.';
            }
            action("Order Plan&ning")
            {
                ApplicationArea = Basic;
                Caption = 'Order Plan&ning';
                Image = Planning;
                RunObject = Page "Order Planning";
                ToolTip = 'Executes the Order Plan&ning action.';
            }
            separator(Action38)
            {
            }
            action("Requisition &Worksheet")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition &Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("Req."),
                                    Recurring = const(false));
                ToolTip = 'Executes the Requisition &Worksheet action.';
            }
            // action("Pur&chase Prices")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Pur&chase Prices';
            //     Image = Price;
            //     RunObject = Page "Purchase Prices";
            // }
            // action("Purchase &Line Discounts")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase &Line Discounts';
            //     Image = LineDiscount;
            //     RunObject = Page "Purchase Line Discounts";
            // }
            separator(Action36)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic;
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page Navigate;
                ToolTip = 'Executes the Navi&gate action.';
            }
        }
    }
}

