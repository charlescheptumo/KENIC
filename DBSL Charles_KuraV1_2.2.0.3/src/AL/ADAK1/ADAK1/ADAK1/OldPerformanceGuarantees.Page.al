#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72678 "Old Performance Guarantees"
{
    ApplicationArea = Basic;
    CardPageID = "Performance Guarantee";
    PageType = List;
    Caption = 'Performance Guarantees';
    SourceTable = "Insurance/Guarantee Header";
    SourceTableView = where("Document Type" = filter("Performance Guarantee"));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Contractor ID"; Rec."Contractor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor ID field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Insurer/Guarantor Name"; Rec."Insurer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurer/Guarantor Name field.';
                }
                field("Policy/Guarantee No"; Rec."Policy/Guarantee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy/Guarantee No field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Expiry Notification Date"; Rec."Expiry Notification Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Notification Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Amount Insured/Guaranteed"; Rec."Amount Insured/Guaranteed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Insured/Guaranteed field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Form of Security"; Rec."Form of Security")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form of Security field.';
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Type field.';
                }
                field("Issuer Institution Type"; Rec."Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer Institution Type field.';
                }
                field("Issuer Registered Offices"; Rec."Issuer Registered Offices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer Registered Offices field.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
                field("Second Expiry Notification Dat"; Rec."Second Expiry Notification Dat")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Expiry Notification Dat field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Performance Guarantee";
    end;
}

