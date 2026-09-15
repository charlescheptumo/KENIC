page 69189 "Overtime Types List"
{
    // Publish under Web Services with Service Name: OvertimeTypes
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Overtime Type Rates";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Overtime Type"; Rec."Overtime Type")
                {
                    ApplicationArea = Basic;
                }
                field("Overtime Rate"; Rec."Overtime Rate")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}