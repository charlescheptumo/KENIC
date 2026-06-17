#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50012 "pageextension50012" extends "Item Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Item Card"(Page 30)".

    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".

        addafter(Description)
        {
            field("Description 3"; Rec."Description 3")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Long Description field.';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            }
            field("Item Brand Code"; Rec."Item Brand Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Brand Code field.', Comment = '%';
            }
            field("Item Brand Description"; Rec."Item Brand Description")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Item Brand Description field.', Comment = '%';
            }
            field("Responsible Employee"; Rec."Responsible Employee")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Responsible Employee field.', Comment = '%';
            }
            field("Responsible Employee Name"; Rec."Responsible Employee Name")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Responsible Employee Name field.', Comment = '%';
            }
            field("Serial No"; Rec."Serial No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Serial No field.', Comment = '%';
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.', Comment = '%';
            }
        }
        addafter("Cost is Posted to G/L")
        {
            field("Vote Item"; Rec."Vote Item")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Vote Item field.';
            }
        }
        addafter("Item Category Code")
        {
            field("Procurement Category"; Rec."Procurement Category")
            {
                ApplicationArea = basic;
                ToolTip = 'Specifies the value of the Procurement Category field.';
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        IsInventoriable := true;
    end;
}

#pragma implicitwith restore

