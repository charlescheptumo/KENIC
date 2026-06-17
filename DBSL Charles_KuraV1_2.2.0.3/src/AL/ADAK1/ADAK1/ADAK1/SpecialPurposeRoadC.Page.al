#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72525 "Special Purpose Road C"
{
    Caption = 'Special Purpose Road Card';
    PageType = Card;
    SourceTable = "Road Inventory";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Name field.';
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
                field("Gazetted Road Length (KMs)"; Rec."Gazetted Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gazetted Road Length (KMs) field.';
                }
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Road Sections field.';
                }
                field("Total Section Length (KMs)"; Rec."Total Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Section Length (KMs) field.';
                }
                field("Original Road Agency"; Rec."Original Road Agency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Road Agency field.';
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
                field("Unpaved Road Length %"; Rec."Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaved Road Length % field.';
                }
                field("General Road Surface Condition"; Rec."General Road Surface Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Road Surface Condition field.';
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
                field("Road Valuation"; Rec."Road Valuation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Valuation field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            group("Linear Referencing Information")
            {
                Caption = 'Linear Referencing Information';
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
                field("Web GIS URL"; Rec."Web GIS URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Web GIS URL field.';
                }
            }
            group("Planning Profile (Studies, Surveys & Designs)")
            {
                Caption = 'Planning Profile (Studies, Surveys & Designs)';
                field("No. of Feasibility Studies"; Rec."No. of Feasibility Studies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Feasibility Studies field.';
                }
                field("No. of Environmental Studies"; Rec."No. of Environmental Studies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Environmental Studies field.';
                }
                field("No. of Topographic Surveys"; Rec."No. of Topographic Surveys")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Topographic Surveys field.';
                }
                field("No. of Traffic Census reports"; Rec."No. of Traffic Census reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Traffic Census reports field.';
                }
                field("No. of Road Safety Audits"; Rec."No. of Road Safety Audits")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Road Safety Audits field.';
                }
            }
            group("Procurement of Works")
            {
                Caption = 'Procurement of Works';
                field("No. of Works Purchase Req"; Rec."No. of Works Purchase Req")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Works Purchase Requisitions field.';
                }
                field("No. of Tender Invitations"; Rec."No. of Tender Invitations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Tender Invitations field.';
                }
                field("No. of Awarded Contracts"; Rec."No. of Awarded Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Awarded Contracts field.';
                }
                field("Total Contract Value"; Rec."Total Contract Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Contract Value field.';
                }
            }
            group("Construction Works Profile")
            {
                Caption = 'Construction Works Profile';
                field("Planned Construction Proj"; Rec."Planned Construction Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Construction Projects field.';
                }
                field("Ongoing Construction Proj"; Rec."Ongoing Construction Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ongoing Construction Projects field.';
                }
                field("Completed Construction Proj"; Rec."Completed Construction Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completed Construction Projects field.';
                }
                field("Construction Budget"; Rec."Construction Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Construction Budget (Total Cost) field.';
                }
                field("Construction Actual"; Rec."Construction Actual")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Construction Actual (Total Cost) field.';
                }
            }
            group("Asset Management Profile")
            {
                Caption = 'Asset Management Profile';
                field("Planned Maintenance Proj"; Rec."Planned Maintenance Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Maintenance Projects field.';
                }
                field("Ongoing Maintenance Proj"; Rec."Ongoing Maintenance Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ongoing Maintenance Projects field.';
                }
                field("Completed Maintenance Proj"; Rec."Completed Maintenance Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completed Maintenance Projects field.';
                }
                field("Maintenance Budget"; Rec."Maintenance Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Budget (Total Cost) field.';
                }
                field("Maintenance Actual"; Rec."Maintenance Actual")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Actual (Total Cost) field.';
                }
                field("No. of Res. Land Acq. W_orders"; Rec."No. of Res. Land Acq. W_orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.Of Reserve Land Acquisition WorOrders';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No.Of Reserve Land Acquisition WorOrders field.';
                }
                field("No. of Roadside Devpt Apps"; Rec."No. of Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of RoadSide Development Applications';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of RoadSide Development Applications field.';
                }
                field("No. of Enchmt Stop W_orders"; Rec."No. of Enchmt Stop W_orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Encroachment Stop Workorders';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of Encroachment Stop Workorders field.';
                }
                field("No. of Axle Load Inspections"; Rec."No. of Axle Load Inspections")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Axle Load Inspections field.';
                }
                field("No. of Axle Load Exempt Prmts"; Rec."No. of Axle Load Exempt Prmts")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Axle Load Exemptions';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of Axle Load Exemptions field.';
                }
                field("No. of Filed Road Misuse Inc."; Rec."No. of Filed Road Misuse Inc.")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Road Misuse Incidents';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of Road Misuse Incidents field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup75)
            {
                action("Road Sections")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Links;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Road Link Sections";
                    RunPageLink = "Road Code" = field("Road Code");
                    ToolTip = 'Executes the Road Sections action.';
                }
                action("Major Structures")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Segment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = false;
                    RunObject = Page "Road Environ Entries";
                    RunPageLink = "Road Code" = field("Road Code");
                    RunPageMode = View;
                    ToolTip = 'Executes the Road Environs action.';
                }
                action("Pavement Condition Entries")
                {
                    ApplicationArea = Basic;
                    Image = EntryStatistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Pavement Surface Entries";
                    RunPageLink = "Road Code" = field("Road Code");
                    ToolTip = 'Executes the Pavement Condition Entries action.';
                }
                action("Road Inventory & Condition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Road Inventory & Condition Surveys';
                    Ellipsis = true;
                    Image = InventorySetup;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Road Inventory & Condition Surveys action.';
                    // RunObject = Page "Road Condition Surveys(Existin";
                    // RunPageLink = "Road Code"=field("Road Code");
                }
                action("Tender Invitations")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Interaction;
                    Promoted = true;
                    PromotedCategory = Category5;
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
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Purchase Order";
                    RunPageLink = "Road Code" = field("Road Code");
                    RunPageView = where("Document Type" = filter("Blanket Order"));
                    ToolTip = 'Executes the Purchase Contracts action.';
                }
                action(Workplans)
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = WorkCenterAbsence;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Consolidated Work Programs";
                    ToolTip = 'Executes the Workplans action.';

                    trigger OnAction()
                    begin
                        Message('Coming up soon!!');
                    end;
                }
            }
        }
        area(processing)
        {
            action("Development/Construction Works")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = AssemblyBOM;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Construction));
                ToolTip = 'Executes the Development/Construction Works action.';
            }
            action("Maintenance Works")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = MaintenanceRegistrations;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Maintenance));
                ToolTip = 'Executes the Maintenance Works action.';
            }
            action("Studies & Surveys")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Studies_Surveys_Designs));
                ToolTip = 'Executes the Studies & Surveys action.';
            }
            action("Design Works")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Design;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Studies_Surveys_Designs));
                ToolTip = 'Executes the Design Works action.';
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Documentations action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadDocument(DMSDocuments."document type"::"Road Link", Rec."Road Code", 'Road Link', Rec.RecordId);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Visible = false;

                // trigger OnAction()
                // var
                //     DocumentAttachmentDetails: Page "Document Attachment Details";
                //     RecRef: RecordRef;
                // begin
                //     RecRef.GetTable(Rec);
                //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //     DocumentAttachmentDetails.RunModal;
                // end;
            }
        }
    }

    var
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}

