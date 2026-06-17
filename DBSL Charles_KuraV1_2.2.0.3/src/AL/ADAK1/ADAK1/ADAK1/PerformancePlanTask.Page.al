
Page 80044 "Performance Plan Task"
{
    PageType = Card;
    SourceTable = "Performance Plan Task";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
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
            }
        }
    }

    actions
    {
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    BEGIN
        Rec."Task Category" := Rec."Task Category"::"Performance Review";
    END;
}



