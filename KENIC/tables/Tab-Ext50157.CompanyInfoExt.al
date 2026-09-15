namespace KENIC.KENIC;

using Microsoft.Foundation.Company;
tableextension 50157 "Comp Info Payslip Ext" extends "Company Information"
{
    fields
    {
        field(50200; "Stamp"; BLOB)
        {
            Caption = 'Company Stamp';
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
        field(50201; "Signature"; BLOB)
        {
            Caption = 'Authorized Signature';
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
    }
}