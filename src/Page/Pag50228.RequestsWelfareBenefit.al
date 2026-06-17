namespace KICD.KICD;

page 50228 "Requests Welfare Benefit"
{
    Caption = 'Requests Welfare Benefit';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "Request Welfare Benefit";
    SourceTableView = WHERE("Welfare Type" = FILTER(Benefit));
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
                field("Raised By"; Rec."Raised By")
                {
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ToolTip = 'Specifies the value of the Raisee Name field.';
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
                field("Benefit Allocation"; Rec."Benefit Allocation")
                {
                    ToolTip = 'Specifies the value of the Benefit Allocation field.';
                }
                field(Status; Rec.Status)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Welfare Type"; Rec."Welfare Type")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Welfare Type field.';
                }
            }
        }
    }

    actions
    {
    }
}