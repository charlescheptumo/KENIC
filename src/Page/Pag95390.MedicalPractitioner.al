page 95390 "Medical Practitioner"
{
    Caption = 'Medical Practitioner';
    PageType = Card;
    SourceTable = Resource;
    UsageCategory = Documents;
    SourceTableView = where("Resource Type" = Const(Physician));
    PopulateAllFields = true;
    DeleteAllowed = false;
    RefreshOnActivate = true;
    PromotedActionCategories = 'New,Process,Report,Approve,Request Approval,New Document,Navigate,Incoming Documents,Vendor';
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.';
                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Medical Specialty"; Rec."Medical Specialty")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medical Specialty field.';
                }
                field("Practitioner Category"; Rec."Practitioner Category")
                {
                    Caption = 'Category';
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Licensing Body"; Rec."Licensing Body")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Licensing Body field.';
                }
                field("License Number"; Rec."License Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the License Number field.';
                }
                field(Name; Rec.Name)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
                }
                group("Address & Contact")
                {
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the vendor''s address.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies additional address information.';
                    }

                    field(City; Rec.City)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the vendor''s city.';
                    }
                    field(County; Rec.County)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the state, province or county as a part of the address.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the country/region of the address.';
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the vendor''s telephone number.';
                    }
                    field(Email; Rec.Email)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Email field.';
                    }
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                // group("Posting Details")
                // {
                //     field("VAT Registration No."; Rec."VAT Registration No.")
                //     {
                //         ApplicationArea = All;
                //         ToolTip = 'Specifies the vendor''s VAT registration number.';
                //     }
                //     field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                //     {
                //         ApplicationArea = All;
                //         ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
                //     }
                //     field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                //     {
                //         ApplicationArea = All;
                //         ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                //     }
                //     field("Prices Including VAT"; Rec."Prices Including VAT")
                //     {
                //         ApplicationArea = All;
                //         ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                //     }
                //     field("Vendor Posting Group"; Rec."Vendor Posting Group")
                //     {
                //         ApplicationArea = All;
                //         ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
                //     }
                // }
            }
        }
        area(factboxes)
        {
            part(Control82; "Resource Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }
            part(Control83; "Resource Signature")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }

            part("Attachments"; "SharePoint File List")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            // action("Bank Accounts")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Bank Accounts';
            //     Image = BankAccount;
            //     Promoted = true;
            //     PromotedCategory = Category7;
            //     RunObject = Page "Vendor Bank Account List";
            //     Visible = false;
            //     RunPageLink = "Vendor No." = field("No.");
            //     ToolTip = 'View or set up the vendor''s bank accounts. You can set up any number of bank accounts for each vendor.';
            // }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Resource Type" := Rec."Resource Type"::Physician;
    end;
}
