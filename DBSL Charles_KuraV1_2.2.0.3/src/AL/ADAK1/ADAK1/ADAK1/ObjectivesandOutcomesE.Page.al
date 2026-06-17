#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80122 "Objectives and Outcomes-E"
{
    PageType = ListPart;
    SourceTable = "Objective Evaluation Result";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Evaluation ID"; Rec."Performance Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Performance Evaluation ID field.';
                    // Caption = 'Annual Performance Evaluation ID';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Scorecard ID"; Rec."Scorecard ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Scorecard ID field.';
                }
                field("Scorecard Line No"; Rec."Scorecard Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Scorecard Line No field.';
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective/Initiative field.';
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Performance Rating Scale field.';
                }
                field("Scale Type"; Rec."Scale Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Scale Type field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("self review qty"; Rec."Self-Review Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Self Review Qty';
                    ToolTip = 'Specifies the value of the Self Review Qty field.';
                }
                field("AppraiserReview Qty"; Rec."AppraiserReview Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Achieved/Supervisor Qty';
                    ToolTip = 'Specifies the value of the Achieved/Supervisor Qty field.';
                }
                field("Final/Actual Qty"; Rec."Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final/Appraiser Qty';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Final/Appraiser Qty field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Achieved Result"; Rec."Achieved Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Results Achieved field.';
                }
                field("Performance Appraisal"; Rec."Performance Appraisal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Appraisal field.';
                }
                field(Reasons; Rec.Reasons)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons field.';
                }
            }
        }
    }

    actions
    {
    }
}

