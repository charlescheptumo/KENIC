#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80052 "Workplan Risk"
{
    PageType = List;
    SourceTable = "PC Risk";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Source Class"; Rec."Risk Source Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Source Class field.';
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Category field.';
                }
                field("Risk Description"; Rec."Risk Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Description field.';
                }
                field("Inherent Likelihood Level"; Rec."Inherent Likelihood Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inherent Likelihood Level field.';
                }
                field("Inherent Impact Level"; Rec."Inherent Impact Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inherent Impact Level field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

