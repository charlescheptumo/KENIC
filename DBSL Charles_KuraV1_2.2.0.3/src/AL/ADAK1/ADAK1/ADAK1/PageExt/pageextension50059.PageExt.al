#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50059 "pageextension50059" extends "Blanket Purchase Order"
{
    layout
    {
        modify("Purchaser Code")
        {
            Caption = 'Supply Chain Officer';
        }
        modify(Status)
        {
            Editable = false;
        }
        modify("Due Date")
        {
            Visible = false;
        }
        modify("Order Date")
        {
            Visible = false;
        }
        modify("Vendor Shipment No.")
        {
            Visible = false;
        }
        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Vendor Order No.")
        {
            Visible = false;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
        addafter("No. of Archived Versions")
        {
            field("Contract Name"; Rec."Contract Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract Name field.';
            }
            field("Contract Start Date"; Rec."Contract Start Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract Start Date field.';
            }
            field("Contract End Date"; Rec."Contract End Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract End Date field.';
            }
            field("Contract Status"; Rec."Contract Status")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract Status field.';
            }
        }
        addafter("Assigned User ID")
        {
            field(Job; Rec.Job)
            {
                ApplicationArea = Basic;
                Caption = 'Project';
                ToolTip = 'Specifies the value of the Project field.';
            }
        }
    }


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Responsibility Center" := UserMgt.GetPurchasesFilter;

    IF (NOT DocNoVisible) AND ("No." = '') THEN
      SetBuyFromVendorFromFilter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Responsibility Center" := UserMgt.GetPurchasesFilter;
    //"Assigned User ID":=UserSet
    #2..4
    */
    //end;
}

