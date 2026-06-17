page 50211 "Pending Training Plans"
{
    Caption = 'Pending Training Plans';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = Basic;
    CardPageID = "Training Plan Header";
    Editable = false;
    SourceTable = "Training Plan Header";
    SourceTableView = where("Approved Status" = filter("Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Approved Status"; Rec."Approved Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Total Estimated Cost"; Rec."Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Estimated Cost field.';
                }
            }
        }
    }

    actions
    {
    }
}

