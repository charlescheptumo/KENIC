#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59011 "Fleet Driver Card"
{
    //  DeleteAllowed = false;
    // InsertAllowed = false;
    PageType = Document;
    SourceTable = "Vehicle Drivers";
    RefreshOnActivate = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Licence Type"; Rec."Licence Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Type field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Next License Renewal field.';
                }
                field("Year Of Experience"; Rec."Year Of Experience")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Year Of Experience field.';
                }
                field("Grade Test"; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Under Probation"; Rec."Under Probation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Under Probation field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                    visible = false;
                }
            }
            part(Control3; "Vehicle Accidents")
            {
                Editable = false;
                SubPageLink = Driver = field(Driver);
            }
            part("Driver Incidents"; "Driver Incident Details")
            {
                SubPageLink = "Document No." = field(Driver), "Driver Name" = field("Driver Name");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print Driver Report';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print Driver Report action.';

                trigger OnAction()
                begin
                    Drivers.Reset;
                    Drivers.SetRange(Drivers.Driver, Rec.Driver);
                    Report.Run(59016, true, true, Drivers);
                end;
            }
            action("Transport Requests Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Transport Requests Report action.';

                trigger OnAction()
                begin
                    Drivers.Reset;
                    Drivers.SetRange(Drivers.Driver, Rec.Driver);
                    Report.Run(59011, true, true, Drivers);
                end;
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    var
        VehicleDrivers: Record "Vehicle Drivers";
    begin
        // VehicleDrivers.Reset();
        // VehicleDrivers.SetRange(Driver, VehicleDrivers.Driver);
        // VehicleDrivers.SetRange("Under Probation", true);
        // if VehicleDrivers.Find('-') then begin
        //     Active := false;
        // end
        if Rec."Under Probation" = true then begin
            Rec.Active := false;
        end
    end;

    var
        Drivers: Record "Vehicle Drivers";
}

