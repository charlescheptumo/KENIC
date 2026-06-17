#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72266 "WEP Key Milestone"
{
    PageType = List;
    SourceTable = "WEP Key Milestone";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone Code field.';
                }
                field(Descrption; Rec.Descrption)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Descrption field.';
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Certificate Type field.';
                }
                field("Payment %"; Rec."Payment %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment % field.';
                }
                field("Planned Amount (LCY)"; Rec."Planned Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Amount (LCY) field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

