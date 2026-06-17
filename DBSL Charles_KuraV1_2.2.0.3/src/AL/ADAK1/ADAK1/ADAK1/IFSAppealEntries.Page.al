#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75390 "IFS Appeal Entries"
{
    Editable = false;
    PageType = List;
    SourceTable = "IFS Appeal Entry";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Bid Response No"; Rec."Bid Response No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Response No field.';
                }
                field("Appeal Date"; Rec."Appeal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appeal Date field.';
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Decision field.';
                }
                field("Date of Verdict"; Rec."Date of Verdict")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Verdict field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
            {
            }
            systempart(Control17; Notes)
            {
            }
            systempart(Control18; MyNotes)
            {
            }
            systempart(Control19; Links)
            {
            }
        }
    }

    actions
    {
    }
}

