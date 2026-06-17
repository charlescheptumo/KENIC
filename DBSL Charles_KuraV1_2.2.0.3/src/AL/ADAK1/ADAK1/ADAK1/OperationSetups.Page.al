#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59003 "Operation Setups"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Management Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Req No"; Rec."Transport Req No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Transport Req No field.';
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
                field("Fuel Register"; Rec."Fuel Register")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Fuel Register field.';
                }
                field("Maintenance Request"; Rec."Maintenance Request")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Maintenance Request field.';
                }
                field("Contract  No"; Rec."Contract  No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contract  No field.';
                }
                field("Fuel Card No"; Rec."Fuel Card No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Fuel Card No field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Sender Email"; Rec."Sender Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Email field.';
                }
                field("Vehicle Inspection  No"; Rec."Vehicle Inspection  No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Inspection  No field.';
                }
                field("Default Fleet Driver"; Rec."Default Fleet Driver")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Fleet Driver field.';
                }
                field("Transport Admin Email"; Rec."Transport Admin Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Admin Email field.';
                }
                field("Expiry Notification Period"; Rec."Expiry Notification Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Notification Period field.';
                }
                field("Out of Office Requistion No"; Rec."Out of Office Requistion No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out of Office Requistion No field.';
                }
                field("Fuel Top up  No"; Rec."Fuel Top up  No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Top up  No field.';
                }
            }
        }
    }

    actions
    {
    }
}

