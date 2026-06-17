#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99999 "Road Study Sections"
{
    PageType = List;
    SourceTable = "Road Study Section";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Section Distance (Km)"; Rec."Section Distance (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Distance (Km) field.';
                }
            }
        }
    }

    actions
    {
    }
}

