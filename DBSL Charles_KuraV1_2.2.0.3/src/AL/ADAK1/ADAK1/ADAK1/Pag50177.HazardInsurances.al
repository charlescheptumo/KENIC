/// <summary>
/// Page Hazard Insurances (ID 50177).
/// </summary>
page 50177 "Hazard Insurances"
{
    ApplicationArea = All;
    Caption = 'Hazard Insurances';
    PageType = List;
    SourceTable = "Insurance Covers";
    SourceTableView = where("FA Cover Type" = filter(Other));
    UsageCategory = Lists;
    CardPageId = "Hazard Insurance";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Insurance No."; Rec."Insurance No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec."Insurance Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the insurance policy.';
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the insurance policy number as stated on the actual insurance policy.';
                }
                field("Annual Premium"; Rec."Annual Premium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount of the annual insurance premium.';
                }
                field("Policy Coverage"; Rec."Policy Coverage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount of coverage provided by this insurance policy.';
                }
                field("Total Value Insured"; Rec."Total Value Insured")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total value of fixed assets linked to this insurance policy. This is the value of fixed assets for which insurance is required.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date from which the insurance policy is valid.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date to which the insurance policy is valid.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of insurance (for example, theft or fire) that is covered by this insurance policy.';
                }
                field("Insurance Vendor No."; Rec."Insurance Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the vendor from whom you purchased this insurance policy.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.', Comment = '%';
                }
                field("Vendor Contact"; Rec."Vendor Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Contact field.', Comment = '%';
                }
                field("Vendor Phone"; Rec."Vendor Phone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Phone field.', Comment = '%';
                }
                field("Vendor Email Address"; Rec."Vendor Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Email Address field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field("Insurance Details"; Rec."Insurance Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Details field.', Comment = '%';
                }
            }
        }
    }
}
