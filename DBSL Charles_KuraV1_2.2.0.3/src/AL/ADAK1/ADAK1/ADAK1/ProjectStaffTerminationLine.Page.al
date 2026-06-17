#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72224 "Project Staff Termination Line"
{
    Caption = 'Project Staff Disengagement Line';
    PageType = ListPart;
    SourceTable = "Project Staff Termination Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Termination  Date"; Rec."Termination  Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disengagement  Date';
                    ToolTip = 'Specifies the value of the Disengagement  Date field.';
                }
                field("Termination Category"; Rec."Termination Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disengagement Reason';
                    ToolTip = 'Specifies the value of the Disengagement Reason field.';
                }
                field("Termination Details"; Rec."Termination Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disengagement Details';
                    ToolTip = 'Specifies the value of the Disengagement Details field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Appointment Document No."; Rec."Appointment Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Document No. field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
            }
        }
    }

    actions
    {
    }
}

