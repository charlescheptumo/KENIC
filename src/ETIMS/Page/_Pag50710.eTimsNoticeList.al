/// <summary>
/// Read-only list of KRA eTIMS notices (title, content, detail URL) retrieved from the eTIMS middleware.
/// </summary>
page 50710 "eTims-Notice List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Notice List';
    PageType = List;
    SourceTable = "ETIMS Notice";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Notice No"; Rec."Notice No") { }
                field(Title; Rec.Title) { }
                field(Content; Rec.Content) { }
                field("Detail URL"; Rec."Detail URL") { }
                field("Registered By"; Rec."Registered By") { }
                field("Register Date"; Rec."Register Date") { }
            }
        }
    }
}
