#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56022 "Language Set-ups"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Language;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Windows Language Name"; Rec."Windows Language Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Windows Language Name field.';
                }
                field("Windows Language ID"; Rec."Windows Language ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Windows Language ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

