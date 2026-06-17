#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 90426 "Innovation Reward Setup"
{
    PageType = List;
    SourceTable = 80250;
    ApplicationArea = All;

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
                field("Reward Category"; Rec."Reward Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reward Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Payroll; Rec.Payroll)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll field.';
                }
                field("Earning Code"; Rec."Earning Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earning Code field.';
                }
            }
        }
    }

    actions
    {
    }
}
