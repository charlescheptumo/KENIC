#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80216 "Policy Statement Revision"
{
    PageType = List;
    SourceTable = "Policy Statement Revision";
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
                field("Area"; Rec.Area)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Area field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Policy Statement"; Rec."Policy Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Statement field.';
                }
            }
        }
    }

    actions
    {
    }
}

