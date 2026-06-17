#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69048 "Salary Scale"
{
    PageType = List;
    SourceTable = "Salary Mapping";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rank field.';
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Profit Centre field.';
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
                field("House Allowance"; Rec."House Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the House Allowance field.';
                }
                field("Uniform Cleaning Allowance"; Rec."Uniform Cleaning Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Uniform Cleaning Allowance field.';
                }
                field("Responsibility Allowance"; Rec."Responsibility Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Allowance field.';
                }
                field("Meal Allowance"; Rec."Meal Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meal Allowance field.';
                }
                field("Night Allowance"; Rec."Night Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Night Allowance field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000011; Notes)
            {
            }
            systempart(Control1000000012; MyNotes)
            {
            }
            systempart(Control1000000013; Links)
            {
            }
        }
    }

    actions
    {
    }
}

