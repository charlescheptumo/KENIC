page 99519 "Work Plan Bill Items"
{
    ApplicationArea = All;
    Caption = 'Work Plan Bill Items';
    PageType = List;
    SourceTable = "Work Plan Bill Item";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Line Amount Excl. VAT"; Rec."Line Amount Excl. VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount Excl. VAT field.';
                }
                field("Line Amount Incl. VAT"; Rec."Line Amount Incl. VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount Incl. VAT field.';
                }
            }
        }
    }
}
