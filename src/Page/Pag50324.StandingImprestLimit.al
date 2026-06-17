namespace KICD.KICD;
using Microsoft.HumanResources.Payables;

page 50324 "Standing Imprest Limit "
{
    ApplicationArea = All;
    Caption = 'Standing Imprest Limit ';
    PageType = List;
    CardPageId = "Standing Imprest Limit Card";
    SourceTable = "Standing Imprest Limit";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Financial Year"; Rec."Financial Year")
                {
                    ToolTip = 'Specifies the value of the Financial Year field.', Comment = '%';
                    Editable = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.', Comment = '%';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.', Comment = '%';
                }
                field("Limit"; Rec."Limit")
                {
                    ToolTip = 'Specifies the value of the Limit field.', Comment = '%';
                }
                // field("Utilized Amount"; Rec."Utilized Amount")
                // {
                //     ToolTip = 'Specifies the value of the Utilized Amount field.', Comment = '%';
                   
                // } 
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                    Visible = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Specifies the value of the Created Date field.', Comment = '%';
                    Visible = false;

                }
   
            }

        }

    }
      
}
