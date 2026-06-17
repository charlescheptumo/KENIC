page 50096 "My CEO Appointment"
{
    ApplicationArea = All;
    Caption = 'My CEO Appointment';
    PageType = Card;
    SourceTable = "CEO Appointment";
    SourceTableView = where("Appointment Status" = filter(Open | "Pending Acceptance" | Reassigned | Rescheduled));

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                    Editable = false;
                }
                field("Requested by Employee No"; Rec."Requested by Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.', Comment = '%';
                }
                field("Requested by Employee Name"; Rec."Requested by Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Booking Type field.', Comment = '%';
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Date field.', Comment = '%';
                }
                field("Appointment Time"; Rec."Appointment Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Time field.', Comment = '%';
                }
                field("Appointment End Date"; Rec."Appointment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment End Date field.', Comment = '%';
                }
                field("Appointment End Time"; Rec."Appointment End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment End Time field.', Comment = '%';
                }
                field("Is Online?"; Rec."Is Online?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Online? field.', Comment = '%';
                }
                field("Meeting Subject"; Rec."Meeting Subject")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Subject field.', Comment = '%';
                }
                field("Meeting Venue"; Rec."Meeting Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Venue field.', Comment = '%';
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Booking Status field.', Comment = '%';
                }
                field("Rescheduled Date"; Rec."Rescheduled Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rescheduled Date field.', Comment = '%';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Request Appointment")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = BookingsLogo;
                Caption = '&Request Appointment';
                ToolTip = 'Executes the &Request Appointment action.';

                trigger OnAction()
                begin
                    // Emp.Get(Rec."Employee No");
                    Emp.Get(Rec."CEO No");
                    if Emp."Company E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."Company E-Mail";

                    Subject := 'Booking for an Appointment';
                    Body += 'Dear ' + Emp."First Name" + ',';
                    // Body += '<br>I am currently booking for an appointment at this date and time' + Rec."Appointment Date" + '.';
                    Body += '<br>There is an appointment booking awaiting for your action. <br> ';
                    Body += '<BR>Kindly find this as the base of the discussion during the appointment:' + Rec.Description;
                    Body += '<br>Kindly log in into the Business Central System to confirm your availability. <br> ';
                    Body += '<br> Kind Regards, <br> <br> ' + Emp."First Name" + ' ' + Emp."Middle Name" + '.';

                    // EmailMess.Create(Recepient, Subject, Body, true);
                    // Email.Send(EmailMess, EmailScen::Default);
                    Message('You have Requested for an Appointment');
                    Rec."Appointment Status" := Rec."Appointment Status"::"Pending Acceptance";
                    // CustomFunc.CreateEvent(Recepient);
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."CEO No" = '' then begin
            Emp.Reset();
            Emp.SetRange(CEO, true);
            if Emp.Find('-') then begin
                Rec."CEO No" := Emp."No.";
                Rec."CEO Email" := Emp."E-Mail";
            end
        end;
        UserSet.Get(UserId);
        if Rec."Requested By Employee Name" = '' then begin
            // Rec."Requested By" := UserSet.UserName;
            Rec."Requested By Employee Name" := UserSet."Employee Name";
        end;
        Rec."Appointment Status" := Rec."Appointment Status"::Open;
    end;

    trigger OnAfterGetRecord()
    begin
        UserSet.Get(UserId);
        Rec."Requested by Employee No" := UserSet."Employee No.";
        Rec."Requested by Employee Name" := UserSet."Employee Name";
        if Rec."Requested By Employee Name" = '' then begin
            // Rec."Requested By" := UserSet.UserName;
            Rec."Requested By Employee Name" := UserSet."Employee Name";
        end
    end;

    var
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Emp: Record Employee;
        Recepient, Subject, Body : Text;
        CustomFunc: Codeunit "Custom Function";
        UserSet: Record "User Setup";
}
