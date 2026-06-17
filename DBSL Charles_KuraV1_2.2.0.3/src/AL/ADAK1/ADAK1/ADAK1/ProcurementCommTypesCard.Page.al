#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75233 "Procurement Comm Types Card"
{
    PageType = Card;
    SourceTable = "Procurement Committee Types";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field("Mandate Type"; Rec."Mandate Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandate Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Title of Appointing Officer"; Rec."Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title of Appointing Officer field.';
                }
                field("Non-Staff Allowed"; Rec."Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Staff Allowed field.';
                }
                field("Min. No. of Members"; Rec."Min. No. of Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min. No. of Members field.';
                }
                field("No. of Appointments Made"; Rec."No. of Appointments Made")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Appointments Made field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control16; "Procurement Comm Composition")
            {
                SubPageLink = "Committee Type" = field("Committee Type");
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
            group(ActionGroup18)
            {
                action("Committee Mandate/Functions")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Committee Function";
                    RunPageLink = "Committee Type" = field("Committee Type");
                    ToolTip = 'Executes the Committee Mandate/Functions action.';
                }
                action("Committee Appointments")
                {
                    ApplicationArea = Basic;
                    Image = ConfidentialOverview;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Tender Committee";
                    RunPageLink = "Committee Type" = field("Committee Type");
                    ToolTip = 'Executes the Committee Appointments action.';
                }
                action(Members)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Tender Committee Member";
                    RunPageLink = "Committee Type" = field("Committee Type");
                    ToolTip = 'Executes the Members action.';
                }
            }
        }
    }
}

