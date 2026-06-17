#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80007 "Stakeholder Sub-Groups"
{
    PageType = List;
    SourceTable = "Stakeholder Sub-Group";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Stakeholder Group"; Rec."Stakeholder Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stakeholder Group field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Stakeholders"; Rec."No. of Stakeholders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Stakeholders field.';
                }
            }
        }
    }

    actions
    {
    }
}

