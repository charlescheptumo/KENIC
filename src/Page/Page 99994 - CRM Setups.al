page 99994 "CRM Setups"
{
    PageType = Card;
    SourceTable = "CRM Setups";
    ApplicationArea = Basic;
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Company's Stakeholders No."; Rec."Company's Stakeholders No.")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Company''s Stakeholders No. field.';
                }
                field("Security Incidence No."; Rec."Security Incidence No.")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Security Incidence No. field.';
                }
                field("Staff Checkin No."; Rec."Staff Checkin No.")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Staff Checkin No. field.';
                }
                field("Vehicles Checkin No."; Rec."Vehicles Checkin No.")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Vehicles Checkin No. field.';
                }
                field("Guard Attendance Reg No."; Rec."Guard Attendance Reg No.")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Guard Attendance Reg No. field.';
                }
                field("External Security No."; Rec."External Security No.")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the External Security No. field.';
                }
                field("Service Charter No."; Rec."Service Charter No.")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Service Charter No. field.';
                }
                field("Complaints No."; Rec."Complaints No.")
                {
                    ToolTip = 'Specifies the value of the Complaints No. field.', Comment = '%';
                }
                field("Complements No."; Rec."Compliments No.")
                {
                    ToolTip = 'Specifies the value of the Complements No. field.', Comment = '%';
                }
                field("Enquiries No."; Rec."Enquiries No.")
                {
                    ToolTip = 'Specifies the value of the Enquiries No. field.', Comment = '%';
                }
                field("Feedback No."; Rec."Feedback No.")
                {
                    ToolTip = 'Specifies the value of the Feedback No. field.', Comment = '%';
                }
                field("Guest Walkin No."; Rec."Guest Walkin No.")
                {
                    ToolTip = 'Specifies the value of the Guest Walkin No. field.', Comment = '%';
                }
            }
            group("Corporate Function Reminders")
            {
                Caption = 'Corporate Function Reminders';
                field("Reminder 1 Period"; Rec."Reminder 1 Period")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Reminder 1 Period field.';
                }
                field("Reminder 2 Period"; Rec."Reminder 2 Period")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Reminder 2 Period field.';
                }
                field("Reminder 3 Period"; Rec."Reminder 3 Period")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Reminder 3 Period field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}



