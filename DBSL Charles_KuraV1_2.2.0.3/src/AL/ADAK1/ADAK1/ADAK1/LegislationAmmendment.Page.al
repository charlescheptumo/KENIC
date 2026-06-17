#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72140 "Legislation Ammendment"
{
    PageType = ListPart;
    SourceTable = "Legislation Amendment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Amendment ID"; Rec."Amendment ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amendment ID field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Gazette Supplement No."; Rec."Gazette Supplement No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gazette Supplement No. field.';
                }
                field("National Assembly Bill No."; Rec."National Assembly Bill No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the National Assembly Bill No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

