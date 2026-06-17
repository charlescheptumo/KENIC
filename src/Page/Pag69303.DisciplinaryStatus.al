#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69303 "Disciplinary Status"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Disciplinary Status Table";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disciplinary Status"; Rec."Disciplinary Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Status field.';
                }
                field("Deduction Code"; Rec."Deduction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduction Code field.';
                }
                field("Deductions Based On"; Rec."Deductions Based On")
                {
                    ApplicationArea = Basic;
                    TableRelation = EarningsX.Code;
                    ToolTip = 'Specifies the value of the Deductions Based On field.';
                }
                field("Computation Method"; Rec."Computation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computation Method field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Formula; Rec.Formula)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Formula field.';
                }
            }
        }
    }

    actions
    {
    }
}

