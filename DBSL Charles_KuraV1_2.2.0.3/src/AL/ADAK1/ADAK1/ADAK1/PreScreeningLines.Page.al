#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69719 "Pre-Screening Lines"
{
    PageType = ListPart;
    SourceTable = "Pre-Screen Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Id"; Rec."Question Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Id field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field("Close Ended Qn Type"; Rec."Close Ended Qn Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Close Ended Qn Type field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Options)
            {
                action("Answer Options")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Template Line Options";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Question ID" = field("Question Id");
                    ToolTip = 'Executes the Answer Options action.';
                }
            }
        }
    }
}

