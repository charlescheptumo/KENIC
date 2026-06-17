namespace KICD.KICD;

using Microsoft.Finance.GeneralLedger.Journal;

tableextension 50111 "Gen. Journal Line Ext" extends "Gen. Journal Line"
{
    fields
    {
        field(50111; "Vendor Name"; Text[200])
        {
            Caption = 'Vendor Name';
            DataClassification = ToBeClassified;
        }
        field(50112; "Employee No."; Text[200])
        {
            Caption = 'Employee No.';
            DataClassification = ToBeClassified;
        }
        field(50113; "Employee Name"; Text[200])
        {
            Caption = 'Employee Name';
            DataClassification = ToBeClassified;
        }
        field(50114; "Paying Bank Account"; Text[200])
        {
            Caption = 'Paying Bank Account';
            DataClassification = ToBeClassified;
        }
        field(50115; "Destination Narration"; Text[200])
        {
            Caption = 'Destination Narration';
            DataClassification = ToBeClassified;
        }
        field(50116; "WHT Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; "VAT Withheld Code PV"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "PPRA Code PV"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50119; "Retention Code PV"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50120; "PAYE Code PV"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50121; "Check No"; Code[50])
        {
            Caption = 'Check No';
            DataClassification = ToBeClassified;
        }
        field(50122; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
            DataClassification = ToBeClassified;
        }
        field(50123; "Paying Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(50124; "Bank Name"; Text[200])
        {
            Caption = 'Bank Name';
            DataClassification = ToBeClassified;
        }
        field(50125; "Bank Name."; Text[200])
        {
            Caption = 'Bank Name';
            DataClassification = ToBeClassified;
        }

    }
}
