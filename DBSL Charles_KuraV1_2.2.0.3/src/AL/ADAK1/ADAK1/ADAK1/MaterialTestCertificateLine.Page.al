#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72691 "Material Test Certificate Line"
{
    PageType = ListPart;
    SourceTable = "Material Test Record Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Material Delivery Date"; Rec."Material Delivery Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Delivery Date field.';
                }
                field("Testing Date"; Rec."Testing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Testing Date field.';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manufacturer field.';
                }
                field("Material ID"; Rec."Material ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

