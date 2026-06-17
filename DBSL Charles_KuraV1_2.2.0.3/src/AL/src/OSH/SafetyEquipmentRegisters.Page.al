#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69470 "Safety Equipment Registers"
{
    CardPageID = "Safety Equipment Register";
    PageType = List;
    SourceTable = 69435;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment ID field.';
                }
                field(SubType; Rec.SubType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SubType field.';
                }
                field("SubType No."; Rec."SubType No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SubType No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Safety Equipment Category"; Rec."Safety Equipment Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Equipment Category field.';
                }
                field("Safety Notes/Comments"; Rec."Safety Notes/Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Notes/Comments field.';
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Location Code field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Inventory Quantity"; Rec."Inventory Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inventory Quantity field.';
                }
                field("Fixed Asset/Resource Quantity"; Rec."Fixed Asset/Resource Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Asset/Resource Quantity field.';
                }
            }
        }
    }

    actions
    {
    }
}
