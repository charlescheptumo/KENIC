table 50181 Registrants
{

    Caption = 'Registrants';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Roid; Code[50]) { Caption = 'ROID'; }
        field(2; ClientId; Code[50]) { Caption = 'Client ID'; }
        field(3; Name; Text[250]) { Caption = 'Name'; }
        field(4; Email; Text[250]) { Caption = 'Email'; }
        field(5; Address; Text[250]) { Caption = 'Address'; }
        field(6; Country; Code[10]) { Caption = 'Country'; }
        field(7; Phone; Text[50]) { Caption = 'Phone'; }
        field(8; Fax; Text[50]) { Caption = 'Fax'; }
        field(9; AdminContact; Text[250]) { Caption = 'Administrative Contact'; }
        field(10; AdminEmail; Text[250]) { Caption = 'Administrative Email'; }
        field(11; BillingContact; Text[250]) { Caption = 'Billing Contact'; }
        field(12; BillingEmail; Text[250]) { Caption = 'Billing Email'; }
        field(13; TechContact; Text[250]) { Caption = 'Technical Contact'; }
        field(14; TechEmail; Text[250]) { Caption = 'Technical Email'; }
        field(15; ServiceContact; Text[250]) { Caption = 'Service Contact'; }
        field(16; ServiceEmail; Text[250]) { Caption = 'Service Email'; }
        field(17; DomainsContact; Text[250]) { Caption = 'Domains Contact'; }
        field(18; DomainsEmail; Text[250]) { Caption = 'Domains Email'; }
        field(19; AbuseEmail; Text[250]) { Caption = 'Abuse Email'; }
        field(20; AbusePhone; Text[50]) { Caption = 'Abuse Phone'; }
        field(21; RegistrationUrl; Text[250]) { Caption = 'Registration URL'; }
        field(22; PrimaryFocus; Text[100]) { Caption = 'Primary Focus'; }
        field(23; CreateDate; DateTime) { Caption = 'Creation Date'; }
        field(24; UpdateDate; DateTime) { Caption = 'Update Date'; }
        field(25; BillingDate; DateTime) { Caption = 'Billing Date'; }
        field(26; CreateUsername; Text[100]) { Caption = 'Created By'; }
        field(27; UpdateUsername; Text[100]) { Caption = 'Updated By'; }
        field(28; AllowEpp; Boolean) { Caption = 'Allow EPP'; }
        field(29; RestrictIps; Boolean) { Caption = 'Restrict IP Addresses'; }
        field(30; AllowRegistryNs; Boolean) { Caption = 'Allow Registry Name Servers'; }
        field(31; FailedEppLogins; Integer) { Caption = 'Failed EPP Logins'; }
        field(32; EppLockedUntil; DateTime) { Caption = 'EPP Locked Until'; }
        field(33; OldStatus; Text[50]) { Caption = 'Old Status'; }
        field(34; IsPicked; Boolean) { Caption = 'Is Picked'; }
        field(35; AllowRestrictIps; Boolean) { Caption = 'Allow Restrict IP Addresses'; }
        field(36; DedicatedEppConnections; Integer) { Caption = 'Dedicated EPP Connections'; }
        field(37; Emailed; Boolean) { Caption = 'Emailed'; }
        field(38; LegacySystemId; Text[100]) { Caption = 'Legacy System ID'; }
        field(39; EmailOptOut; Boolean) { Caption = 'Email Opt Out'; }
        field(40; SystemAccount; Boolean) { Caption = 'System Account'; }
        field(41; AdminOptOut; Boolean) { Caption = 'Admin Opt Out'; }
        field(42; BillingOptOut; Boolean) { Caption = 'Billing Opt Out'; }
        field(43; TechOptOut; Boolean) { Caption = 'Technical Opt Out'; }
        field(44; ServiceOptOut; Boolean) { Caption = 'Service Opt Out'; }
        field(45; AutoDiscount; Boolean) { Caption = 'Automatic Discount'; }
        field(46; DefaultWhoisProxyId; Text[100]) { Caption = 'Default WHOIS Proxy ID'; }
        field(47; IanaNumber; Text[100]) { Caption = 'IANA Number'; }
        field(48; UseSecureAuthInfoPw; Boolean) { Caption = 'Use Secure Auth Info Password'; }
        field(49; TmpActivateVariants; Boolean) { Caption = 'Activate Variants'; }
        field(50; EppHashIteration; Integer) { Caption = 'EPP Hash Iteration'; }
        field(51; ClientWhois; Text[250]) { Caption = 'Client WHOIS'; }
        field(52; ClientRdap; Text[250]) { Caption = 'Client RDAP'; }
        field(53; ContactCounter; Integer) { Caption = 'Contact Counter'; }
        field(54; PaymentGatewayId; Text[100]) { Caption = 'Payment Gateway ID'; }
        field(55; City; Text[100]) { Caption = 'City'; }
        field(56; State; Text[100]) { Caption = 'State'; }
        field(57; PostalCode; Text[50]) { Caption = 'Postal Code'; }
        field(58; EppEnforceClientCert; Boolean) { Caption = 'Enforce EPP Client Certificate'; }
        field(59; EppPassword; Text[2048]) { Caption = 'EPP Password Hash'; ExtendedDatatype = Masked; }
        field(60; EppSalt; Text[250]) { Caption = 'EPP Salt'; ExtendedDatatype = Masked; }
        field(61; RawJsonPayload; Blob) { Caption = 'Raw JSON Payload'; SubType = Memo; }
        field(62; LastUpdatedAt; DateTime) { Caption = 'Last Updated At'; }
        field(63; LastUpdatedBy; Code[50]) { Caption = 'Last Updated By'; }
    }

    keys
    {
        key(PK; Roid) { Clustered = true; }
        key(ClientIdKey; ClientId) { }
        key(NameKey; Name) { }
        key(CreateDateKey; CreateDate) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Roid, ClientId, Name, Email) { }
        fieldgroup(Brick; Name, ClientId, Email, Country) { }
    }
}