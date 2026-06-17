#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80191 "Policy Revision Info Sources"
{
    PageType = List;
    SourceTable = "Policy Revision Info Sources";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy ID field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("URL Link"; Rec."URL Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the URL Link field.';
                }
                field("Revision No."; Rec."Revision No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

