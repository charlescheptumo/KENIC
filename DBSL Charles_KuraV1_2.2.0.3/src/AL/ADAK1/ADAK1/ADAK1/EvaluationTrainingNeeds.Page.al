#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80403 "Evaluation Training Needs"
{
    PageType = ListPart;
    SourceTable = "Evaluation Training needs";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Course; Rec.Course)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course field.';
                }
                field("Training Need Number"; Rec."Training Need Number")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Training Need Number field.';
                }
                field("Training Need Category"; Rec."Training Need Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Training Need Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Training Duration"; Rec."Training Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Appraisee's Comments"; Rec."Appraisee's Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisee''s Comments field.';
                }
                field("Supervisor's Comments"; Rec."Supervisor's Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor''s Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

