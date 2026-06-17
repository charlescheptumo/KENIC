#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80557 "Sub Objectives/Intiatives-V"
{
    PageType = List;
    SourceTable = 80102;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Initiative No."; Rec."Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Activities No.';
                    ToolTip = 'Specifies the value of the Sub Activities No. field.';
                }
                field("Sub-Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Activities';
                    ToolTip = 'Specifies the value of the Sub Activities field.';
                }
                field("Sub Activity Description"; Rec."Sub Activity Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual Action';
                    ToolTip = 'Specifies the value of the Individual Action field.';
                }
                field("Sub-Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Sub Targets"; Rec."Sub Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Targets field.';
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Completion Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
                field("Sub Activity weight %"; Rec."Sub Activity weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Activity weight % field.';
                }
                field("Expense Amount"; Rec."Expense Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Amount field.';
                }
                field("Q1 Target Qty"; Rec."Q1 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Target Qty field.';
                }
                field("Q2 Target Qty"; Rec."Q2 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Target Qty field.';
                }
                field("Q3 Target Qty"; Rec."Q3 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Target Qty field.';
                }
                field("Q4 Target Qty"; Rec."Q4 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Target Qty field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        SubPCObjective.Reset;
        SubPCObjective.SetRange("Workplan No.", Rec."Workplan No.");
        SubPCObjective.SetRange("Initiative No.", Rec."Initiative No.");
        SubPCObjective.CalcSums("Sub Activity weight %");
        if SubPCObjective."Sub Activity weight %" <> 100 then
            Error('Sub Activity agreed weight should equal to 100%');
    end;

    var
        SubPCObjective: Record 80102;
}
