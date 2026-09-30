page 50650 "Per Diem Setup"
{
    Caption = 'Per Diem Payroll Setup';
    PageType = Card;
    SourceTable = "Per Diem Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Rules)
            {
                Caption = 'Rules';
                field("Daily Tax-Free Limit"; Rec."Daily Tax-Free Limit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the per diem amount per day that is not taxable.';
                }
                field("Accommodation %"; Rec."Accommodation %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the percentage of the imprest amount paid when accommodation is provided.';
                }
            }
            group(Staff)
            {
                Caption = 'Staff Payroll Codes';
                field("PD Non-Taxable Earning"; Rec."PD Non-Taxable Earning")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the earning code used for the non-taxable part of the per diem.';
                }
                field("PD Taxable Earning"; Rec."PD Taxable Earning")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the earning code used for the taxable excess of the per diem.';
                }
                field("PD Advance Deduction"; Rec."PD Advance Deduction")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the deduction code used to recover per diems already paid outside payroll.';
                }
            }
            group(Board)
            {
                Caption = 'Board Payroll Codes';
                field("Dir. PD Non-Taxable Earning"; Rec."Dir. PD Non-Taxable Earning")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the director earning code used for the non-taxable part of the per diem.';
                }
                field("Dir. PD Taxable Earning"; Rec."Dir. PD Taxable Earning")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the director earning code used for the taxable excess of the per diem.';
                }
                field("Dir. PD Advance Deduction"; Rec."Dir. PD Advance Deduction")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the director deduction code used to recover per diems already paid outside payroll.';
                }
                field("Director Per Diem Work Type"; Rec."Director Per Diem Work Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the work type whose resource cost gives the board per diem daily rate.';
                }
                field("Director Per Diem G/L Account"; Rec."Director Per Diem G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vote G/L account committed for board per diems.';
                }
            }
            group(Finance)
            {
                Caption = 'Finance';
                field("Per Diem Clearing Account"; Rec."Per Diem Clearing Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the G/L account debited when a per diem is paid before payroll.';
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
