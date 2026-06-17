page 50109 "Accepted CEO Appointment"
{
    ApplicationArea = All;
    Caption = 'Accepted CEO Appointment';
    PageType = Card;
    // Editable = false;
    SourceTable = "CEO Appointment";
    SourceTableView = where("Appointment Status" = filter(Accepted | Rescheduled));

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
                    ToolTip = 'Specifies the value of the Booking Status field.', Comment = '%';
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
            action("Add to Calendar")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = BookingsLogo;
                Caption = '&Add to Calendar';
                ToolTip = 'Executes the &Add to Calendar action.';

                trigger OnAction()
                begin
                    Emp.Get(Rec."Requested by Employee No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";
                    CustomFunc.CreateEvent(Rec);
                end;
            }
        }
    }
    var
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Emp: Record Employee;
        Recepient, Subject, Body : Text;
        CustomFunc: Codeunit "Custom Function";
        UserSet: Record "User Setup";
}
