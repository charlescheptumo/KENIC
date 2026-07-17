page 58115 "Resolution Options Subform"
{
    PageType = ListPart;
    SourceTable = "Circular Resolution Option";
    Caption = 'Resolution Options';
    InsertAllowed = false;    
    DeleteAllowed = false;    
    ModifyAllowed = false;    

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Option Code"; Rec."Option Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique code identifier for this option (e.g., FOR, AGAINST).';
                    Editable = false;
                }
                field("Option Description"; Rec."Option Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user-facing text displayed to voting board members.';
                    Editable = false;
                }
                field("Display Order"; Rec."Display Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the order of appearance on the eBoard Portal screen.';
                    Editable = false;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this option is currently open for voting.';
                    Editable = false;
                }
                field("Vote Count"; Rec."Vote Count")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies how many board members have voted for this option.';
                }
            }
        }
    }
}