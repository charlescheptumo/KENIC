namespace KICD.KICD;

using System.Security.User;

pageextension 50131 "User Setup Exts" extends "User Setup"
{
    layout
    {
        addafter("Approver ID")
        {
            field("Registry Approval"; Rec."Registrar Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Registrar User ID field.';
            }
            field("Payroll P&P"; Rec."Payroll P&P")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payroll P&P User ID field.';
            }
            field("Payroll AP"; Rec."Payroll AP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payroll AP User ID field.';
            }
            field("Payroll contract"; Rec."Payroll Contract")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payroll Contract User ID field.';
            }


        }


    }
}
