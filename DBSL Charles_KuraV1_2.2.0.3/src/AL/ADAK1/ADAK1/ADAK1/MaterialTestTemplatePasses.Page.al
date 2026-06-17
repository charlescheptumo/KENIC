#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72432 "Material Test Template Passes"
{
    CardPageID = "Material Test Template Pass";
    PageType = List;
    SourceTable = "Material Test Template Pass";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Test Type"; Rec."Test Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Type field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Attach Documents action.';

                trigger OnAction()
                begin
                    //  DMSManagement.UploadAIEAttchmentDocuments("Template ID 'Material Test Template', RecordId, d,'');
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

