table 50170 "Domain Client"
{
    Caption = 'Domain Client';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }

        field(2; Roid; Code[50]) { }
        field(3; Clid; Code[50]) { }
        field(4; EppPassword; Text[100]) { }
        field(5; Name; Text[150]) { }
        field(6; Email; Text[150]) { }
        field(7; Address; Text[250]) { }
        field(8; Country; Code[10]) { }
        field(9; Phone; Text[50]) { }
        field(10; Fax; Text[50]) { }
        field(11; AdminContact; Text[100]) { }
        field(12; AdminEmail; Text[100]) { }
        field(13; BillingContact; Text[100]) { }
        field(14; BillingEmail; Text[100]) { }
        field(15; TechContact; Text[100]) { }
        field(16; TechEmail; Text[100]) { }
        field(17; CreateDate; DateTime) { }
        field(18; UpdateDate; DateTime) { }
        field(19; ServiceContact; Text[100]) { }
        field(20; ServiceEmail; Text[100]) { }
        field(21; RegistrationUrl; Text[250]) { }
        field(22; PrimaryFocus; Text[100]) { }

        field(23; AllowEpp; Boolean) { }
        field(24; RestrictIps; Boolean) { }
        field(25; AllowRegistryNs; Boolean) { }
        field(26; FailedEppLogins; Integer) { }
        field(27; EppLockedUntil; DateTime) { }
        field(28; OldStatus; Code[20]) { }
        field(29; IsPicked; Boolean) { }
        field(30; BillingDate; DateTime) { }
        field(31; AllowRestrictIps; Boolean) { }
        field(32; DedicatedEppConnections; Integer) { }
        field(33; Emailed; Boolean) { }
        field(34; LegacySystemId; BigInteger) { }

        field(35; EmailOptOut; Boolean) { }
        field(36; SystemAccount; Boolean) { }
        field(37; AdminOptOut; Boolean) { }
        field(38; BillingOptOut; Boolean) { }
        field(39; TechOptOut; Boolean) { }
        field(40; ServiceOptOut; Boolean) { }

        field(41; DomainsContact; Text[100]) { }
        field(42; DomainsEmail; Text[100]) { }
        field(43; AutoDiscount; Boolean) { }
        field(44; DefaultWhoisProxyId; BigInteger) { }
        field(45; CreateUsername; Text[100]) { }
        field(46; UpdateUsername; Text[100]) { }
        field(47; IanaNumber; Integer) { }

        field(48; UseSecureAuthInfoPw; Boolean) { }
        field(49; TmpActivateVariants; Boolean) { }
        field(50; AbuseEmail; Text[100]) { }
        field(51; AbusePhone; Text[50]) { }
        field(52; EppSalt; Text[100]) { }
        field(53; EppHashIteration; Integer) { }
        field(54; ClientWhois; Text[250]) { }
        field(55; ClientRdap; Text[250]) { }
        field(56; ContactCounter; Integer) { }
        field(57; PaymentGatewayId; Integer) { }
        field(58; City; Text[100]) { }
        field(59; State; Text[100]) { }
        field(60; PostalCode; Code[30]) { }
        field(61; EppEnforceClientCert; Boolean) { }
    }

    keys
    {
        key(PK; Clid)
        {
            Clustered = true;
        }

        key(Roid; Roid)
        {
        }

        key(Email; Email)
        {
        }
    }
}
