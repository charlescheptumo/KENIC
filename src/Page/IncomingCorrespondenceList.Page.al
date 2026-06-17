#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 72121 "Incoming Correspondence List"
{
    CardPageID = "Incoming Correspondences Card";
    PageType = List;
    SourceTable = "Incoming Correspondence Header";
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("External Reference No"; Rec."External Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Reference No field.';
                }
                field("Urgency Status"; Rec."Urgency Status")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = Rec."Urgency Status" = Rec."Urgency Status"::Urgent;
                    ToolTip = 'Specifies the value of the Urgency Status field.';
                }
                field("Internal Reference No"; Rec."Internal Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Reference No field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
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

