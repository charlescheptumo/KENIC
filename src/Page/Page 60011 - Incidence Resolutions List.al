
/// <summary>
/// Page Incidence Resolutions List (ID 60011).
/// </summary>
page 60011 "Incidence Resolutions List"
{
    PageType = ListPart;
    SourceTable = "Incidence Resolution Table";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resolution Status"; Rec."Resolution Status")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Resolution Status field.';
                }
                field("Actions Taken"; Rec."Actions Taken")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Actions Taken field.';
                }
                field("Actioned By"; Rec."Actioned By")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Actioned By field.';
                }
                field("Actioned At"; Rec."Actioned At")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Actioned At field.';
                }
                field("Duration Taken"; Rec."Duration Taken")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Duration Taken field.';
                }
            }
        }
    }

    actions
    {
    }
}



