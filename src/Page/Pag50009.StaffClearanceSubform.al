page 50009 "Staff Clearance Subform"
{
    Caption = 'Staff Clearance Subform';
    PageType = ListPart;
    SourceTable = "Staff Clearance";
    Editable = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Staff Clearance Code"; Rec."Staff Clearance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Staff Clearance Code field.';
                    Visible = false;
                }
                field("FA Code"; Rec."FA Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the FA Code field.';
                }
                field("FA Description"; Rec."FA Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the FA Description field.';
                }
                field(Cleared; Rec.Cleared)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the FA field is cleared.';
                }
            }
        }
    }
}
