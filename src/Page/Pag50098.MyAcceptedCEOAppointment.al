page 50098 "My Accepted CEO Appointment"
{
    ApplicationArea = All;
    Caption = 'My Accepted CEO Appointment';
    PageType = Card;
    SourceTable = "CEO Appointment";
    Editable = false;
    CardPageId = "My Accepted CEO Appointment";
    SourceTableView = where("Appointment Status" = filter(Accepted));

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
                field("Employee No"; Rec."Requested by Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.', Comment = '%';
                }
                field("Employee Name"; Rec."Requested by Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
                field("Rescheduled Date"; Rec."Rescheduled Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rescheduled Date field.', Comment = '%';
                }
                field("CEO Remarks"; Rec."CEO Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Remarks field.', Comment = '%';
                }
            }
        }
    }
}
