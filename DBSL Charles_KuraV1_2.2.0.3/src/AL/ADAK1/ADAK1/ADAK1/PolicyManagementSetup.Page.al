#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80175 "Policy Management Setup"
{
    PageType = Card;
    SourceTable = "Policy Management Setup";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Internal Policy Development"; Rec."Internal Policy Development")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Policy Development field.';
                }
                field("Internal Policy No. Series"; Rec."Internal Policy No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Policy No. Series field.';
                }
                field("External Policy No. Series"; Rec."External Policy No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Policy No. Series field.';
                }
                field("Policy Revision No. Series"; Rec."Policy Revision No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Revision No. Series field.';
                }
                field("Policy Attestation No. Series"; Rec."Policy Attestation No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Attestation No. Series field.';
                }
                field("Policy Compliance Audit Nos"; Rec."Policy Compliance Audit Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Compliance Audit Nos field.';
                }
                field("Enable Email Alerts"; Rec."Enable Email Alerts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enable Email Alerts field.';
                }
                field("Notification Email"; Rec."Notification Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Email field.';
                }
            }
        }
    }

    actions
    {
    }
}

