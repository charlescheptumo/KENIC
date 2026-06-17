#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72576 "Inspection Plan Line"
{
    PageType = Card;
    SourceTable = "Inspection Plan Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Category ID"; Rec."Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category ID field.';
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Maximum Weight"; Rec."Maximum Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Weight field.';
                }
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
                field("Actual Score"; Rec."Actual Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Score field.';
                }
            }
        }
    }

    actions
    {
    }
}

