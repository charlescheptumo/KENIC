namespace KENIC.KENIC;

using Microsoft.Sales.Customer;

page 50354 "Domain Client List"
{
    ApplicationArea = All;
    Caption = 'Domain Clients';
    PageType = List;
    SourceTable = "Domain Client";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = true;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Clid; Rec.Clid)
                {
                    ApplicationArea = All;
                }
                field(Roid; Rec.Roid)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                }
                field(PostalCode; Rec.PostalCode)
                {
                    ApplicationArea = All;
                }
                field(Fax; Rec.Fax)
                {
                    ApplicationArea = All;
                }
                field(AdminContact; Rec.AdminContact)
                {
                    ApplicationArea = All;
                }
                field(AdminEmail; Rec.AdminEmail)
                {
                    ApplicationArea = All;
                }
                field(BillingContact; Rec.BillingContact)
                {
                    ApplicationArea = All;
                }
                field(BillingEmail; Rec.BillingEmail)
                {
                    ApplicationArea = All;
                }
                field(TechContact; Rec.TechContact)
                {
                    ApplicationArea = All;
                }
                field(TechEmail; Rec.TechEmail)
                {
                    ApplicationArea = All;
                }
                field(ServiceContact; Rec.ServiceContact)
                {
                    ApplicationArea = All;
                }
                field(ServiceEmail; Rec.ServiceEmail)
                {
                    ApplicationArea = All;
                }
                field(DomainsContact; Rec.DomainsContact)
                {
                    ApplicationArea = All;
                }
                field(DomainsEmail; Rec.DomainsEmail)
                {
                    ApplicationArea = All;
                }
                field(AbuseEmail; Rec.AbuseEmail)
                {
                    ApplicationArea = All;
                }
                field(AbusePhone; Rec.AbusePhone)
                {
                    ApplicationArea = All;
                }
                field(CreateDate; Rec.CreateDate)
                {
                    ApplicationArea = All;
                }
                field(UpdateDate; Rec.UpdateDate)
                {
                    ApplicationArea = All;
                }
                field(BillingDate; Rec.BillingDate)
                {
                    ApplicationArea = All;
                }
                field(RegistrationUrl; Rec.RegistrationUrl)
                {
                    ApplicationArea = All;
                }
                field(PrimaryFocus; Rec.PrimaryFocus)
                {
                    ApplicationArea = All;
                }
                field(EppPassword; Rec.EppPassword)
                {
                    ApplicationArea = All;
                }
                field(EppSalt; Rec.EppSalt)
                {
                    ApplicationArea = All;
                }
                field(EppHashIteration; Rec.EppHashIteration)
                {
                    ApplicationArea = All;
                }
                field(FailedEppLogins; Rec.FailedEppLogins)
                {
                    ApplicationArea = All;
                }
                field(EppLockedUntil; Rec.EppLockedUntil)
                {
                    ApplicationArea = All;
                }
                field(CreateUsername; Rec.CreateUsername)
                {
                    ApplicationArea = All;
                }
                field(UpdateUsername; Rec.UpdateUsername)
                {
                    ApplicationArea = All;
                }
                field(LegacySystemId; Rec.LegacySystemId)
                {
                    ApplicationArea = All;
                }
                field(DefaultWhoisProxyId; Rec.DefaultWhoisProxyId)
                {
                    ApplicationArea = All;
                }
                field(ClientWhois; Rec.ClientWhois)
                {
                    ApplicationArea = All;
                }
                field(ClientRdap; Rec.ClientRdap)
                {
                    ApplicationArea = All;
                }
                field(ContactCounter; Rec.ContactCounter)
                {
                    ApplicationArea = All;
                }
                field(PaymentGatewayId; Rec.PaymentGatewayId)
                {
                    ApplicationArea = All;
                }
                field(IanaNumber; Rec.IanaNumber)
                {
                    ApplicationArea = All;
                }
                field(DedicatedEppConnections; Rec.DedicatedEppConnections)
                {
                    ApplicationArea = All;
                }
                field(AllowEpp; Rec.AllowEpp)
                {
                    ApplicationArea = All;
                }
                field(RestrictIps; Rec.RestrictIps)
                {
                    ApplicationArea = All;
                }
                field(AllowRestrictIps; Rec.AllowRestrictIps)
                {
                    ApplicationArea = All;
                }
                field(AllowRegistryNs; Rec.AllowRegistryNs)
                {
                    ApplicationArea = All;
                }
                field(UseSecureAuthInfoPw; Rec.UseSecureAuthInfoPw)
                {
                    ApplicationArea = All;
                }
                field(TmpActivateVariants; Rec.TmpActivateVariants)
                {
                    ApplicationArea = All;
                }
                field(EppEnforceClientCert; Rec.EppEnforceClientCert)
                {
                    ApplicationArea = All;
                }
                field(AutoDiscount; Rec.AutoDiscount)
                {
                    ApplicationArea = All;
                }
                field(IsPicked; Rec.IsPicked)
                {
                    ApplicationArea = All;
                }
                field(Emailed; Rec.Emailed)
                {
                    ApplicationArea = All;
                }
                field(EmailOptOut; Rec.EmailOptOut)
                {
                    ApplicationArea = All;
                }
                field(AdminOptOut; Rec.AdminOptOut)
                {
                    ApplicationArea = All;
                }
                field(BillingOptOut; Rec.BillingOptOut)
                {
                    ApplicationArea = All;
                }
                field(TechOptOut; Rec.TechOptOut)
                {
                    ApplicationArea = All;
                }
                field(ServiceOptOut; Rec.ServiceOptOut)
                {
                    ApplicationArea = All;
                }
                field(SystemAccount; Rec.SystemAccount)
                {
                    ApplicationArea = All;
                }
                field(OldStatus; Rec.OldStatus)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetDomainClient)
            {
                ApplicationArea = All;
                Caption = 'Get Domain Client';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ClientDialog: Page "Get Domain Client";
                begin
                    ClientDialog.RunModal();
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
                    if Rec.Clid = '' then
                        Error('Please select a domain client with a valid CLID before creating a customer.');

                    // Step 1: Prevent duplicate creation
                    if Customer.Get(Rec.Clid) then begin
                        Message('A customer already exists for CLID %1 (Customer No. %2). No new record was created.', Rec.Clid, Customer."No.");
                        exit;
                    end;

                    // Step 2: Get posting group defaults from Cash Management Setup
                    CashMgtSetup.Get();
                    CashMgtSetup.TestField("Domain Cust Posting Group");
                    CashMgtSetup.TestField("Domain Cust Bus Posting Group");
                    CashMgtSetup.TestField("Domain Cust VAT Bus Posting Group");

                    // Step 3: Create the Customer record
                    Customer.Init();
                    Customer."No." := Rec.Clid;
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

                    Message('Customer %1 - %2 created successfully from Domain Client %3.', Customer."No.", Customer.Name, Rec.Clid);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
