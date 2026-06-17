#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59020 "Pending Requisition Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Transport Requisition";
    SourceTableView = where(Status = filter("Pending Approval"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transport Requisition No field.';
                }
                field(Commencement; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Commencement field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                // field("Vehicle Allocated"; Rec."Vehicle Allocated")
                // {
                //     ApplicationArea = All;
                //     Editable = NotUserId;
                //     ToolTip = 'Specifies the value of the Vehicle Allocated field.', Comment = '%';
                // }
                // field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                // {
                //     ApplicationArea = All;
                //     Editable = false;

                //     ToolTip = 'Specifies the value of the Vehicle Allocated by field.', Comment = '%';
                // }
                // field("Driver Allocated"; Rec."Driver Allocated")
                // {
                //     ApplicationArea = All;
                //     Editable = NotUserId;

                //     ToolTip = 'Specifies the value of the Driver Allocated field.', Comment = '%';
                // }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Request field.';
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Odometer Reading field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Loaded to WorkTicket field.';
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time out field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Requested field.';
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Closing Odometer Reading field.';
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Work Ticket No field.';
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Days Requested field.';
                }
                field("Approved Imprest Memo"; Rec."Approved Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of Approved Imprest Memo Requested field.';
                }
                field("Authorized  By"; Rec."Authorized  By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Authorized  By field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = All;
                    Editable = Edit;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vehicle Allocated field.', Comment = '%';
                }
                field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                {
                    ApplicationArea = All;
                    Editable = Edit;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vehicle Allocated by field.', Comment = '%';
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = All;
                    Editable = Edit;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Driver Allocated field.', Comment = '%';
                }

            }
            group(Purpose)
            {
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
            part("Transport Requisition Staff"; "Travel Requisition Staff")
            {
                SubPageLink = "Req No" = field("Transport Requisition No");
            }
            part(Control5; "Non Staff Tavel Request")
            {
                SubPageLink = "Req No" = field("Transport Requisition No");
            }
            part(Control14; "Driver Vehicle Allocation")
            {
                Caption = 'Driver Vehicle Allocation';
                ApplicationArea = Basic;
                SubPageLink = "Requisition Number" = field("Transport Requisition No");
                Visible = drivervehicleallocationtabsvisible;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = false;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                    CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Open);
                    Rec.TestField(Commencement);
                    Rec.TestField(Destination);
                    Rec.TestField("Date of Trip");
                    Rec.TestField("Purpose of Trip");

                    VarVariant := Rec;
                    if CustomApprovalsMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovalsMgt.OnSendDocForApproval(VarVariant);

                    //  if ApprovalsMgmt.CheckFleetApprovalsWorkflowEnabled(Rec) then
                    //    ApprovalsMgmt.OnSendFleetForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                var
                    CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField(Rec.Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
                    //   if Status=Status::"Pending Approval" then
                    //ApprovalsMgmt.OnCancelFleetApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
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
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        updatecontrols();
        drivervehicleallocationtabsvisible := false;
        if Rec.Status in [Rec.Status::Approved, Rec.Status::Cancelled, Rec.Status::Closed, Rec.Status::Rejected, Rec.Status::"Pending Approval"] then begin
            drivervehicleallocationtabsvisible := true;
        end;

        // DocType := DocType::"Transport Requisition";
        // CurrPage.Attachment.Page.Documenttype(DocType, Rec."Transport Requisition No");
    end;

    trigger OnAfterGetRecord()
    begin
        // "Purpose of Trip".CREATEINSTREAM(ObjInstr);
        // Obj.READ(ObjInstr);
        // ObjText:=FORMAT(Obj);
        drivervehicleallocationtabsvisible := false;
        if Rec.Status in [Rec.Status::Approved, Rec.Status::Cancelled, Rec.Status::Closed, Rec.Status::Rejected, Rec.Status::"Pending Approval"] then begin
            drivervehicleallocationtabsvisible := true;
        end;
        Edit := false;
    end;

    trigger OnModifyRecord(): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if UserSetup."User ID" <> Rec."User Id" then begin
            NotUserId := true;
        end else begin
            Error('You cannot assign the Vehicle and Driver');
        end;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Open then
            Edit := false;

        if (Rec.Status = Rec.Status::"Pending Approval") and (Rec."User Id" <> UserId) then
            Edit := true;
    end;

    var
        TransportReqEditable: Boolean;
        CommencementEditable: Boolean;
        DensitationEditable: Boolean;
        VehicleEditable: Boolean;
        DriverEditable: Boolean;
        DriverNameEditable: Boolean;
        allocatedbyEditable: Boolean;
        DepartmentEditable: Boolean;
        DaterequestedEditable: Boolean;
        TimeRequestedEditable: Boolean;
        DateofTripEditable: Boolean;
        TimeoutEditable: Boolean;
        TimeInEditable: Boolean;
        JourneyEditable: Boolean;
        openingMileageEditable: Boolean;
        closingMileageEditable: Boolean;
        NoofDaysEditable: Boolean;
        loadedEditable: Boolean;
        workticketEditable: Boolean;
        purposeEditable: Boolean;
        authorisedEditable: Boolean;
        lines: Record "Travel Requisition Staff";
        line: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        NotUserId: Boolean;
        Edit: Boolean;
        drivervehicleallocationtabsvisible: Boolean;


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := true;
            DriverEditable := true;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := true;
            TimeRequestedEditable := true;
            DateofTripEditable := true;
            TimeoutEditable := true;
            JourneyEditable := true;
            openingMileageEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            authorisedEditable := false;
            line := true;
            NotUserId := false;
        end;
        if Rec.Status = Rec.Status::"Pending Approval" then begin
            TransportReqEditable := false;
            CommencementEditable := false;
            DensitationEditable := false;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := false;
            TimeRequestedEditable := false;
            DateofTripEditable := false;
            TimeoutEditable := false;
            JourneyEditable := false;
            openingMileageEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            authorisedEditable := false;
        end;
        if Rec.Status = Rec.Status::Approved then begin
            TransportReqEditable := false;
            CommencementEditable := false;
            DensitationEditable := false;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := true;
            workticketEditable := true;
            DaterequestedEditable := false;
            TimeRequestedEditable := false;
            DateofTripEditable := false;
            TimeoutEditable := false;
            JourneyEditable := false;
            openingMileageEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            authorisedEditable := false;
            line := false;
            NotUserId := false;
        end;

        if Rec.Status = Rec.Status::Rejected then begin
            TransportReqEditable := false;
            CommencementEditable := false;
            DensitationEditable := false;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := false;
            TimeRequestedEditable := false;
            DateofTripEditable := false;
            TimeoutEditable := false;
            JourneyEditable := false;
            openingMileageEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            authorisedEditable := false;
            line := false;
            NotUserId := false;
        end
    end;
}

