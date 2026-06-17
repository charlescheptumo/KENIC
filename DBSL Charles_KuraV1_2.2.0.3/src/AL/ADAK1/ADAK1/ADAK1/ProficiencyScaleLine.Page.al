#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80061 "Proficiency Scale Line"
{
    PageType = ListPart;
    SourceTable = "Proficiency Scale Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Proficiency Scale ID"; Rec."Proficiency Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proficiency Scale ID field.';
                }
                field("Level ID"; Rec."Level ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Score Value"; Rec."Default Score Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Score Value field.';
                }
                field("Behavioral Indicator"; Rec."Behavioral Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Behavioral Indicator field.';
                }
                field("General Recommendations"; Rec."General Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Recommendations field.';
                }
            }
        }
    }

    actions
    {
    }
}

