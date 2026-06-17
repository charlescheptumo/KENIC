table 50161 "Standing Imprest Limit"
{
    Caption = 'Standing Imprest Limit';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Financial Year","Employee Name";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            
        }
        field(2; "Financial Year"; Code[20])
        {
            Caption = 'Financial Year';
            TableRelation = "Financial Year Code";
        }
        field(3; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            TableRelation = Employee;
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Employee No") then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    Employee.CalcFields("Department Name");
                    Department := Employee."Department Code";
                    "Department Name" := Employee."Department Name"
                end;
            end;
        }
        field(4; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(5; "Department"; Code[20])
        {
            Caption = 'Department ';
            TableRelation = "Responsibility Center";
            Editable = false;

            trigger OnValidate()
            var
                department: Record "Responsibility Center";
            begin
                if department.Get(department.Code) then begin
                    "Department Name" := department.Name;
                end;
            end;
        }
        field(6; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
            Editable = false;
        }
        field(7; "Limit"; Decimal)
        {
            Caption = 'Limit';
        }
        field(8; "Created By"; Code[100])
        {
            Caption = 'Created By';
            Editable = false;
        }
        field(9; "Created Date"; DateTime)
        {
            Caption = 'Created Date';
            Editable = false;
        }
         field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; "Utilized Amount"; Decimal)
        {
        // FieldClass = FlowField;
        // CalcFormula = Sum("Employee Ledger Entry".Amount WHERE(
        //                     "Employee No." = FIELD("Employee No"),
        //                     "Imprest Document Type" = const("Standing Imprest"),
        //                     Reversed = CONST(false),
        //                     "Financial Year" = FIELD("Financial Year")
        //                 ));
        // Editable = false;
        }
        field(12; "Remaining Amount"; Decimal)
        {
        Caption = 'Remaining Amount';
        Editable = false;
        }

    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
        // key(FYEmp; "Financial Year", "Employee No")
        // {
        //     Unique = true;
        // }
    }
    trigger OnInsert()
    var
    StandingImprest: Record "Standing Imprest Limit";
    begin
    StandingImprest.Reset();
    StandingImprest.SetRange("Financial Year", "Financial Year");
    StandingImprest.SetRange("Employee No", "Employee No");
    StandingImprest.SetFilter("Document No.", '<>%1', "Document No.");
    if StandingImprest.FindFirst() then
        Error('Employee %1 already has a Standing Imprest Limit for Financial Year %2.',"Employee No", "Financial Year");
        if "Document No." = '' then begin
            CashMgtSetup.Get();
            CashMgtSetup.TestField("Standing Imprest Limit Nos");
            CashMgtSetup.TestField("Current Financial Year");
            "Financial Year" := CashMgtSetup."Current Financial Year";
            "No. Series" := CashMgtSetup."Standing Imprest Limit Nos";
            if NoSeries.AreRelated(CashMgtSetup."Standing Imprest Limit Nos", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Document No." := NoSeries.GetNextNo("No. Series");
        end;


        if "Created By" = '' then
            "Created By" := UserId;

        if "Created Date" = 0DT then
            "Created Date" := CurrentDateTime;
    end;

    var
     NoSeries: Codeunit "No. Series";
     CashMgtSetup: Record "Cash Management Setup";


}
