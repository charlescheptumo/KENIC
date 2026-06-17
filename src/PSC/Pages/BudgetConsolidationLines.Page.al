#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80460 "Budget Consolidation Lines"
{
    PageType = ListPart;
    SourceTable = "Budget Consolidation Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Vote id"; Rec."Vote id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote id field.';
                }
                field("Vote Desription"; Rec."Vote Desription")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Description';
                    ToolTip = 'Specifies the value of the Vote Description field.';
                }
                field("Draft Budgeted Amount"; Rec."Draft Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Annual Work Plan Budget';
                    ToolTip = 'Specifies the value of the Draft Annual Work Plan Budget field.';
                }
                field("GL Budgeted Amount"; Rec."GL Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Budget';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approved Budget field.';
                }
                field("Actual Budgeted Amount"; Rec."Actual Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rationalized Budget';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Rationalized Budget field.';
                }
                field("Deficit/Surplus"; Rec."Deficit/Surplus")
                {
                    ApplicationArea = Basic;
                    Caption = 'Variance ';
                    ToolTip = 'Specifies the value of the Variance  field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions ")
            {
                Caption = 'Line Function';
                Image = AnalysisView;
                action("Budget Consolidation Entries")
                {
                    ApplicationArea = Basic;
                    Image = Notes;
                    RunObject = Page "Budget Consolidation Entries";
                    RunPageLink = "Consolidation Header No" = field("Consolidation Header No"),
                                  "Job No" = field("Job No"),
                                  "Vote id" = field("Vote id");
                    ToolTip = 'Executes the Budget Consolidation Entries action.';
                }
                action("Update Deficit/Surplus")
                {
                    ApplicationArea = Basic;
                    Image = Notes;
                    ToolTip = 'Executes the Update Deficit/Surplus action.';

                    trigger OnAction()
                    begin
                        BudgetConsolidationLines.Reset;
                        BudgetConsolidationLines.SetRange("Consolidation Header No", Rec."Consolidation Header No");
                        if BudgetConsolidationLines.Find('-') then begin
                            repeat
                                BudgetConsolidationLines.CalcFields("Draft Budgeted Amount", "Actual Budgeted Amount");
                                BudgetConsolidationLines."Deficit/Surplus" := BudgetConsolidationLines."Draft Budgeted Amount" - BudgetConsolidationLines."GL Budgeted Amount";
                                BudgetConsolidationLines.Modify;
                            until BudgetConsolidationLines.Next = 0;
                        end;

                        Message('Surplus/Deficit updated successfully');
                    end;
                }
            }
        }
    }

    var
        BudgetConsolidationLines: Record "Budget Consolidation Lines";
}

#pragma implicitwith restore

