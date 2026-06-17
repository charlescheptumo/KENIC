
Page 59026 "Fuel Requisition Card"
{
    Caption = 'Fuel Management Card';
    DeleteAllowed = false;
    PageType = Card;
    // Editable = false;
    SourceTable = "Fuel & Maintenance Requisition";
    ApplicationArea = All;
    // SourceTableView = where(Type = filter(Fuel));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = False;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                    // Caption = 'Region Code';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                    // Caption = 'Region Name';
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Reg No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = basic;
                    Editable = false;
                    Caption = 'Fuel Card No.';
                    ToolTip = 'Specifies the value of the Fuel Card No. field.';
                }
                field("Type of Fuel"; Rec."Type of Fuel")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type of Fuel field.';
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Caption = 'Odometer Reading (KM)';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Odometer Reading (KM) field.';
                }
                field("Previous Odometer Reading"; Rec."Previous Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Previous Odometer Reading field.';
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = VendorEditable;
                    LookupPageID = "Vendor List";
                    TableRelation = Vendor;
                    ToolTip = 'Specifies the value of the Vendor(Dealer) field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Litres of Oil"; Rec."Litres of Oil")
                {
                    ApplicationArea = Basic;
                    Caption = 'Litres';
                    ToolTip = 'Specifies the value of the Litres field.';

                    trigger OnValidate()
                    begin
                        if Rec."Price/Litre" <> 0 then
                            Rec."Total Price of Fuel" := Rec."Litres of Oil" * Rec."Price/Litre";
                    end;
                }
                field("Price/Litre"; Rec."Price/Litre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Price/Litre field.';

                    trigger OnValidate()
                    begin
                        if Rec."Price/Litre" <> 0 then
                            Rec."Total Price of Fuel" := Rec."Litres of Oil" * Rec."Price/Litre";
                    end;
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount Requested';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount Requested field.';

                    trigger OnValidate()
                    begin
                        if Rec."Price/Litre" <> 0 then
                            Rec."Litres of Oil" := Rec."Total Price of Fuel" / Rec."Price/Litre";
                    end;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = RequestDateEditable;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the Type.';
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Petty Cash Number';
                    Editable = chequeEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Petty Cash Number field.';
                }
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = Basic;
                SubPageLink = "No." = field("Requisition No");
            }
            systempart(Control1000000020; Links)
            {
            }

            systempart(Control1000000017; Notes)
            {
            }

        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                //Visible = Approved;
                Enabled = Rec.Status = Rec.Status::Open;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin

                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    ;
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                //Visible = Approved;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Close Fuel Request")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Promoted = true;
                Visible = PendingApp;
                PromotedIsBig = true;
                ToolTip = 'Executes the Close Fuel Request action.';

                trigger OnAction()
                var
                    VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
                    FleetVehicles: Record "Fleet Vehicles.";
                begin
                    //TESTFIELD("Posted Invoice No");

                    // if Confirm('Are you sure you want to close this Fuel Request?', true) = false then begin
                    //     exit
                    // end else
                    if Confirm('Are you sure you want to close this Fuel Request?', false, true) then begin
                        VehicleFuelCardLines.Reset();
                        VehicleFuelCardLines.SetRange("Vehicle RegNo", Rec."Vehicle Reg No");
                        if not VehicleFuelCardLines.Find('-') then begin
                            VehicleFuelCardLines."Amount in Litres" := Rec."Total Price of Fuel";
                            VehicleFuelCardLines."Amount in Litres" := Rec."Litres of Oil";
                            VehicleFuelCardLines."Date of Fueling" := Rec."Date Closed";
                            VehicleFuelCardLines."Vehicle RegNo" := Rec."Vehicle Reg No";
                            VehicleFuelCardLines.Driver := Rec.Driver;
                            VehicleFuelCardLines."Driver Names" := Rec."Driver Name";

                            // if FleetVehicles.Get("Vehicle RegNo") then begin
                            //     VehicleFuelCardLines."vehicle Make":=FleetVehicles.Make;
                            // end;                            
                            VehicleFuelCardLines.Insert();
                        end;
                        Rec.Status := Rec.Status::Closed;
                        Rec."Closed By" := UserId;
                        Rec."Date Closed" := Today;
                        Rec.Modify;
                    end

                end;
            }
            action("Generate Petty Cash Voucher")
            {
                ApplicationArea = Basic;
                Image = Currencies;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Generate Petty Cash Voucher action.';

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    if Rec."PO Created" then begin
                        if Confirm('PV already created, Would you like to open it?', true) then begin
                            Payments.Reset;
                            Payments.SetRange(Payments."No.", Rec."Posted Invoice No");
                            Page.Run(57017, Payments);
                        end;
                    end else
                        if Confirm('Are you sure you want to generate a PV?', true) then begin
                            Payments.Init;
                            Payments."Payment Type" := Payments."payment type"::"Petty Cash";
                            Payments."Payment Narration" := Rec."Requisition No" + ' Fuel Requisition for ' + Rec."Vehicle Reg No";
                            Payments."Account Type" := Payments."account type"::Employee;
                            Payments."Account No." := Rec.Driver;
                            Payments."Account Name" := Rec."Driver Name";
                            Payments."Pre-Assigned No." := Rec."Requisition No";
                            Payments.Validate("Account No.");
                            UserSetup.Get(UserId);
                            //Payments.
                            Payments.Date := Today;
                            if Payments.Insert(true) then begin
                                PVLines.Init;
                                PVLines."Document Type" := Payments."Document Type";
                                PVLines.No := Payments."No.";
                                PVLines."Account Type" := PVLines."account type"::Vendor;

                                PVLines."Account No" := Rec."Vendor(Dealer)";
                                PVLines.Validate("Account No");
                                PVLines.Amount := Rec."Total Price of Fuel";
                                PVLines.Validate(Amount);
                                PVLines.Insert(true);
                                //MESSAGE('%1 Created Successfully', );

                                Rec."PO Created" := true;
                                Rec."PO Created By" := UserId;
                                Rec."Posted Invoice No" := Payments."No.";
                                if Confirm('%1 Created Successfully, Would you like to open it?', true, Payments."No.") then begin
                                    Payments.Reset;
                                    Payments.SetRange(Payments."No.", Payments."No.");
                                    Page.Run(57017, Payments);
                                end;
                            end;
                        end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Requisition No", Rec."Requisition No");
                    Report.Run(59019, true, true, Rec);
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadImprestDocuments(DMSDocuments."document type"::"Fuel Requisition", Rec."Requisition No", 'Fuel Requisition', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                end;
            }
        }



    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        updatecontrols;
        DocType := DocType::FuelReq;
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."Requisition No");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Fuel;
        Rec."Request Date" := WorkDate();
        Rec.Status := Rec.Status::Open;
        PendingApp := false;
        Approved := true;
        // if Rec.Status = Rec.Status::"Pending Approval" then
        //     PendingApp := true;
        if Rec.Status = Rec.Status::Approved then
            PendingApp := true;
    end;

    trigger OnOpenPage()
    begin
        if (Rec.Status = Rec.Status::Approved) then
            Approved := false;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::Fuel;
        Rec."Request Date" := Today;
        Rec.Status := Rec.Status::Open;
        PendingApp := false;
        //IF FltUserSetup.GET(USERID) THEN BEGIN
        //FltUserSetup.TESTFIELD("User Department");
        Rec."Prepared By" := UserId;
        //Department:=FltUserSetup."User Department";
        //END ELSE
        //ERROR(Text0001);
    end;

    var
        VendorEditable: Boolean;
        TotalAmountEditable: Boolean;
        RequestDateEditable: Boolean;
        chequeEditable: Boolean;
        Payments: Record payments;
        PVLines: Record "PV Lines";
        Fuel: Record "Fuel & Maintenance Requisition";
        UserSetup: Record "User Setup";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PendingApp: Boolean;
        Approved: Boolean;


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VendorEditable := true;
            TotalAmountEditable := true;
            RequestDateEditable := false;
            chequeEditable := false;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                VendorEditable := false;
                TotalAmountEditable := false;
                RequestDateEditable := false;
                chequeEditable := false;

            end else
                if Rec.Status = Rec.Status::Approved then begin
                    VendorEditable := false;
                    TotalAmountEditable := false;
                    RequestDateEditable := false;
                    chequeEditable := true;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        VendorEditable := false;
                        TotalAmountEditable := false;
                        RequestDateEditable := false;
                        chequeEditable := false;

                    end
    end;
}



