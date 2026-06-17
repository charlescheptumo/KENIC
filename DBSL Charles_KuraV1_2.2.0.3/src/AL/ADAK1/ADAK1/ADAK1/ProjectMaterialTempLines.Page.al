#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72609 "Project Material Temp. Lines"
{
    PageType = List;
    SourceTable = "Project Material Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field("Material Name"; Rec."Material Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Name field.';
                }
                field("Material ID"; Rec."Material ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material ID field.';
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

