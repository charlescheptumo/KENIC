page 58143 "ComplianceObligationEmployees"
{
    PageType = ListPart;
    SourceTable = "Compliance Obligation Employee";
    Caption = 'Assigned Team Members';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}