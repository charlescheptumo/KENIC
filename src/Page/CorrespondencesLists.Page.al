#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50188 "Correspondences Lists"
{
    PageType = List;
    SourceTable = "General Correspondence Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Urgency Status"; Rec."Urgency Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Urgency Status field.';
                }
                field("Sender No"; Rec."Sender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender No field.';
                }
                field("Sender Name"; Rec."Sender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

