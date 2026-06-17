#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56211 "Training & Development Needs"
{
    PageType = ListPart;
    SourceTable = "Staff Training Appraisal";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Training & Development Need"; Rec."Training & Development Need")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training & Development Need field.';
                }
            }
        }
    }

    actions
    {
    }
}

