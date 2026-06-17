#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80454 "Corporate Tasks"
{
    CardPageID = "Performance Plan Task";
    PageType = ListPart;
    SourceTable = 80052;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Performance Mgt Plan ID field.';
                }
                field("Task Code"; Rec."Task Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Code field.';
                }
                field("Task Category"; Rec."Task Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Review Periods"; Rec."Review Periods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Periods field.';

                    trigger OnValidate()
                    begin
                        if ReviewPeriod.Get(Rec."Review Periods") then begin
                            Rec."Performance Cycle Start Date" := ReviewPeriod."Starting Date";
                            Rec."Performance Cycle End Date" := ReviewPeriod."End Date";
                            Rec."Processing Start Date" := ReviewPeriod."Starting Date";
                            Rec."Processing Due Date" := ReviewPeriod."End Date";
                        end;
                    end;
                }
                field("Performance Cycle Start Date"; Rec."Performance Cycle Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Cycle Start Date field.';
                }
                field("Performance Cycle End Date"; Rec."Performance Cycle End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Cycle End Date field.';
                }
                field("Processing Start Date"; Rec."Processing Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Processing Start Date field.';
                }
                field("Processing Due Date"; Rec."Processing Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Processing Due Date field.';
                }
                field("Published?"; Rec."Published?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published? field.';
                }
                field("Closed?"; Rec."Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Published By"; Rec."Published By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published By field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("No of Evaluations/Appeals"; Rec."No of Evaluations/Appeals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Evaluations/Appeals field.';
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
                action("Publish Task")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Publish Task action.';

                    trigger OnAction()
                    begin
                        Rec."Published?" := true;
                        Rec."Published By" := UserId;
                        Message('Task Published Successfully');
                    end;
                }
                action("Generate Appraisals")
                {
                    ApplicationArea = Basic;
                    Image = CreateDocument;
                    ToolTip = 'Executes the Generate Appraisals action.';

                    trigger OnAction()
                    begin
                        if Rec."Task Category" = Rec."task category"::"Performance Review" then begin
                            PerformanceManagementPlan.Reset;
                            PerformanceManagementPlan.SetRange(No, Rec."Performance Mgt Plan ID");
                            if PerformanceManagementPlan.FindFirst then begin
                                // StrategicPlanning.FnGenerateBatchAppraisals(Rec,PerformanceManagementPlan."Strategy Plan ID");
                            end;
                        end;
                    end;
                }
                action("Close Task")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Close Task action.';

                    trigger OnAction()
                    begin
                        Rec.TestField("Published?", true);
                        Rec."Closed" := true;
                        Rec."Closed By" := UserId;
                        Message('Task Closed Successfully');
                    end;
                }
            }
        }
    }

    var
        ReviewPeriod: Record 80101;
        StrategicPlanning: Codeunit 57007;
        PerformanceManagementPlan: Record 80050;
}
