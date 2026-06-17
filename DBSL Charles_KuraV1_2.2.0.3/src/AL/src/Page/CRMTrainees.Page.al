#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69519 "CRM Trainees"
{
    PageType = ListPart;
    SourceTable = "CRM Traineees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field("Member ID No"; Rec."Member ID No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member ID No field.';
                }
                field("Member Phone No"; Rec."Member Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Phone No field.';
                }
                field(Attended; Rec.Attended)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended field.';
                }
            }
        }
    }

    actions
    {
    }
}

