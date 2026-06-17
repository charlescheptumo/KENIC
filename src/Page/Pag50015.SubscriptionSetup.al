/// <summary>
/// Page SubscriptionSetup (ID 50015).
/// </summary>
page 50015 SubscriptionSetup
{
    ApplicationArea = BasicHR;
    Caption = 'Subscription and Continuous Development Setup';
    PageType = Card;
    SourceTable = SubscriptionSetup;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';

                field("Professional Body No."; Rec."Professional Body No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Professional Body No. field.';
                }
                field("Membership No."; Rec."Membership No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Membership No. field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
