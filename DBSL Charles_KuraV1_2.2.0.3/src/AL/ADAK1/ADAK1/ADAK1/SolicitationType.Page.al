#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75004 "Solicitation Type"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Solicitation Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Default Procurement Method"; Rec."Default Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Procurement Method field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Supplier Set"; Rec."Supplier Set")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Set field.';
                }
                field("Preliminary RFI"; Rec."Preliminary RFI")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preliminary RFI field.';
                }
                field("Default Bid Selection Method"; Rec."Default Bid Selection Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Bid Selection Method field.';
                }
                field("PP  Invitation Notice Type"; Rec."PP  Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP  Invitation Notice Type field.';
                }
                field("Bid Evaluation Template"; Rec."Bid Evaluation Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Bid Evaluation Template field.';
                }
                field("No. of Invitations"; Rec."No. of Invitations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Invitations field.';
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Responses field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
            }
            systempart(Control13; Notes)
            {
            }
            systempart(Control14; MyNotes)
            {
            }
            systempart(Control15; Links)
            {
            }
         
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup28)
            {
                Image = SalesPerson;
                action("Solicitation Schedule")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Solicitation Activity Schedule";
                    RunPageLink = "Solicitation Type ID" = field(Code);
                    ToolTip = 'Executes the Solicitation Schedule action.';
                }
                action(RFIs)
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Request For Information";
                    RunPageLink = "Solicitation Type" = field(Code);
                    ToolTip = 'Executes the RFIs action.';
                }
                action("Invitation For Supply")
                {
                    ApplicationArea = Basic;
                    Image = InwardEntry;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Solicitation Type" = field(Code);
                    ToolTip = 'Executes the Invitation For Supply action.';
                }
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Quotes action.';
                    // RunObject = Page "Purchase Quotes";
                    // RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Purchase Orders action.';
                    // RunObject = Page "Purchase Order List";
                    // RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Purchase Agreements")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Purchase Agreements action.';
                    // RunObject = Page "Blanket Purchase Orders";
                    // RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Procurement Types")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Solicitation Procurement Types";
                    RunPageLink = "Solicitation Type" = field(Code);
                    ToolTip = 'Executes the Procurement Types action.';
                }
                action("Procurement Activities")
                {
                    ApplicationArea = Basic;
                    Image = CapacityLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Solicitation Activity Schedule";
                    RunPageLink = "Solicitation Type ID" = field(Code);
                    ToolTip = 'Executes the Procurement Activities action.';
                }
                action("Procurement plan entries")
                {
                    ApplicationArea = Basic;
                    Image = EntriesList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Procurement Plan Entry";
                    RunPageLink = "Solicitation Type" = field(Code);
                    ToolTip = 'Executes the Procurement plan entries action.';
                }
                action("Submitted Bids")
                {
                    ApplicationArea = Basic;
                    Image = Bin;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Submitted Bids action.';
                    // RunObject = Page Bidders;
                }
            }
        }
    }
}

