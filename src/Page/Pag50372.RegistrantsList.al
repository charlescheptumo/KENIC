namespace KENIC.KENIC;

using Microsoft.Sales.Customer;

page 50372 "Registrants List"
{
    ApplicationArea = All;
    Caption = 'Registrars';
    PageType = List;
    SourceTable = Registrants;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = true;
    ModifyAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Roid; Rec.Roid) { ApplicationArea = All; }
                field(ClientId; Rec.ClientId) { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field(Email; Rec.Email) { ApplicationArea = All; }
                field(Phone; Rec.Phone) { ApplicationArea = All; }
                field(Country; Rec.Country) { ApplicationArea = All; }
                field(City; Rec.City) { ApplicationArea = All; }
                field(AdminContact; Rec.AdminContact) { ApplicationArea = All; }
                field(AdminEmail; Rec.AdminEmail) { ApplicationArea = All; }
                field(BillingContact; Rec.BillingContact) { ApplicationArea = All; }
                field(BillingEmail; Rec.BillingEmail) { ApplicationArea = All; }
                field(TechContact; Rec.TechContact) { ApplicationArea = All; }
                field(TechEmail; Rec.TechEmail) { ApplicationArea = All; }
                field(ServiceContact; Rec.ServiceContact) { ApplicationArea = All; }
                field(ServiceEmail; Rec.ServiceEmail) { ApplicationArea = All; }
                field(CreateDate; Rec.CreateDate) { ApplicationArea = All; }
                field(UpdateDate; Rec.UpdateDate) { ApplicationArea = All; }
                field(BillingDate; Rec.BillingDate) { ApplicationArea = All; }
                field(AllowEpp; Rec.AllowEpp) { ApplicationArea = All; }
                field(RestrictIps; Rec.RestrictIps) { ApplicationArea = All; }
                field(IsPicked; Rec.IsPicked) { ApplicationArea = All; }
                field(IanaNumber; Rec.IanaNumber) { ApplicationArea = All; }
                field(LastUpdatedAt; Rec.LastUpdatedAt) { ApplicationArea = All; }
                field(LastUpdatedBy; Rec.LastUpdatedBy) { ApplicationArea = All; }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetRegistrants)
            {
                ApplicationArea = All;
                Caption = 'Get Registrars';
                ToolTip = 'Retrieve registrars by zone name, client ID, or date range.';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GetRegistrantsDialog: Page "Get Registrants";
                begin
                    GetRegistrantsDialog.RunModal();
                    CurrPage.Update(false);
                end;
            }
            action(CreateCustomer)
            {
                ApplicationArea = All;
                Caption = 'Create as a Customer';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Customer: Record Customer;
                    CashMgtSetup: Record "Cash Management Setup";
                begin
                    if Rec.Roid = '' then
                        Error('Please select a domain client with a valid CLID before creating a customer.');

                    // Step 1: Prevent duplicate creation
                    if Customer.Get(Rec.Roid) then begin
                        Message('A customer already exists for CLID %1 (Customer No. %2). No new record was created.', Rec.Roid, Customer."No.");
                        exit;
                    end;

                    // Step 2: Get posting group defaults from Cash Management Setup
                    CashMgtSetup.Get();
                    CashMgtSetup.TestField("Domain Cust Posting Group");
                    CashMgtSetup.TestField("Domain Cust Bus Posting Group");
                    CashMgtSetup.TestField("Domain Cust VAT Bus Posting Group");

                    // Step 3: Create the Customer record
                    Customer.Init();
                    Customer."No." := Rec.Roid;
                    Customer.Name := Rec.Name;
                    Customer."E-Mail" := Rec.Email;
                    Customer."Phone No." := Rec.Phone;
                    Customer.Address := Rec.Address;
                    Customer."Country/Region Code" := Rec.Country;
                    Customer.City := Rec.City;
                    Customer.County := Rec.State;
                    Customer."Post Code" := Rec.PostalCode;
                    Customer."Fax No." := Rec.Fax;

                    // Step 4: Assign posting groups from setup
                    Customer."Customer Posting Group" := CashMgtSetup."Domain Cust Posting Group";
                    Customer."Gen. Bus. Posting Group" := CashMgtSetup."Domain Cust Bus Posting Group";
                    Customer."VAT Bus. Posting Group" := CashMgtSetup."Domain Cust VAT Bus Posting Group";

                    Customer.Insert(true);

                    Message('Customer %1 - %2 created successfully from Domain Client %3.', Customer."No.", Customer.Name, Rec.Roid);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
