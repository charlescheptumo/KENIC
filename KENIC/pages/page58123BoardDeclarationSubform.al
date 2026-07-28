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
                field("Declaration No."; Rec."Declaration No.")
                {
                    ApplicationArea = All;
                }
                field("Interest Type"; Rec."Interest Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of interest declared.';
                    Visible = true;
                }
                field("Interest Type Description";Rec."Interest Type Description")
                {
                    ApplicationArea = All;
                    ToolTip =  'Specifies the type of interest declared.';
                
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

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when interest began.';
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when interest ended, if it is no longer active.';
                }

                field("Potential Conflict"; Rec."Potential Conflict")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if this interest poses a potential conflict of interest.';
                }

                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any additional remarks or details regarding this interest.';
                }
            }
        }
    }
}