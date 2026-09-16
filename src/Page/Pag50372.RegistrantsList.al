namespace KENIC.KENIC;

page 50372 "Registrants List"
{
    ApplicationArea = All;
    Caption = 'Registrants';
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
                field(Roid; Rec.Roid)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(UnicodeName; Rec.UnicodeName)
                {
                    ApplicationArea = All;
                }
                field(Registrant; Rec.Registrant)
                {
                    ApplicationArea = All;
                }
                field(ClientId; Rec.ClientId)
                {
                    ApplicationArea = All;
                }
                field(Zone; Rec.Zone)
                {
                    ApplicationArea = All;
                }
                field(StOk; Rec.StOk)
                {
                    ApplicationArea = All;
                }
                field(ExpiryDate; Rec.ExpiryDate)
                {
                    ApplicationArea = All;
                }
                field(RenewalDate; Rec.RenewalDate)
                {
                    ApplicationArea = All;
                }
                field(CreateDate; Rec.CreateDate)
                {
                    ApplicationArea = All;
                }
                field(CreatedById; Rec.CreatedById)
                {
                    ApplicationArea = All;
                }
                field(CreateUsername; Rec.CreateUsername)
                {
                    ApplicationArea = All;
                }
                field(UpdateDate; Rec.UpdateDate)
                {
                    ApplicationArea = All;
                }
                field(UpdatedById; Rec.UpdatedById)
                {
                    ApplicationArea = All;
                }
                field(UpdateUsername; Rec.UpdateUsername)
                {
                    ApplicationArea = All;
                }
                field(UpdateLoginUsername; Rec.UpdateLoginUsername)
                {
                    ApplicationArea = All;
                }
                field(TransferDate; Rec.TransferDate)
                {
                    ApplicationArea = All;
                }
                field(DeleteDate; Rec.DeleteDate)
                {
                    ApplicationArea = All;
                }
                field(Signed; Rec.Signed)
                {
                    ApplicationArea = All;
                }
                field(AbuseEmail; Rec.AbuseEmail)
                {
                    ApplicationArea = All;
                }
                field(TechnicalEmail; Rec.TechnicalEmail)
                {
                    ApplicationArea = All;
                }
                field(FailedLogins; Rec.FailedLogins)
                {
                    ApplicationArea = All;
                }
                field(LockedUntil; Rec.LockedUntil)
                {
                    ApplicationArea = All;
                }
                field(ApplicationExpiryDate; Rec.ApplicationExpiryDate)
                {
                    ApplicationArea = All;
                }
                field(ApprovalTimeout; Rec.ApprovalTimeout)
                {
                    ApplicationArea = All;
                }
                field(SuperLockId; Rec.SuperLockId)
                {
                    ApplicationArea = All;
                }
                field(MaxSigLife; Rec.MaxSigLife)
                {
                    ApplicationArea = All;
                }
                field(StClDeleteProhibited; Rec.StClDeleteProhibited)
                {
                    ApplicationArea = All;
                }
                field(StClHold; Rec.StClHold)
                {
                    ApplicationArea = All;
                }
                field(StClRenewProhibited; Rec.StClRenewProhibited)
                {
                    ApplicationArea = All;
                }
                field(StClTransferProhibited; Rec.StClTransferProhibited)
                {
                    ApplicationArea = All;
                }
                field(StClUpdateProhibited; Rec.StClUpdateProhibited)
                {
                    ApplicationArea = All;
                }
                field(StInactive; Rec.StInactive)
                {
                    ApplicationArea = All;
                }
                field(StPendingCreate; Rec.StPendingCreate)
                {
                    ApplicationArea = All;
                }
                field(StPendingDelete; Rec.StPendingDelete)
                {
                    ApplicationArea = All;
                }
                field(StPendingRenew; Rec.StPendingRenew)
                {
                    ApplicationArea = All;
                }
                field(StPendingTransfer; Rec.StPendingTransfer)
                {
                    ApplicationArea = All;
                }
                field(StPendingUpdate; Rec.StPendingUpdate)
                {
                    ApplicationArea = All;
                }
                field(StPendingRestore; Rec.StPendingRestore)
                {
                    ApplicationArea = All;
                }
                field(StSvDeleteProhibited; Rec.StSvDeleteProhibited)
                {
                    ApplicationArea = All;
                }
                field(StSvHold; Rec.StSvHold)
                {
                    ApplicationArea = All;
                }
                field(StSvRenewProhibited; Rec.StSvRenewProhibited)
                {
                    ApplicationArea = All;
                }
                field(StSvTransferProhibited; Rec.StSvTransferProhibited)
                {
                    ApplicationArea = All;
                }
                field(StSvUpdateProhibited; Rec.StSvUpdateProhibited)
                {
                    ApplicationArea = All;
                }
                field(StAddPeriod; Rec.StAddPeriod)
                {
                    ApplicationArea = All;
                }
                field(StRedemptionPeriod; Rec.StRedemptionPeriod)
                {
                    ApplicationArea = All;
                }
                field(RedemptionExpiryDate; Rec.RedemptionExpiryDate)
                {
                    ApplicationArea = All;
                }
                field(DeleteRequestedDate; Rec.DeleteRequestedDate)
                {
                    ApplicationArea = All;
                }
                field(RestoreRequestedDate; Rec.RestoreRequestedDate)
                {
                    ApplicationArea = All;
                }
                field(PendingRegistrant; Rec.PendingRegistrant)
                {
                    ApplicationArea = All;
                }
                field(PendingReregLength; Rec.PendingReregLength)
                {
                    ApplicationArea = All;
                }
                field(PendingRegistrantExpiry; Rec.PendingRegistrantExpiry)
                {
                    ApplicationArea = All;
                }
                field(ExpiryEmailSent; Rec.ExpiryEmailSent)
                {
                    ApplicationArea = All;
                }
                field(PostExpiryEmailSent; Rec.PostExpiryEmailSent)
                {
                    ApplicationArea = All;
                }
                field(RequestedDeleteUsername; Rec.RequestedDeleteUsername)
                {
                    ApplicationArea = All;
                }
                field(RequestedDeleteClid; Rec.RequestedDeleteClid)
                {
                    ApplicationArea = All;
                }
                field(RequestedDeleteDate; Rec.RequestedDeleteDate)
                {
                    ApplicationArea = All;
                }
                field(RestoreRegRenLength; Rec.RestoreRegRenLength)
                {
                    ApplicationArea = All;
                }
                field(RestoreReregLength; Rec.RestoreReregLength)
                {
                    ApplicationArea = All;
                }
                field(AuthInfoPwUpdateTime; Rec.AuthInfoPwUpdateTime)
                {
                    ApplicationArea = All;
                }
                field(LastUpdatedAt; Rec.LastUpdatedAt)
                {
                    ApplicationArea = All;
                }
                field(LastUpdatedBy; Rec.LastUpdatedBy)
                {
                    ApplicationArea = All;
                }
            }
        }

        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetRegistrants)
            {
                ApplicationArea = All;
                Caption = 'Get Registrants';
                ToolTip = 'Retrieve registrants by zone name or client ID.';
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
        }
    }
}
