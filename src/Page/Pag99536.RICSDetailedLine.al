page 99536 "RICS Detailed Line"
{
    ApplicationArea = Basic;
    Caption = 'RICS Detailed Line';
    PageType = List;
    SourceTable = "RICS Detailed Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(Km) field.';
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(Km) field.';
                }
                field("Surface Type"; Rec."Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surface Type field.';
                }
                field("Width (M)"; Rec."Width (M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Width (M) field.';
                }
                field(Terrain; Rec.Terrain)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terrain field.';
                }
                field("Road Condition"; Rec."Road Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Condition field.';
                }
                field("Road Condition %"; Rec."Road Condition %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Condition % field.';
                }
                field("Existing Culverts(Lines)"; Rec."Existing Culverts(Lines)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Existing Culverts(Lines) field.';
                }
                field("Proposed Culverts(Lines)"; Rec."Proposed Culverts(Lines)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposed Culverts(Lines) field.';
                }
                field("Cut to spoil mtr (M³)"; Rec."Cut to spoil mtr (M³)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cut to spoil mtr (M³) field.';
                }
                field("Drain Cleaning (M)"; Rec."Drain Cleaning (M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drain Cleaning (M) field.';
                }
                field("Bush Clearing (M²)"; Rec."Bush Clearing (M²)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bush Clearing (M²) field.';
                }
                field("Side Slabs (M²)"; Rec."Side Slabs (M²)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Side Slabs (M²) field.';
                }
                field("Kerbs Installation"; Rec."Kerbs Installation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Kerbs Installation field.';
                }
                field("Patching Required M³"; Rec."Patching Required M³")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Patching Required M³ field.';
                }
                field("Overlay Required M³"; Rec."Overlay Required M³")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overlay Required M³ field.';
                }
                field("Gravel Required M³"; Rec."Gravel Required M³")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gravel Required M³ field.';
                }
                field("Other Structures"; Rec."Other Structures")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Structures field.';
                }
                field("Proposed Intervention"; Rec."Proposed Intervention")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposed Intervention field.';
                }
            }
        }
    }
}
