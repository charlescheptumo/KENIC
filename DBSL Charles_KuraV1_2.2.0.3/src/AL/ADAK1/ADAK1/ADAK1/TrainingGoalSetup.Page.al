#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69305 "Training Goal Setup"
{
    PageType = List;
    SourceTable = "Training Goals Setup";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Plan ID"; Rec."Training Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Plan ID field.';
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of training objectives"; Rec."No. of training objectives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of training objectives field.';
                }
            }
        }
    }

    actions
    {
    }
}

