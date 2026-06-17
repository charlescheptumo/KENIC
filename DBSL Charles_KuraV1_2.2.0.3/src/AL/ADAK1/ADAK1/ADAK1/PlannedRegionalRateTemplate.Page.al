#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72319 "Planned Regional Rate Template"
{
    PageType = List;
    SourceTable = "Planned Regional Rate Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition Template ID"; Rec."Requisition Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Requisition Template ID field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Planned Rate(Unit Amount Exc)"; Rec."Planned Rate(Unit Amount Exc)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Rate(Unit Amount Exc) field.';
                }
            }
        }
    }

    actions
    {
    }
}

