#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50133 "pageextension50133" extends "Purchase Credit Memos"
{
    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    //  if UserSetup.Get(UserId) then begin
    //   SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    //   end;
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetSecurityFilterOnRespCenter;

    JobQueueActive := PurchasesPayablesSetup.JobQueueActive;
    IsOfficeAddin := OfficeMgt.IsAvailable;

    CopyBuyFromVendorFilter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //SetSecurityFilterOnRespCenter;
    #2..6

    //  if UserSetup.Get(UserId) then begin
    //   SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    //   end;
    */
    //end;
}

