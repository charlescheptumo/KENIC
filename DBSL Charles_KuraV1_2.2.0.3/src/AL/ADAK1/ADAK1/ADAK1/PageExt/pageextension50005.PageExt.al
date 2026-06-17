#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50005 "pageextension50005" extends "G/L Account Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""G/L Account Card"(Page 17)".

    layout
    {
        addafter(Blocked)
        {
            field("Budget Controlled"; Rec."Budget Controlled")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Controlled field.';
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (RunObject) on ""Trial Balance"(Action 1904082706)".

    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Accounts Administrator" = false then begin
                if UserSetup."Accounts User" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Finance Office');
            end;
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Accounts Administrator" = false then begin
                if UserSetup."Accounts User" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Finance Office');
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Accounts Administrator" = false then begin
                if UserSetup."Accounts User" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Finance Office');
            end;
        end;
    end;
    trigger OnDeleteRecord(): Boolean
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Accounts Administrator" = false then begin
                if UserSetup."Accounts User" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Finance Office');
            end;
        end;
    end;

    

    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      IF NOT UserSetup."View Works Inspections" = TRUE THEN BEGIN
        ERROR('You do not have permission to edit these GL Account details.Please contact your system administrator');
        END;
      END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      IF NOT UserSetup."View Works Inspections" = TRUE THEN BEGIN
        ERROR('You do not have permission to edit these GL Account details.Please contact your system administrator');
        END;
      END;
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetupNewGLAcc(xRec,BelowxRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetupNewGLAcc(xRec,BelowxRec);
    IF UserSetup.GET(USERID) THEN BEGIN
      IF NOT UserSetup."View Works Inspections" = TRUE THEN BEGIN
        ERROR('You do not have permission to edit these GL Account details.Please contact your system administrator');
        END;
      END;
    */
    //end;
}

