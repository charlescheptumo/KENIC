page 58121 "Board Declarations"
{
    PageType = List;
    SourceTable = "Board Declaration Header";
    Caption = 'Board Declarations';
    CardPageId = "Board Declaration Card";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the declaration number.';
                }
                field("Board Member No."; Rec."Board Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member number.';
                }
                field("Board Member Name"; Rec."Board Member Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member name.';
                }
                field("Declaration Type"; Rec."Declaration Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this declaration is Annual or for a specific Meeting.';
                }
                  field("Declaration Date"; Rec."Declaration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of declaration.';
                }
                field("Declaration Status"; Rec."Declaration Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current approval status.';
                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who submitted the record.';
                }
            }
        }
    }
}