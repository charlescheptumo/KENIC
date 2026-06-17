#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54018 "Posted Bond Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Bond Calculator";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Intial Info")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("FXD No"; Rec."FXD No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FXD No field.';
                }
                field("System Bond No"; Rec."System Bond No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Bond No field.';
                }
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Face Value field.';
                }
                field("Original Term"; Rec."Original Term")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Term field.';
                }
                field("Coupon Rate"; Rec."Coupon Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Coupon Rate field.';
                }
                field("Nominal Amount (Cost)"; Rec."Nominal Amount (Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominal Amount (Cost) field.';
                }
            }
            group("Input Details")
            {
                field("Settlement Date"; Rec."Settlement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Settlement Date field.';
                }
                field("Yield(input)"; Rec."Yield(input)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Yield(input) field.';
                }
                field("Dirty Price/per value"; Rec."Dirty Price/per value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dirty Price/per value field.';
                }
                field("% commission"; Rec."% commission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % commission field.';
                }
            }
            group(Dates)
            {
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Date field.';
                }
                field("Next Coupon"; Rec."Next Coupon")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Coupon field.';
                }
                field("Last Coupon"; Rec."Last Coupon")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Coupon field.';
                }
            }
            group("Stastistical Information")
            {
                field("Set to Next"; Rec."Set to Next")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Set to Next field.';
                }
                field("Last to next"; Rec."Last to next")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last to next field.';
                }
                field("Last to set"; Rec."Last to set")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last to set field.';
                }
                field("Average unpaid coupons"; Rec."Average unpaid coupons")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Average unpaid coupons field.';
                }
                field("Unpaid Coupon"; Rec."Unpaid Coupon")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaid Coupon field.';
                }
            }
            group("Bond Analysis")
            {
                field("Market Rate"; Rec."Market Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Market Rate field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Day Basis"; Rec."Day Basis")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day Basis field.';
                }
                field("Accrued Interest"; Rec."Accrued Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accrued Interest field.';
                }
                field("Clean Price"; Rec."Clean Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clean Price field.';
                }
                field("Bond Consideration"; Rec."Bond Consideration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bond Consideration field.';
                }
                field(Commission; Rec.Commission)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commission field.';
                }
                field("Net Amount Receivable"; Rec."Net Amount Receivable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount Receivable field.';
                }
                field("Book value for the Bond"; Rec."Book value for the Bond")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Book value for the Bond field.';
                }
                field("Accrued Interest 2"; Rec."Accrued Interest 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accrued Interest 2 field.';
                }
                field("Loss/Profit on sale of bond"; Rec."Loss/Profit on sale of bond")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loss/Profit on sale of bond field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(ReOpen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the ReOpen action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to reopen this transaction?') = true then begin
                        Rec.Posted := false;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }
}

