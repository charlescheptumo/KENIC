#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80235 "Additional Assignments"
{
    PageType = ListPart;
    SourceTable = "Additional Assignment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Additional Assignment"; Rec."Additional Assignment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Assignment field.';
                }
            }
        }
    }

    actions
    {
    }
}
