#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56084 "Tracks Other Persons"
{
    PageType = ListPart;
    SourceTable = "Track Other Persons";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Id Number"; Rec."Id Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Id Number field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
            }
        }
    }

    actions
    {
    }
}

