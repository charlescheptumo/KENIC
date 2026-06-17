#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72716 "Detailed Pavemet Tests"
{
    PageType = List;
    SourceTable = "Detailed Pavemet Test Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Layer Code"; Rec."Layer Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Code field.';
                }
                field("Layer Description"; Rec."Layer Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Description field.';
                }
                field("Layer Test Code"; Rec."Layer Test Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Test Code field.';
                }
                field("Layer Test Description"; Rec."Layer Test Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Test Description field.';
                }
                field("Chainage(KM)"; Rec."Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage(KM) field.';
                }
                field("Layer Tolerance"; Rec."Layer Tolerance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Tolerance field.';
                }
                field("Test Result"; Rec."Test Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Result field.';
                }
                field("Level Deviation"; Rec."Level Deviation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level Deviation field.';
                }
                field("Test Date"; Rec."Test Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Date field.';
                }
                field("Survey Date"; Rec."Survey Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

