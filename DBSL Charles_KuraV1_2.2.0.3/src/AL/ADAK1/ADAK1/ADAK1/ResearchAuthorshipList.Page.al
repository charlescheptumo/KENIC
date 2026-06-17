#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65021 "Research Authorship List"
{
    CardPageID = "Research Authorship Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Authorship";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Output Id"; Rec."Research Output Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output Id field.';
                }
                field("Author No"; Rec."Author No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Author No field.';
                }
                field("Author Name"; Rec."Author Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Author Name field.';
                }
                field("Author Contribution(%)"; Rec."Author Contribution(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Author Contribution(%) field.';
                }
                field("Author Category"; Rec."Author Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Author Category field.';
                }
            }
        }
    }

    actions
    {
    }
}

