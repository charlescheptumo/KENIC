#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80218 "Policy Related Framework Rev"
{
    PageType = List;
    SourceTable = "Policy Related Framework Rev";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Revision No."; Rec."Revision No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision No. field.';
                }
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy ID field.';
                }
                field("Framework Code"; Rec."Framework Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("No. of Articles"; Rec."No. of Articles")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Articles field.';
                }
            }
        }
    }

    actions
    {
    }
}

