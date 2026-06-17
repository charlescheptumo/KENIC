#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59069 "Planning Matrix List"
{
    PageType = ListPart;
    SourceTable = "Planning Marix";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Strategic Themes"; Rec."Strategic Themes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Themes field.';
                }
                field("Strategic Objectives"; Rec."Strategic Objectives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Objectives field.';
                }
                field(Strategies; Rec.Strategies)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategies field.';
                }
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activities field.';
                }
                field(KPI; Rec.KPI)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KPI field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

