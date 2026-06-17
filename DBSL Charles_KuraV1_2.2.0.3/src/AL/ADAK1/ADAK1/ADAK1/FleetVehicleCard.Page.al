#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59001 "Fleet Vehicle Card"
{
    //  DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Vehicles.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("FA Serial No"; Rec."FA Serial No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fixed Asset List";
                    ToolTip = 'Specifies the value of the FA Serial No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsible Employee field.';
                }
                field(Grounded; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Caption = 'Grounded';
                    ToolTip = 'Specifies the value of the Grounded field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Location';
                    ToolTip = 'Specifies the value of the Vehicle Location field.';
                }
                field("Vehicle Status"; Rec."Vehicle Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Status field.';
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = "Daily Work Ticket Lines"."Closing Odometer Reading" where("Vehicle Allocated" = field("FA Serial No"));
                    ToolTip = 'Specifies the value of the Odometer Reading field.';
                }
            }
            group(Posting)
            {
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Class Code field.';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Subclass Code field.';
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Location Code field.';
                }
                field("Budgeted Asset"; Rec."Budgeted Asset")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budgeted Asset field.';
                }
            }
            group(Maintenance)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Maintenance Vendor No. field.';
                }
                field("Next Service Milleage"; Rec."Next Service Milleage")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next Service Mileage';
                    ToolTip = 'Specifies the value of the Next Service Mileage field.';
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Next Service Date field.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warranty Date field.';
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insured field.';
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Under Maintenance field.';
                }
            }
            group("Vehicle Details")
            {
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Vehicle Make List";
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vehicle Model List";
                    LookupPageID = "Vehicle Model List";
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Year Of Manufacture"; Rec."Year Of Manufacture")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Of Manufacture field.';
                }
                field("Country Of Origin"; Rec."Country Of Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country Of Origin field.';
                }
                field("Vehicle CC"; Rec."Vehicle CC")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle CC field.';
                }
                field(Ownership; Rec.Ownership)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership field.';
                }
                field("Body Color"; Rec."Body Color")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body Color field.';
                }
                field("Chassis Serial No."; Rec."Chassis Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chassis Serial No. field.';
                }
                field("Engine Serial No."; Rec."Engine Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engine Serial No. field.';
                }
                field("Ignition Key Code"; Rec."Ignition Key Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ignition Key Code field.';
                }
                field("Tare Weight"; Rec."Tare Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tare Weight field.';
                }
                field("Fuel Card No"; Rec."Fuel Card No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Card No field.';
                }
                field("Fuel Card Pin"; Rec."Fuel Card Pin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Card Pin field.';
                }
                field("Maximum Tonnage(Kgs)"; Rec."Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Vehicle Limit field.';
                }
                field("Tire Size Rear"; Rec."Tire Size Rear")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tire Size Rear field.';
                    Caption = 'Tire Size';
                }
                field("Tire Size Front"; Rec."Tire Size Front")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tire Size Front field.';
                    Visible = False;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Type field.';
                }
            }
            group("Millage/Hrs Worked Details")
            {
                Caption = 'Mileage/Hrs Worked Details';
                group(Details)
                {
                    Caption = 'Details';
                    field("Readings Based On"; Rec."Readings Based On")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Readings Based On field.';
                    }
                    field("Start Reading"; Rec."Start Reading")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Start Reading field.';

                        trigger OnValidate()
                        begin
                            Rec.Validate("Total Trip Milleage");
                            Rec."Current Reading" := Rec."Start Reading" + Rec."Total Trip Milleage";
                        end;
                    }
                    field("Current Reading"; Rec."Current Reading")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Current Reading field.';
                    }
                    field("Total Trip Milleage"; Rec."Total Trip Milleage")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Total Trip Mileage';
                        ToolTip = 'Specifies the value of the Total Trip Mileage field.';
                    }
                }
                part(Control11; "Fuel Milleage")
                {
                    Caption = 'Fuel Mileage';
                    SubPageLink = No = field("No.");
                }
            }
            part(Control14; "Vehicle Insurance Lines")
            {
                Caption = 'Vehicle Insurance Details';
                Editable = false;
                SubPageLink = "Registration No." = field("FA Serial No");
            }
            part(Control1000000069; "Vehicle Accidents")
            {
                Caption = 'Vehicle Incidents/Occurrences';
                SubPageLink = RegNo = field("FA Serial No");
            }
            part(Control5; "Closed Fleet Requests List")
            {
                Caption = 'Approved Transport Requests';
                SubPageLink = "Vehicle Allocated" = field("FA Serial No");
                Visible = true;
            }
            // part(Control1000000050; "Fuel and Maintenance List")
            part(Control1000000050; "Fuel and Maintenance ListPart")
            {
                Caption = 'Maintenance Requests List';
                SubPageLink = "Vehicle Reg No" = field("FA Serial No"),
                              Type = const(Maintenance);
            }
            // part(Control10; "Fuel and Maintenance List")
            part(Control10; "Fuel and Maintenance ListPart")
            {
                Caption = 'Fuel Requisitions List';
                SubPageLink = "Vehicle Reg No" = field("FA Serial No"),
                              Type = const(Fuel);
            }
        }
        area(Factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Fleet Vehicles."),
                              "No." = field("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Maintenance Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;
                ToolTip = 'Executes the Maintenance Ledger Entries action.';

                trigger OnAction()
                begin
                    FleetVehicles.Reset;
                    FleetVehicles.SetRange(FleetVehicles."FA No.", Rec."No.");
                    Page.Run(5641, FleetVehicles);
                end;
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                Promoted = true;
                RunObject = Page "Comment Sheet";
                ToolTip = 'Executes the Comments action.';
            }
            action(Picture)
            {
                ApplicationArea = Basic;
                Image = Picture;
                Promoted = true;
                ToolTip = 'Executes the Picture action.';
            }
            action("Maintenance Registration")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                RunObject = Page "Maintenance Registration";
                ToolTip = 'Executes the Maintenance Registration action.';
            }
            action(Statistics)
            {
                ApplicationArea = Basic;
                Image = Statistics;
                Promoted = true;
                ToolTip = 'Executes the Statistics action.';
            }
            action("Main Asset Components")
            {
                ApplicationArea = Basic;
                Image = Components;
                Promoted = true;
                ToolTip = 'Executes the Main Asset Components action.';
            }
            action("Total Value Insured")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                Promoted = true;
                RunObject = Page "Total Value Insured";
                ToolTip = 'Executes the Total Value Insured action.';
            }
            action("Allocate to Departments")
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                ToolTip = 'Executes the Allocate to Departments action.';
                //  RunObject = Page UnknownPage52018565;
            }
            action("Create Plan")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Create Plan action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Vehicles.SetRange("No.", Rec."No.");
                    Report.Run(59017, true, true, Vehicles);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.Validate("Start Reading");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Validate("Start Reading");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Validate("Start Reading");
    end;

    trigger OnOpenPage()
    begin
        Rec.Validate("Start Reading");
    end;

    var
        MaintenanceLedgerEntries: Page "Maintenance Ledger Entries";
        FleetVehicles: Record "Maintenance Ledger Entry";
        Vehicles: Record "Fleet Vehicles.";
}

