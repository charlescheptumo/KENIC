#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72131 "Progress Per Road Activity"
{
    PageType = ListPart;
    SourceTable = "Progress Per Road Activity";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Header No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Bill No"; Rec."Bill No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill No field.';
                }
                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Bid Rate(LCY)"; Rec."Bid Rate(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Rate(LCY) field.';
                }
                field("Bill Item Amount(LCY)"; Rec."Bill Item Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Amount(LCY) field.';
                }
                field("Previous Quantity"; Rec."Previous Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Quantity field.';
                }
                field("Previous Percantage"; Rec."Previous Percantage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Percantage field.';
                }
                field("This Quantity"; Rec."This Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the This Quantity field.';
                }
                field("This Quantity Percentage"; Rec."This Quantity Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the This Quantity Percentage field.';
                }
                field("Done To Date Quantity"; Rec."Done To Date Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Done To Date Quantity field.';
                }
                field("Done To Date Percentage"; Rec."Done To Date Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Done To Date Percentage field.';
                }
            }
        }
    }

    actions
    {
    }
}

