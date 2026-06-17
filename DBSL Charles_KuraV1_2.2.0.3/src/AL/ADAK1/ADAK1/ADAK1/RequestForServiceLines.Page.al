#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72750 "Request For Service Lines"
{
    PageType = ListPart;
    SourceTable = "Equipment Repair Line";
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the code field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type field.';
                }
                field("Equipment No."; Rec."Equipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Equipment Serial No."; Rec."Equipment Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Serial No. field.';
                }
                field("Maintenance Start Date"; Rec."Maintenance Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Start Date field.';
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Scheduled Date of Delivery to Site';
                    ToolTip = 'Specifies the value of the Scheduled Date of Delivery to Site field.';
                }
                field("Additional Remarks"; Rec."Additional Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Remarks field.';
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

