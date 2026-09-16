page 58260 "Board Pack Documents List"
{
    PageType = List;
    SourceTable = "Board Pack Document";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Meeting Code"; Rec."Meeting Code") { ApplicationArea = All; }
                field("File Name"; Rec."File Name") { ApplicationArea = All; }
                field("SharePoint Link"; Rec."SharePoint Link") { ApplicationArea = All; }
                field("Uploaded By"; Rec."Uploaded By") { ApplicationArea = All; }
                field("Date Uploaded"; Rec."Date Uploaded") { ApplicationArea = All; }
            }
        }
    }
}