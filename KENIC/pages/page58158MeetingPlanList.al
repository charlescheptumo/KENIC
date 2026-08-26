page 58158 "Meeting Plan List"
{
    ApplicationArea = All;
    Caption = 'Meeting Plans';
    PageType = List;
    SourceTable = "Meeting Plans";
    CardPageId = "Meeting Plan Card";
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Id"; Rec."Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the meeting plan.';
                }
                field("Committee Id"; Rec."Committee Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board committee associated with this plan.';
                }
                field("Committee Description"; Rec."Committee Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the selected committee.';
                }
                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the title of the meeting plan.';
                }
                field("Year"; Rec."Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the year for the meeting plan.';
                }
                field("Quarter"; Rec."Quarter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the target quarter.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current status of the plan.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who created the record.';
                }
                field("Created At"; Rec."Created At")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when the record was created.';
                }
            }
        }
    }
}