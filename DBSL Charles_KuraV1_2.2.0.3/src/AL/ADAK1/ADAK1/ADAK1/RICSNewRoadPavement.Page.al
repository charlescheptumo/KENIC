#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72180 "RICS New Road Pavement"
{
    PageType = List;
    SourceTable = "RICS Existing Road Pavement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RICS No."; Rec."RICS No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Pavement Surface Type"; Rec."Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Surface Type field.';
                }
                field("Pavement Category"; Rec."Pavement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Category field.';
                }
                field("Start Chainage(KM)"; Rec."Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(KM) field.';
                }
                field("End Chainage(KM)"; Rec."End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(KM) field.';
                }
                field("Road Length (Kms)"; Rec."Road Length (Kms)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Length (Kms) field.';
                }
                field("Road Surface Condition"; Rec."Road Surface Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Surface Condition field.';
                }
            }
        }
    }

    actions
    {
    }
}

