page 58123 "Board Declaration Subform"
{
    PageType = ListPart;
    SourceTable = "Board Declaration Line";
    Caption = 'Declaration Lines';
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Interest Type"; Rec."Interest Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of interest declared.';
                }
                field(Organization; Rec.Organization)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the organization or company associated with this interest.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies details about the declared interest.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the percentage of ownership or shareholding, if applicable.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this declaration interest is active.';
                }
            }
        }
    }
}