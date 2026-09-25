namespace KENIC.KENIC;
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
Page 50377 "Trng Eval Areas Addressed"
{
    PageType = ListPart;
    SourceTable = "Trng Eval Areas Addressed";
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Areas Addressed by Training';

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

