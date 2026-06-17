#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75248 "Tender Addendum Amendment"
{
    PageType = ListPart;
    SourceTable = "Tender Addendum Amendment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Amendment Type"; Rec."Amendment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amendment Type field.';
                }
                field("Amended Section of Tender Doc"; Rec."Amended Section of Tender Doc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amended Section of Tender Document field.';
                }
                field("Amendment Description"; Rec."Amendment Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amendment Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

