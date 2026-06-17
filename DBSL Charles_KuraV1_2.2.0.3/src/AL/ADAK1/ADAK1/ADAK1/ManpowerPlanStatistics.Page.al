#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69112 "Manpower Plan Statistics"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "ManPower Plan Task Lines";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Manpower Plan Code"; Rec."Manpower Plan Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manpower Plan';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Manpower Plan field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Actual Active"; Rec."Actual Active")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual Active field.';
                }
                fixed(Control27)
                {
                    group(Quantities)
                    {
                        Caption = 'Quantities';
                        field("Planned Qty"; "Planned Qty")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Planned Quantity';
                            ToolTip = 'Specifies the value of the Planned Quantity field.';
                        }
                        field("Actual Qty"; "Actual Qty")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Actual Quantity';
                            ToolTip = 'Specifies the value of the Actual Quantity field.';
                        }
                        field("FillUp%"; "FillUp%")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Filled Up %';
                            ToolTip = 'Specifies the value of the Filled Up % field.';
                        }
                        field(Available; Available)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Available %';
                            ToolTip = 'Specifies the value of the Available % field.';
                        }
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        "Planned Qty" := 0;
        "Actual Qty" := 0;
        "FillUp%" := 0;
        Available := 0;
        ManPowerPlanTaskLines.Reset;
        ManPowerPlanTaskLines.SetRange("Manpower Plan Code", Rec."Manpower Plan Code");
        ManPowerPlanTaskLines.SetRange("Job Id", Rec."Job Id");
        if ManPowerPlanTaskLines.FindSet then begin
            "Planned Qty" := ManPowerPlanTaskLines."Target No.";
            "Actual Qty" := ManPowerPlanTaskLines."Actual Recruited";
            if "Actual Qty" > 0 then begin
                Available := (("Planned Qty" - "Actual Qty") / "Planned Qty") * 100;
                "FillUp%" := 100 - Available;
            end else begin
                "FillUp%" := 0;
            end
        end
    end;

    var
        "Planned Qty": Decimal;
        "Actual Qty": Decimal;
        "FillUp%": Decimal;
        Available: Decimal;
        ManPowerPlanTaskLines: Record "ManPower Plan Task Lines";
}

