table 50160 "Batch Imprest Voucher Lines"
{
    Caption = 'Batch Imprest Voucher Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[100])
        {
            Caption = 'No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Imprest Req. No."; Code[100])
        {
            Caption = 'Imprest Req. No.';
        }
        field(4; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(5; "Account No."; Code[40])
        {

            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer."No." where("Customer Type" = filter(" "))
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const(Employee)) Employee."No.";

            trigger OnValidate()
            begin
                case "Account Type" of
                    "account type"::Customer:
                        begin
                            if Customer.Get("Account No.") then begin
                                "Account Name" := Customer.Name;
                                Payee := Customer.Name;
                            end;
                        end;

                    "account type"::Employee:
                        begin
                            Emp.Reset;
                            Emp.SetRange("No.", "Account No.");
                            if Emp.FindSet then begin
                                "Account Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                Payee := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                "Directorate Code" := Emp."Directorate Code";
                                "Department Code" := Emp."Department Code";
                                Division := Emp.Division;
                                HOD := Emp.HOD;
                                // "Regional Manager":=Emp."Regional Manager";
                                "Directorate Head" := Emp."Directorate Head";
                                "Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
                                "Shortcut Dimension 2 Code" := Emp."Global Dimension 2 Code";
                                "Shortcut Dimension 3 Code" := Emp."Shortcut Dimension 3";
                                "Employee Ban Account Name" := Emp."Bank Name";
                                "Employee Bank Account Code" := Emp."Employee's Bank";
                                "Employee Bank Brach Code" := Emp."Bank Branch";
                                "Employee Bank Branch Name" := Emp."Bank Branch Name";
                                "Employee Bank Account Number" := Emp."Bank Account Number";
                                "Employee Mobile No" := Emp."Mobile Phone No.";
                            end;
                        end;
                    "account type"::Vendor:
                        begin
                            if Vendor.Get("Account No.") then begin
                                "Account Name" := Vendor.Name;
                                Payee := Vendor.Name;
                            end;
                        end;
                end;
                if xRec."Account No." <> "Account No." then begin
                    "Employee Bank Account Code" := '';
                    "Employee Ban Account Name" := '';
                    "Employee Bank Brach Code" := '';
                    "Employee Bank Branch Name" := '';
                    "Employee Bank Account Number" := '';
                    "Employee Mobile No" := '';
                end;


                EmployeePaymentInformation.Reset;
                EmployeePaymentInformation.SetRange(EmployeePaymentInformation."Employee No", "Account No.");
                //EmployeePaymentInformation.SETRANGE(EmployeePaymentInformation."Employee Bank Code",'<>%1','');
                EmployeePaymentInformation.SetRange("Imprest Account", true);
                if EmployeePaymentInformation.FindLast then begin
                    "Employee Bank Account Code" := EmployeePaymentInformation."Employee Bank Code";
                    "Employee Ban Account Name" := EmployeePaymentInformation."Employee Bank Name";
                    "Employee Bank Brach Code" := EmployeePaymentInformation."Employee Bank Branch Code";
                    "Employee Bank Branch Name" := EmployeePaymentInformation."Employee Bank Branch Name";
                    "Employee Bank Account Number" := EmployeePaymentInformation."Employee Bank Account Number";
                    "Employee Mobile No" := EmployeePaymentInformation."Employee Mobile No";
                end else begin
                    EmployeePaymentInformation.Reset;
                    EmployeePaymentInformation.SetRange(EmployeePaymentInformation."Employee No", "Account No.");
                    EmployeePaymentInformation.SetRange("Imprest Account", false);
                    if EmployeePaymentInformation.FindLast then begin
                        "Employee Bank Account Code" := EmployeePaymentInformation."Employee Bank Code";
                        "Employee Ban Account Name" := EmployeePaymentInformation."Employee Bank Name";
                        "Employee Bank Brach Code" := EmployeePaymentInformation."Employee Bank Branch Code";
                        "Employee Bank Branch Name" := EmployeePaymentInformation."Employee Bank Branch Name";
                        "Employee Bank Account Number" := EmployeePaymentInformation."Employee Bank Account Number";
                        "Employee Mobile No" := EmployeePaymentInformation."Employee Mobile No";
                    end;

                end;
                Employee.Reset;
                Employee.SetRange("No.", "Account No.");
                if Employee.FindSet then begin
                    "Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    //"Shortcut Dimension 2 Code":=Employee."Global Dimension 2 Code";
                    //MODIFY(TRUE);
                end;

                Employee.Reset;
                Employee.SetRange("No.", "Account No.");
                if Employee.FindSet then begin
                    //"Responsibility Center":=Employee."Global Dimension 1 Code";
                    "Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                end;
            end;
        }
        field(6; "Account Name"; Text[70])
        {
        }
        field(7; "Imprest Amount"; Decimal)
        {
            Editable = false;
        }
        field(8; "Employee Bank Account Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Payment Information"."Employee Bank Code" where("Employee No" = field("Account No."));

            trigger OnValidate()
            begin
                EmployeePaymentInformation.Reset;
                EmployeePaymentInformation.SetRange(EmployeePaymentInformation."Employee Bank Code", "Employee Bank Account Code");
                EmployeePaymentInformation.SetRange(EmployeePaymentInformation."Employee No", "Account No.");
                if EmployeePaymentInformation.FindSet(true) then begin
                    "Employee Ban Account Name" := EmployeePaymentInformation."Employee Bank Name";
                    "Employee Bank Account Number" := EmployeePaymentInformation."Employee Bank Account Number";
                    Message("Employee Bank Account Number");
                    "Employee Bank Brach Code" := EmployeePaymentInformation."Employee Bank Branch Code";
                    Validate("Employee Bank Brach Code");
                    Modify;
                end;
            end;
        }
        field(9; "Employee Ban Account Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Employee Bank Brach Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Payment Information"."Employee Bank Branch Code" where("Employee No" = field("Account No."));

            trigger OnValidate()
            begin
                EmployeePaymentInformation.Reset;
                EmployeePaymentInformation.SetRange(EmployeePaymentInformation."Employee Bank Branch Code", "Employee Bank Brach Code");
                if EmployeePaymentInformation.FindSet then begin
                    "Employee Bank Branch Name" := EmployeePaymentInformation."Employee Bank Branch Name";
                end;
            end;
        }
        field(11; "Employee Bank Branch Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Employee Bank Account Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Employee Mobile No"; Code[120])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Payee; Text[150])
        {
        }
        field(15; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(16; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(17; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"), "Direct Reports To" = field("Department Code"));
        }
        field(18; HOD; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Directorate Head"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Shortcut Dimension 1 Code"; Code[50])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(21; "Shortcut Dimension 2 Code"; Code[50])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(22; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(23; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
        field(24; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender,"Staff Claims","Salary Advance","Standing Imprest","Standing Imprest Surrender","Salary Advance Memo";
        }
        field(25; "Reference No."; Code[100])
        {
            Caption = 'Reference No.';
        }
        field(26; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account" where(Type = filter(Bank | "Petty Cash"));
            trigger OnValidate()
            var
                Bank: Record "Bank Account";
            begin
                if Bank.Get("Paying Bank Account") then begin
                    "Bank Name" := Bank.Name;
                    "Source Bank Acc No." := Bank."Bank Account No.";


                end;
            end;
        }
        field(27; "Bank Name"; Text[100])
        {
            Editable = false;
        }
        field(28; "Source Bank Acc No."; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(Key1; "No.", "Line No.")
        {
        }
    }
    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        IF "No." <> '' THEN
            //MODIFY;

        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
                //MODIFY;
                IF PurchLinesExist THEN
                    UpdateAllLineDim("Dimension Set ID", OldDimSetID);
            END;
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
  DimMgt.EditDimensionSet(
    "Dimension Set ID", STRSUBSTNO('%1 %2', "Document Type", "No."),
    "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;


            IF PurchLinesExist THEN
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        END;

    end;

    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange(PurchLine.No, "No.");
        exit(PurchLine.FindFirst);
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin
        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not Confirm(Text051) then
            exit;

        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange(PurchLine.No, "No.");
        PurchLine.LockTable;
        if PurchLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if PurchLine."Dimension Set ID" <> NewDimSetID then begin
                    PurchLine."Dimension Set ID" := NewDimSetID;
                    DimMgt.UpdateGlobalDimFromDimSetID(
                      PurchLine."Dimension Set ID", PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
                    PurchLine.Modify;
                end;
            until PurchLine.Next = 0;
    end;

    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Employee: Record Employee;
        EmployeePaymentInformation: Record "Employee Payment Information";
        ImprestMemo: Record "Imprest Memo";
        Emp: Record Employee;
        Vendor: Record Vendor;
        DimMgt: Codeunit DimensionManagement;
        PurchLines: Record "PV Lines";
        PurchLine: Record "PV Lines";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
}
