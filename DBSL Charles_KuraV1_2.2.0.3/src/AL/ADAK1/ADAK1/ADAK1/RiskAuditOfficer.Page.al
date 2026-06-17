#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95140 "Risk & Audit Officer"
{
    PageType = Card;
    SourceTable = "Risk & Audit Officer";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("No. of Assigned Audit Projects"; Rec."No. of Assigned Audit Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Assigned Audit Projects field.';
                }
            }
        }
    }

    actions
    {
    }
}

