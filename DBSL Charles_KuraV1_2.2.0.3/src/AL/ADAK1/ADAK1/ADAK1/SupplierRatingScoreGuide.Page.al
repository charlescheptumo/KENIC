#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75166 "Supplier Rating Score Guide"
{
    PageType = List;
    SourceTable = "Supplier Rating Score Guide";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Template ID field.';
                }
                field("Template Type"; Rec."Template Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template Type field.';
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Group field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Value field.';
                }
                field("Min Bid Value"; Rec."Min Bid Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Bid Value field.';
                }
                field("Max Bid Value"; Rec."Max Bid Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Bid Value field.';
                }
                field("Min Date Value"; Rec."Min Date Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Date Value field.';
                }
                field("Max Date Value"; Rec."Max Date Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Date Value field.';
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score % field.';
                }
            }
        }
    }

    actions
    {
    }
}

