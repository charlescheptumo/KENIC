#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65055 "Grant Research Objectives List"
{
    PageType = List;
    SourceTable = "Grant Research Objectives";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Objective"; Rec."Research Objective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Objective field.';
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Program field.';
                }
                field("Project Area"; Rec."Project Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Area field.';
                }
            }
        }
    }

    actions
    {
    }
}

