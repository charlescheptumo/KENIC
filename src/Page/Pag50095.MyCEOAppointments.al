page 50095 "My CEO Appointments"
{
    ApplicationArea = All;
    Caption = 'My CEO Appointments';
    PageType = List;
    SourceTable = "CEO Appointment";
    CardPageId = "My CEO Appointment";
    SourceTableView = where("Appointment Status" = filter(Open | "Pending Acceptance" | Reassigned | Rescheduled));

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
                field("Rescheduled Date"; Rec."Rescheduled Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rescheduled Date field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
    UserSetup: Record "User Setup";
    begin
         UserSetup.Reset;
         UserSetup.SetRange("User ID", UserId);
         if UserSetup.Findfirst then begin
         Rec.SetRange("Requested by Employee No",UserSetup."Employee No.");
    end;  
    end;
}
