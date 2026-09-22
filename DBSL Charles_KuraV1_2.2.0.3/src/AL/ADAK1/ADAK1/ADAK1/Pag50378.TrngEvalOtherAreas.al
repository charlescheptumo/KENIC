namespace KENIC.KENIC;
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
Page 50378 "Trng Eval Other Areas"
{
    PageType = ListPart;
    SourceTable = "Trng Eval Other Areas";
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Other Areas of Training Evaluation';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Comment on Relevance of Course"; Rec."Comment on Relevance of Course")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment on Relevance of Course field.';
                }
            }
        }
    }
}

