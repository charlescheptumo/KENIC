#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99504 "Emergency Drill Evacuation Lin"
{
    PageType = ListPart;
    SourceTable = 69447;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evacuation Procedure ID"; Rec."Evacuation Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Procedure ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Status field.';
                }
                field("Drill Obeservations"; Rec."Drill Obeservations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Obeservations field.';
                }
                field("No. of Recommended Actions"; Rec."No. of Recommended Actions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Recommended Actions field.';
                }
            }
        }
    }

    actions
    {
    }
}
