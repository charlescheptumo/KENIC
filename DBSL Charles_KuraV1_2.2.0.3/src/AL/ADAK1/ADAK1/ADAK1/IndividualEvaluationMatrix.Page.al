#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75318 "Individual Evaluation Matrix"
{
    PageType = List;
    SourceTable = "Individual Evaluation Matrix";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid Evaluation Register No"; Rec."Bid Evaluation Register No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Evaluation Register No field.';
                }
                field("Bid No"; Rec."Bid No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Evaluation Decision"; Rec."Evaluation Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Decision field.';
                }
                field("Evaluation Score"; Rec."Evaluation Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Score field.';
                }
                field("Evaluator No"; Rec."Evaluator No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator No field.';
                }
                field("Evaluator Name"; Rec."Evaluator Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator Name field.';
                }
                field("Evaluation Results"; Rec."Evaluation Results")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Results field.';
                }
                field("Evaluation Date"; Rec."Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

