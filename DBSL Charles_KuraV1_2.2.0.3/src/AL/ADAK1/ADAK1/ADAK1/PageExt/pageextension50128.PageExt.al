#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50128 "pageextension50128" extends "Sales Invoice List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Sales Invoice List"(Page 9301)".

    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetControlAppearance;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetControlAppearance;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

    //  if UserSetup.Get(UserId) then begin
    //   SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    //   end;
    */
    //end;


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
    JobQueueActive := SalesSetup.JobQueueActive;

    CopySellToCustomerFilter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //SetSecurityFilterOnRespCenter;
    #2..4
    //Fred RCs
    //  if UserSetup.Get(UserId) then begin
    //   SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    //   end;
    */
    //end;
}

