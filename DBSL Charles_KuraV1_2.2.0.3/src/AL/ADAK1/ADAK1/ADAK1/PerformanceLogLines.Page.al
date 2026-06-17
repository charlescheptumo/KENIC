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
                field("Activity Type"; Rec."Activity Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Type field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiative No. field.';
                }
                field("Sub Intiative No"; Rec."Sub Intiative No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Sub Intiative No field.';
                    Visible = false;
                }
                field("Activity Decription"; Rec."Activity Decription")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the  Activity Description field.';
                }
                field("Key Performance Indicator"; Rec."Key Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Key Performance Indicator field.';
                }
                field(Outcome; Rec.Outcome)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Start Date';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Due Date';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned Due Date field.';
                }
                field("Achieved Date"; Rec."Achieved Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Date field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Weight % field.';
                }
                field("Achieved Target"; Rec."Achieved Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Target field.';
                    Caption = 'Achieved Target %';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Q1 Achieved Target"; Rec."Q1 Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q1 Achieved Target field.';
                    Visible = false;
                }
                field("Q2 Achieved Target"; Rec."Q2 Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q2 Achieved Target field.';
                    visible = false;
                }
                field("Q3 AchievedTarget"; Rec."Q3 AchievedTarget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q3 Achieved Target';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q3 Achieved Target field.';
                    visible = false;
                }
                field("Q4 Achieved Target"; Rec."Q4 Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Q4 Achieved Target field.';
                    visible = false;
                }
                field("Remaining Targets"; Rec."Remaining Targets")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Remaining Targets field.';
                }
                field("Achieved Weight(%)"; Rec."Achieved Weight(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Achieved Weight(%) field.';
                }
                field(Variance; Rec.Variance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variance field.';

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

    var
        SubPlogLines: Record "Sub Plog Lines";
        TotalWeight: Decimal;
}

