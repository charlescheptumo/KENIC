#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65069 "Research Program Factbox"
{
    PageType = CardPart;
    SourceTable = "Research Program";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("Code"; Rec.Code)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Code field.';
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Name field.';
            }
            field("No. of Project Areas"; Rec."No. of Project Areas")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. of Project Areas field.';
            }
            field("No. of Awarded GFO"; Rec."No. of Awarded GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Awarded Grants';
                Style = AttentionAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the No. of Awarded Grants field.';
            }
            field("No. of Lost Grant GFO"; Rec."No. of Lost Grant GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Lost Grant Grants';
                ToolTip = 'Specifies the value of the No. of Lost Grant Grants field.';
            }
            field("No. of Ongoing RProjects"; Rec."No. of Ongoing RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Ongoing Projects';
                ToolTip = 'Specifies the value of the No. of Ongoing Projects field.';
            }
            field("No. of Completed RProjects"; Rec."No. of Completed RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Completed Projects';
                ToolTip = 'Specifies the value of the No. of Completed Projects field.';
            }
            field("Total Amount Awarded(LCY)"; Rec."Total Amount Awarded(LCY)")
            {
                ApplicationArea = Basic;
                Style = AttentionAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the Total Amount Awarded(LCY) field.';
            }
        }
    }

    actions
    {
    }
}

