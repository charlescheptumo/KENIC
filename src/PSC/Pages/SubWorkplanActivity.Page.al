#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80419 "Sub Workplan Activity"
{
    Caption = 'Sub Workplan Activities';
    PageType = List;
    SourceTable = "Sub Workplan Activity";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub-Intiative No"; Rec."Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub-Activity No';
                    ToolTip = 'Specifies the value of the Sub-Activity No field.';
                }
                field("Sub-Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub-Activity';
                    ToolTip = 'Specifies the value of the Sub-Activity field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
                // field("Total Autocalculated Amount"; Rec."Total Autocalculated Amount")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Expense Amount"; Rec."Expense Amount")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Completion Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field("Q1 Target Qty"; Rec."Q1 Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q1 Target';
                    ToolTip = 'Specifies the value of the Q1 Target field.';
                }
                field("Q2 Target Qty"; Rec."Q2 Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q2 Target';
                    ToolTip = 'Specifies the value of the Q2 Target field.';
                }
                field("Q3 Target Qty"; Rec."Q3 Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q3 Target';
                    ToolTip = 'Specifies the value of the Q3 Target field.';
                }
                field("Q4 Target Qty"; Rec."Q4 Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q4 Target';
                    ToolTip = 'Specifies the value of the Q4 Target field.';
                }
                field("Elements Count"; Rec."Elements Count")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Elements Count field.';
                }
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
            //     action("Workplan Cost Items")
            //     {
            //         ApplicationArea = Basic;
            //         Image = Notes;
            //         Promoted = true;
            //         PromotedCategory = Process;
            //         PromotedIsBig = true;
            //         RunObject = Page "Workplan Cost Elements";
            //         RunPageLink = "Workplan No." = field("Workplan No."),
            //                       "Activity Id" = field("Activity Id"),
            //                       "Sub Activity No" = field("Sub Initiative No.");
            //     }
            //     action("Update Total SubActivity Budget")
            //     {
            //         ApplicationArea = Basic;
            //         Image = UpdateUnitCost;
            //         Promoted = true;
            //         PromotedCategory = Category4;
            //         PromotedIsBig = true;

            //         trigger OnAction()
            //         begin
            //             WorkplanCostElements.Reset;
            //             WorkplanCostElements.SetRange("Workplan No.", Rec."Workplan No.");
            //             WorkplanCostElements.SetRange("Activity Id", Rec."Activity Id");
            //             WorkplanCostElements.SetRange("Sub Activity No", Rec."Sub Initiative No.");
            //             WorkplanCostElements.CalcSums(Amount);
            //             Rec."Total Budget" := WorkplanCostElements.Amount;
            //             Rec.Modify;

            //             Message('Total Sub Activity Budget Updated successfully');
            //         end;
            //     }
            //}
        }
    }

    var
        WorkplanCostElements: Record "Workplan Cost Elements";
}

#pragma implicitwith restore

