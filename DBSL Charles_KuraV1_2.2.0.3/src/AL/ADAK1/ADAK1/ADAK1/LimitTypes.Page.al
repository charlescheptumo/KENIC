#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59033 "Limit Types"
{
    ApplicationArea = Basic;
    CardPageID = "Limit Types Card";
    PageType = List;
    SourceTable = "Limit Types";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Request Duration"; Rec."Request Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Duration field.';
                }
                field("Litre Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit field.';
                }
                field("Litre Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit field.';
                }
                field("Fuel Card Limit Reminder"; Rec."Fuel Card Limit Reminder")
                {
                    ToolTip = 'Specifies the value of the Fuel Card Limit Reminder field.', Comment = '%';
                    ApplicationArea = Basic;
                }
                field("Effective Start Date"; Rec."Effective Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Start Date field.';
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective End Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

