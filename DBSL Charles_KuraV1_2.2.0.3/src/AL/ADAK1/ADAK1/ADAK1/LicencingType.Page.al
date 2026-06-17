#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 58999 "Licencing Type"
{
    PageType = List;
    SourceTable = "Licence Types";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Licence Type Code"; Rec."Licence Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Type Code field.';
                }
                field("Licence Type Description"; Rec."Licence Type Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Type Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

