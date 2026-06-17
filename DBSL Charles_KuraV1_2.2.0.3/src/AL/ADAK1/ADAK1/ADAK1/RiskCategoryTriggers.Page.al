#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95019 "Risk Category Triggers"
{
    CardPageID = "Risk Category Trigger";
    PageType = List;
    SourceTable = "Risk Category Trigger";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Category ID"; Rec."Risk Category ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Category ID field.';
                }
                field("Trigger ID"; Rec."Trigger ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trigger ID field.';
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

