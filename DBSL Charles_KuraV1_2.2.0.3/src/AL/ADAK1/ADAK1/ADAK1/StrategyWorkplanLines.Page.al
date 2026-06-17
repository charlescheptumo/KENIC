
Page 80035 "Strategy Workplan Lines"
{
    PageType = ListPart;
    SourceTable = "Strategy Workplan Lines";
    Caption = 'Deparment Workplan Lines';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                    visible = false;
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity ID field.';
                }
                field(Exists; Rec.Exists)
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Exists field.';
                    visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                    Caption = 'Activity Description';
                }
                
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                    Visible =false;
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                    visible = false;
                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the perfomance Indicator field.';
                }
                field(Outcome; Rec.Outcome)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outcome field.';
                }
                field("Key Performance Indicator"; Rec."Key Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Caption = 'Perfromance Indicator';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Perfromance Indicator field.';
                    visible = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                    visible = false;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                    visible = False;
                }
                field("Assigned Weight(%)"; Rec."Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summation of Subactivity Weight(%) field.';
                    visible = false;
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imported Annual Target Qty field.';
                    visible = false;
                }
                field("Imported Annual Budget Est."; Rec."Imported Annual Budget Est.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imported Annual Budget Est. field.';
                    visible = false;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                    visible = false;
                }
                field("Primary Directorate Name"; Rec."Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Directorate Name field.';
                    visible = false;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                    visible = false;
                }
                field("Primary Department Name"; Rec."Primary Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Department Name field.';
                    visible = false;
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Year Reporting Code field.', Comment = '%';
                }
                field("Q1 Target"; Rec."Q1 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Target field.';
                    Caption = 'Target';
                }
                field("Q1 Budget"; Rec."Q1 Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Budget field.';
                    Caption = 'Budget';
                }
                field("Q2 Target"; Rec."Q2 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Target field.';
                    visible = false;
                }
                field("Q2 Budget"; Rec."Q2 Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Budget field.';
                    visible = false;
                }
                field("Q3 Target"; Rec."Q3 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Target field.';
                    visible = false;
                }
                field("Q3 Budget"; Rec."Q3 Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Budget field.';
                    visible = false;
                }
                field("Q4 Target"; Rec."Q4 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Target field.';
                    visible = false;
                }
                field("Q4 Budget"; Rec."Q4 Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Budget field.';
                    visible = false;
                }
                field("AnnualWorkplan Achieved Target"; Rec."AnnualWorkplan Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Achieved Target field.';
                    Caption = 'Department Achieved Target';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                // field("Achieved Performance Level"; Rec."Achieved Performance Level")
                // {
                //     ApplicationArea = basic;
                // }

                // field("Key Performance Indicator";"Key Performance Indicator")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Performance Indicator';
                //     Editable = false;
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         KeyPerformanceIndicator.Reset;
                //         KeyPerformanceIndicator.SetRange(KPI,"Key Performance Indicator","Key Performance Indicator");
                //         if KeyPerformanceIndicator.FindFirst then begin
                //             "Unit of Measure":=KeyPerformanceIndicator."Unit of Measure";
                //           end;
                //     end;
                // }

                field("Departmental Activity Weight"; Rec."Departmental Activity Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Departmental Activity Weight field.';
                }
                // field("Total Subactivity budget"; Rec."Total Subactivity budget")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field("Sub Activity Budget Sum"; Rec."Sub Activity Budget Sum")
                // {
                //     ApplicationArea = Basic;
                // }


                // field("Annual Target"; Rec."Annual Target")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Annual Target field.';
                // }
                // field("Annual Budget"; Rec."Annual Budget")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Allocated Budget';
                // }


            }
        }
    }
    actions
    {
        area(processing)
        {
            // group("Line Functions ")
            // {
            //     Caption = 'Annual Workplan Sub-Activities';
            //     Image = AnalysisView;
            //     action("Sub-Activities ")
            //     {
            //         ApplicationArea = Basic;
            //         Image = Notes;
            //         RunObject = Page "Sub Workplan Activity";
            //         RunPageLink = "Strategy Plan ID" = field("Strategy Plan ID"),
            //                       "Workplan No." = field(No),
            //                       "Activity Id" = field("Activity ID");
            //         ToolTip = 'Executes the Sub-Activities  action.';
            //     }
            // }
            // action("Update Activity Achievements")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'UPDATE';
            //     Image = AllocatedCapacity;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     ToolTip = 'Executes the UPDATE action.';

            //     trigger OnAction()
            //     begin
            //         if not Confirm('Are you sure you want to update Activitiy  Total Assigned Weight?', true) then
            //             Error('Activity achievement not update');

            //         SubWorkplanActivity.Reset;
            //         SubWorkplanActivity.SetRange("Workplan No.", rec.No);
            //         SubWorkplanActivity.SetRange("Activity Id", rec."Activity ID");
            //         SubWorkplanActivity.CalcSums(Weight);
            //         SubWorkplanActivity.CalcSums("Total Budget");

            //         if SubWorkplanActivity.Weight = 100 then begin
            //             rec."Assigned Weight(%)" := SubWorkplanActivity.Weight;
            //             rec."Total Subactivity budget" := SubWorkplanActivity."Total Budget";

            //             rec.Modify;
            //         end else
            //             Error('Total Assigned Weight for sub-sctivities should be equals to 100%');
            //     end;
            // }
        }
    }

    var
        SubWorkplanActivity: Record "Sub Workplan Activity";
    //  KeyPerformanceIndicator: Record ;


}




#pragma implicitwith restore

