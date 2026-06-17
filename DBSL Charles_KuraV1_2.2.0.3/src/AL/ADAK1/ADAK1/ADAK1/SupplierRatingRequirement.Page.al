#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75165 "Supplier Rating Requirement"
{
    PageType = ListPart;
    SourceTable = "Supplier Rating Requirement";
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
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Target Value"; Rec."Target Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Value field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = CreditMemo;
                    RunObject = Page "Supplier Rating Score Guide";
                    RunPageLink = "Appraisal Template ID" = field("Appraisal Template ID"),
                                  "Template Type" = field("Template Type"),
                                  "Criteria Group" = field("Criteria Group");
                    ToolTip = 'Executes the Score Guide action.';
                }
            }
        }
    }
}

