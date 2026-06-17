#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75346 "IFP Evaluation Voucher"
{
    PageType = ListPart;
    SourceTable = "IFP Response Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Response No';
                    ToolTip = 'Specifies the value of the Response No field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Evaluation Decision"; Rec."Evaluation Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Decision field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Evaluation Score %"; Rec."Evaluation Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Score % field.';
                }
                field("Special Group Reservation"; Rec."Special Group Reservation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Reservation field.';
                }
                field("Unique Category Requirements"; Rec."Unique Category Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unique Category Requirements field.';
                }
                field("Global RC Prequalification"; Rec."Global RC Prequalification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global RC Prequalification field.';
                }
                field("Restricted Responsbility Cente"; Rec."Restricted Responsbility Cente")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted Responsbility Center field.';
                }
                field("Restricted RC ID"; Rec."Restricted RC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted RC ID field.';
                }
                field("Prequalification Start Date"; Rec."Prequalification Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Start Date field.';
                }
                field("Prequalification End Date"; Rec."Prequalification End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification End Date field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("RFI Category Requirement ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specific Requirement';
                    Image = Category;
                    
                    RunObject = Page "RFI Category Requirement";
                    RunPageLink = "Requirement Code" = field("Procurement Category");
                    ToolTip = 'Executes the Specific Requirement action.';
                }
                action("Prequalified Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalified Responsibility Centers';
                    Image = Comment;
                    
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Document Type" = field("Document Type"),
                                  "Procurement Category" = field("Procurement Category"),
                                  "Vendor No" = field("Vendor No.");
                    ToolTip = 'Executes the Prequalified Responsibility Centers action.';
                }
            }
            group("Vendor Profile")
            {
                Caption = 'Vendor Profile';
                Image = FiledPosted;
                action("Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document No" = field("Document No."),
                                  "Vendor No" = field("Vendor No.");
                    ToolTip = 'Executes the Filed Documents action.';
                }
                action("Locations Applied")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Procurement Category" = field("Procurement Category"),
                                  "Vendor No" = field("Vendor No.");
                    ToolTip = 'Executes the Locations Applied action.';
                }
                action("Vendor Special Group Entry")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    RunObject = Page "Vendor Special Group Entry";
                    RunPageLink = "Vendor No" = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Special Group Entry action.';
                }
                action("Vendor Bank Account List")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    ToolTip = 'Executes the Vendor Bank Account List action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    //  RunObject = Page "Vendor Bank Account List";
                    //  RunPageLink = "Vendor No = "=field("Vendor No.");
                }
                action("Vendor Business Owner")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Business Owner";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Business Owner action.';
                }
                action("Vendor Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Litigation History";
                    ToolTip = 'Executes the Vendor Litigation History action.';
                    // RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Professional Staff";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Past Experience action.';
                }
                action("Vendor Professional Staff")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Past Experience";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Professional Staff action.';
                }
                action("Vendor Audited Income Statemen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Audited Income Statement';
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Income Statemen";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Audited Income Statement action.';
                }
                action("Vendor Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Balance Sheet";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Audited Balance Sheet action.';
                }
            }
        }
    }
}

