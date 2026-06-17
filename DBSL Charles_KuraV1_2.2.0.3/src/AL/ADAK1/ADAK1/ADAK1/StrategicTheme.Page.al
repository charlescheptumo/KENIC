#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80027 "Strategic Theme"
{
    PageType = List;
    SourceTable = "Strategic Theme";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Plan ID field.';
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Key Result Area';
                    ToolTip = 'Specifies the value of the Key Result Area field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Strategic Issue"; Rec."Primary Strategic Issue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Strategic Issue field.';
                }
                field("No. of Strategic Goals"; Rec."No. of Strategic Goals")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Strategic Goals field.';
                }
                field("No. of Strategic Objectives"; Rec."No. of Strategic Objectives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Strategic Objectives field.';
                }
                field("No. of Strategies"; Rec."No. of Strategies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Strategies field.';
                }
                field("No. of Strategic Initiatives"; Rec."No. of Strategic Initiatives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Strategic Initiatives field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

