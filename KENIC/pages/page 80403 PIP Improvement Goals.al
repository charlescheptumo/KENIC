page 90403 "PIP Improvement Goals"
{
    Caption = 'Improvement Goals';
    PageType = ListPart;
    SourceTable = "PIP Improvement Goal";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Goal No.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Linked Area Line No."; Rec."Linked Area Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Linked Area Description"; Rec."Linked Area Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
