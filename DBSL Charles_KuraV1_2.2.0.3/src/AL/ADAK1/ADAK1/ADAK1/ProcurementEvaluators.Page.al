#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70083 "Procurement Evaluators"
{
    PageType = List;
    SourceTable = "Procurement Evaluators";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(tenderno; Rec.tenderno)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the tenderno field.';
                }
                field("Evaluator 1"; Rec."Evaluator 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 1 field.';
                }
                field("Evaluator 2"; Rec."Evaluator 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 2 field.';
                }
                field("Evaluator 3"; Rec."Evaluator 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 3 field.';
                }
                field("Evaluator 4"; Rec."Evaluator 4")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 4 field.';
                }
                field("Evaluator 5"; Rec."Evaluator 5")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 5 field.';
                }
                field("Evaluator 6"; Rec."Evaluator 6")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 6 field.';
                }
                field("Evaluator 7"; Rec."Evaluator 7")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 7 field.';
                }
                field("Evaluator 8"; Rec."Evaluator 8")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator 8 field.';
                }
            }
        }
    }

    actions
    {
    }
}

