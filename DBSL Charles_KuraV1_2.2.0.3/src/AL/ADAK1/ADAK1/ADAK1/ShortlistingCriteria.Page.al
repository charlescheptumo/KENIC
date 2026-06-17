#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69142 "Shortlisting Criteria"
{
    PageType = List;
    SourceTable = "Shortlist Criteria";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Shortlist Criteria"; Rec."Shortlist Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortlist Criteria field.';
                }
                field("Shortlist Description"; Rec."Shortlist Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortlist Description field.';
                }
                field(Requirement; Rec.Requirement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

