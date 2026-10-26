/// <summary>
/// Part II: Office Equipment (ID 50412).
/// </summary>
page 50412 "Asset Poss. Equipment Subform"
{
    Caption = 'Part II: Office Equipment';
    PageType = ListPart;
    SourceTable = "Asset Possession Line";
    SourceTableView = where("Line Type" = const("Office Equipment"));
    DelayedInsert = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of equipment.';
                }
                field(Issued; Rec.Issued)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tick if this item has been issued to the staff member.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the model of the equipment.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the serial number of the equipment.';
                }
                field("Asset Tag No."; Rec."Asset Tag No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the asset tag number. Picking a fixed asset fills in the serial number if it is blank.';
                }
                field(Condition; Rec.Condition)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the equipment is new or reallocated.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Line Type" := Rec."Line Type"::"Office Equipment";
    end;
}

/// <summary>
/// Part III: Furniture (ID 50413).
/// </summary>
page 50413 "Asset Poss. Furniture Subform"
{
    Caption = 'Part III: Furniture';
    PageType = ListPart;
    SourceTable = "Asset Possession Line";
    SourceTableView = where("Line Type" = const(Furniture));
    DelayedInsert = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of furniture.';
                }
                field(Issued; Rec.Issued)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tick if this item has been issued to the staff member.';
                }
                field("Asset Tag No."; Rec."Asset Tag No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the asset tag number of the furniture.';
                }
                field(Condition; Rec.Condition)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the furniture is new or reallocated.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity, used for items tracked by quantity such as pedestal keys.';
                    Editable = Rec."Track By Quantity";
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Line Type" := Rec."Line Type"::Furniture;
    end;
}

/// <summary>
/// Part IV: Keys (ID 50414).
/// </summary>
page 50414 "Asset Poss. Keys Subform"
{
    Caption = 'Part IV: Keys';
    PageType = ListPart;
    SourceTable = "Asset Possession Line";
    SourceTableView = where("Line Type" = const("Keys"));
    DelayedInsert = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of key or token.';
                }
                field(Issued; Rec.Issued)
                {
                    ApplicationArea = All;
                    Caption = 'Yes/No';
                    ToolTip = 'Tick if this key has been issued to the staff member.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = All;
                    ShowMandatory = Rec."Details Required";
                    ToolTip = 'Specifies the details, for example the bank, post office or car the key relates to.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Line Type" := Rec."Line Type"::"Keys";
    end;
}

/// <summary>
/// Part V: Phones (ID 50415).
/// </summary>
page 50415 "Asset Poss. Phones Subform"
{
    Caption = 'Part V: Phones';
    PageType = ListPart;
    SourceTable = "Asset Possession Line";
    SourceTableView = where("Line Type" = const(Phone));
    DelayedInsert = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Phone Type"; Rec."Phone Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the phone is a mobile or a desk phone.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the serial number of the phone.';
                }
                field("Asset Tag No."; Rec."Asset Tag No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the asset tag number of the phone.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Line Type" := Rec."Line Type"::Phone;
    end;
}
