#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80064 "Perfomance Scale Line"
{
    PageType = ListPart;
    SourceTable = "Perfomance Scale Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Scale ID"; Rec."Performance Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Scale ID field.';
                }
                field("Perfomance Grade"; Rec."Perfomance Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Perfomance Grade field.';
                }
                field("Default Score Value"; Rec."Default Score Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Score Value field.';
                }
                field("Behavioral Indicator"; Rec."Behavioral Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Behavioral Indicator field.';
                }
                field("Lower Limit Target (%)"; Rec."Lower Limit Target (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit Target (%) field.';
                }
                field("Upper Limit Target (%)"; Rec."Upper Limit Target (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit Target (%) field.';
                }
                field("Lower Limit Criteria Value"; Rec."Lower Limit Criteria Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit Criteria Value field.';
                }
                field("Upper Limit Criteria Value"; Rec."Upper Limit Criteria Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit Criteria Value field.';
                }
                field("Criteria Value Range Span"; Rec."Criteria Value Range Span")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Value Range Span field.';
                }
            }
        }
    }

    actions
    {
    }
}

