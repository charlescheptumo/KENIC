#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75286 "Purchase Contract Insurance"
{
    PageType = List;
    SourceTable = "Purchase Contract Insurance";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
                field("Policy Cover Type"; Rec."Policy Cover Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Cover Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Policy Coverage (LCY)"; Rec."Policy Coverage (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Coverage (LCY) field.';
                }
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy ID field.';
                }
                field("Insurance Company"; Rec."Insurance Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Company field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Expiry Norification Date"; Rec."Expiry Norification Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Norification Date field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Second Expiry Notification Dat"; Rec."Second Expiry Notification Dat")
                {
                    ApplicationArea = Basic;
                    Caption = 'Second Expiry Notification Date';
                    ToolTip = 'Specifies the value of the Second Expiry Notification Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

