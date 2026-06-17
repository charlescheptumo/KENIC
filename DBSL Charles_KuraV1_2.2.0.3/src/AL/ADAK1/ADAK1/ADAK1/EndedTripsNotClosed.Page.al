#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59138 "Ended Trips Not Closed"
{
    ApplicationArea = Basic;
    Caption = 'Assigned Not Closed Fleet Requests';
    CardPageID = "Fleet Requisition Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Transport Requisition";
    SourceTableView = order(ascending)
                      where(Status = const(Approved));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected field.';
                }
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Requisition No field.';
                }
                field(Commencement; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Request field.';
                }
                field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Allocated by field.';
                }
                field("Number of Assigned Drivers"; Rec."Number of Assigned Drivers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Assigned Drivers field.';
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Odometer Reading field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loaded to WorkTicket field.';
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time out field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Requested field.';
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Odometer Reading field.';
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Ticket No field.';
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Days Requested field.';
                }
                field("Authorized  By"; Rec."Authorized  By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authorized  By field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Close Multiple Trips")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Close Multiple Trips action.';

                trigger OnAction()
                begin
                    TransportReq.Reset;
                    TransportReq.SetRange(TransportReq.Status, TransportReq.Status::Approved);
                    TransportReq.SetRange(TransportReq.Selected, true);
                    SelectedNo := TransportReq.Count();
                    if SelectedNo = 0 then
                        Error('No record selected..')
                    else
                        if Confirm('Are you sure you want to Bulk close %1 Records?', true, SelectedNo) then begin
                            TransportReqs.Reset;
                            TransportReqs.SetRange(TransportReqs.Status, TransportReqs.Status::Approved);
                            TransportReqs.SetRange(TransportReqs.Selected, true);
                            if TransportReqs.Find('-') then begin
                                repeat
                                    TransportReqs.Status := TransportReqs.Status::Closed;
                                    TransportReqs.Selected := false;
                                    TransportReqs.Modify;
                                until TransportReqs.Next = 0;
                                Message('%1 Records Closed', SelectedNo);
                            end;
                        end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.SetFilter("Trip End Date", '>=%1', Today);
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields("Number of Assigned Drivers");
        Rec.SetFilter("Number of Assigned Drivers", '<>%1', 0);
        TransportReq.Reset;
        TransportReq.SetRange(TransportReq.Selected, true);
        if TransportReq.Find('-') then begin
            repeat
                TransportReq.Selected := false;
                TransportReq.Modify;
            until TransportReq.Next = 0
        end;
    end;

    var
        TransportReq: Record "Transport Requisition";
        SelectedNo: Integer;
        TransportReqs: Record "Transport Requisition";
}

