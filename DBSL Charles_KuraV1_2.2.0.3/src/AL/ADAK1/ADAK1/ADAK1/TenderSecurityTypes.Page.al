#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75108 "Tender Security Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Tender Security Types";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Nature of Security"; Rec."Nature of Security")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Security field.';
                }
                field("No. of Filed Securities"; Rec."No. of Filed Securities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Filed Securities field.';
                }
                field("Filed Securities Value (LCY)"; Rec."Filed Securities Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Filed Securities Value (LCY) field.';
                }
                field("No. of Forfeited Securities"; Rec."No. of Forfeited Securities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Forfeited Securities field.';
                }
                field("Forfeited Securities Value LCY"; Rec."Forfeited Securities Value LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Forfeited Securities Value LCY field.';
                }
                field("No. of Released Securities"; Rec."No. of Released Securities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Released Securities field.';
                }
                field("Released Securities Value LCY"; Rec."Released Securities Value LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Released Securities Value LCY field.';
                }
                field(BLocked; Rec.BLocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BLocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

