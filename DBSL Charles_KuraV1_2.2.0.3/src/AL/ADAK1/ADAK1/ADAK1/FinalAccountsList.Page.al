#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72612 "Final Accounts List"
{
    ApplicationArea = Basic;
    CardPageID = "Final Account";
    PageType = List;
    SourceTable = "Final Account";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Defects Liability Period field.';
                }
                field("DLP Start Date"; Rec."DLP Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP Start Date field.';
                }
                field("DLP End Date"; Rec."DLP End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP End Date field.';
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Sum field.';
                }
                field("Payments to Date"; Rec."Payments to Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payments to Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

