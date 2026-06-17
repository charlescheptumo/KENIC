#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69682 "Application Hobbies"
{
    PageType = List;
    SourceTable = "Application Hobby";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Hobby Type"; Rec."Hobby Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hobby Type field.';
                }
                field("Hobby Category"; Rec."Hobby Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hobby Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
            systempart(Control10; Links)
            {
            }
        }
    }

    actions
    {
    }
}

