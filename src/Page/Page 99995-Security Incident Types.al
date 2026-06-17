
/// <summary>
/// Page Security Incident Types (ID 95126).
/// </summary>
page 99995 "Security Incident Types"
{
    PageType = List;
    SourceTable = "Security Incident Types";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}



