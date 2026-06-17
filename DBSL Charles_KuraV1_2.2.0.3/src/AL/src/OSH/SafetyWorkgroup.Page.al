#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69420 "Safety Workgroup"
{
    PageType = Card;
    SourceTable = 69410;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Workgroup ID"; Rec."Workgroup ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workgroup ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Stakeholder Category"; Rec."Stakeholder Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stakeholder Category field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}
