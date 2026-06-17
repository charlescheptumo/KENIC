#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75028 "Procurement Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Category";
    SourceTableView = where(Blocked = const(false));
    UsageCategory = Lists;

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
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Preferred Vendor Cluster"; Rec."Preferred Vendor Cluster")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preferred Vendor Cluster field.';
                }
                field("Applicable Location"; Rec."Applicable Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicable Location field.';
                }
                field("Specific Responsibility Center"; Rec."Specific Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specific Responsibility Center field.';
                }
                field("Responsibility Center Type"; Rec."Responsibility Center Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center Type field.';
                }
                field("Responsibility Center Code"; Rec."Responsibility Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center Code field.';
                }
                field("Category Type"; Rec."Category Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Type field.';
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
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }

        }
    }

    actions
    {
        area(navigation)
        {
            action(Products)
            {
                ApplicationArea = Basic;
                Image = Item;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Procurement Category Product";
                RunPageLink = "Category ID" = field(Code);
                ToolTip = 'Executes the Products action.';
            }
            action("Registered Vendors")
            {
                ApplicationArea = Basic;
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor List";
                ToolTip = 'Executes the Registered Vendors action.';
            }
            action("Specific Category Requirement")
            {
                ApplicationArea = Basic;
                Image = ServiceAccessories;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "RFI Category Requirement";
                RunPageLink = "Category ID" = field(Code);
                ToolTip = 'Executes the Specific Category Requirement action.';
            }
            action("Procurement Planning")
            {
                ApplicationArea = Basic;
                Image = AbsenceCategory;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Procurement Plan Lines";
                RunPageLink = "Planning Category" = field(Code);
                ToolTip = 'Executes the Procurement Planning action.';
            }
            action("Invitation For Prequalification")
            {
                ApplicationArea = Basic;
                Image = Info;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Request For Information";
                ToolTip = 'Executes the Invitation For Prequalification action.';
            }
            action("Invitation For Supply")
            {
                ApplicationArea = Basic;
                Image = InwardEntry;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Draft Invitation For Supply";
                ToolTip = 'Executes the Invitation For Supply action.';
            }
            action(print)
            {
                ApplicationArea = Basic;
                //Image = print;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the print action.';
                // RunObject = Report "Procurement categories";
            }
        }
    }
}

