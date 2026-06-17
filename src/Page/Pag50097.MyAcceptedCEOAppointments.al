page 50097 "My Accepted CEO Appointments"
{
    ApplicationArea = All;
    Caption = 'My Accepted CEO Appointments';
    PageType = List;
    SourceTable = "CEO Appointment";
    Editable = false;
    UsageCategory = Documents;
    CardPageId = "My Accepted CEO Appointment";
    SourceTableView = where("Appointment Status" = filter(Accepted));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
