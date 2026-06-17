#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69247 "HR Jobs Factbox"
{
    PageType = ListPart;
    SourceTable = "ManPower Planning Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("Entry No"; Rec."Entry No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Entry No field.';
            }
            field("Task No"; Rec."Task No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Task No field.';
            }
            field("Manpower Plan Code"; Rec."Manpower Plan Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Manpower Plan Code field.';
            }
            field("Job Id"; Rec."Job Id")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Id field.';
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
            field("Responsibility Center Code"; Rec."Responsibility Center Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center Code field.';
            }
            // field(Catego ry;Category)
            // {
            //     ApplicationArea = Basic;
            // }
            // field(Gra de;Grade)
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Employee Requisition s";"Employee Requisitions")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Supervisor Nam e";"Supervisor Name")
            // {
            //     ApplicationArea = Basic;
            // }
            // field(Stat us;Status)
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Responsibility Cente r";"Responsibility Center")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Date Create d";"Date Created")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }

    actions
    {
    }
}

