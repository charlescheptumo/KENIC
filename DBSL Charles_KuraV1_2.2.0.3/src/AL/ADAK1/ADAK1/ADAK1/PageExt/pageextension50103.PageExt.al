#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50103 "pageextension50103" extends "Fixed Asset List"
{

    layout
    {
        addafter("No.")
        {
            field("Serial No."; Rec."Serial No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Serial No. field.';
            }
        }
        addafter("FA Subclass Code")
        {
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Location Code field.';
            }
        }
    }
    //trigger OnOpenPage()
    //begin
    //IF UserSetup.GET(USERID) THEN
    //Rec.SETRANGE("Global Dimension 1 Code", UserSetup."Region Code");
    // ;
    //end;

    //var
    //UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Location Code",UserSetup."Purchase Resp. Ctr. Filter");
      END;
    IF UserSetup.GET(USERID) THEN BEGIN
      IF (UserSetup."Amend Bank Account Details"=TRUE) THEN
        RESET;
      END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Location Code",UserSetup."Purchase Resp. Ctr. Filter");
      END;
    IF UserSetup.GET(USERID) THEN BEGIN
      IF (UserSetup."Amend Bank Account Details"=TRUE) THEN
        RESET;
      END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Location Code",UserSetup."Purchase Resp. Ctr. Filter");
      END;
      IF UserSetup.GET(USERID) THEN BEGIN
      IF (UserSetup."Amend Bank Account Details"=TRUE) THEN
        RESET;
      END;
    */
    //end;

    actions
    {
        addafter("C&opy Fixed Asset")
        {
            action(DeleteSelectedFixedAssets)
            {
                Caption = 'Delete Selected Fixed Assets';
                Image = Delete;
                Enabled = HasSelectedRecords;
                ApplicationArea = All;

                trigger OnAction()
                var
                    FixedAsset: Record "Fixed Asset";
                    FALedgerEntry: Record "FA Ledger Entry";
                    SelectedCount: Integer;
                    DeletedCount: Integer;
                    SkippedCount: Integer;
                begin
                    CurrPage.SetSelectionFilter(FixedAsset);

                    SelectedCount := FixedAsset.Count();

                    if SelectedCount = 0 then
                        exit;

                    if not Confirm('This will delete %1 selected fixed asset(s) that have no ledger entries. Continue?', false, SelectedCount) then
                        exit;

                    if FixedAsset.FindSet() then
                        repeat
                            FALedgerEntry.SetRange("FA No.", FixedAsset."No.");
                            if FALedgerEntry.IsEmpty() then begin
                                FixedAsset.Delete(true);
                                DeletedCount += 1;
                            end else
                                SkippedCount += 1;
                        until FixedAsset.Next() = 0;

                    Message('%1 fixed asset(s) deleted. %2 skipped (have ledger entries).', DeletedCount, SkippedCount);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    local procedure UpdateControls()
    var
        FixedAsset: Record "Fixed Asset";
    begin
        CurrPage.SetSelectionFilter(FixedAsset);
        HasSelectedRecords := not FixedAsset.IsEmpty();
    end;

    var
        HasSelectedRecords: Boolean;
}

