#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80210 "Secondary Workplan Initiatives"
{
    Caption = 'Secondary Workplan Initiatives';
    PageType = ListPart;
    SourceTable = "Secondary PC Objective";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiative No. field.';
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective/Initiative field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreed Targets';
                    ToolTip = 'Specifies the value of the Agreed Targets field.';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight (%) field.';
                }
                field(Control7; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Plog Achieved Targets"; Rec."Plog Achieved Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plog Achieved Targets field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Sub Intiatives")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Workplan No." = field("Workplan No."),
                                  "Initiative No." = field("Initiative No."),
                                  "Goal ID" = field("Goal ID"),
                                  "Strategy Plan ID" = field("Strategy Plan ID");
                    ToolTip = 'Executes the Sub Intiatives action.';
                }
                action("Implementation Intiatives")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Executes the Implementation Intiatives action.';
                }
                action("Performance Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Performance Targets action.';

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
                action("Performance Appraisal Entries")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Performance Appraisal Entries action.';

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Comments action.';

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
                action("Import Objectives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Import Objectives action.';

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
            }
        }
    }
}

