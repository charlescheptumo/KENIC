#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50099 "pageextension50099" extends "Employee Ledger Entries"
{
    layout
    {
        addafter("Entry No.")
        {
            field(Reversed; Rec.Reversed)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reversed field.';
            }
            field("Reversed by Entry No."; Rec."Reversed by Entry No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reversed by Entry No. field.';
            }
            field("EXternal Document No."; Rec."EXternal Document No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the EXternal Document No. field.', Comment = '%';
            }

        }
        addafter("Employee No.")
        {
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
        
        }
    }
    trigger OnAfterGetRecord()
    var
        Emp: Record Employee;
    begin
        if Emp.Get(Rec."Employee No.") then
            Rec."Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name"
        else
            Rec."Employee Name" := '';
    end;
}

