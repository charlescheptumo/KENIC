#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69192 "Hr Salary Increament Lines"
{
    PageType = ListPart;
    SourceTable = "HR Salary Increament Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Current Present"; Rec."Current Present")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Salary Scale';
                    ToolTip = 'Specifies the value of the Current Salary Scale field.';
                }
                field("Current Salary Scale"; Rec."Current Salary Scale")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Salary Scale Pointer';
                    ToolTip = 'Specifies the value of the Current Salary Scale Pointer field.';
                }
                field("New Salary Scale"; Rec."New Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Salary Scale field.';
                }
                field("New Present"; Rec."New Present")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Salary Scale Pointer';
                    ToolTip = 'Specifies the value of the New Salary Scale Pointer field.';
                }
                field("Effective Start Date"; Rec."Effective Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Effective Start Date field.';
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective End Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

