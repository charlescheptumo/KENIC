page 69188 "Overtime Lines List"
{
    // Publish under Web Services with Service Name: OvertimeLinesList
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Overtime lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("EmpNo."; Rec."EmpNo.")
                {
                    ApplicationArea = Basic;
                }
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                }
                field("Overtime Type"; Rec."Overtime Type")
                {
                    ApplicationArea = Basic;
                }
                field("Overtime Rate"; Rec."Overtime Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                }
                field(Hours; Rec.Hours)
                {
                    ApplicationArea = Basic;
                }
                field("Work Done"; Rec."Work Done")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}