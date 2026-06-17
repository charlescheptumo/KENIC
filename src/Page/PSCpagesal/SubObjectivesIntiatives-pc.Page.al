#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80466 "Sub Objectives/Intiatives-pc"
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
                    Visible = false;
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Individual Action field.';
                }
                field("Sub-Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Sub Targets"; Rec."Sub Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Targets field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Completion Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Sub Activity weight %"; Rec."Sub Activity weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Activity weight % field.';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
            }
        }
    }

    actions
    {
    }
}
