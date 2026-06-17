page 56133 "ICT Inventory"
{
    PageType = Card;
    SourceTable = 56060;
    PromotedActionCategories = 'New,Process,Report,Approvals,Inventory Entries';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    //Editable = false;
                }
                field("Sub-Type"; Rec."Sub-Type")
                {
                    ToolTip = 'Specifies the value of the Sub-Type field.';
                }
                field("Sub Type No."; Rec."Sub Type No.")
                {
                    Caption = 'Asset number';
                    ToolTip = 'Specifies the value of the Asset number field.';
                }
                field("Sub Type Description"; Rec."Sub Type Description")
                {
                    ToolTip = 'Specifies the value of the Sub Type Description field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Current Assigned Dept"; Rec."Current assigned Dept")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the current assigned department.';
                    visible = false;
                }
                field("ICT Asset Category"; Rec."ICT Asset Category")
                {
                    ToolTip = 'Specifies the value of the ICT Asset Category field.';
                }
                field("ICT Asset subcategory"; Rec."ICT Asset subcategory")
                {
                    ToolTip = 'Specifies the value of the ICT Asset subcategory field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ToolTip = 'Specifies the value of the Warranty Date field.';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Maintenance Vendor No. field.';
                }
                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ToolTip = 'Specifies the value of the Last Maintenance Date field.';
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ToolTip = 'Specifies the value of the Under Maintenance field.';
                }
                field("Next service date"; Rec."Next service date")
                {
                    ToolTip = 'Specifies the value of the Next service date field.';
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ToolTip = 'Specifies the value of the FA Class Code field.';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ToolTip = 'Specifies the value of the FA Subclass Code field.';
                }
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.';
                }
                field(Insured; Rec.Insured)
                {
                    ToolTip = 'Specifies the value of the Insured field.';
                }
                field("Current Assigned Employee"; Rec."Current Assigned Employee")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Current Assigned Employee field.';
                }
                field("Current Assigned Division/Unit"; Rec."Current Assigned Division/Unit")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Current Assigned Division/Unit field.';
                    Caption = 'Current Assigned Department';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Condition; Rec.Condition)
                {
                    ToolTip = 'Specifies the value of the Condition field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. of Issues Raised"; Rec."No. of Issues Raised")
                {
                    ToolTip = 'Specifies the value of the No. of Issues Raised field.';
                }
                field("No. of Movements"; Rec."No. of Movements")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Issuances"; Rec."No. of Issuances")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Employees Assigned"; Rec."No. of Employees Assigned")
                {
                    ApplicationArea = Basic;
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ToolTip = 'Specifies the value of the Acquisition Cost field.';
                }
                field("Purchase date"; Rec."Purchase date")
                {
                    ToolTip = 'Specifies the value of the Purchase date field.';
                }
                field("Disposed date"; Rec."Disposed date")
                {
                    ToolTip = 'Specifies the value of the Disposed date field.';
                }
                field("Tag No"; Rec."Tag No")
                {
                    ToolTip = 'Specifies the value of the Tag No field.';
                }
                field(Supplier; Rec.Supplier)
                {
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field("IP address"; Rec."IP address")
                {
                    ToolTip = 'Specifies the value of the IP address field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
            group("Software details")
            {
                Caption = 'Software details';
                field("Has Expiry Date"; Rec."Has Expiry Date")
                {
                    ToolTip = 'Specifies the value of the Track Expiry Date field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Software Product key"; Rec."Software Product key")
                {
                    ToolTip = 'Specifies the value of the Software Product key field.';
                }
                field("Total number of license"; Rec."Total number of license")
                {
                    ToolTip = 'Specifies the value of the Total number of license field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Link; Rec.Link)
                {
                    ExtendedDatatype = URL;
                    ToolTip = 'Specifies the value of the Link field.';
                }
                field("Manufactured date"; Rec."Manufactured date")
                {
                    ToolTip = 'Specifies the value of the Manufactured date field.';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ToolTip = 'Specifies the value of the Manufacturer field.';
                }
            }
        }
        area(factboxes)
        {

        }
    }

    actions
    {
        area(navigation)
        {
            action("Issuance Entries")
            {
                Image = ShipmentLines;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "ICT Issuance Entries";
                RunPageLink = Code = FIELD(Code),
                              Type = CONST(Issuance);
                ToolTip = 'Executes the Issuance Entries action.';
            }
            action("Movement Entries")
            {
                Image = ViewDocumentLine;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "ICT Issuance Entries";
                RunPageLink = Code = FIELD(Code),
                              Type = CONST(Movement);
                ToolTip = 'Executes the Movement Entries action.';
            }
            action("Maintenance &Registration")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Maintenance &Registration';
                Image = MaintenanceRegistrations;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 5625;
                RunPageLink = "FA No." = FIELD("Sub Type No.");
                ToolTip = 'View or edit maintenance codes for the various types of maintenance, repairs, and services performed on your fixed assets. You can then enter the code in the Maintenance Code field on journals.';
                Visible = false;
            }
            action("Main&tenance Ledger Entries")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Main&tenance Ledger Entries';
                Image = MaintenanceLedgerEntries;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page 56179;
                RunPageLink = "ICT Inventory No." = FIELD("Code");
                ToolTip = 'View all the maintenance ledger entries for a fixed asset.';
                Visible = false;
            }
            action("Board of Survey Entries")
            {
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page 56172;
                RunPageLink = "ICT Inventory No" = FIELD(Code);
                Visible = false;
                ToolTip = 'Executes the Board of Survey Entries action.';
            }
        }
    }
}

