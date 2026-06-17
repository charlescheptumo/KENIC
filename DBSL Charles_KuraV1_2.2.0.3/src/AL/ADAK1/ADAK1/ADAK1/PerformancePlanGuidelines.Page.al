#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80094 "Performance Plan Guidelines"
{
    CardPageID = "Performance Plan Guideline";
    Editable = false;
    PageType = List;
    SourceTable = "Performance Plan Guideline";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Mgt Plan ID field.';
                }
                field("Policy/Guideline ID"; Rec."Policy/Guideline ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy/Guideline ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

