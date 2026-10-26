/// <summary>
/// Table Exit Form Header (ID 50420).
/// Holds the Terminal Clearance Form, Terminated Employee/Intern/Casual Form,
/// Intern Assessment Form and Clearance Certificate for one staff member.
/// </summary>
table 50420 "Exit Form Header"
{
    Caption = 'Exit Form';
    DataClassification = CustomerContent;
    LookupPageId = "Exit Form List";
    DrillDownPageId = "Exit Form List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Staff Exit Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; "Employee No."; Code[20])
        {
            Caption = 'Staff Number';
            TableRelation = Employee;

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if "Employee No." = '' then begin
                    "First Name" := '';
                    Surname := '';
                    "ID Number" := '';
                    "Department Name" := '';
                    Position := '';
                    "Start Date" := 0D;
                    "End Date" := 0D;
                    "Date Of Termination" := 0D;
                    "Leave Balance" := 0;
                    Clear("Notice Period");
                    exit;
                end;

                Employee.Get("Employee No.");
                Employee.CalcFields("Leave Balance");
                "First Name" := Employee."First Name";
                Surname := Employee."Last Name";
                "ID Number" := Employee."ID Number";
                "Department Name" := Employee."Department Name";
                Position := Employee."Job Title";
                "Start Date" := Employee."Employment Date";
                "End Date" := Employee."Date Of Leaving";
                "Date Of Termination" := Employee."Date Of Leaving";
                "Leave Balance" := Employee."Leave Balance";
                "Notice Period" := Employee."Notice Period";
            end;
        }
        field(4; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }
        field(5; Surname; Text[50])
        {
            Caption = 'Surname';
        }
        field(6; "ID Number"; Text[50])
        {
            Caption = 'ID Number';
        }
        field(7; "Staff Category"; Text[50])
        {
            Caption = 'Category of Staff';
        }
        field(8; "Department Name"; Text[100])
        {
            Caption = 'Department';
        }
        field(9; Position; Text[100])
        {
            Caption = 'Position';
        }
        field(10; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(11; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(12; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        // ---------- TERMINAL CLEARANCE FORM ----------
        field(20; "CEO Name"; Text[100])
        {
            Caption = 'CEO Name';
        }
        // ---------- TERMINATED EMPLOYEE/INTERN/CASUAL FORM ----------
        field(30; "Termination Reason"; Text[100])
        {
            Caption = 'Reason for Termination';
        }
        field(31; "Date Of Termination"; Date)
        {
            Caption = 'Date of Termination (Last Working Day)';
        }
        field(32; "Work Days Paid"; Decimal)
        {
            Caption = 'Number of Work Days Paid';
            DecimalPlaces = 0 : 2;
        }
        field(33; "Leave Balance"; Decimal)
        {
            Caption = 'Leave Balance';
            DecimalPlaces = 0 : 2;
        }
        field(34; "Payment In Lieu Of Leave"; Decimal)
        {
            Caption = 'Payment in Lieu of Leave Days (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(35; "Notice Period"; DateFormula)
        {
            Caption = 'Notice Period';
        }
        field(36; "Payment In Lieu Of Notice"; Decimal)
        {
            Caption = 'Payment in Lieu of Notice (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(37; "Other Allowances"; Decimal)
        {
            Caption = 'Other Allowances (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(38; "Gross Pay"; Decimal)
        {
            Caption = 'Gross Pay (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(39; Benefits; Decimal)
        {
            Caption = 'Benefits (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(40; NSSF; Decimal)
        {
            Caption = 'NSSF';
            DecimalPlaces = 2 : 2;
        }
        field(41; NHIF; Decimal)
        {
            Caption = 'NHIF';
            DecimalPlaces = 2 : 2;
        }
        field(42; HELB; Decimal)
        {
            Caption = 'HELB';
            DecimalPlaces = 2 : 2;
        }
        field(43; Pension; Decimal)
        {
            Caption = 'Pension';
            DecimalPlaces = 2 : 2;
        }
        field(44; PAYE; Decimal)
        {
            Caption = 'PAYE';
            DecimalPlaces = 2 : 2;
        }
        field(45; SACCO; Decimal)
        {
            Caption = 'SACCO';
            DecimalPlaces = 2 : 2;
        }
        field(46; "Housing Levy"; Decimal)
        {
            Caption = 'Housing Levy';
            DecimalPlaces = 2 : 2;
        }
        field(47; "Other Deduction Description"; Text[100])
        {
            Caption = 'Other Deduction';
        }
        field(48; "Other Deduction Amount"; Decimal)
        {
            Caption = 'Other Deduction Amount (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(49; "Net Pay"; Decimal)
        {
            Caption = 'Net Pay (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(50; "Authorised By"; Text[100])
        {
            Caption = 'Authorised By';
        }
        field(51; Comment; Text[250])
        {
            Caption = 'Comment';
        }
        // ---------- INTERN ASSESSMENT FORM ----------
        field(60; Supervisor; Text[100])
        {
            Caption = 'Supervisor';
        }
        field(61; "Overall Performance"; Text[50])
        {
            Caption = 'Overall Performance';
        }
        // ---------- CLEARANCE CERTIFICATE ----------
        field(70; "Amount Received"; Decimal)
        {
            Caption = 'Sum Received in Full and Final Settlement (KSH)';
            DecimalPlaces = 2 : 2;
        }
        field(71; "Certificate Date"; Date)
        {
            Caption = 'Certificate Date';
        }
        field(72; "Witness Name"; Text[100])
        {
            Caption = 'Witnessed By (Name)';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Staff Exit Nos");
            Rec."No." := NoSeriesMgt.GetNextNo(HRSetup."Staff Exit Nos", WorkDate(), true);
        end;

        "Document Date" := Today;
    end;

    trigger OnDelete()
    var
        ExitFormLine: Record "Exit Form Line";
    begin
        ExitFormLine.SetRange("Document No.", "No.");
        ExitFormLine.DeleteAll();
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
