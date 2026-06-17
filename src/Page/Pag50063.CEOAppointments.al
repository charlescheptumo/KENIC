page 50063 "CEO Appointments"
{
    ApplicationArea = All;
    Caption = 'CEO Appointments';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "CEO Appointment";
    CardPageId = "CEO Appointment";
    SourceTableView = where("Appointment Status" = filter("Pending Acceptance"));

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Booking Status"; Rec."Appointment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Booking Status field.', Comment = '%';
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
                field("Requested By"; Rec."Requested By Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
                field("Requested By Name"; Rec."Requested By Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By Name field.', Comment = '%';
                }
            }
        }
    }
}
