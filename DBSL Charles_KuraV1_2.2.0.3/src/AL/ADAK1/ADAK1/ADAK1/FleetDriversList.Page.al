#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59010 "Fleet Drivers List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Driver Card";
    //  DeleteAllowed = false;
    // InsertAllowed = false;
    PageType = List;
    SourceTable = "Vehicle Drivers";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Driver License Number"; Rec."Driver License Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver License Number field.';
                }
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last License Renewal field.';
                }
                field("Renewal Interval"; Rec."Renewal Interval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Interval field.';
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Interval Value field.';
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next License Renewal field.';
                }
                field("Year Of Experience"; Rec."Year Of Experience")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Of Experience field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Update Dates")
            {
                ApplicationArea = Basic;
                Image = CalendarMachine;
                ToolTip = 'Executes the Update Dates action.';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    VehicleDrivers.Reset;
                    if VehicleDrivers.Find('-') then
                        repeat
                            StrValue := 'D';

                            if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Days then begin
                                StrValue := 'D';
                            end
                            else
                                if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Weeks then begin
                                    StrValue := 'W';
                                end
                                else
                                    if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Months then begin
                                        StrValue := 'M';
                                    end
                                    else
                                        if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Quarterly then begin
                                            StrValue := 'Q';
                                        end
                                        else
                                            if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Years then begin
                                                StrValue := 'Y';
                                            end;
                            if (VehicleDrivers."Renewal Interval Value" <> 0) and (VehicleDrivers."Last License Renewal" <> 0D) then
                                VehicleDrivers."Next License Renewal" := CalcDate(Format(VehicleDrivers."Renewal Interval Value") + StrValue, VehicleDrivers."Last License Renewal");
                            //VehicleDrivers.VALIDATE("Renewal Interval");
                            VehicleDrivers.Modify;
                        until VehicleDrivers.Next = 0;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Region Code",UserSetup."Region Code");
        //  END;
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Region Code", UserSetup."Region Code");
        // end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Rec.Reset;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Region Code",UserSetup."Region Code");
        //  END;
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Region Code", UserSetup."Region Code");
        // end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Rec.Reset;
        end;
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Region Code",UserSetup."Region Code");
        //  END;
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Region Code", UserSetup."Region Code");
        // end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Rec.Reset;
        end;
    end;

    var
        VehicleDrivers: Record "Vehicle Drivers";
        StrValue: Text[1];
        UserSetup: Record "User Setup";
}

