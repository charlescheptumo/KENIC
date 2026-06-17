#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59084 "File Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "File Types SetUp";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type Code field.';
                }
                field("Type Name"; Rec."Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

