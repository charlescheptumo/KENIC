#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72399 "Contract Currencies"
{
    PageType = ListPart;
    SourceTable = "Contract Currency";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Percentage of Total Payment(%)"; Rec."Percentage of Total Payment(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage of Total Payment(%) field.';
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exchange Rate field.';
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount(LCY) field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount FCY';
                    ToolTip = 'Specifies the value of the Amount FCY field.';
                }
            }
        }
    }

    actions
    {
    }
}

