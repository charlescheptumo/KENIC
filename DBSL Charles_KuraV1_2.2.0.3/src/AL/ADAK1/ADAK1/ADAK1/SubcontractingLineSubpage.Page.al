#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72656 "Subcontracting Line Subpage"
{
    PageType = ListPart;
    SourceTable = "Subcontracting Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Subcontractor Name"; Rec."Subcontractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subcontractor Name field.';
                }
                field("Tax PIN No."; Rec."Tax PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax PIN No. field.';
                }
                field("Description Of Works"; Rec."Description Of Works")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description Of Works field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Scope of Subcontracting"; Rec."Scope of Subcontracting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scope of Subcontracting field.';
                }
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Group field.';
                }
                field("Supplier Type"; Rec."Supplier Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Type field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

