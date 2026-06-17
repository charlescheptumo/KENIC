#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69602 "Terms of Service"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Terms of Service";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Contract Term Period"; Rec."Contract Term Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Term Period field.';
                }
                field("Maximum No. of Terms"; Rec."Maximum No. of Terms")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum No. of Terms field.';
                }
                field("Maximum Employment Age (Years)"; Rec."Maximum Employment Age (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Employment Age (Years) field.';
                }
                field("Linked to Projects"; Rec."Linked to Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Linked to Projects field.';
                }
                field("Pension Benefit"; Rec."Pension Benefit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Benefit field.';
                }
                field("Service Gratuity Benefit"; Rec."Service Gratuity Benefit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Gratuity Benefit field.';
                }
                field("No. of Positions"; Rec."No. of Positions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Positions field.';
                }
                field("No. of Active Employees"; Rec."No. of Active Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Active Employees field.';
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

