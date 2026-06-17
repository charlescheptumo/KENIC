#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72545 "Quality Management Plan Lines"
{
    PageType = ListPart;
    SourceTable = "QM Plan Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility field.';
                }
                field("Project Supervision Template"; Rec."Project Supervision Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Supervision Template field.';
                }
                field("Scheduled Start Date"; Rec."Scheduled Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled Start Date field.';
                }
                field("Scheduled End Date"; Rec."Scheduled End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled End Date field.';
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Start Date field.';
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual End Date field.';
                }
                field("Corrective Orders Issued"; Rec."Corrective Orders Issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrective Orders Issued field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

