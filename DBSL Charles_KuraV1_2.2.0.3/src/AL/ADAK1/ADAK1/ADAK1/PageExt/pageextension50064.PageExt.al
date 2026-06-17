#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50064 "pageextension50064" extends "Job Task Lines Subform"
{
    layout
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Schedule (Total Cost)")
        {
            Caption = 'Budget Sum';
        }
        modify("Global Dimension 1 Code") { visible = true; }

        //Unsupported feature: Property Deletion (Visible) on ""Global Dimension 1 Code"(Control 67)".


        //Unsupported feature: Property Deletion (Visible) on ""Global Dimension 2 Code"(Control 69)".

        addafter(Description)
        {
            field("Road Section  Name"; Rec."Road Section  Name")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Section  Name field.';
            }
        }
        addafter("Global Dimension 2 Code")
        {
            field("Start Point(Km)"; Rec."Start Point(Km)")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Start Point(Km) field.';
            }
            field("End Point(Km)"; Rec."End Point(Km)")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the End Point(Km) field.';
            }
        }
        addafter(Totaling)
        {
            field("Surface Types"; Rec."Surface Types")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Surface Types field.';
            }
            field("Road Condition"; Rec."Road Condition")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Condition field.';
            }
            field("Funding Source"; Rec."Funding Source")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Funding Source field.';
            }
        }
        addafter("End Date")
        {
            field("Road Section ID"; Rec."Road Section ID")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Section ID field.';
            }
            field("Procurement Method"; Rec."Procurement Method")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Procurement Method field.';
            }
        }
        addafter("Amt. Rcd. Not Invoiced")
        {
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Department Code field.';
            }
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Directorate Code field.';
            }
            field(Division; Rec.Division)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Division field.';
            }
            field("Roads Category"; Rec."Roads Category")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Roads Category field.';
            }
            field("Fund Type"; Rec."Fund Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Fund Type field.';
            }
            field("Execution Method"; Rec."Execution Method")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Execution Method field.';
            }
            field(Commitments; Rec.Commitments)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Commitments field.';
            }
            field("Completed Length(Km)"; Rec."Completed Length(Km)")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Completed Length(Km) field.';
            }
        }
        moveafter(Description; "Global Dimension 1 Code")
    }
    actions
    {
        addafter("F&unctions")
        {
            group(Milestones)
            {
                Image = Setup;
                action(MilestoneLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Milestone & Lines';
                    Image = JobLines;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';

                    trigger OnAction()
                    var
                        MilestoneLine: Record "Milestones Lines";
                        MilestoneLines: Page "Milestones Lines";
                    begin
                        Rec.TestField("Job No.");
                        MilestoneLine.FilterGroup(2);
                        MilestoneLine.SetRange("Project No", Rec."Job No.");
                        MilestoneLine.SetRange("Task No", Rec."Job Task No.");
                        MilestoneLine.FilterGroup(0);
                        MilestoneLines.SetTableview(MilestoneLine);
                        MilestoneLines.Editable := true;
                        MilestoneLines.Run;
                    end;
                }
            }
        }
    }
}

