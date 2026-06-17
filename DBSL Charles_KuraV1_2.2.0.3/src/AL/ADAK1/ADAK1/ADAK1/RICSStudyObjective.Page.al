#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72161 "RICS Study Objective"
{
    PageType = Card;
    SourceTable = "RICS Study Objective";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("RICS No."; Rec."RICS No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

