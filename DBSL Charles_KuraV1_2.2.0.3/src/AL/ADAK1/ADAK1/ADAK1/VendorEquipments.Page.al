#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72260 "Vendor Equipments"
{
    PageType = List;
    SourceTable = "Vendor Equipment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment No."; Rec."Equipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Equipment Category"; Rec."Equipment Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Category field.';
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership Type field.';
                }
                field("Equipment Registration No."; Rec."Equipment Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Registration No. field.';
                }
                field("Equipment Usability Code"; Rec."Equipment Usability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Usability Code field.';
                }
                field("Years of Previous Use"; Rec."Years of Previous Use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Years of Previous Use field.';
                }
                field("Equipment Condition Code"; Rec."Equipment Condition Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Condition Code field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

