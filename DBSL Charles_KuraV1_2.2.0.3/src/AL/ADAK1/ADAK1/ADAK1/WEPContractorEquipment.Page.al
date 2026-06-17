#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72269 "WEP Contractor Equipment"
{
    PageType = ListPart;
    SourceTable = "WEP Contractor Equipment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the code field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Equipment No."; Rec."Equipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment No. field.';
                }
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership Type field.';
                }
                field("Equipment Serial No."; Rec."Equipment Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Serial No. field.';
                }
                field("Equipment Usability Code"; Rec."Equipment Usability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Usability Code field.';
                }
                field("Years of Previous Use"; Rec."Years of Previous Use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Years of Previous Use field.';
                }
                field("Equipment Condition Code"; Rec."Equipment Condition Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Condition Code field.';
                }
                field("Equipment Availability"; Rec."Equipment Availability")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Availability field.';
                }
                field("Project Phase"; Rec."Project Phase")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Phase field.';
                }
                field("Scheduled Date of Delivery"; Rec."Scheduled Date of Delivery")
                {
                    ApplicationArea = Basic;
                    Caption = 'Scheduled Date of Delivery to Site';
                    ToolTip = 'Specifies the value of the Scheduled Date of Delivery to Site field.';
                }
                field("No of Planned Maintenance"; Rec."No of Planned Maintenance")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "WEP Equipment Repair Plan";
                    ToolTip = 'Specifies the value of the No of Planned Maintenance field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        VendorProfessionalStaff: Record "Vendor Professional Staff";
        PurchaseHeader: Record "Purchase Header";
        WEPContractorTeam: Record "WEP Contractor Team";
        BidKeyStaff: Record "Bid Key Staff";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
        BidEquipmentSpecification: Record "Bid Equipment Specification";
}

