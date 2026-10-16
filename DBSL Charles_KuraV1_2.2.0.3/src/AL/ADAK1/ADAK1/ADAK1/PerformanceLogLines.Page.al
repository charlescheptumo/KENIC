#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80199 "Performance Log Lines"
{
    PageType = ListPart;
    SourceTable = "Plog Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiative No. field.';
                }
                field(KeyResultArea; KeyResultArea)
                {
                    ApplicationArea = Basic;
                    Caption = 'Key Result Area';
                    Editable = false;
                    ToolTip = 'Specifies the key result area of the activity.';
                }
                field("Sub Intiative No"; Rec."Sub Intiative No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the objective.';
                }
                field("Activity Decription"; Rec."Activity Decription")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity';
                    Editable = false;
                    ToolTip = 'Specifies the activity.';
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective Weight';
                    Editable = false;
                    ToolTip = 'Specifies the objective weight.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the target quantity.';
                }
                field("Achieved Target"; Rec."Achieved Target")
                {
                    ApplicationArea = Basic;
                    Caption = 'Achieved Qty';
                    ToolTip = 'Specifies the quantity achieved.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Comments';
                    ToolTip = 'Specifies the employee comments on achievement.';
                }
                field("Achieved Weight(%)"; Rec."Achieved Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Rating';
                    Editable = false;
                    ToolTip = 'Employee rating in points, calculated by Update Activity Achievements.';
                }
                field("Supervisor rating"; Rec."Supervisor rating")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reviewer''s Comments';
                    ToolTip = 'Specifies the reviewer''s comments.';
                }
                field("Supervisor Score"; Rec."Supervisor Score")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reviewer''s Rating';
                    ToolTip = 'Reviewer rating in points, cannot exceed the objective weight.';
                }
                field("Final Score"; Rec."Final Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = '40% employee rating plus 60% reviewer rating.';
                }
            }

        }
    }

    actions
    {
        area(processing)
        {
            action("Sub Plog Lines")
            {
                ApplicationArea = Basic;
                RunObject = Page "Sub Plog Lines";
                RunPageLink = "PLog No." = field("PLog No."),
                              "Initiative No." = field("Initiative No."),
                              "Personal Scorecard ID" = field("Personal Scorecard ID");
                ToolTip = 'Executes the Sub Plog Lines action.';
                Visible = false;
            }
            action("Update Activity Achievements")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Update Activity Achievements action.';

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to update Sub-activity achievement?', true) then
                        Error('Sub-activity achievement not update');

                    //
                    // SubPlogLines.RESET;
                    // SubPlogLines.SETRANGE("PLog No.","PLog No.");
                    // SubPlogLines.SETRANGE("Employee No.","Employee No.");
                    // SubPlogLines.SETRANGE("Personal Scorecard ID","Personal Scorecard ID");
                    // SubPlogLines.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    // SubPlogLines.SETRANGE("Initiative No.","Initiative No.");
                    // SubPlogLines.CALCSUMS("Target Qty");
                    // IF SubPlogLines."Target Qty">"Target Qty" THEN
                    //ERROR('Total Sub Activity Targets %1 should be equal to Activity Target %2 ',
                    //       SubPlogLines."Target Qty","Target Qty");


                    SubPlogLines.Reset;
                    SubPlogLines.SetRange("PLog No.", Rec."PLog No.");
                    SubPlogLines.SetRange("Employee No.", Rec."Employee No.");
                    SubPlogLines.SetRange("Personal Scorecard ID", Rec."Personal Scorecard ID");
                    SubPlogLines.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                    SubPlogLines.SetRange("Initiative No.", Rec."Initiative No.");
                    SubPlogLines.CalcSums("Achieved Target");

                    Rec."Achieved Target" := SubPlogLines."Achieved Target";
                    TotalWeight := ((Rec."Achieved Target" / Rec."Target Qty") * 100) * (Rec."Weight %" / 100);
                    if TotalWeight > Rec."Weight %" then
                        TotalWeight := Rec."Weight %";

                    Rec."Achieved Weight(%)" := TotalWeight;
                    Rec.Modify;
                    Message('Updated Successfully');
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        KeyResultArea := Rec.GetKeyResultArea();
    end;

    var
        SubPlogLines: Record "Sub Plog Lines";
        TotalWeight: Decimal;
        KeyResultArea: Text[255];
}

