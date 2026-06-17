
page 60000 "Company Stakeholders"
{
    PageType = List;
    SourceTable = "Company Stakeholders";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Descriptions; Rec.Descriptions)
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Descriptions field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }

            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}



