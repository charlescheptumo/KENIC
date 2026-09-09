page 69187 "Overtime Header List"
{
    // Publish under Web Services with Service Name: OvertimeHeaderList
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Overtime Header";
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
                field("EMp No."; Rec."EMp No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Hours"; Rec."Total Hours")
                {
                    ApplicationArea = Basic;
                }
                field(Converted; Rec.Converted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}