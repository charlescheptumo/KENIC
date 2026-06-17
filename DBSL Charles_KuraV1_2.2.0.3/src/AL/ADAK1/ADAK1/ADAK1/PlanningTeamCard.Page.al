#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52014 "Planning Team Card"
{
    PageType = Card;
    SourceTable = "Planning Team Members";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Team ID"; Rec."Team ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team ID field.';
                }
                field("Team Name"; Rec."Team Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Name field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
            }
        }
    }

    actions
    {
    }
}

