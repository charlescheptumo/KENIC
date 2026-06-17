page 50043 "Vendor Evaluation Score Entry"
{
    PageType = ListPart;
    SourceTable = "Vendor Evaluation Score Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement ID field.';
                }
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Requirement field.';
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score % field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Value field.';
                }
                field(Scores; Rec.Scores)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scores field.';
                }
                field("Scores Remarks"; Rec."Scores Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scores Remarks field.';
                }
                field("Evaluation Results"; Rec."Evaluation Results")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Results field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Criteria Group ID"; Rec."Criteria Group ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Group ID field.';
                }
                field("Criteria Description"; Rec."Criteria Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Description field.';
                }

            }
        }
    }

    actions
    {
    }
}
