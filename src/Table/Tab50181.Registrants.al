table 50181 Registrants
{

    Caption = 'Registrants';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Roid; Code[50])
        {
            Caption = 'ROID';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(3; ExpiryDate; DateTime)
        {
            Caption = 'Expiry Date';
        }
        field(4; StClDeleteProhibited; Text[100])
        {
            Caption = 'Client Delete Prohibited';
        }
        field(5; StClHold; Text[100])
        {
            Caption = 'Client Hold';
        }
        field(6; StClRenewProhibited; Text[100])
        {
            Caption = 'Client Renew Prohibited';
        }
        field(7; StClTransferProhibited; Text[100])
        {
            Caption = 'Client Transfer Prohibited';
        }
        field(8; StClUpdateProhibited; Text[100])
        {
            Caption = 'Client Update Prohibited';
        }
        field(9; StInactive; Text[100])
        {
            Caption = 'Inactive Status';
        }
        field(10; StOk; Text[100])
        {
            Caption = 'Status';
        }
        field(11; StPendingCreate; Text[100])
        {
            Caption = 'Pending Create';
        }
        field(12; StPendingDelete; Text[100])
        {
            Caption = 'Pending Delete';
        }
        field(13; StPendingRenew; Text[100])
        {
            Caption = 'Pending Renew';
        }
        field(14; StPendingTransfer; Text[100])
        {
            Caption = 'Pending Transfer';
        }
        field(15; StPendingUpdate; Text[100])
        {
            Caption = 'Pending Update';
        }
        field(16; StSvDeleteProhibited; Text[100])
        {
            Caption = 'Server Delete Prohibited';
        }
        field(17; StSvHold; Text[100])
        {
            Caption = 'Server Hold';
        }
        field(18; StSvRenewProhibited; Text[100])
        {
            Caption = 'Server Renew Prohibited';
        }
        field(19; StSvTransferProhibited; Text[100])
        {
            Caption = 'Server Transfer Prohibited';
        }
        field(20; StSvUpdateProhibited; Text[100])
        {
            Caption = 'Server Update Prohibited';
        }
        field(21; Registrant; Code[100])
        {
            Caption = 'Registrant';
        }
        field(22; AuthInfoPw; Text[2048])
        {
            Caption = 'Authorization Information';
        }
        field(23; ClientId; Code[50])
        {
            Caption = 'Client ID';
        }
        field(24; CreatedById; Code[50])
        {
            Caption = 'Created By ID';
        }
        field(25; CreateDate; DateTime)
        {
            Caption = 'Creation Date';
        }
        field(26; UpdatedById; Code[50])
        {
            Caption = 'Updated By ID';
        }
        field(27; UpdateDate; DateTime)
        {
            Caption = 'Update Date';
        }
        field(28; TransferDate; DateTime)
        {
            Caption = 'Transfer Date';
        }
        field(29; Zone; Code[100])
        {
            Caption = 'Zone';
        }
        field(30; ClientSpecificData; Text[2048])
        {
            Caption = 'Client Specific Data';
        }
        field(31; DeleteDate; DateTime)
        {
            Caption = 'Delete Date';
        }
        field(32; StPendingRestore; Text[100])
        {
            Caption = 'Pending Restore';
        }
        field(33; RedemptionExpiryDate; DateTime)
        {
            Caption = 'Redemption Expiry Date';
        }
        field(34; DeleteRequestedDate; DateTime)
        {
            Caption = 'Delete Requested Date';
        }
        field(35; RestoreRequestedDate; DateTime)
        {
            Caption = 'Restore Requested Date';
        }
        field(36; RenewalDate; DateTime)
        {
            Caption = 'Renewal Date';
        }
        field(37; UnicodeName; Text[250])
        {
            Caption = 'Unicode Name';
        }
        field(38; ApplicationExpiryDate; DateTime)
        {
            Caption = 'Application Expiry Date';
        }
        field(39; ApprovalTimeout; DateTime)
        {
            Caption = 'Approval Timeout';
        }
        field(40; SuperLockId; Text[100])
        {
            Caption = 'Super Lock ID';
        }
        field(41; UpdateLoginUsername; Text[100])
        {
            Caption = 'Update Login Username';
        }
        field(42; CreateUsername; Text[100])
        {
            Caption = 'Create Username';
        }
        field(43; UpdateUsername; Text[100])
        {
            Caption = 'Update Username';
        }
        field(44; MaxSigLife; Integer)
        {
            Caption = 'Maximum Signature Life';
        }
        field(45; FailedLogins; Integer)
        {
            Caption = 'Failed Logins';
        }
        field(46; LockedUntil; DateTime)
        {
            Caption = 'Locked Until';
        }
        field(47; PendingRegistrant; Text[100])
        {
            Caption = 'Pending Registrant';
        }
        field(48; PendingReregLength; Integer)
        {
            Caption = 'Pending Re-registration Length';
        }
        field(49; PendingRegistrantExpiry; DateTime)
        {
            Caption = 'Pending Registrant Expiry';
        }
        field(50; Signed; Boolean)
        {
            Caption = 'Signed';
        }
        field(51; ExpiryEmailSent; Boolean)
        {
            Caption = 'Expiry Email Sent';
        }
        field(52; RequestedDeleteUsername; Text[100])
        {
            Caption = 'Requested Delete Username';
        }
        field(53; RequestedDeleteClid; Code[50])
        {
            Caption = 'Requested Delete Client ID';
        }
        field(54; RequestedDeleteDate; DateTime)
        {
            Caption = 'Requested Delete Date';
        }
        field(55; RestoreRegRenLength; Integer)
        {
            Caption = 'Restore Registration Renewal Length';
        }
        field(56; RestoreReregLength; Integer)
        {
            Caption = 'Restore Re-registration Length';
        }
        field(57; AuthInfoSalt; Text[250])
        {
            Caption = 'Authorization Information Salt';
        }
        field(58; AuthInfoHashIteration; Integer)
        {
            Caption = 'Authorization Hash Iteration';
        }
        field(59; AbuseEmail; Text[250])
        {
            Caption = 'Abuse Email';
        }
        field(60; TechnicalEmail; Text[250])
        {
            Caption = 'Technical Email';
        }
        field(61; StAddPeriod; Text[250])
        {
            Caption = 'Add Period Status';
        }
        field(62; StRedemptionPeriod; Text[250])
        {
            Caption = 'Redemption Period Status';
        }
        field(63; PostExpiryEmailSent; Boolean)
        {
            Caption = 'Post Expiry Email Sent';
        }
        field(64; AuthInfoPwUpdateTime; DateTime)
        {
            Caption = 'Authorization Information Updated At';
        }
        field(65; RawJsonPayload; Blob)
        {
            Caption = 'Raw JSON Payload';
            SubType = Memo;
        }
        field(66; LastUpdatedAt; DateTime)
        {
            Caption = 'Last Updated At';
        }
        field(67; LastUpdatedBy; Code[50])
        {
            Caption = 'Last Updated By';
        }
    }

    keys
    {
        key(PK; Roid)
        {
            Clustered = true;
        }
        key(NameKey; Name)
        {
        }
        key(ClientIdKey; ClientId)
        {
        }
        key(ZoneKey; Zone)
        {
        }
        key(RegistrantKey; Registrant)
        {
        }
        key(ExpiryDateKey; ExpiryDate)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Roid, Name, Registrant, ClientId, Zone)
        {
        }
        fieldgroup(Brick; Name, Registrant, ClientId, Zone, StOk)
        {
        }
    }
}