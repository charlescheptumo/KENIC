#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72454 "DWR Meeting Agenda"
{
    CardPageID = "DWR Meeting Agendum";
    PageType = List;
    SourceTable = "DWR Meeting Agenda";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Description"; Rec."Agenda Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Description field.';
                }
                field(Owner; Rec.Owner)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Owner field.';
                }
                field("Estimate Time (Minutes)"; Rec."Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Time (Minutes) field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Agenda Summaries")
            {
                ApplicationArea = Basic;
                Image = AmountByPeriod;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "DWR Meeting Summaries";
                RunPageLink = "Document No." = field("Document No."),
                              "Line No." = field("Line No."),
                              "Agenda Code" = field("Agenda Code");
                ToolTip = 'Executes the Agenda Summaries action.';
            }
        }
    }
}

