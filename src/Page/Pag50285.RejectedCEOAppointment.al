namespace KICD.KICD;

page 50285 "Rejected CEO Appointment"
{
    ApplicationArea = All;
    Caption = 'Rejected CEO Appointment';
    PageType = Card;
    Editable = false;
    SourceTable = "CEO Appointment";
    SourceTableView = where("Appointment Status" = filter(Rejected));
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ToolTip = 'Specifies the value of the Appointment Date field.', Comment = '%';
                }
                field("Appointment Time"; Rec."Appointment Time")
                {
                    ToolTip = 'Specifies the value of the Appointment Time field.', Comment = '%';
                }
                field("Appointment End Date"; Rec."Appointment End Date")
                {
                    ToolTip = 'Specifies the value of the Appointment End Date field.', Comment = '%';
                }
                field("Appointment End Time"; Rec."Appointment End Time")
                {
                    ToolTip = 'Specifies the value of the Appointment End Time field.', Comment = '%';
                }
                field("Is Online?"; Rec."Is Online?")
                {
                    ToolTip = 'Specifies the value of the Is Online? field.', Comment = '%';
                }
                field("Meeting Subject"; Rec."Meeting Subject")
                {
                    ToolTip = 'Specifies the value of the Meeting Subject field.', Comment = '%';
                }
                field("Meeting Venue"; Rec."Meeting Venue")
                {
                    ToolTip = 'Specifies the value of the Meeting Venue field.', Comment = '%';
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                    ToolTip = 'Specifies the value of the Appointment Status field.', Comment = '%';
                }
                field("Requested by Employee No"; Rec."Requested by Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.', Comment = '%';
                }
                field("Requested by Employee Name"; Rec."Requested by Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
            }
        }
    }
}
