#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80085 "Upcoming Performance Tasks"
{
    ApplicationArea = Basic;
    CardPageID = "Performance Plan Task";
    PageType = List;
    SourceTable = "Performance Plan Task";
    SourceTableView = where("Task Category" = const("Performance Review"));
    //  "Published?"=const(true));
    UsageCategory = Lists;

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
    }
}

