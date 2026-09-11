page 69249 "Course Budget Alloc List"
{
    // Publish under Web Services with Service Name: CourseBudgetAllocationList
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Planning Line Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Plan Id"; Rec."Training Plan Id")
                {
                    ApplicationArea = Basic;
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}