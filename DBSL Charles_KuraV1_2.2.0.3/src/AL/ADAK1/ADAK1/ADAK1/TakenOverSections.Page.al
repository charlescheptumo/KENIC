#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72661 "Taken Over Sections"
{
    PageType = List;
    SourceTable = "Taking Over Section Line";
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
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Taking Over Start Chainage"; Rec."Taking Over Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taking Over Start Chainage field.';
                }
                field("Taking Over End Chainage"; Rec."Taking Over End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taking Over End Chainage field.';
                }
                field("Taking Over Length"; Rec."Taking Over Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taking Over Length field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        TakingOverSection: Record "Taking Over Section";
}

