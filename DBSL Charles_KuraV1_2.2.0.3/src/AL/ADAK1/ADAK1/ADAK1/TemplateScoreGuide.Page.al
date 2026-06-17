#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69808 "Template Score Guide"
{
    PageType = List;
    SourceTable = "Screening Template Score Guide";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Option Code"; Rec."Option Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Option Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Points"; Rec."Default Points")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Points field.';
                }
            }
        }
    }

    actions
    {
    }
}

