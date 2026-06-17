#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65070 "Research Program Statistics"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Research Program";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
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
                    Caption = 'No. of Awarded Grant';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Awarded Grant field.';
                }
                field("No. of Lost Grant GFO"; Rec."No. of Lost Grant GFO")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Lost Grant Grants';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Lost Grant Grants field.';
                }
                field("No. of Ongoing RProjects"; Rec."No. of Ongoing RProjects")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Ongoing Projects';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Ongoing Projects field.';
                }
                field("No. of Completed RProjects"; Rec."No. of Completed RProjects")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Completed Projects';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Completed Projects field.';
                }
                field("Total Amount Awarded(LCY)"; Rec."Total Amount Awarded(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount Awarded(LCY) field.';
                }
            }
            part(Control11; "Grant Funding Sub List")
            {
                SubPageLink = "Primary Research Program ID" = field(Code);
            }
            part(Control12; "Project Funding Con. Sub List")
            {
                SubPageLink = "Research Program" = field(Code);
            }
        }
    }

    actions
    {
    }
}

