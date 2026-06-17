#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72282 "Measurement & Payment Line"
{
    PageType = ListPart;
    SourceTable = "Measurement & Payment Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Measurement Type"; Rec."Measurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Measurement Type field.';
                }
                field("Linear/Unit Quantity"; Rec."Linear/Unit Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Linear/Unit Quantity field.';
                }
                field("Length (m)"; Rec."Length (m)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Length (m) field.';
                }
                field("Width (m)"; Rec."Width (m)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Width (m) field.';
                }
                field("Height/Depth (m)"; Rec."Height/Depth (m)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Height/Depth (m) field.';
                }
                field("Measured Quantity"; Rec."Measured Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Measured Quantity field.';
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Measured Amount';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Measured Amount field.';
                }
                field("Contract Quantity"; Rec."Contract Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Quantity field.';
                }
                field("Direct Unit Cost (LCY)"; Rec."Direct Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Direct Unit Cost (LCY) field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Technology Type"; Rec."Technology Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technology Type field.';
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage field.';
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chainage field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Previous Measured Quantity"; Rec."Previous Measured Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Previous Measured Quantity field.';
                }
                field("Previous Certificate Amount"; Rec."Previous Certificate Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Previous Certificate Amount field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        FnSetPageVisibility;
    end;

    trigger OnInit()
    begin
        FnSetPageVisibility;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        FnSetPageVisibility;
    end;

    trigger OnOpenPage()
    begin
        FnSetPageVisibility;
    end;

    var
        LengthVisible: Boolean;
        WidthVisible: Boolean;
        HeightVisible: Boolean;
        MeasuredQtyVisible: Boolean;
        Linear_UnitQty: Boolean;

    local procedure FnSetPageVisibility()
    begin
        if Rec."Measurement Type" = Rec."measurement type"::"Linear/Unit" then begin
            Linear_UnitQty := true;
            LengthVisible := false;
            WidthVisible := false;
            HeightVisible := false;
        end;

        if Rec."Measurement Type" = Rec."measurement type"::Areal then begin
            Linear_UnitQty := false;
            LengthVisible := true;
            WidthVisible := true;
            HeightVisible := false;
        end;

        if Rec."Measurement Type" = Rec."measurement type"::Volumetric then begin
            Linear_UnitQty := false;
            LengthVisible := true;
            WidthVisible := true;
            HeightVisible := true;
        end;
    end;
}

