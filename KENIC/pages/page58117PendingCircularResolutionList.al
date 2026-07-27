page 58117 "Circular Resolution List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Circular Resolution Header";
    Caption = 'Pending Circular Resolutions';
    Editable = false;
    CardPageId = "Circular Resolution Card";
    SourceTableView =
                        where(
                            Status = filter(Open | "Pending Approval"),
                            "Approval Status" = filter(Open | "Pending Approval")
                        );

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique resolution number.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the resolution title.';
                }
                // field("Department Code"; Rec."Department Code")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the department responsible for or targeted by this resolution.';
                // }
                field("Resolution Type"; Rec."Resolution Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the resolution type.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the voting or document status.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the workflow approval status.';
                }
                field("Voting Deadline"; Rec."Voting Deadline")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last date and time members can cast their votes.';
                }
                field("Total Members"; Rec."Total Members")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of members invited to vote.';
                }
                field("Total Votes Cast"; Rec."Total Votes Cast")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of votes submitted so far.';
                }
                field("Winning Option"; Rec."Winning Option")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the winning choice after the voting process closes.';
                }

                field("Resolution Outcome"; Rec."Resolution Outcome")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the winning choice after the voting process closes.';
                }
            }
        }
    }
}