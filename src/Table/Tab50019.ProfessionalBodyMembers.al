/// <summary>
/// Table ProfessionalBodyMembers (ID 50019).
/// </summary>
table 50019 ProfessionalBodyMembers
{
    Caption = 'ProfessionalBodyMembers';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No. ';
        }
        field(3; "Membership No."; Code[20])
        {
            Caption = 'Membership No.';
        }
        field(4; "Membership Category"; Code[20])
        {
            Caption = 'Membership Category';
            TableRelation = ProfBodyMembershipCategories where(Blocked = const(false));
        }
        field(5; Member; Code[20])
        {
            Caption = 'Member';
            NotBlank = true;
            TableRelation = Employee where(Status = filter(Active));

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Member <> '' then begin
                    Employee.Get(Member);
                    Name := Employee.FullName();
                    Designation := Employee."Job Title";
                    Position := Employee."Job ID";

                    ResponsibilityCenter.Reset();
                    ResponsibilityCenter.SetRange(Code, Employee."Department Code");
                    if ResponsibilityCenter.FindFirst then
                        Department := ResponsibilityCenter.Name;

                    ResponsibilityCenter1.Reset();
                    ResponsibilityCenter1.SetRange(Code, Employee."Directorate Code");
                    if ResponsibilityCenter1.FindFirst then
                        Directorate := ResponsibilityCenter1.Name;

                end else begin
                    Name := '';
                    Designation := '';
                    Position := '';
                    Directorate := '';
                    Department := '';
                end;
            end;
        }
        field(6; Name; Text[250])
        {
            Caption = 'Member Name';
            Editable = false;
        }
        field(7; Designation; Text[250])
        {
            Caption = 'Designation';
            Editable = false;
        }
        field(8; Position; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;
            Editable = false;
        }
        field(9; "Annual Fee Payable"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "CPD Points Required"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Department; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; Directorate; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Member: Record ProfessionalBodyMembers;
    begin
        Member.Reset();
        Member.SetRange("Document No.", Rec."Document No.");
        if Member.FindLast() then begin
            "Line No." := Member."Line No." + 1;
        end;
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        ResponsibilityCenter1: Record "Responsibility Center";
}
