namespace KICD.KICD;

page 50224 "Welfare Contributions"
{
    Caption = 'Welfare Contributions';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "Welfare Contribution Header";
    SourceTableView = WHERE("Welfare Type" = FILTER(Contribution));
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contribution No"; Rec."Welfare No.")
                {
                    ToolTip = 'Specifies the value of the Welfare No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
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
        area(creation)
        {
            action("Import Contributions")
            {
                ToolTip = 'Executes the Import Contributions action.';
            }
        }
    }
}