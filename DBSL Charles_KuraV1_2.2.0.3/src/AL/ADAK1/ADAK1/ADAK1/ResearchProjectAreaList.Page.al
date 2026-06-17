#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65012 "Research Project Area List"
{
    CardPageID = "Research Project Area Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Project Area";
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
                field("Research Program ID"; Rec."Research Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Program ID field.';
                }
                field("Program Name"; Rec."Program Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Program Name field.';
                }
                field("Project Area Description"; Rec."Project Area Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Area Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

