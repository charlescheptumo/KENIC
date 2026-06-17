
Page 80078 "Objectives and Outcomes"
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Objective/Initiative field.';
                }
                field("Departmental Objective"; Rec."Departmental Objective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Departmental Objective field.';
                    //  Visible = false;
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                    // Editable = false;
                    visible = false;
                }
                field(outcome;Rec.Outcome)
                {
                ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Key Performance Indicator"; Rec."Key Performance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Key Performance Indicator field.';
                    // Editable = false;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    ToolTip = 'Specifies the value of the Target Qty field.';
                    // Editable = false;
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Weight % field.';
                }
                field("Self-Review Qty"; Rec."Self-Review Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Self-Review Qty field.';
                    // Editable = false;
                }
                field("AppraiserReview Qty"; Rec."AppraiserReview Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Achieved/Appraisee Qty';
                    ToolTip = 'Specifies the value of the Achieved/Appraisee Qty field.';
                    // Visible = false;
                }
                field("Final/Actual Qty"; Rec."Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final/Appraiser Qty';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Final/Appraiser Qty field.';
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
        area(processing)
        {
            group("Related Information")
            {
                Caption = 'Related Information';

                action("Sub Objectives and Outcomes")
                {
                    ApplicationArea = Basic;
                    Image = Agreement;
                    RunObject = Page "Sub Objectives and Outcomes";
                    RunPageLink = "Performance Evaluation ID" = field("Performance Evaluation ID"),
                                  "Scorecard ID" = field("Scorecard ID"),
                                  "Intiative No" = field("Intiative No");
                    ToolTip = 'Executes the Sub Objectives and Outcomes action.';
                }
            }
        }
    }
}



