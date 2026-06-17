#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75003 "Procurement Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Types";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Salesperson")
            {
                Caption = '&Salesperson';
                Image = SalesPerson;
                action(RFIs)
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Request For Information";
                    RunPageLink = "Procurement Type" = field(Code);
                    ToolTip = 'Executes the RFIs action.';
                }
                action("Invitation For Supply")
                {
                    ApplicationArea = Basic;
                    Image = InwardEntry;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Procurement Type" = field(Code);
                    ToolTip = 'Executes the Invitation For Supply action.';
                }
                action(Bids)
                {
                    ApplicationArea = Basic;
                    Image = BinLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Bids action.';
                    //RunObject = Page Bidders;
                }
                action("Prequalification Categories")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOpportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Procurement Categories";
                    RunPageLink = "Procurement Type" = field(Code);
                    ToolTip = 'Executes the Prequalification Categories action.';
                }
                action("Procurement Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = OutboundEntry;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Procurement Plan Lines";
                    RunPageLink = "Procurement Type" = field(Code);
                    ToolTip = 'Executes the Procurement Plan Entries action.';
                }
                action("Solicitation Types")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Solicitation Procurement Types";
                    RunPageLink = "Procument Type" = field(Code);
                    ToolTip = 'Executes the Solicitation Types action.';
                }
                action("Assigned Quotes")
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Assigned Quotes action.';
                    //  RunObject = Page "Purchase Quotes";
                    //   RunPageLink = "Procurement Type"=field(Code);
                }
                action("Assigned Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Assigned Purchase Orders action.';
                    //   RunObject = Page "Purchase Order List";
                    // RunPageLink = "Procurement Type"=field(Code);
                }
                action("Assigned Purchase Agreements")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Assigned Purchase Agreements action.';
                    // RunObject = Page "Blanket Purchase Orders";
                    //  RunPageLink = "Procurement Type"=field(Code);
                }
            }
        }
    }
}

