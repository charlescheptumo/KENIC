#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80171 "Policy Version"
{
    Editable = false;
    PageType = List;
    SourceTable = "Policy Version";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Version Id"; Rec."Version Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Version Id field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Revision Date"; Rec."Revision Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

