#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72182 "RICS New Road Environ"
{
    PageType = List;
    SourceTable = "RICS Existing Road Environ";
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
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Environ ID"; Rec."Environ ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Environ ID field.';
                }
                field("Road Environ Category"; Rec."Road Environ Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Environ Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field("Connected to Road Link"; Rec."Connected to Road Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Connected to Road Link field.';
                }
                field("Connection Road Length (Km)"; Rec."Connection Road Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Connection Road Length (Km) field.';
                }
                field("Location Details"; Rec."Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Details field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

