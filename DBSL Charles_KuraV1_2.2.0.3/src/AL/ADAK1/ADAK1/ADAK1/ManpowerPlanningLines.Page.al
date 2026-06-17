#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69111 "Manpower Planning Lines"
{
    PageType = List;
    SourceTable = "ManPower Planning Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control17)
            {
                field("Task No"; Rec."Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Responsibility Center Code"; Rec."Responsibility Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center Code field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Quarter 1 Target"; Rec."Quarter 1 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 1 Target field.';
                }
                field("Quarter 2 Target"; Rec."Quarter 2 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 2 Target field.';
                }
                field("Quarter 3 Target"; Rec."Quarter 3 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 3 Target field.';
                }
                field("Quarter 4 Target"; Rec."Quarter 4 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 4 Target field.';
                }
                field("Quarter 1 Actual"; Rec."Quarter 1 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quarter 1 Actual field.';
                }
                field("Quarter 2 Actual"; Rec."Quarter 2 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quarter 2 Actual field.';
                }
                field("Quarter 3 Actual"; Rec."Quarter 3 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quarter 3 Actual field.';
                }
                field("Quarter 4 Actual"; Rec."Quarter 4 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quarter 4 Actual field.';
                }
            }
        }
    }

    actions
    {
    }
}

