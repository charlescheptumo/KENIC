#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50009 "pageextension50009" extends "Vendor Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor Card"(Page 26)".

    layout
    {
        moveafter("NAME"; "VAT Registration No.")
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN';
            ShowMandatory = true;
            trigger OnBeforeValidate()
            var
                vendor1: Record Vendor;
            begin

                // IF vendor1.GET(REC."VAT Registration No.") then
                //     Error('Vat Registration Number Already Exists!');

            end;
        }

        modify(Priority)
        {
            Editable = false;
        }
        addafter(Blocked)
        {
            field("Send Payslip By E-mail?"; Rec."Send Payslip By E-mail?")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Send Payslip By E-mail? field.';
            }
        }
        addafter("Balance Due (LCY)")
        {
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Category field.';
            }
        }
        addafter("Responsibility Center")
        {
            field("Supplier Category"; Rec."Supplier Category")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Supplier Category field.';
            }
            field("Vendor Type"; Rec."Vendor Type")
            {
                ApplicationArea = basic;
                ToolTip = 'Specifies the value of the Vendor Type field.';
            }
            field("Special Category"; Rec."Special Category")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Special Category field.';
            }
            field(Registered; Rec.Registered)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Registered field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                Editable = true;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field(Trainer; Rec.Trainer)
            {
                applicationarea = basic;
                ToolTip = 'Specifies the value of the Trainer field.';
            }
        }
        addafter("Country/Region Code")
        {
            field("Residential Status"; Rec."Residential Status")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Residential Status field.';
            }
        }
        addafter("Address & Contact")
        {
            group("Vendor Details")
            {
                Caption = 'Vendor Details';
            }
            group("Business Details")
            {
                Caption = 'Business Details';
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership Type field.';
                }
                field("Certificate of Registration"; Rec."Certificate of Registration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate of Registration field.';
                    Caption = 'CR12 No.';
                }
                field("AGPO Certificate"; Rec."AGPO Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AGPO Certificate field.';
                    
                }
                field("Registration/Incorporation No."; Rec."Registration/Incorporation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration/Incorporation No. field.';
                }
                field("Reg/Incorporation Date"; Rec."Reg/Incorporation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reg/Incorporation Date field.';
                }
                field("Operations Start Date"; Rec."Operations Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Operations Start Date field.';
                }
                field("Tax PIN No."; Rec."Tax PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax PIN No. field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF No. field.';
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF No. field.';
                }
                field("Current Vendor Class"; Rec."Current Vendor Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Vendor Class field.';
                }
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Group field.';
                }
                field("Supplier Type"; Rec."Supplier Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Type field.';
                }
                field("Nominal Capital LCY"; Rec."Nominal Capital LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominal Capital LCY field.';
                }
                field("Issued Capital LCY"; Rec."Issued Capital LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Capital LCY field.';
                }
                field("Dealer Type"; Rec."Dealer Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dealer Type field.';
                }
                field("Max Value of Business"; Rec."Max Value of Business")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Value of Business field.';
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Business field.';
                }
                field("Fixed Line Tel No"; Rec."Fixed Line Tel No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Line Tel No field.';
                }
                field("Building/House No"; Rec."Building/House No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Building/House No field.';
                }
                field(Floor; Rec.Floor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Floor field.';
                }
                field("Plot No"; Rec."Plot No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plot No field.';
                }
                field(Street; Rec.Street)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Street field.';
                }
                field("Authorized Signatory Name"; Rec."Authorized Signatory Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authorized Signatory Name field.';
                }
                field("Signatory Designation"; Rec."Signatory Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Signatory Designation field.';
                }
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vision Statement field.';
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mission Statement field.';
                }
                field("Advance Customer No"; Rec."Advance Customer No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Customer No field.';
                }
            }
        }

    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on "PayVendor(Action 98)".

        addafter(Documents)
        {
            action("Create Advance Payment Customer")
            {
                ApplicationArea = Basic;
                Image = CreateMovement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Create Advance Payment Customer action.';

                trigger OnAction()
                begin
                    if Rec."Advance Customer No" = '' then begin
                        ObjCust.Init;
                        ObjCust."No." := '';
                        ObjCust."Funding Class" := ObjCust."funding class"::Trade;
                        ObjCust.Name := Rec.Name;
                        ObjCust.Validate(Name);
                        ObjCust."Customer Posting Group" := 'CONTRACTOR';
                        ObjCust.Validate("Customer Posting Group");
                        ObjCust.Insert(true);
                        Rec."Advance Customer No" := ObjCust."No.";
                        Rec.Modify;
                        Message('Customer No %1 created successfully', ObjCust."No.");
                    end
                    else
                        Error('Advance customer account already exists');
                end;
            }
            action("Create Portal User")
            {
                ApplicationArea = Basic;
                Image = CreateInteraction;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Create Portal User action.';
                trigger onaction()
                begin
                    portalusers.RESET;
                    portalusers.SETRANGE("customer No", Rec."No.");
                    IF portalusers.FINDSET THEN BEGIN
                        ERROR('that user is already created as a portal user!');
                    END ELSE BEGIN
                        MESSAGE(Rec.Email);
                        MESSAGE(Rec."E-Mail");
                        portalusers.INIT;
                        portalusers."customer No" := Rec."No.";
                        portalusers.Password := FORMAT(hrportal.fnRandomPass);
                        portalusers.usertype := 1; //1 for directors
                        portalusers.Email := Rec."E-Mail";
                        IF portalusers.INSERT(TRUE) THEN BEGIN
                            hrportal.fnSendRegistrationEmail(portalusers.Email);
                            MESSAGE('Portal user created successfully');
                        END ELSE BEGIN
                            ERROR('User could not be created contact ICT.');
                        END;
                    END;
                end;
            }
        }
        addafter("Vendor - Balance to Date")
        {
            action("Vendor Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Statement';
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Vendor Statement action.';

                trigger OnAction()
                begin
                    Vendor.SetRange("No.", Rec."No.");
                    Report.Run(57022, true, false, Vendor);
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    var
        Vendor: Record Vendor;
        ObjCust: Record Customer;
        UserSetup: Record "User Setup";
        portalusers: Record portalusers;

        hrportal: Codeunit HRPortal;

}

#pragma implicitwith restore

