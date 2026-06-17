#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75459 "Bid Evaluation Scores"
{
    PageType = List;
    SourceTable = "Bid Evaluation Score Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Group field.';
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
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Target Value/KPI"; Rec."Target Value/KPI")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Value/KPI field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Value field.';
                }
                field("Bid Response Actual Qty"; Rec."Bid Response Actual Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Response Actual Qty field.';
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score % field.';
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
                field("Weighted Line Score"; Rec."Weighted Line Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Line Score field.';
                }
                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Bid Scoring Document No."; Rec."Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Scoring Document No. field.';
                }
                field("Bid Scoring Document Type"; Rec."Bid Scoring Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Scoring Document Type field.';
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
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Contract Ref Clause"; Rec."Contract Ref Clause")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Ref Clause field.';
                }
            }
        }
    }

    actions
    {
    }
}

