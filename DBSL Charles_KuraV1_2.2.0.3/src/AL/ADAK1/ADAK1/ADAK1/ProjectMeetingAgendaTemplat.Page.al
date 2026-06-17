#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72251 "Project Meeting Agenda Templat"
{
    ApplicationArea = Basic;
    CardPageID = "Project Meeting Agenda Temp";
    PageType = ListPart;
    SourceTable = "Project Meeting Agenda Temp";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Meeting Type"; Rec."Project Meeting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Meeting Type field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Description"; Rec."Agenda Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Description field.';
                }
                field(Owner; Rec.Owner)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Owner field.';
                }
                field("Estimate Time (Minutes)"; Rec."Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Time (Minutes) field.';
                }
                field("No. of Agenda Items"; Rec."No. of Agenda Items")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Agenda Items field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Project Meeting Agenda Templat")
            {
                Caption = '&Line';
                Image = AddAction;
                action("Agenda  Templates")
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    RunObject = Page "Project Meeting Agenda Templat";
                    RunPageLink = "Project Meeting Type" = field("Project Meeting Type"),
                                  "Agenda Code" = field("Agenda Code");
                    ToolTip = 'Executes the Agenda  Templates action.';
                }
            }
        }
    }
}

