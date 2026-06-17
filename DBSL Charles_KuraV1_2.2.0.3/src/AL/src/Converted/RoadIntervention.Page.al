#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99453 "Road Intervention"
{
    PageType = ListPart;
    SourceTable = "Road Intervention";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Description"; Rec."Road Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Description field.';
                }
                field("Intervention Type"; Rec."Intervention Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Intervention Type field.';
                }
                field("Intervention Description"; Rec."Intervention Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Intervention Description field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

