namespace KENIC.KENIC;

pageextension 64156 "Domain Renewal Write Actions" extends "Domain Renewals"
{
    actions
    {
        addlast(Processing)
        {
            action(CreateReversalRequest)
            {
                ApplicationArea = All;
                Caption = 'Create Reversal Request';
                Image = ReverseRegister;
                trigger OnAction()
                var
                    Mgt: Codeunit COCCAIntegration;
                begin
                    Rec.TestField(LedgerId);
                    // Stored eligibility may be stale; the API enforces current rules.
                    Mgt.NewCoCCAWriteRequest(Enum::"CoCCA Write Operation"::Reversal, Rec.LedgerId);
                end;
            }
        }
    }
}
