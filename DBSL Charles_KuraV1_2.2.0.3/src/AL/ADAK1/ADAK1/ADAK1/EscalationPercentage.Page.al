#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70127 "Escalation Percentage"
{
    PageType = List;
    SourceTable = "Escalation Percentage";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item Catecory"; Rec."Item Catecory")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Category';
                    ToolTip = 'Specifies the value of the Item Category field.';
                }
                field("Item Category Description"; Rec."Item Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Category Description field.';
                }
                field("Escalation Percentage"; Rec."Escalation Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalation Percentage field.';
                }
                field("Escalation Amount"; Rec."Escalation Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Escalation Amount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Calculate)
            {
                ApplicationArea = Basic;
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Calculate action.';
            }
        }
    }

    var
        ItemCategory: Record "Item Category";
        PurchaseLine: Record "Purchase Line";
        BidRegister: Record "Bid Evaluation Register";
        EPercentage: Record "Escalation Percentage";
}

