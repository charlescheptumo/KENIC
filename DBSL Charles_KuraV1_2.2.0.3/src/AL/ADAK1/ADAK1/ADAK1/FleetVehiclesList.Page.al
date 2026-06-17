#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59000 "Fleet Vehicles List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Vehicle Card";
    //  DeleteAllowed = false;
    InsertAllowed = true;
    PageType = List;
    SourceTable = "Fleet Vehicles.";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fixed Asset List-flt";
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Class Code field.';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Subclass Code field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Location Code field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warranty Date field.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = Loans;
                    LookupPageID = Loans;
                    ToolTip = 'Specifies the value of the Responsible Employee field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Vendor No. field.';
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Service Date field.';
                }
                field("Last Service Date"; Rec."Last Service Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Service Date field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Operation Setups";
                    LookupPageID = "Operation Setups";
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vehicle Model List";
                    LookupPageID = "Vehicle Model List";
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Start Reading"; Rec."Start Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Reading field.';
                }
                field("Body Color"; Rec."Body Color")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body Color field.';
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Type field.';
                }
                field("Current Reading"; Rec."Current Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Reading field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Location Code",UserSetup."Region Code");
        //  END;
        // if UserSetup.Get(UserId) then begin
        //     Rec.SetRange("Location Code", UserSetup."Region Code");
        // end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Rec.Reset;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Location Code",UserSetup."Region Code");
        //  END;
        // if UserSetup.Get(UserId) then begin
        //     Rec.SetRange("Location Code", UserSetup."Region Code");
        // end;

        // if UserSetup.Get(UserId) then begin
        //     if (UserSetup."View Lab Works Inspections" = true) then
        //         Rec.Reset;
        // end;
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Location Code",UserSetup."Region Code");
        //  END;
        // IF UserSetup.GET(USERID) THEN BEGIN
        //        SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    END;
        //
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF ((UserSetup."AIE Creation & Posting" = TRUE) OR (UserSetup."Principal Accountant"=TRUE)) THEN
        //    RESET;
        //  END;
        // if UserSetup.Get(UserId) then begin
        //     Rec.SetRange("Location Code", UserSetup."Region Code");
        // end;

        // if UserSetup.Get(UserId) then begin
        //     if (UserSetup."View Lab Works Inspections" = true) then
        //         Rec.Reset;
        // end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

