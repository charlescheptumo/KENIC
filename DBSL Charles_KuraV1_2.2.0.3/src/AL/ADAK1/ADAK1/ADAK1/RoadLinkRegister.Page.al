#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72042 "Road Link Register"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Road Link Register";
    // UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Link ID"; Rec."Road Link ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Link ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Road Asset Quantity"; Rec."Road Asset Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Asset Quantity field.';
                }
            }
        }
    }

    actions
    {
    }
}

