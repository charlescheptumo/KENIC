pageextension 50368 "Comp Info Payslip Ext" extends "Company Information"
{
    layout
    {
        addafter(Picture)
        {
            field(Stamp; Rec.Stamp)
            {
                ApplicationArea = All;
                Caption = 'Company Stamp';
            }
            field(Signature; Rec.Signature)
            {
                ApplicationArea = All;
                Caption = 'Authorized Signature';
            }
        }
    }
}