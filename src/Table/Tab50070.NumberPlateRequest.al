table 50070 "Number Plate Request"
{
    Caption = 'Number Plate Request';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[100])
        {
        }
        field(2; "Vehicle Reg No"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin
                WshpFA.Reset;
                WshpFA.SetRange(WshpFA."FA Serial No", "Vehicle Reg No");
                if WshpFA.Find('-') then begin
                    "Fixed Asset No" := WshpFA."No.";
                end;
            end;
        }
        field(3; Driver; Code[100])
        {
            TableRelation = Employee;
            Caption = 'Officer';

            trigger OnValidate()
            begin
                if Employee.Get(Driver) then begin
                    "Driver Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    "Department Name" := Employee.Workstation;
                end;
            end;
        }
        field(4; "Driver Name"; Text[1000])
        {
            Caption = 'Officer Name';
        }
        field(5; "Fixed Asset No"; Code[20])
        {
        }
        field(6; "Request Date"; Date)
        {
            Editable = false;
        }
        field(7; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled;
        }
        field(8; "Requested By"; Code[30])
        {
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(11; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(12; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(15; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Dimension Set ID"; Integer)
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
        field(17; Description; Text[250])
        {
        }
        field(18; "New Number Plate"; Code[1000])
        {

        }
        field(19; "Submitted By"; Code[100])
        {
        }
        field(20; "Submitted On"; Date)
        {
        }
        field(21; Submitted; Boolean)
        {
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        FltMgtSetup.Get();
        FltMgtSetup.TestField("Number Plate Request No");
        if Code = '' then begin
            rec."Code" := NoSeriesMgt.GetNextNo(FltMgtSetup."Number Plate Request No", WorkDate(), true);
        end
    end;

    var
        WshpFA: Record "Fleet Vehicles.";
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
        DimMgt: Codeunit DimensionManagement;
        Employee: Record Employee;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', '', Code),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if Code <> '' then
            Modify;
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;
        end;
    end;
}
