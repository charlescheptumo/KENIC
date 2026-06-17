#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69308 "TrainingL Needs"
{
    CardPageID = "Training Courses Needs";
    PageType = List;
    SourceTable = "Training Courses Needs";
    ApplicationArea = All;
    // SourceTableView = where(Field6=filter(0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("Training Need Code"; Rec."Training Need Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Need Code field.';
                }
                // field(Status;Status)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Blocked;Blocked)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created By";"Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created On";"Created On")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("No. of Needs";"No. of Needs")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

