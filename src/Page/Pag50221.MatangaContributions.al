namespace KICD.KICD;

page 50221 "Matanga Contributions"
{
    Caption = 'Matanga Contributions';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "Matanga Contribution Header";
    SourceTableView = WHERE("Welfare Category" = FILTER(1));
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Welfare No."; Rec."Welfare No.")
                {
                    ToolTip = 'Specifies the value of the Welfare No. field.';
                }
                field("Welfare Type"; Rec."Welfare Type")
                {
                    ToolTip = 'Specifies the value of the Welfare Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Welfare Category"; Rec."Welfare Category")
                {
                    ToolTip = 'Specifies the value of the Welfare Category field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}