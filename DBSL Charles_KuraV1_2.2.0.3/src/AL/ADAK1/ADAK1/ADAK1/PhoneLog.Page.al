#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69777 "Phone Log"
{
    PageType = ListPart;
    SourceTable = "PreScreening Phone Log";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Phone Interview Template ID"; Rec."Phone Interview Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Template ID field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field("Question Asked"; Rec."Question Asked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Asked field.';
                }
                field("General Rating"; Rec."General Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Rating field.';
                }
                field("Response Rating %"; Rec."Response Rating %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Rating % field.';
                }
                field("Comments/Notes"; Rec."Comments/Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments/Notes field.';
                }
            }
        }
    }

    actions
    {
    }
}

