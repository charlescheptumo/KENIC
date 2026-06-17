namespace KICD.KICD;

page 50325 "Standing Imprest Limit Card"
{
    ApplicationArea = All;
    Caption = 'Standing Imprest Limit Card';
    PageType = Card;
    SourceTable = "Standing Imprest Limit";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Financial Year"; Rec."Financial Year")
                {
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Limit "; Rec."Limit")
                {
                    ToolTip = 'Specifies the value of the Limit field.';
                }
                // field("Utilized Amount"; Rec."Utilized Amount")
                // {
                //     ToolTip = 'Specifies the value of the Utilized Amount field.', Comment = '%';
                // }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Specifies the value of the Created Date field.';
                    Editable = false;
                }
            }
        }
        
    }
    
}
