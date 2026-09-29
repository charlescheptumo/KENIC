page 58290 "Disciplinary Case WS"
{
    PageType = List;
    SourceTable = "HR Disciplinary Cases";
    Editable = false;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(Cases)
            {
                field(No; Rec."Employee No") { ApplicationArea = All; Caption = 'Employee No'; }
                field("Case Number"; Rec."Case Number") { ApplicationArea = All; }
                field("Case Description"; Rec."Case Description") { ApplicationArea = All; }
                field("Response to Show Cause"; Rec."Response to Show Cause") { ApplicationArea = All; }
                field(Accuser; Rec.Accuser) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Date of Complaint"; Rec."Date of Complaint") { ApplicationArea = All; }
            }
        }
    }
}