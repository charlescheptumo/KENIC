#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

Page 55003 "Board Meeting Card"
{
    PageType = Card;
    SourceTable = "Board Meetings";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start date field.';
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start time field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End time field.';
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue/Location field.';
                }
                field("Convened by"; Rec."Convened by")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Convened by field.';
                }
                field("Contact Tel. No"; Rec."Contact Tel. No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contact Tel. No field.';
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contact Email field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Meeting group Code"; Rec."Meeting group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting group Code field.';
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Type field.';
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting group field.';
                }
                field("Conference Venue"; Rec."Conference Venue")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Conference Venue field.';
                }
                field("Parking Arrangement"; Rec."Parking Arrangement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parking Arrangement field.';
                }
                field("Access requirement"; Rec."Access requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Access requirement field.';
                }
            }

            part(AttendanceLines; "Board Meeting Attendance")
            {
                ApplicationArea = Basic;
                Caption = 'Attendees';
                SubPageLink = "Meeting Code" = field(No);
                UpdatePropagation = Both;
            }
        }

        area(factboxes)
        {
            part(Attachments; "Doc. Attachment List Factbox")
            {
                ApplicationArea = Basic;
                SubPageLink = "Table ID" = const(55002), "No." = field(No);
            }
            systempart(Control22; Notes) { }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup24)
            {
                action("Board Meeting Attendance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Attendance';
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Attendance";
                    RunPageLink = "Meeting Code" = field(No);
                    ToolTip = 'Executes the Board Meeting Attendance action.';
                }

                action("Meeting Agenda")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Agenda';
                    Image = Agreement;
                    Promoted = true;
                    Visible = false;
                    PromotedIsBig = true;
                    RunObject = Page "Meeting Agenda";
                    RunPageLink = "Meeting Code" = field(No);
                    ToolTip = 'Executes the Meeting Agenda action.';
                }

                action("Publish to Portal")
                {
                    ApplicationArea = Basic;
                    Image = Action;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to publish this?', false, true) then begin
                            Rec.Published := true;
                            Rec.Modify(true);
                        end;
                    end;
                }

                action("Close Meeting")
                {
                    ApplicationArea = Basic;
                    Image = Action;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to close this?', false, true) then begin
                            Rec.Closed := true;
                            Rec.Status := Rec.Status::Completed;
                            Rec.Modify(true);
                        end;
                    end;
                }

                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = Rec.Status = Rec.Status::"Pending Approval";

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Completed;
                        Rec.Modify(true);
                    end;
                }

                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = Rec.Status = Rec.Status::"Pending Approval";

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                    end;
                }

                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = Rec.Status = Rec.Status::"Pending Approval";

                    trigger OnAction()
                    begin
                    end;
                }

                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = Rec.Status = Rec.Status::Open;

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }

                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = Rec.Status = Rec.Status::"Pending Approval";

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetApprovalEntriesExist;
    end;

    trigger OnAfterGetRecord()
    begin
        SetApprovalEntriesExist;
    end;

    local procedure SetApprovalEntriesExist()
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetRange("Table ID", Database::"Board Meetings");
        ApprovalEntry.SetRange("Record ID to Approve", Rec.RecordId);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        OpenApprovalEntriesExist := not ApprovalEntry.IsEmpty;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
}