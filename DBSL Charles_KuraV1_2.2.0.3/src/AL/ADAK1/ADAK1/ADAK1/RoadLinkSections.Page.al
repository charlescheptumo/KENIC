#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72170 "Road Link Sections"
{
    PageType = List;
    SourceTable = "Road Section";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Road Class ID"; Rec."Road Class ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class ID field.';
                }
                field("Road Category"; Rec."Road Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Category field.';
                }
                field("Carriageway Type"; Rec."Carriageway Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Carriageway Type field.';
                }
                field("Primary Constituency ID"; Rec."Primary Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Constituency ID field.';
                }
                field("Primary County ID"; Rec."Primary County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary County ID field.';
                }
                field("Primary Region ID"; Rec."Primary Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region ID field.';
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage Description field.';
                }
                field("Start Chainage(KM)"; Rec."Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(KM) field.';
                }
                field("End Chainage(KM)"; Rec."End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(KM) field.';
                }
                field("Total Road Length (KMs)"; Rec."Total Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Road Length (KMs) field.';
                }
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Point Longitude field.';
                }
                field("Start Point Latitude"; Rec."Start Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Point Latitude field.';
                }
                field("End Point Longitude"; Rec."End Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Point Longitude field.';
                }
                field("End Point Latitude"; Rec."End Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Point Latitude field.';
                }
                field("Paved Road Length (Km)"; Rec."Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paved Road Length (Km) field.';
                }
                field("Paved Road Length %"; Rec."Paved Road Length %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paved Road Length % field.';
                }
                field("UnPaved Road Length (Km)"; Rec."UnPaved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UnPaved Road Length (Km) field.';
                }
                field("Unpaved Road Length %"; Rec."Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaved Road Length % field.';
                }
                field("Section Surface Type"; Rec."Section Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Surface Type field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Last Road Condition Survey ID"; Rec."Last Road Condition Survey ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Road Condition Survey ID field.';
                }
                field("Last Road Cond. Survey Date"; Rec."Last Road Cond. Survey Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Road Cond. Survey Date field.';
                }
                field("No. of Awarded Contracts"; Rec."No. of Awarded Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Awarded Contracts field.';
                }
                field("No. of Planned Road Projects"; Rec."No. of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Road Projects field.';
                }
                field("No. of Ongoing Road Projects"; Rec."No. of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Ongoing Road Projects field.';
                }
                field("No. of Completed Road Projects"; Rec."No. of Completed Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Completed Road Projects field.';
                }
                field("Budget (Total Cost)"; Rec."Budget (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget (Total Cost) field.';
                }
                field("Actual (Total Cost)"; Rec."Actual (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual (Total Cost) field.';
                }
                field("No. of Res. Land Acq. W_orders"; Rec."No. of Res. Land Acq. W_orders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Res. Land Acq. W_orders field.';
                }
                field("No. of Roadside Devpt Apps"; Rec."No. of Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Roadside Devpt Apps field.';
                }
                field("No. of Enchmt Stop W_orders"; Rec."No. of Enchmt Stop W_orders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Enchmt Stop W_orders field.';
                }
                field("No. of Axle Load Inspections"; Rec."No. of Axle Load Inspections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Axle Load Inspections field.';
                }
                field("No. of Axle Load Exempt Prmts"; Rec."No. of Axle Load Exempt Prmts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Axle Load Exempt Prmts field.';
                }
                field("No. of Filed Road Misuse Inc."; Rec."No. of Filed Road Misuse Inc.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Filed Road Misuse Inc. field.';
                }
                field("Total No. of Fatalities"; Rec."Total No. of Fatalities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of Fatalities field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                group("&Functions")
                {
                    Caption = '&Functions';
                    action("Major Structures")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Segment;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Road Facility Type";
                        RunPageLink = "Facility Type" = filter(Structure);
                        ToolTip = 'Executes the Major Structures action.';
                    }
                    action("Road Furniture")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Components;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Road Facility Type";
                        RunPageLink = "Facility Type" = filter(Furniture);
                        ToolTip = 'Executes the Road Furniture action.';
                    }
                    action("Road Environs")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = SelectItemSubstitution;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Road Environ Entries";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageMode = View;
                        ToolTip = 'Executes the Road Environs action.';
                    }
                    action("Road Condition Data")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = ChangeTo;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Pavement Surface Entries";
                        RunPageLink = "Road Code" = field("Road Code");
                        ToolTip = 'Executes the Road Condition Data action.';
                    }
                    action("Road Inventory & Condition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'RRoad Inventory & Condition Surveys';
                        Ellipsis = true;
                        Image = InventorySetup;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        ToolTip = 'Executes the RRoad Inventory & Condition Surveys action.';
                        // //RunObject = Page "Road Condition Surveys(Existing)";
                        //RunPageLink = "Road Code" = field("Road Code");
                    }
                    action("Tender Invitations")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Interaction;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Standard Purchase Codes";
                        RunPageLink = "Road Code" = field("Road Code");
                        ToolTip = 'Executes the Tender Invitations action.';
                    }
                    action("Purchase Contracts")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = ContractPayment;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Purchase Order";
                        RunPageView = where("Document Type" = filter("Blanket Order"));
                        ToolTip = 'Executes the Purchase Contracts action.';
                    }
                    action(Workplans)
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = WorkCenterAbsence;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        ToolTip = 'Executes the Workplans action.';

                        trigger OnAction()
                        begin
                            Message('Coming up soon!!');
                        end;
                    }
                    action("Development/Construction Works")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = AssemblyBOM;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter(Construction));
                        ToolTip = 'Executes the Development/Construction Works action.';
                    }
                    action("Maintenance Works")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = MaintenanceRegistrations;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter("Asset Management"));
                        ToolTip = 'Executes the Maintenance Works action.';
                    }
                    action("Studies & Surveys")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Statistics;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter("Studies & Surveys"));
                        ToolTip = 'Executes the Studies & Surveys action.';
                    }
                    action("Design Works")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Design;
                        Promoted = true;
                        PromotedIsBig = true;

                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter("Design Works"));
                        ToolTip = 'Executes the Design Works action.';
                    }
                }
            }
        }
    }
}

#pragma implicitwith restore

