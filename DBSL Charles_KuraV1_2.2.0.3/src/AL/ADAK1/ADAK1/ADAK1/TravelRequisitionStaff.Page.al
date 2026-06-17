
/// <summary>
/// Page Travel Requisition Staff (ID 59017).
/// </summary>

Page 59017 "Travel Requisition Staff"
{
    CardPageID = "Fleet Requisition Card";
    PageType = ListPart;
    SourceTable = "Travel Requisition Staff";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Req No"; Rec."Req No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Req No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Employee List";
                    TableRelation = Employee;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Days Requested field.';
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Trip End Date field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }
                field("Reassigned?"; Rec."Reassigned?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reassigned? field.';
                }
                field("New Trip"; Rec."New Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the New Trip field.';
                }
                field("Date Reassigned"; Rec."Date Reassigned")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Reassigned field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Reassign to Another Trip")
                {
                    ApplicationArea = Basic;
                    Image = Refresh;
                    ToolTip = 'Executes the Reassign to Another Trip action.';

                    trigger OnAction()
                    begin
                        if Rec."Employee No" = '' then
                            Error('No employee selected..');
                        TransportReq.Reset;
                        TransportReq.SetRange("Transport Requisition No", Rec."Req No");
                        if TransportReq.FindSet then begin
                            if TransportReq.Status = TransportReq.Status::Approved then
                                Error('You cannot reassign employee on a trip to another trip');

                        end;
                        if Rec."Reassigned?" = true then
                            Error('The employee has already been reassigned to another trip');
                        TravelRequ.Reset;
                        TravelRequ.SetRange("Employee No", Rec."Employee No");
                        TravelRequ.SetRange("Req No", Rec."Req No");
                        if Dialog.Confirm('Are you sure you want to reasign %1 to another trip?', true, Rec."Employee Name") then
                            Report.Run(59000, true, true, TravelRequ);
                    end;
                }
            }
        }
    }

    var
        TravelRequ: Record "Travel Requisition Staff";
        TransportReq: Record "Transport Requisition";
}



