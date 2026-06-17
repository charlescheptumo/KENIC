#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69106 "Staff Establishment Plan Lines"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Staff Est Plan Lines";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }
                field("Approved Establishment"; Rec."Approved Establishment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Establishment field.';
                }
                field("Actual Active"; Rec."Actual Active")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Active field.';
                }
                field("Actual Suspended"; Rec."Actual Suspended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Suspended field.';
                }
                field("Actual Terminated"; Rec."Actual Terminated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Terminated field.';
                }
            }
        }
    }

    actions
    {
    }
}

