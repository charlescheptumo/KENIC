#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72229 "Inspection & Payment Line"
{
    PageType = ListPart;
    SourceTable = "Inspection & Payment Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Bill No"; Rec."Bill No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bill No field.';
                }
                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Item Code field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field("BoQ Quantity"; Rec."BoQ Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the BoQ Quantity field.';
                }
                field("Bid Rate(LCY)"; Rec."Bid Rate(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bid Rate(LCY) field.';
                }
                field("Bill Item Amount"; Rec."Bill Item Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bill Item Amount field.';
                }
                field("Previous Qty"; Rec."Previous Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Previous Qty field.';
                }
                field("Previous %"; Rec."Previous %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Previous % field.';
                }
                field("This Qty"; Rec."This Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the This Qty field.';
                }
                field("This Qty %"; Rec."This Qty %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the This Qty % field.';
                }
                field("Done ToDate Qty"; Rec."Done ToDate Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Done ToDate Qty field.';
                }
                field("Done ToDate %"; Rec."Done ToDate %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Done ToDate % field.';
                }
            }
        }
    }

    actions
    {
    }
}

