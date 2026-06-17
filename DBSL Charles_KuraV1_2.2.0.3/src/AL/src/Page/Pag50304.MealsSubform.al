namespace KICD.KICD;

using Microsoft.Purchases.Document;

page 50304 "Meals Subform"
{
    ApplicationArea = All;
    Caption = 'Meals Subform';
    PageType = ListPart;
    SourceTable = "Purchase line";
    SourceTableView = where("Document Type" = filter("Meals Requisition"));
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Type field.';
                    visible = false;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                    Caption = 'Vote Amount';
                    Visible = false;
                }
                field("Vote Item";Rec."Vote Item")
                {
                }
                field("Vote Amount";Rec."Vote Amount1")
                {
                }          
                field("Funds Available"; Rec."Funds Available")
                {
                    ToolTip = 'Specifies the value of the Funds Available field.', Comment = '%';
                }
            }
        }
               
    }
}
