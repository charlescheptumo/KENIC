#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75260 "Purchase Contract Template"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Purchase Contract Template";
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
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Procurement Doc Template ID"; Rec."Procurement Doc Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Doc Template ID field.';
                }
                field("Default Language Code"; Rec."Default Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Language Code field.';
                }
                field("Governing Laws"; Rec."Governing Laws")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Governing Laws field.';
                }
                field("Max Contract Variation %"; Rec."Max Contract Variation %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Contract Variation % field.';
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Defects Liability Period field.';
                }
                field("Daily Liquidated Unit Cost"; Rec."Daily Liquidated Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Liquidated Damages Unit Cost (LCY) field.';
                }
                field("Liquidated Damages Limit %"; Rec."Liquidated Damages Limit %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Liquidated Damages Limit % (Contract Value) field.';
                }
                field("Payment Retention %"; Rec."Payment Retention %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Retention % field.';
                }
                field("Retention Amount Limit %"; Rec."Retention Amount Limit %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Amount Limit % (Contract Value) field.';
                }
                field("Minimum Interim Certificate"; Rec."Minimum Interim Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Interim Certificate Amount (LCY) field.';
                }
                field("Written Consent for 3rd Party"; Rec."Written Consent for 3rd Party")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Written Consent for 3rd Party Assignment field.';
                }
                field("Limitation of Liability Clause"; Rec."Limitation of Liability Clause")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Limitation of Liability Clause field.';
                }
                field("Idemnification Clause"; Rec."Idemnification Clause")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idemnification Clause field.';
                }
                field("Full Transfer of Ownership"; Rec."Full Transfer of Ownership")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Transfer of Ownership  on Completion field.';
                }
                field("Written Consent for Subcontr"; Rec."Written Consent for Subcontr")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Written Consent for Subcontracting field.';
                }
                field("Max Subcontractor Value %"; Rec."Max Subcontractor Value %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Subcontractor Value % field.';
                }
                field("Amicable Dispute Settlement"; Rec."Amicable Dispute Settlement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amicable Dispute Settlement Allowed field.';
                }
                field("Appointer of Arbitrator"; Rec."Appointer of Arbitrator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointer of Arbitrator field.';
                }
                field("Min Termination Notice Period"; Rec."Min Termination Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Termination Notice Period field.';
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
    }
}

